Return-Path: samuel@sholland.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3965dbc
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Feb 2017 18:38:26 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6382fff0
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Feb 2017 18:38:26 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A38422069A
 for <wireguard@lists.zx2c4.com>; Thu, 16 Feb 2017 13:38:40 -0500 (EST)
Received: from [10.7.33.183] (unknown [161.130.188.44])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4B4257E0D2
 for <wireguard@lists.zx2c4.com>; Thu, 16 Feb 2017 13:38:40 -0500 (EST)
To: wireguard@lists.zx2c4.com
From: Samuel Holland <samuel@sholland.org>
Subject: Instability during large transfers
Message-ID: <7a3a5f6d-1eb5-ef32-097e-e24c2f9d2805@sholland.org>
Date: Thu, 16 Feb 2017 12:38:38 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

Since I started using wireguard in August 2016, my main firewall has
been resetting every few weeks to a month. Since the switch from my
previous openvpn setup to wireguard coincided with some hardware
changes, I haven't been confident about the source of the crashes.

However, the last three crashes have been directly connected to a large
file transfer, meaning sustained, even if not large, bandwidth use. (For
comparison, this firewall can handle >400Mbps VPN traffic over a gigabit
WAN link.) The first was a `zfs send` job over SSH, around 15Mbps, where
the panic happened after around 18 hours. The second was a video
transfer over SSH, around 10Mbps, and the panic happened after about 30
minutes. The most recent was another `zfs send` over SSH, this time
40-50Mbps.

The transfer started at 2017-02-15 20:23:39. At 2017-02-16 01:32:13, the
firewall reset, and it came back up at 01:32:47. Through the magic of
wireguard, the SSH connection stayed intact. The transfer continued, and
my sshd logs continue showing key rotations until 04:43:55. This
coincides with the following warning from the firewall at 04:44:50:

[11547.285960] ------------[ cut here ]------------
[11547.285976] WARNING: CPU: 1 PID: 0 at kernel/workqueue.c:1440 
__queue_work+0x1e0/0x450
[11547.285980] Modules linked in: cfg80211 rfkill wireguard(O) bonding 
mei_txe mei
[11547.285995] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G           O 
4.7.10-hardened #1
[11547.285999] Hardware name: To be filled by O.E.M. To be filled by 
O.E.M./D180S/D190S/D290S
Series, BIOS DB1F1P05_x64 12/23/2014
[11547.286003]  0000000000000000 ffffffff814b4d1f 0000000000000007 
0000000000000000
[11547.286010]  0000000000000000 ffffffff810d8059 ffffe8ffffc07900 
0000000000000004
[11547.286016]  0000000000000000 ffff880077a9b600 ffffe8ffffc07a38 
00000000000105b0
[11547.286023] Call Trace:
[11547.286027]  <IRQ>  [<ffffffff814b4d1f>] ? dump_stack+0x47/0x68
[11547.286040]  [<ffffffff810d8059>] ? __warn+0xb9/0xe0
[11547.286046]  [<ffffffff810f1b00>] ? __queue_work+0x1e0/0x450
[11547.286052]  [<ffffffff810f1d80>] ? queue_work_on+0x10/0x20
[11547.286059]  [<ffffffff8118d788>] ? padata_do_parallel+0xe8/0x110
[11547.286071]  [<ffffffffa004f4c5>] ? packet_consume_data+0x4b5/0x760 
[wireguard]
[11547.286080]  [<ffffffffa004fe90>] ? packet_send_queue+0x330/0x600 
[wireguard]
[11547.286087]  [<ffffffff8195a2c9>] ? vlan_dev_hard_start_xmit+0x89/0x100
[11547.286093]  [<ffffffff818ce2b1>] ? fib_validate_source+0x101/0x470
[11547.286102]  [<ffffffffa0050a50>] ? packet_receive+0x440/0x470 
[wireguard]
[11547.286110]  [<ffffffffa0050a66>] ? packet_receive+0x456/0x470 
[wireguard]
[11547.286116]  [<ffffffff818bddeb>] ? udp_queue_rcv_skb+0x1fb/0x470
[11547.286122]  [<ffffffff818be487>] ? __udp4_lib_rcv+0x427/0x9b0
[11547.286129]  [<ffffffff8188f9d3>] ? ip_local_deliver_finish+0x63/0x1b0
[11547.286135]  [<ffffffff8188fca6>] ? ip_local_deliver+0x56/0xd0
[11547.286140]  [<ffffffff8188f970>] ? ip_rcv_finish+0x390/0x390
[11547.286146]  [<ffffffff8188ff64>] ? ip_rcv+0x244/0x370
[11547.286151]  [<ffffffff8188f5e0>] ? inet_del_offload+0x30/0x30
[11547.286158]  [<ffffffff81828089>] ? __netif_receive_skb_core+0x909/0xa20
[11547.286163]  [<ffffffff81955fd3>] ? br_handle_vlan+0xe3/0x180
[11547.286168]  [<ffffffff81955fd3>] ? br_handle_vlan+0xe3/0x180
[11547.286174]  [<ffffffff8182820a>] ? netif_receive_skb_internal+0x1a/0x80
[11547.286181]  [<ffffffff819495ce>] ? br_pass_frame_up+0x8e/0x130
[11547.286187]  [<ffffffff8110f645>] ? find_busiest_group+0xe5/0x950
[11547.286192]  [<ffffffff819562dd>] ? br_allowed_ingress+0x26d/0x390
[11547.286198]  [<ffffffff8194987f>] ? br_handle_frame_finish+0x20f/0x4f0
[11547.286205]  [<ffffffff81949cdf>] ? br_handle_frame+0x13f/0x2d0
[11547.286210]  [<ffffffff81827a7d>] ? __netif_receive_skb_core+0x2fd/0xa20
[11547.286216]  [<ffffffff818befca>] ? udp_gro_receive+0x4a/0x110
[11547.286222]  [<ffffffff818c7309>] ? inet_gro_receive+0x1b9/0x240
[11547.286227]  [<ffffffff8182820a>] ? netif_receive_skb_internal+0x1a/0x80
[11547.286232]  [<ffffffff818290f6>] ? napi_gro_receive+0xb6/0x100
[11547.286240]  [<ffffffff816bde99>] ? igb_poll+0x699/0xde0
[11547.286247]  [<ffffffff8112902d>] ? rcu_report_qs_rnp+0x11d/0x170
[11547.286252]  [<ffffffff81828969>] ? net_rx_action+0x219/0x350
[11547.286258]  [<ffffffff810dd2da>] ? __do_softirq+0xea/0x280
[11547.286263]  [<ffffffff810dd59c>] ? irq_exit+0x8c/0x90
[11547.286270]  [<ffffffff8108a2a9>] ? smp_apic_timer_interrupt+0x39/0x50
[11547.286277]  [<ffffffff8196b35b>] ? apic_timer_interrupt+0x8b/0x90
[11547.286280]  <EOI>  [<ffffffff817c03ec>] ? poll_idle+0xc/0x60
[11547.286291]  [<ffffffff817bff91>] ? cpuidle_enter_state+0xf1/0x2b0
[11547.286298]  [<ffffffff811171d9>] ? cpu_startup_entry+0x259/0x2e0
[11547.286304]  [<ffffffff8108839d>] ? start_secondary+0x1ad/0x270
[11547.286308] ---[ end trace 0439ccab88b5fb0e ]---

At that point, the VPN stopped responding, the SSH connection to the
server behind the firewall was broken, and the zfs send job failed.

When I woke up this morning, none of the firewall's wireguard peers were
able to ping or SSH into it or any machine behind it. However, they all
reported their last handshake being less than <the persistent keepalive
time> (25s) ago, even though my laptop had been suspended all night (so
it was able to connect fine from a new IP, but not transfer any data).

All machines involved are running the same kernel (Linux 4.7.10-hardened
from Gentoo's sys-kernel/hardened-sources package), and they all have
wireguard version 0.0.20170214 loaded. They had all been rebooted since
upgrading to that wireguard version, so within the last two days.

I will enable netconsole on the firewall now that I can hopefully
reproduce the panic, but since the networking setup there is rather
complicated (vlans on top of bridges) I'm not sure if I will get all of
the panic messages.

I have seen no wireguard-related warnings or panics on any other
machine, but this firewall machine has by far the most traffic and the
weakest CPU (http://ark.intel.com/products/78866).

Is there any more information I can provide to help resolve this?

Thanks,
Samuel
