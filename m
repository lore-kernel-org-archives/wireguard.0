Return-Path: samuel@sholland.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bec08e02
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Oct 2016 16:09:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id ED48B20914
 for <wireguard@lists.zx2c4.com>; Mon, 31 Oct 2016 12:10:51 -0400 (EDT)
Received: from [10.7.34.107] (unknown [161.130.188.162])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E5A8F2D3A
 for <wireguard@lists.zx2c4.com>; Mon, 31 Oct 2016 12:10:51 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: wireguard@lists.zx2c4.com
Message-ID: <1e33f311-9d18-6822-cf9e-e3d93da0af21@sholland.org>
Date: Mon, 31 Oct 2016 11:10:50 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Subject: [WireGuard] Kernel warning from WireGuard module
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I've been using WireGuard on my firewall, and I got the warning below.
I'm using the 20161014 snapshot, but I don't see any changes to the
relevant code since then.

# uname -r
4.7.10-hardened

------------[ cut here ]------------
WARNING: CPU: 0 PID: 25786 at include/linux/kref.h:46 
packet_consume_data+0x755/0x780 [wireguard]
Modules linked in: cfg80211 rfkill wireguard(O) bonding 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
input_leds led_class i915 snd_hda_intel snd_hda_codec snd_hwdep 
snd_hda_core mei_txe snd_pcm mei snd_timer intel_gtt snd
CPU: 0 PID: 25786 Comm: kworker/u4:2 Tainted: G           O 
4.7.10-hardened #1
Hardware name: To be filled by O.E.M. To be filled by 
O.E.M./D180S/D190S/D290S Series, BIOS DB1F1P05_x64 12/23/2014
Workqueue: wireguard-wg0 ffffffffa03f5e40
   0000000000000000 ffffffff814b6b3f 0000000000000001 0000000000000000
   0000000000000000 ffffffff810da0f9 ffff8800763b0200 ffff880078e039b8
   0000000000000001 0000000035f78084 ffff88007627a800 ffff880077c1c800
Call Trace:
   <IRQ>  [<ffffffff814b6b3f>] ? dump_stack+0x47/0x68
   [<ffffffff810da0f9>] ? __warn+0xb9/0xe0
   [<ffffffffa03f5345>] ? packet_consume_data+0x755/0x780 [wireguard]
   [<ffffffff81948ff7>] ? __br_deliver+0x57/0x110
   [<ffffffffa03f5bd0>] ? packet_send_keepalive+0x230/0x4a0 [wireguard]
   [<ffffffff8182b912>] ? __dev_queue_xmit+0x272/0x570
   [<ffffffff818cf561>] ? fib_validate_source+0x101/0x470
   [<ffffffffa03f6470>] ? packet_receive+0x1e0/0x550 [wireguard]
   [<ffffffffa03f6486>] ? packet_receive+0x1f6/0x550 [wireguard]
   [<ffffffff818bf09b>] ? udp_queue_rcv_skb+0x1fb/0x470
   [<ffffffff818bf737>] ? __udp4_lib_rcv+0x427/0x9b0
   [<ffffffff81890c83>] ? ip_local_deliver_finish+0x63/0x1b0
   [<ffffffff81890f56>] ? ip_local_deliver+0x56/0xd0
   [<ffffffff81890c20>] ? ip_rcv_finish+0x390/0x390
   [<ffffffff81891214>] ? ip_rcv+0x244/0x370
   [<ffffffff81890890>] ? inet_del_offload+0x30/0x30
   [<ffffffff81829349>] ? __netif_receive_skb_core+0x909/0xa20
   [<ffffffff81956e00>] ? br_handle_vlan+0xa0/0x180
   [<ffffffff81956e43>] ? br_handle_vlan+0xe3/0x180
   [<ffffffff818294ca>] ? netif_receive_skb_internal+0x1a/0x80
   [<ffffffff8194a43e>] ? br_pass_frame_up+0x8e/0x130
   [<ffffffff8195714d>] ? br_allowed_ingress+0x26d/0x390
   [<ffffffff8194a6ef>] ? br_handle_frame_finish+0x20f/0x4f0
   [<ffffffff8194ab4f>] ? br_handle_frame+0x13f/0x2d0
   [<ffffffff81828d3d>] ? __netif_receive_skb_core+0x2fd/0xa20
   [<ffffffff818c027a>] ? udp_gro_receive+0x4a/0x110
   [<ffffffff818c85b9>] ? inet_gro_receive+0x1b9/0x240
   [<ffffffff818294ca>] ? netif_receive_skb_internal+0x1a/0x80
   [<ffffffff8182a3b6>] ? napi_gro_receive+0xb6/0x100
   [<ffffffff816bf159>] ? igb_poll+0x699/0xde0
   [<ffffffff81829c29>] ? net_rx_action+0x219/0x350
   [<ffffffff814d24f6>] ? __list_add+0x16/0x40
   [<ffffffff810df37a>] ? __do_softirq+0xea/0x280
   [<ffffffff810df63c>] ? irq_exit+0x8c/0x90
   [<ffffffff8106e51a>] ? do_IRQ+0x4a/0xc0
   [<ffffffff8196bf8b>] ? common_interrupt+0x8b/0x8b
   <EOI>  [<ffffffffa03f2cba>] ? 
noise_handshake_begin_session+0x4fa/0xf90 [wireguard]
   [<ffffffffa03f29fe>] ? noise_handshake_begin_session+0x23e/0xf90 
[wireguard]
   [<ffffffffa03f5489>] ? packet_send_handshake_response+0x79/0xb0 
[wireguard]
   [<ffffffffa03f6130>] ? 
packet_process_queued_handshake_packets+0x2f0/0x450 [wireguard]
   [<ffffffff810f4e09>] ? process_one_work+0x179/0x430
   [<ffffffff810f5108>] ? worker_thread+0x48/0x480
   [<ffffffff810f50c0>] ? process_one_work+0x430/0x430
   [<ffffffff810fa1b8>] ? kthread+0xb8/0xd0
   [<ffffffff8196b82e>] ? ret_from_fork+0x1e/0x50
   [<ffffffff810fa100>] ? kthread_worker_fn+0x180/0x180
---[ end trace c2bae3a81c34af5a ]---

This was immediately followed by the warning below. I am not sure if it
is related, but here it is for good measure:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/rcu/tree.c:2805 
rcu_process_callbacks+0x576/0x590
Modules linked in: cfg80211 rfkill wireguard(O) bonding 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
input_leds led_class i915 snd_hda_intel snd_hda_codec snd_hwdep 
snd_hda_core mei_txe snd_pcm mei snd_timer intel_gtt snd
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W  O    4.7.10-hardened #1
Hardware name: To be filled by O.E.M. To be filled by 
O.E.M./D180S/D190S/D290S Series, BIOS DB1F1P05_x64 12/23/2014
   0000000000000000 ffffffff814b6b3f 0000000000000001 0000000000000000
   0000000000000000 ffffffff810da0f9 ffffffff81e74d80 ffff880078e13f78
   0000000000000000 0000000000000246 ffff880078e13f40 0000000000000001
Call Trace:
   <IRQ>  [<ffffffff814b6b3f>] ? dump_stack+0x47/0x68
   [<ffffffff810da0f9>] ? __warn+0xb9/0xe0
   [<ffffffff8112e156>] ? rcu_process_callbacks+0x576/0x590
   [<ffffffff810df37a>] ? __do_softirq+0xea/0x280
   [<ffffffff810df63c>] ? irq_exit+0x8c/0x90
   [<ffffffff8108c339>] ? smp_apic_timer_interrupt+0x39/0x50
   [<ffffffff8196c1db>] ? apic_timer_interrupt+0x8b/0x90
   <EOI>  [<ffffffff817c1285>] ? cpuidle_enter_state+0x125/0x2b0
   [<ffffffff817c126e>] ? cpuidle_enter_state+0x10e/0x2b0
   [<ffffffff81119279>] ? cpu_startup_entry+0x259/0x2e0
   [<ffffffff81fd5efc>] ? 0xffffffff81fd5efc
   [<ffffffff81fd5120>] ? 0xffffffff81fd5120
   [<ffffffff81fd53c1>] ? 0xffffffff81fd53c1
---[ end trace c2bae3a81c34af5b ]---

Hope this helps,
Samuel
