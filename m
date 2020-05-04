Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D62C3A5A9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 03:56:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD3FE206EB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 03:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOwunVKu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD3FE206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28102cf8;
	Mon, 4 May 2020 03:43:28 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9b9f4d7f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 03:43:26 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id k110so3284551otc.2
 for <wireguard@lists.zx2c4.com>; Sun, 03 May 2020 20:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2cwyd0O0wP/EQchNtYNy330NWRDG9bj9sGyYEpH/EDk=;
 b=pOwunVKuFfQPyEw/wmXB3wI2eTBTvV6Af7dAGd8yqAFS8KfzbQrUHv81rjkjZxoOMk
 +189lpiVSewZEIL2mekAOJsFvoUopQDY9+B9IV4PxA9Le2+B/Rshunzk8EEdBCHyTFz2
 O2rzPlJE3eo4kbG0YlXOo9RXJqutQfgG4vMazozfrmi483blyX5WCu7jjdXWYb7CcRpb
 8Z7jX7OSDI//QO2j6tHYiTcbijD0gM1UFjDcEMWSVttRYBUoprX6wug5fzbUe1eY02Og
 6Dm25INDE93vus6je6MMOtnwQm+SIhCowldyOjFoR7cqlFWjE4BBnGB2PUOierEtujFl
 S2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2cwyd0O0wP/EQchNtYNy330NWRDG9bj9sGyYEpH/EDk=;
 b=HS52HbwOtXlfAHRiWQPTU2NMn2asBndwnCFQ8WUxQOGGKcVZK6pN97sl3IJCNsUntc
 3ysviMocCE0t4n/AIGpw0BCIU+Q3AvU/RPMsX+K/WcbDyp3uI+o7JVU4+/SPrVON5ljn
 oB5JFDvzkYfwmTa8jzAflhLUR5mV4INPWqMKn7mBNPAdng2OavhfaekUiSK8cwk8br3D
 heepvgghxz91WDjWqATjZyAZsibiVuNy+L/cwuPpsK5MkYoPU3wJGfLG5Niv2oAU/IDx
 s0/ez4eEIzHBg9Zo6GoKEVRfqJaNs3fRwGuNZpIIofz4J/R0KDqsuEkcNmqHzbeuT6pu
 2QLw==
X-Gm-Message-State: AGi0PuasvUjtTm8eNlWwQ21GPNu0oRzEShLhFsm5D7WAz7Cuzl/OrlbL
 3gdaWSalQHZ821pVEtpmJ3OVfQ3RboMmJNAWuZgzLzjWvy0=
X-Google-Smtp-Source: APiQypJ62+qSsLdbnP8h05LJ1+2rsHuVcI1AaBaeTgqQTH5V+NY/l6gJQr8M/TojfjcoBn/oY434nn3XgRvB4LTxh+8=
X-Received: by 2002:a05:6830:1316:: with SMTP id
 p22mr12038613otq.223.1588564546984; 
 Sun, 03 May 2020 20:55:46 -0700 (PDT)
MIME-Version: 1.0
From: Wang Jian <larkwang@gmail.com>
Date: Mon, 4 May 2020 11:55:35 +0800
Message-ID: <CAF75rJBKTbaK6CEQcmto=YcgA5NGrG85jSvSrYZpQV-L1xFMww@mail.gmail.com>
Subject: soft lockup - may be related to wireguard (backported)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

The following is kernel log of soft lockup

# uname -a
Linux gw 5.5.0-2-amd64 #1 SMP Debian 5.5.17-1 (2020-04-15) x86_64 GNU/Linux
# cat /sys/module/wireguard/version
1.0.0

This is a linux box run debian testing. I think the wireguard is
backported from 5.6.
The box had a cpu usage spike during the soft lockup, and after that,
the wireguard stopped working, no handshake.
ifdown wg0; ifup wg0 was not capable to recover the wireguard, no handshake.

--
May  4 01:02:17 gw kernel: [27929.504771] rcu: INFO: rcu_sched
self-detected stall on CPU
May  4 01:02:17 gw kernel: [27929.504859] rcu:  2-....: (5582 ticks
this GP) idle=c02/1/0x4000000000000002 softirq=300509/300511 fqs=2470
May  4 01:02:17 gw kernel: [27929.504937]       (t=5250 jiffies g=518541 q=1110)
May  4 01:02:17 gw kernel: [27929.504975] NMI backtrace for cpu 2
May  4 01:02:17 gw kernel: [27929.505010] CPU: 2 PID: 25094 Comm:
kworker/2:1 Not tainted 5.5.0-2-amd64 #1 Debian 5.5.17-1
May  4 01:02:17 gw kernel: [27929.505076] Hardware name:  /DN2800MT,
BIOS MTCDT10N.86A.0169.2013.0923.1101 09/23/2013
May  4 01:02:17 gw kernel: [27929.505152] Workqueue: wg-crypt-wg0
wg_packet_tx_worker [wireguard]
May  4 01:02:17 gw kernel: [27929.505205] Call Trace:
May  4 01:02:17 gw kernel: [27929.505233]  <IRQ>
May  4 01:02:17 gw kernel: [27929.505263]  dump_stack+0x66/0x90
May  4 01:02:17 gw kernel: [27929.505297]  nmi_cpu_backtrace.cold+0x14/0x53
May  4 01:02:17 gw kernel: [27929.505339]  ? lapic_can_unplug_cpu.cold+0x3e/0x3e
May  4 01:02:17 gw kernel: [27929.505381]
nmi_trigger_cpumask_backtrace+0xf6/0xf8
May  4 01:02:17 gw kernel: [27929.505427]  rcu_dump_cpu_stacks+0x8f/0xbd
May  4 01:02:17 gw kernel: [27929.505466]  rcu_sched_clock_irq.cold+0x1b2/0x3ab
May  4 01:02:17 gw kernel: [27929.505509]  update_process_times+0x24/0x50
May  4 01:02:17 gw kernel: [27929.505549]  tick_sched_handle+0x22/0x60
May  4 01:02:17 gw kernel: [27929.505585]  tick_sched_timer+0x38/0x80
May  4 01:02:17 gw kernel: [27929.505620]  ? tick_sched_do_timer+0x60/0x60
May  4 01:02:17 gw kernel: [27929.505660]  __hrtimer_run_queues+0xf6/0x270
May  4 01:02:17 gw kernel: [27929.505700]  hrtimer_interrupt+0x10e/0x240
May  4 01:02:17 gw kernel: [27929.505740]  smp_apic_timer_interrupt+0x6c/0x130
May  4 01:02:17 gw kernel: [27929.505782]  apic_timer_interrupt+0xf/0x20
May  4 01:02:17 gw kernel: [27929.505818]  </IRQ>
May  4 01:02:17 gw kernel: [27929.505843] RIP: 0010:queue_work_on+0x27/0x40
May  4 01:02:17 gw kernel: [27929.505883] Code: 00 00 00 0f 1f 44 00
00 53 9c 58 0f 1f 44 00 00 48 89 c3 fa 66 0f 1f 44 00 00 f0 48 0f ba
2a 00 73 12 45 31 c0 48 89 df 57 9d <0f> 1f 44 00 00 44 89 c0 5b c3 e8
ea fb ff ff 41 b8 01 00 00 00 eb
May  4 01:02:17 gw kernel: [27929.506019] RSP: 0018:ffffb071c2eefaa8
EFLAGS: 00000286 ORIG_RAX: ffffffffffffff13
May  4 01:02:17 gw kernel: [27929.506080] RAX: 0000000000000001 RBX:
0000000000000286 RCX: 0000000000000000
May  4 01:02:17 gw kernel: [27929.506135] RDX: 00001966d8343dfd RSI:
0000000000000083 RDI: 0000000000000286
May  4 01:02:17 gw kernel: [27929.506191] RBP: ffff8b61aa1c0000 R08:
0000000000000001 R09: ffff8b61abdad510
May  4 01:02:17 gw kernel: [27929.506246] R10: ffff8b61a467ee98 R11:
ffff8b61abdacb78 R12: ffff8b61abc43000
May  4 01:02:17 gw kernel: [27929.506301] R13: ffff8b60fef63500 R14:
0000000000000003 R15: ffff8b61a9623904
May  4 01:02:17 gw kernel: [27929.506367]
wg_packet_send_staged_packets+0x320/0x5d0 [wireguard]
May  4 01:02:17 gw kernel: [27929.506426]  wg_xmit+0x324/0x490 [wireguard]
May  4 01:02:17 gw kernel: [27929.506469]  dev_hard_start_xmit+0x8d/0x1e0
May  4 01:02:17 gw kernel: [27929.506508]  __dev_queue_xmit+0x721/0x8e0
May  4 01:02:17 gw kernel: [27929.506549]  ip_finish_output2+0x19b/0x590
May  4 01:02:17 gw kernel: [27929.506604]  ? nf_confirm+0xcb/0xf0 [nf_conntrack]
May  4 01:02:17 gw kernel: [27929.506648]  ip_output+0x76/0xf0
May  4 01:02:17 gw kernel: [27929.506681]  ? __ip_finish_output+0x1c0/0x1c0
May  4 01:02:17 gw kernel: [27929.506720]  iptunnel_xmit+0x174/0x210
May  4 01:02:17 gw kernel: [27929.506761]  send4+0x120/0x390 [wireguard]
May  4 01:02:17 gw kernel: [27929.506806]
wg_socket_send_skb_to_peer+0x98/0xb0 [wireguard]
May  4 01:02:17 gw kernel: [27929.506860]
wg_packet_tx_worker+0xa9/0x210 [wireguard]
May  4 01:02:17 gw kernel: [27929.506907]  process_one_work+0x1b4/0x370
May  4 01:02:17 gw kernel: [27929.506944]  worker_thread+0x50/0x3c0
May  4 01:02:17 gw kernel: [27929.506980]  kthread+0xf9/0x130
May  4 01:02:17 gw kernel: [27929.510322]  ? process_one_work+0x370/0x370
May  4 01:02:17 gw kernel: [27929.514059]  ? kthread_park+0x90/0x90
May  4 01:02:17 gw kernel: [27929.517774]  ret_from_fork+0x1f/0x40
May  4 01:02:45 gw kernel: [27957.473746] watchdog: BUG: soft lockup -
CPU#2 stuck for 22s! [kworker/2:1:25094]
May  4 01:02:45 gw kernel: [27957.476765] Modules linked in:
nf_conntrack_netlink sctp wireguard pppoe pppox ppp_generic slhc
curve25519_x86_64 libcurve25519 libchacha20poly1305 chacha_x86_64
poly1305_x86_64 ip6_udp_tunnel udp_tunnel libblake2s blake2s_x86_64
libblake2s_generic libchacha cfg80211 rfkill 8021q garp stp mrp llc
xt_mark xt_set nft_chain_nat xt_MASQUERADE xt_TCPMSS xt_nat nf_nat
nft_counter xt_tcpudp ipt_REJECT nf_reject_ipv4 xt_state xt_conntrack
xt_multiport nft_compat nf_tables ip_set_hash_ip ip_set nfnetlink
binfmt_misc nls_ascii nls_cp437 vfat intel_powerclamp fat coretemp
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio hid_generic
snd_hda_codec_hdmi evdev efi_pstore snd_hda_intel snd_intel_dspcfg
snd_hda_codec snd_hda_core gma500_gfx usbhid snd_hwdep snd_pcm hid
iTCO_wdt snd_timer efivars pcspkr iTCO_vendor_support drm_kms_helper
snd sg watchdog soundcore i2c_algo_bit acpi_cpufreq button tcp_bbr
sch_cake nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 loop drm efivarfs
ip_tables x_tables autofs4
May  4 01:02:45 gw kernel: [27957.476843]  ext4 crc16 mbcache jbd2
btrfs xor zstd_decompress zstd_compress raid6_pq crc32c_generic
libcrc32c sd_mod ahci libahci uhci_hcd ehci_pci libata ehci_hcd e1000e
scsi_mod usbcore ptp i2c_i801 lpc_ich pps_core mfd_core usb_common
video [last unloaded: wireguard]
May  4 01:02:45 gw kernel: [27957.501504] CPU: 2 PID: 25094 Comm:
kworker/2:1 Not tainted 5.5.0-2-amd64 #1 Debian 5.5.17-1
May  4 01:02:45 gw kernel: [27957.505274] Hardware name:  /DN2800MT,
BIOS MTCDT10N.86A.0169.2013.0923.1101 09/23/2013
May  4 01:02:45 gw kernel: [27957.509046] Workqueue: wg-crypt-wg0
wg_packet_tx_worker [wireguard]
May  4 01:02:45 gw kernel: [27957.512801] RIP:
0010:__xfrm_decode_session+0xd/0x800
May  4 01:02:45 gw kernel: [27957.516563] Code: 00 00 00 e8 55 be ce
ff eb 8c e8 be 46 95 ff 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 0f
1f 44 00 00 55 48 89 e5 41 57 41 56 <41> 89 ce 41 55 41 54 49 89 fc 53
48 89 f3 48 83 ec 10 83 fa 02 74
May  4 01:02:45 gw kernel: [27957.520497] RSP: 0018:ffffb071c2eefb28
EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
May  4 01:02:45 gw kernel: [27957.524422] RAX: 0000000000000000 RBX:
ffff8b618d13ed80 RCX: 0000000000000000
May  4 01:02:45 gw kernel: [27957.528366] RDX: 0000000000000002 RSI:
ffffb071c2eefb58 RDI: ffff8b60fe81ce00
May  4 01:02:45 gw kernel: [27957.532285] RBP: ffffb071c2eefb38 R08:
0000000000000000 R09: ffff8b60ff8e5f00
May  4 01:02:45 gw kernel: [27957.536216] R10: 0000000000000000 R11:
0000000000000001 R12: ffffffff92ae7f80
May  4 01:02:45 gw kernel: [27957.540097] R13: ffffb071c2eefb58 R14:
0000000000000000 R15: 0000000000000001
May  4 01:02:45 gw kernel: [27957.543929] FS:  0000000000000000(0000)
GS:ffff8b61abd00000(0000) knlGS:0000000000000000
May  4 01:02:45 gw kernel: [27957.547734] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
May  4 01:02:45 gw kernel: [27957.551506] CR2: 00007fa15c342fb8 CR3:
000000010c80a000 CR4: 00000000000006e0
May  4 01:02:45 gw kernel: [27957.555248] Call Trace:
May  4 01:02:45 gw kernel: [27957.558920]  ip_route_me_harder+0x1ce/0x250
May  4 01:02:45 gw kernel: [27957.562614]
nf_route_table_hook4+0xee/0x110 [nf_tables]
May  4 01:02:45 gw kernel: [27957.566288]  nf_hook_slow+0x40/0xb0
May  4 01:02:45 gw kernel: [27957.569916]  __ip_local_out+0xd4/0x140
May  4 01:02:45 gw kernel: [27957.573500]  ? ip_forward_options.cold+0x23/0x23
May  4 01:02:45 gw kernel: [27957.577098]  ip_local_out+0x18/0x50
May  4 01:02:45 gw kernel: [27957.580669]  iptunnel_xmit+0x174/0x210
May  4 01:02:45 gw kernel: [27957.584210]  send4+0x120/0x390 [wireguard]
May  4 01:02:45 gw kernel: [27957.587726]
wg_socket_send_skb_to_peer+0x98/0xb0 [wireguard]
May  4 01:02:45 gw kernel: [27957.591377]
wg_packet_tx_worker+0xa9/0x210 [wireguard]
May  4 01:02:45 gw kernel: [27957.594986]  process_one_work+0x1b4/0x370
May  4 01:02:45 gw kernel: [27957.598526]  worker_thread+0x50/0x3c0
May  4 01:02:45 gw kernel: [27957.602063]  kthread+0xf9/0x130
May  4 01:02:45 gw kernel: [27957.605583]  ? process_one_work+0x370/0x370
May  4 01:02:45 gw kernel: [27957.609112]  ? kthread_park+0x90/0x90
May  4 01:02:45 gw kernel: [27957.612633]  ret_from_fork+0x1f/0x40
