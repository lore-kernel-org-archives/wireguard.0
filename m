Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MIME_HTML_MOSTLY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4636AC3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E89642080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E89642080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nicolaschan.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1de1be3d;
	Sun, 25 Aug 2019 15:42:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65473880
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jul 2019 00:43:32 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba47f74a
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jul 2019 00:43:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y4so37538148wrm.2
 for <wireguard@lists.zx2c4.com>; Sun, 21 Jul 2019 17:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=44juR+93lGdPbZ9cYsVOsObQFMAjIVUT0RYV+6FO/KA=;
 b=qC4tAeZWhSOIWl+p18B/ktHlYkB5wAKV0bYLCKTWXSGPbZi8UMx/UGYqymQzJgfghk
 Dcu9bd33UWk2lKRPMJAoNRNoBGEYz9qGr8nzVs/+I1xrro3svMvJ2uvzCZ3FJYZSkXwe
 95GaZb//7spofF56WqPiaJtKo8czvNcTKBEjRNhpApYCls/NhHpXJR5eA+P8Q9uoc/W8
 2mPlTOLoIqvIUZ7gEaGKNn9KKowPg/WEzb90PCmomHOCQg3H+pslh4uyKifZFfc/uEgM
 bguBgv5Bf4KsNQh1DDiIej069B9XEM808Im7DYFfvlGfRC4nsyT/Axea4hrc95Uv4F0W
 /zZw==
X-Gm-Message-State: APjAAAXGAvi1XVfUZR6OvKnYtlMqFIs1zu5XfL0LgvS/Fvkt1tcf9OEB
 pmLkK7ijLsyIPSoFJy5M2Vkl9ER0pTztFj+oUoV2GwrK
X-Google-Smtp-Source: APXvYqwbyYp2vfxDGecTg2fI2XTH7x1IvuC4TRb9zNQctjNoDcfYi+JOPLJebd7+Gfu/FexBZlGf0sIS0e6ldSXGQbU=
X-Received: by 2002:adf:90e7:: with SMTP id i94mr40560255wri.224.1563756210619; 
 Sun, 21 Jul 2019 17:43:30 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Chan <nicolas@nicolaschan.com>
Date: Sun, 21 Jul 2019 17:43:04 -0700
Message-ID: <CABPqyTY-KfjFenwKMWK7VHw_Kqv8ax8aW8tfjgJv8iHbX-vgYw@mail.gmail.com>
Subject: Wireguard causes system to hang
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:42:57 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2796887246404958142=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2796887246404958142==
Content-Type: multipart/alternative; boundary="000000000000730910058e3a5d30"

--000000000000730910058e3a5d30
Content-Type: text/plain; charset="UTF-8"

Hi Wireguard team,

I've recently started using Wireguard on a new system I put together, but
after a few minutes of running Wireguard the system hangs. If I don't start
Wireguard, the system behaves normally. I am using the latest version of
Arch Linux. It could be an issue with Arch, and I have also posted on their
forums about this issue, but based on the dmesg log I think it may be a
problem with Wireguard.

I can consistently reproduce this issue on my machine. I am connected on
ethernet, and normal networking works fine, and I have tried both
NetworkManager and systemd-networkd. When I start up Wireguard, either
through systemd-networkd native support or with wireguard's
systemd-networkd service (`sudo systemctl start wg-quick@intranet`)
("intranet" is the name of my Wireguard network) (configured as per the
wiki's instructions), it works perfectly fine for a couple of minutes. I
can even ping other hosts on my Wireguard network. However, after a couple
minutes, the CPU load on a single CPU core spikes to 100% (I watch htop).
Shortly thereafter, all pings to the Wireguard network fail. Normal
internet keeps working for a bit, but then that also fails (all pings and
network-related commands hang). I then have to forcibly restart my computer
by holding the power button to be able to use anything network related
again.

Based on the output of dmesg (below), I'm thinking this may be a bug with
the Wireguard kernel module, but I'm not sure. I've looked online, and have
not found anything similar related to Wireguard. It could also be poor
support for my CPU since it is relatively new (Ryzen 9 3900X), which did
have an issue with the way systemd generated random numbers that has since
been patched (and the dmesg output does mention a get_random_u32 function)
[1]. If anyone knows how to resolve this issue, or next steps I should take
to troubleshoot, I'd really appreciate your advice.

Thank you,
Nicolas

[1]
https://www.phoronix.com/scan.php?page=news_item&px=Ryzen-3K-RdRand-Systemd-Maybe

Here is the dmesg output:

[  545.876435] wireguard: WireGuard 0.0.20190702 loaded. See
www.wireguard.com for information.
[  545.876436] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.
[  708.146753] watchdog: BUG: soft lockup - CPU#2 stuck for 22s!
[kworker/u64:5:808]
[  708.146755] Modules linked in: wireguard(OE) ip6_udp_tunnel
udp_tunnel fuse xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user
xfrm_algo iptable_nat xt_addrtype iptable_filter xt_conntrack nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 br_netfilter bridge stp llc
edac_mce_amd snd_hda_codec_hdmi arc4 nvidia_drm(POE)
nvidia_modeset(POE) nls_iso8859_1 nls_cp437 vfat fat kvm iwlmvm
nvidia(POE) irqbypass mac80211 snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio btusb btrtl crct10dif_pclmul btbcm
snd_hda_intel btintel crc32_pclmul ghash_clmulni_intel hid_uclogic
joydev mousedev bluetooth wmi_bmof input_leds iwlwifi snd_hda_codec
drm_kms_helper snd_hda_core ecdh_generic ecc snd_hwdep crc16 drm
cfg80211 aesni_intel snd_pcm aes_x86_64 agpgart crypto_simd cryptd
ipmi_devintf igb glue_helper snd_timer ipmi_msghandler snd syscopyarea
sp5100_tco sysfillrect i2c_piix4 ccp sysimgblt pcspkr fb_sys_fops
evdev i2c_algo_bit soundcore rfkill rng_core dca mac_hid pinctrl_amd
wmi pcc_cpufreq
[  708.146779]  acpi_cpufreq sg crypto_user ip_tables x_tables btrfs
libcrc32c crc32c_generic xor raid6_pq sd_mod hid_generic usbhid hid
ahci libahci libata xhci_pci crc32c_intel scsi_mod xhci_hcd
[  708.146786] CPU: 2 PID: 808 Comm: kworker/u64:5 Tainted: P
 OE     5.2.1-arch1-1-ARCH #1
[  708.146787] Hardware name: Gigabyte Technology Co., Ltd. X570 I
AORUS PRO WIFI/X570 I AORUS PRO WIFI, BIOS F3 06/13/2019
[  708.146792] Workqueue: wg-kex-intranet
wg_packet_handshake_send_worker [wireguard]
[  708.146795] RIP: 0010:get_random_u32+0x21/0xa0
[  708.146796] Code: b8 01 00 00 00 eb cc 66 90 0f 1f 44 00 00 41 54
55 53 48 83 ec 08 0f 1f 44 00 00 ba 0a 00 00 00 eb 05 ba 0a 00 00 00
0f c7 f0 <72> 5f 83 ea 01 75 f6 48 8b 74 24 20 48 c7 c2 20 84 1c b5 48
c7 c7
[  708.146797] RSP: 0018:ffffa543c9123ca8 EFLAGS: 00000203 ORIG_RAX:
ffffffffffffff13
[  708.146797] RAX: 00000000ffffffff RBX: ffffa05d720b42c8 RCX: 0000000000000000
[  708.146798] RDX: 000000000000000a RSI: 0000000000000201 RDI: ffffffffc0ef6297
[  708.146798] RBP: ffffa05d3ac60000 R08: ffffffffc0f1eea0 R09: ffffa543c9123c58
[  708.146798] R10: 0000000000000000 R11: 073b28980328607f R12: ffffa05d3ac70000
[  708.146799] R13: ffffa05d720b42d0 R14: ffffa543c9123d30 R15: ffffa05d720b43f0
[  708.146799] FS:  0000000000000000(0000) GS:ffffa05dbe680000(0000)
knlGS:0000000000000000
[  708.146800] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  708.146800] CR2: 00007efbdec04000 CR3: 00000007ebd58000 CR4: 0000000000340ee0
[  708.146801] Call Trace:
[  708.146804]  ? wg_index_hashtable_insert+0x6f/0x110 [wireguard]
[  708.146807]  wg_index_hashtable_insert+0x5c/0x110 [wireguard]
[  708.146809]  wg_noise_handshake_create_initiation+0x2d6/0x300 [wireguard]
[  708.146812]  wg_packet_send_handshake_initiation+0xc9/0x160 [wireguard]
[  708.146814]  wg_packet_handshake_send_worker+0x18/0x30 [wireguard]
[  708.146816]  process_one_work+0x1d1/0x3e0
[  708.146817]  worker_thread+0x4a/0x3d0
[  708.146818]  kthread+0xfd/0x130
[  708.146819]  ? process_one_work+0x3e0/0x3e0
[  708.146820]  ? kthread_park+0x90/0x90
[  708.146822]  ret_from_fork+0x22/0x40
[  736.146757] watchdog: BUG: soft lockup - CPU#2 stuck for 22s!
[kworker/u64:5:808]
[  736.146759] Modules linked in: wireguard(OE) ip6_udp_tunnel
udp_tunnel fuse xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user
xfrm_algo iptable_nat xt_addrtype iptable_filter xt_conntrack nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 br_netfilter bridge stp llc
edac_mce_amd snd_hda_codec_hdmi arc4 nvidia_drm(POE)
nvidia_modeset(POE) nls_iso8859_1 nls_cp437 vfat fat kvm iwlmvm
nvidia(POE) irqbypass mac80211 snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio btusb btrtl crct10dif_pclmul btbcm
snd_hda_intel btintel crc32_pclmul ghash_clmulni_intel hid_uclogic
joydev mousedev bluetooth wmi_bmof input_leds iwlwifi snd_hda_codec
drm_kms_helper snd_hda_core ecdh_generic ecc snd_hwdep crc16 drm
cfg80211 aesni_intel snd_pcm aes_x86_64 agpgart crypto_simd cryptd
ipmi_devintf igb glue_helper snd_timer ipmi_msghandler snd syscopyarea
sp5100_tco sysfillrect i2c_piix4 ccp sysimgblt pcspkr fb_sys_fops
evdev i2c_algo_bit soundcore rfkill rng_core dca mac_hid pinctrl_amd
wmi pcc_cpufreq
[  736.146783]  acpi_cpufreq sg crypto_user ip_tables x_tables btrfs
libcrc32c crc32c_generic xor raid6_pq sd_mod hid_generic usbhid hid
ahci libahci libata xhci_pci crc32c_intel scsi_mod xhci_hcd
[  736.146789] CPU: 2 PID: 808 Comm: kworker/u64:5 Tainted: P
 OEL    5.2.1-arch1-1-ARCH #1
[  736.146790] Hardware name: Gigabyte Technology Co., Ltd. X570 I
AORUS PRO WIFI/X570 I AORUS PRO WIFI, BIOS F3 06/13/2019
[  736.146796] Workqueue: wg-kex-intranet
wg_packet_handshake_send_worker [wireguard]
[  736.146799] RIP: 0010:get_random_u32+0x21/0xa0
[  736.146800] Code: b8 01 00 00 00 eb cc 66 90 0f 1f 44 00 00 41 54
55 53 48 83 ec 08 0f 1f 44 00 00 ba 0a 00 00 00 eb 05 ba 0a 00 00 00
0f c7 f0 <72> 5f 83 ea 01 75 f6 48 8b 74 24 20 48 c7 c2 20 84 1c b5 48
c7 c7
[  736.146800] RSP: 0018:ffffa543c9123ca8 EFLAGS: 00000203 ORIG_RAX:
ffffffffffffff13
[  736.146801] RAX: 00000000ffffffff RBX: ffffa05d720b42c8 RCX: 0000000000000000
[  736.146802] RDX: 000000000000000a RSI: 0000000000000201 RDI: ffffffffc0ef6297
[  736.146802] RBP: ffffa05d3ac60000 R08: ffffffffc0f1eea0 R09: ffffa543c9123c58
[  736.146802] R10: 0000000000000000 R11: 073b28980328607f R12: ffffa05d3ac70000
[  736.146803] R13: ffffa05d720b42d0 R14: ffffa543c9123d30 R15: ffffa05d720b43f0
[  736.146803] FS:  0000000000000000(0000) GS:ffffa05dbe680000(0000)
knlGS:0000000000000000
[  736.146804] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  736.146804] CR2: 00007efbdec04000 CR3: 00000007ebd58000 CR4: 0000000000340ee0
[  736.146805] Call Trace:
[  736.146809]  ? wg_index_hashtable_insert+0x7d/0x110 [wireguard]
[  736.146811]  wg_index_hashtable_insert+0x5c/0x110 [wireguard]
[  736.146813]  wg_noise_handshake_create_initiation+0x2d6/0x300 [wireguard]
[  736.146816]  wg_packet_send_handshake_initiation+0xc9/0x160 [wireguard]
[  736.146818]  wg_packet_handshake_send_worker+0x18/0x30 [wireguard]
[  736.146820]  process_one_work+0x1d1/0x3e0
[  736.146821]  worker_thread+0x4a/0x3d0
[  736.146822]  kthread+0xfd/0x130
[  736.146823]  ? process_one_work+0x3e0/0x3e0
[  736.146824]  ? kthread_park+0x90/0x90
[  736.146826]  ret_from_fork+0x22/0x40
[  740.753351] rcu: INFO: rcu_preempt self-detected stall on CPU
[  740.753355] rcu:     2-....: (8 GPs behind)
idle=bd2/1/0x4000000000000002 softirq=1024/1024 fqs=5999
last_accelerate: bdca/048c, Nonlazy posted: .LD
[  740.753358]  (t=18000 jiffies g=9985 q=125494)
[  740.753359] NMI backtrace for cpu 2
[  740.753361] CPU: 2 PID: 808 Comm: kworker/u64:5 Tainted: P
 OEL    5.2.1-arch1-1-ARCH #1
[  740.753361] Hardware name: Gigabyte Technology Co., Ltd. X570 I
AORUS PRO WIFI/X570 I AORUS PRO WIFI, BIOS F3 06/13/2019
[  740.753368] Workqueue: wg-kex-intranet
wg_packet_handshake_send_worker [wireguard]
[  740.753370] Call Trace:
[  740.753373]  <IRQ>
[  740.753377]  dump_stack+0x5c/0x78
[  740.753379]  nmi_cpu_backtrace.cold+0x13/0x51
[  740.753381]  ? lapic_can_unplug_cpu.cold+0x44/0x44
[  740.753383]  nmi_trigger_cpumask_backtrace+0x10e/0x11f
[  740.753385]  rcu_dump_cpu_stacks+0x92/0xc0
[  740.753387]  rcu_sched_clock_irq.cold+0x25c/0x4fb
[  740.753389]  update_process_times+0x29/0x60
[  740.753390]  tick_sched_handle.isra.0+0x22/0x60
[  740.753392]  tick_sched_timer+0x3b/0x80
[  740.753393]  ? tick_sched_handle.isra.0+0x60/0x60
[  740.753394]  __hrtimer_run_queues+0xfd/0x2c0
[  740.753396]  hrtimer_interrupt+0x118/0x240
[  740.753397]  ? sched_clock+0x5/0x10
[  740.753399]  smp_apic_timer_interrupt+0x84/0x180
[  740.753401]  apic_timer_interrupt+0xf/0x20
[  740.753402]  </IRQ>
[  740.753404] RIP: 0010:get_random_u32+0x21/0xa0
[  740.753405] Code: b8 01 00 00 00 eb cc 66 90 0f 1f 44 00 00 41 54
55 53 48 83 ec 08 0f 1f 44 00 00 ba 0a 00 00 00 eb 05 ba 0a 00 00 00
0f c7 f0 <72> 5f 83 ea 01 75 f6 48 8b 74 24 20 48 c7 c2 20 84 1c b5 48
c7 c7
[  740.753406] RSP: 0018:ffffa543c9123ca8 EFLAGS: 00000203 ORIG_RAX:
ffffffffffffff13
[  740.753407] RAX: 00000000ffffffff RBX: ffffa05d720b42c8 RCX: 0000000000000000
[  740.753407] RDX: 000000000000000a RSI: 0000000000000201 RDI: ffffffffc0ef6297
[  740.753408] RBP: ffffa05d3ac60000 R08: ffffffffc0f1eea0 R09: ffffa543c9123c58
[  740.753408] R10: 0000000000000000 R11: 073b28980328607f R12: ffffa05d3ac70000
[  740.753409] R13: ffffa05d720b42d0 R14: ffffa543c9123d30 R15: ffffa05d720b43f0
[  740.753413]  ? wg_index_hashtable_insert+0x57/0x110 [wireguard]
[  740.753416]  ? wg_index_hashtable_insert+0x7d/0x110 [wireguard]
[  740.753418]  wg_index_hashtable_insert+0x5c/0x110 [wireguard]
[  740.753421]  wg_noise_handshake_create_initiation+0x2d6/0x300 [wireguard]
[  740.753425]  wg_packet_send_handshake_initiation+0xc9/0x160 [wireguard]
[  740.753428]  wg_packet_handshake_send_worker+0x18/0x30 [wireguard]
[  740.753430]  process_one_work+0x1d1/0x3e0
[  740.753431]  worker_thread+0x4a/0x3d0
[  740.753433]  kthread+0xfd/0x130
[  740.753434]  ? process_one_work+0x3e0/0x3e0
[  740.753435]  ? kthread_park+0x90/0x90
[  740.753436]  ret_from_fork+0x22/0x40
[  768.146760] watchdog: BUG: soft lockup - CPU#2 stuck for 22s!
[kworker/u64:5:808]
[  768.146762] Modules linked in: wireguard(OE) ip6_udp_tunnel
udp_tunnel fuse xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user
xfrm_algo iptable_nat xt_addrtype iptable_filter xt_conntrack nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 br_netfilter bridge stp llc
edac_mce_amd snd_hda_codec_hdmi arc4 nvidia_drm(POE)
nvidia_modeset(POE) nls_iso8859_1 nls_cp437 vfat fat kvm iwlmvm
nvidia(POE) irqbypass mac80211 snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio btusb btrtl crct10dif_pclmul btbcm
snd_hda_intel btintel crc32_pclmul ghash_clmulni_intel hid_uclogic
joydev mousedev bluetooth wmi_bmof input_leds iwlwifi snd_hda_codec
drm_kms_helper snd_hda_core ecdh_generic ecc snd_hwdep crc16 drm
cfg80211 aesni_intel snd_pcm aes_x86_64 agpgart crypto_simd cryptd
ipmi_devintf igb glue_helper snd_timer ipmi_msghandler snd syscopyarea
sp5100_tco sysfillrect i2c_piix4 ccp sysimgblt pcspkr fb_sys_fops
evdev i2c_algo_bit soundcore rfkill rng_core dca mac_hid pinctrl_amd
wmi pcc_cpufreq
[  768.146785]  acpi_cpufreq sg crypto_user ip_tables x_tables btrfs
libcrc32c crc32c_generic xor raid6_pq sd_mod hid_generic usbhid hid
ahci libahci libata xhci_pci crc32c_intel scsi_mod xhci_hcd
[  768.146791] CPU: 2 PID: 808 Comm: kworker/u64:5 Tainted: P
 OEL    5.2.1-arch1-1-ARCH #1
[  768.146791] Hardware name: Gigabyte Technology Co., Ltd. X570 I
AORUS PRO WIFI/X570 I AORUS PRO WIFI, BIOS F3 06/13/2019
[  768.146797] Workqueue: wg-kex-intranet
wg_packet_handshake_send_worker [wireguard]
[  768.146800] RIP: 0010:get_random_u32+0x21/0xa0
[  768.146801] Code: b8 01 00 00 00 eb cc 66 90 0f 1f 44 00 00 41 54
55 53 48 83 ec 08 0f 1f 44 00 00 ba 0a 00 00 00 eb 05 ba 0a 00 00 00
0f c7 f0 <72> 5f 83 ea 01 75 f6 48 8b 74 24 20 48 c7 c2 20 84 1c b5 48
c7 c7
[  768.146801] RSP: 0018:ffffa543c9123ca8 EFLAGS: 00000203 ORIG_RAX:
ffffffffffffff13
[  768.146802] RAX: 00000000ffffffff RBX: ffffa05d720b42c8 RCX: 0000000000000000
[  768.146802] RDX: 000000000000000a RSI: 0000000000000201 RDI: ffffffffc0ef6297
[  768.146802] RBP: ffffa05d3ac60000 R08: ffffffffc0f1eea0 R09: ffffa543c9123c58
[  768.146803] R10: 0000000000000000 R11: 073b28980328607f R12: ffffa05d3ac70000
[  768.146803] R13: ffffa05d720b42d0 R14: ffffa543c9123d30 R15: ffffa05d720b43f0
[  768.146804] FS:  0000000000000000(0000) GS:ffffa05dbe680000(0000)
knlGS:0000000000000000
[  768.146804] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  768.146805] CR2: 00007efbdec04000 CR3: 00000007ebd58000 CR4: 0000000000340ee0
[  768.146805] Call Trace:
[  768.146808]  ? wg_index_hashtable_insert+0x6f/0x110 [wireguard]
[  768.146810]  wg_index_hashtable_insert+0x5c/0x110 [wireguard]
[  768.146813]  wg_noise_handshake_create_initiation+0x2d6/0x300 [wireguard]
[  768.146815]  wg_packet_send_handshake_initiation+0xc9/0x160 [wireguard]
[  768.146817]  wg_packet_handshake_send_worker+0x18/0x30 [wireguard]
[  768.146819]  process_one_work+0x1d1/0x3e0
[  768.146820]  worker_thread+0x4a/0x3d0
[  768.146821]  kthread+0xfd/0x130
[  768.146822]  ? process_one_work+0x3e0/0x3e0
[  768.146823]  ? kthread_park+0x90/0x90
[  768.146824]  ret_from_fork+0x22/0x40

--000000000000730910058e3a5d30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Wireguard team, <br></div><div><br></div><div>I&#3=
9;ve recently started using Wireguard on a new system I put together, but a=
fter a few minutes of running Wireguard the system hangs. If I don&#39;t st=
art Wireguard, the system behaves normally. I am using the latest version o=
f Arch Linux. It could be an issue with Arch, and I have also posted on the=
ir forums about this issue, but based on the dmesg log I think it may be a =
problem with Wireguard.<br></div><br>I can consistently reproduce this issu=
e on my machine. I am connected on ethernet, and normal networking works fi=
ne, and I have tried both NetworkManager and systemd-networkd. When I start=
 up Wireguard, either through systemd-networkd native support or with wireg=
uard&#39;s systemd-networkd service (`sudo systemctl start wg-quick@intrane=
t`) (&quot;intranet&quot; is the name of my Wireguard network) (configured =
as per the wiki&#39;s instructions), it works perfectly fine for a couple o=
f minutes. I can even ping other hosts on my Wireguard network. However, af=
ter a couple minutes, the CPU load on a single CPU core spikes to 100% (I w=
atch htop). Shortly thereafter, all pings to the Wireguard network fail. No=
rmal internet keeps working for a bit, but then that also fails (all pings =
and network-related commands hang). I then have to forcibly restart my comp=
uter by holding the power button to be able to use anything network related=
 again.<br><br><div>Based on the output of dmesg (below), I&#39;m thinking =
this may be a bug with the Wireguard kernel module, but I&#39;m not sure. I=
&#39;ve looked online, and have not found anything similar related to Wireg=
uard. It could also be poor support for my CPU since it is relatively new (=
Ryzen 9 3900X), which did have an issue with the way systemd generated rand=
om numbers that has since been patched (and the dmesg output does mention a=
 get_random_u32 function) [1]. If anyone knows how to resolve this issue, o=
r next steps I should take to troubleshoot, I&#39;d really appreciate your =
advice. <br></div><div><br></div>Thank you,<br><div>Nicolas</div><div><br><=
/div><div>[1] <a href=3D"https://www.phoronix.com/scan.php?page=3Dnews_item=
&amp;px=3DRyzen-3K-RdRand-Systemd-Maybe">https://www.phoronix.com/scan.php?=
page=3Dnews_item&amp;px=3DRyzen-3K-RdRand-Systemd-Maybe</a></div><div><br><=
/div><div>Here is the dmesg output:</div><div><br></div><div><div class=3D"=
gmail-codebox"><pre class=3D"gmail-vscroll"><code>[  545.876435] wireguard:=
 WireGuard 0.0.20190702 loaded. See <a href=3D"http://www.wireguard.com">ww=
w.wireguard.com</a> for information.
[  545.876436] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld &lt;<a=
 href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt;. All Rights Reserv=
ed.
[  708.146753] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [kworker/u=
64:5:808]
[  708.146755] Modules linked in: wireguard(OE) ip6_udp_tunnel udp_tunnel f=
use xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo iptabl=
e_nat xt_addrtype iptable_filter xt_conntrack nf_nat nf_conntrack nf_defrag=
_ipv6 nf_defrag_ipv4 br_netfilter bridge stp llc edac_mce_amd snd_hda_codec=
_hdmi arc4 nvidia_drm(POE) nvidia_modeset(POE) nls_iso8859_1 nls_cp437 vfat=
 fat kvm iwlmvm nvidia(POE) irqbypass mac80211 snd_hda_codec_realtek snd_hd=
a_codec_generic ledtrig_audio btusb btrtl crct10dif_pclmul btbcm snd_hda_in=
tel btintel crc32_pclmul ghash_clmulni_intel hid_uclogic joydev mousedev bl=
uetooth wmi_bmof input_leds iwlwifi snd_hda_codec drm_kms_helper snd_hda_co=
re ecdh_generic ecc snd_hwdep crc16 drm cfg80211 aesni_intel snd_pcm aes_x8=
6_64 agpgart crypto_simd cryptd ipmi_devintf igb glue_helper snd_timer ipmi=
_msghandler snd syscopyarea sp5100_tco sysfillrect i2c_piix4 ccp sysimgblt =
pcspkr fb_sys_fops evdev i2c_algo_bit soundcore rfkill rng_core dca mac_hid=
 pinctrl_amd wmi pcc_cpufreq
[  708.146779]  acpi_cpufreq sg crypto_user ip_tables x_tables btrfs libcrc=
32c crc32c_generic xor raid6_pq sd_mod hid_generic usbhid hid ahci libahci =
libata xhci_pci crc32c_intel scsi_mod xhci_hcd
[  708.146786] CPU: 2 PID: 808 Comm: kworker/u64:5 Tainted: P           OE =
    5.2.1-arch1-1-ARCH #1
[  708.146787] Hardware name: Gigabyte Technology Co., Ltd. X570 I AORUS PR=
O WIFI/X570 I AORUS PRO WIFI, BIOS F3 06/13/2019
[  708.146792] Workqueue: wg-kex-intranet wg_packet_handshake_send_worker [=
wireguard]
[  708.146795] RIP: 0010:get_random_u32+0x21/0xa0
[  708.146796] Code: b8 01 00 00 00 eb cc 66 90 0f 1f 44 00 00 41 54 55 53 =
48 83 ec 08 0f 1f 44 00 00 ba 0a 00 00 00 eb 05 ba 0a 00 00 00 0f c7 f0 &lt=
;72&gt; 5f 83 ea 01 75 f6 48 8b 74 24 20 48 c7 c2 20 84 1c b5 48 c7 c7
[  708.146797] RSP: 0018:ffffa543c9123ca8 EFLAGS: 00000203 ORIG_RAX: ffffff=
ffffffff13
[  708.146797] RAX: 00000000ffffffff RBX: ffffa05d720b42c8 RCX: 00000000000=
00000
[  708.146798] RDX: 000000000000000a RSI: 0000000000000201 RDI: ffffffffc0e=
f6297
[  708.146798] RBP: ffffa05d3ac60000 R08: ffffffffc0f1eea0 R09: ffffa543c91=
23c58
[  708.146798] R10: 0000000000000000 R11: 073b28980328607f R12: ffffa05d3ac=
70000
[  708.146799] R13: ffffa05d720b42d0 R14: ffffa543c9123d30 R15: ffffa05d720=
b43f0
[  708.146799] FS:  0000000000000000(0000) GS:ffffa05dbe680000(0000) knlGS:=
0000000000000000
[  708.146800] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  708.146800] CR2: 00007efbdec04000 CR3: 00000007ebd58000 CR4: 00000000003=
40ee0
[  708.146801] Call Trace:
[  708.146804]  ? wg_index_hashtable_insert+0x6f/0x110 [wireguard]
[  708.146807]  wg_index_hashtable_insert+0x5c/0x110 [wireguard]
[  708.146809]  wg_noise_handshake_create_initiation+0x2d6/0x300 [wireguard=
]
[  708.146812]  wg_packet_send_handshake_initiation+0xc9/0x160 [wireguard]
[  708.146814]  wg_packet_handshake_send_worker+0x18/0x30 [wireguard]
[  708.146816]  process_one_work+0x1d1/0x3e0
[  708.146817]  worker_thread+0x4a/0x3d0
[  708.146818]  kthread+0xfd/0x130
[  708.146819]  ? process_one_work+0x3e0/0x3e0
[  708.146820]  ? kthread_park+0x90/0x90
[  708.146822]  ret_from_fork+0x22/0x40
[  736.146757] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [kworker/u=
64:5:808]
[  736.146759] Modules linked in: wireguard(OE) ip6_udp_tunnel udp_tunnel f=
use xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo iptabl=
e_nat xt_addrtype iptable_filter xt_conntrack nf_nat nf_conntrack nf_defrag=
_ipv6 nf_defrag_ipv4 br_netfilter bridge stp llc edac_mce_amd snd_hda_codec=
_hdmi arc4 nvidia_drm(POE) nvidia_modeset(POE) nls_iso8859_1 nls_cp437 vfat=
 fat kvm iwlmvm nvidia(POE) irqbypass mac80211 snd_hda_codec_realtek snd_hd=
a_codec_generic ledtrig_audio btusb btrtl crct10dif_pclmul btbcm snd_hda_in=
tel btintel crc32_pclmul ghash_clmulni_intel hid_uclogic joydev mousedev bl=
uetooth wmi_bmof input_leds iwlwifi snd_hda_codec drm_kms_helper snd_hda_co=
re ecdh_generic ecc snd_hwdep crc16 drm cfg80211 aesni_intel snd_pcm aes_x8=
6_64 agpgart crypto_simd cryptd ipmi_devintf igb glue_helper snd_timer ipmi=
_msghandler snd syscopyarea sp5100_tco sysfillrect i2c_piix4 ccp sysimgblt =
pcspkr fb_sys_fops evdev i2c_algo_bit soundcore rfkill rng_core dca mac_hid=
 pinctrl_amd wmi pcc_cpufreq
[  736.146783]  acpi_cpufreq sg crypto_user ip_tables x_tables btrfs libcrc=
32c crc32c_generic xor raid6_pq sd_mod hid_generic usbhid hid ahci libahci =
libata xhci_pci crc32c_intel scsi_mod xhci_hcd
[  736.146789] CPU: 2 PID: 808 Comm: kworker/u64:5 Tainted: P           OEL=
    5.2.1-arch1-1-ARCH #1
[  736.146790] Hardware name: Gigabyte Technology Co., Ltd. X570 I AORUS PR=
O WIFI/X570 I AORUS PRO WIFI, BIOS F3 06/13/2019
[  736.146796] Workqueue: wg-kex-intranet wg_packet_handshake_send_worker [=
wireguard]
[  736.146799] RIP: 0010:get_random_u32+0x21/0xa0
[  736.146800] Code: b8 01 00 00 00 eb cc 66 90 0f 1f 44 00 00 41 54 55 53 =
48 83 ec 08 0f 1f 44 00 00 ba 0a 00 00 00 eb 05 ba 0a 00 00 00 0f c7 f0 &lt=
;72&gt; 5f 83 ea 01 75 f6 48 8b 74 24 20 48 c7 c2 20 84 1c b5 48 c7 c7
[  736.146800] RSP: 0018:ffffa543c9123ca8 EFLAGS: 00000203 ORIG_RAX: ffffff=
ffffffff13
[  736.146801] RAX: 00000000ffffffff RBX: ffffa05d720b42c8 RCX: 00000000000=
00000
[  736.146802] RDX: 000000000000000a RSI: 0000000000000201 RDI: ffffffffc0e=
f6297
[  736.146802] RBP: ffffa05d3ac60000 R08: ffffffffc0f1eea0 R09: ffffa543c91=
23c58
[  736.146802] R10: 0000000000000000 R11: 073b28980328607f R12: ffffa05d3ac=
70000
[  736.146803] R13: ffffa05d720b42d0 R14: ffffa543c9123d30 R15: ffffa05d720=
b43f0
[  736.146803] FS:  0000000000000000(0000) GS:ffffa05dbe680000(0000) knlGS:=
0000000000000000
[  736.146804] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  736.146804] CR2: 00007efbdec04000 CR3: 00000007ebd58000 CR4: 00000000003=
40ee0
[  736.146805] Call Trace:
[  736.146809]  ? wg_index_hashtable_insert+0x7d/0x110 [wireguard]
[  736.146811]  wg_index_hashtable_insert+0x5c/0x110 [wireguard]
[  736.146813]  wg_noise_handshake_create_initiation+0x2d6/0x300 [wireguard=
]
[  736.146816]  wg_packet_send_handshake_initiation+0xc9/0x160 [wireguard]
[  736.146818]  wg_packet_handshake_send_worker+0x18/0x30 [wireguard]
[  736.146820]  process_one_work+0x1d1/0x3e0
[  736.146821]  worker_thread+0x4a/0x3d0
[  736.146822]  kthread+0xfd/0x130
[  736.146823]  ? process_one_work+0x3e0/0x3e0
[  736.146824]  ? kthread_park+0x90/0x90
[  736.146826]  ret_from_fork+0x22/0x40
[  740.753351] rcu: INFO: rcu_preempt self-detected stall on CPU
[  740.753355] rcu:     2-....: (8 GPs behind) idle=3Dbd2/1/0x4000000000000=
002 softirq=3D1024/1024 fqs=3D5999 last_accelerate: bdca/048c, Nonlazy post=
ed: .LD
[  740.753358]  (t=3D18000 jiffies g=3D9985 q=3D125494)
[  740.753359] NMI backtrace for cpu 2
[  740.753361] CPU: 2 PID: 808 Comm: kworker/u64:5 Tainted: P           OEL=
    5.2.1-arch1-1-ARCH #1
[  740.753361] Hardware name: Gigabyte Technology Co., Ltd. X570 I AORUS PR=
O WIFI/X570 I AORUS PRO WIFI, BIOS F3 06/13/2019
[  740.753368] Workqueue: wg-kex-intranet wg_packet_handshake_send_worker [=
wireguard]
[  740.753370] Call Trace:
[  740.753373]  &lt;IRQ&gt;
[  740.753377]  dump_stack+0x5c/0x78
[  740.753379]  nmi_cpu_backtrace.cold+0x13/0x51
[  740.753381]  ? lapic_can_unplug_cpu.cold+0x44/0x44
[  740.753383]  nmi_trigger_cpumask_backtrace+0x10e/0x11f
[  740.753385]  rcu_dump_cpu_stacks+0x92/0xc0
[  740.753387]  rcu_sched_clock_irq.cold+0x25c/0x4fb
[  740.753389]  update_process_times+0x29/0x60
[  740.753390]  tick_sched_handle.isra.0+0x22/0x60
[  740.753392]  tick_sched_timer+0x3b/0x80
[  740.753393]  ? tick_sched_handle.isra.0+0x60/0x60
[  740.753394]  __hrtimer_run_queues+0xfd/0x2c0
[  740.753396]  hrtimer_interrupt+0x118/0x240
[  740.753397]  ? sched_clock+0x5/0x10
[  740.753399]  smp_apic_timer_interrupt+0x84/0x180
[  740.753401]  apic_timer_interrupt+0xf/0x20
[  740.753402]  &lt;/IRQ&gt;
[  740.753404] RIP: 0010:get_random_u32+0x21/0xa0
[  740.753405] Code: b8 01 00 00 00 eb cc 66 90 0f 1f 44 00 00 41 54 55 53 =
48 83 ec 08 0f 1f 44 00 00 ba 0a 00 00 00 eb 05 ba 0a 00 00 00 0f c7 f0 &lt=
;72&gt; 5f 83 ea 01 75 f6 48 8b 74 24 20 48 c7 c2 20 84 1c b5 48 c7 c7
[  740.753406] RSP: 0018:ffffa543c9123ca8 EFLAGS: 00000203 ORIG_RAX: ffffff=
ffffffff13
[  740.753407] RAX: 00000000ffffffff RBX: ffffa05d720b42c8 RCX: 00000000000=
00000
[  740.753407] RDX: 000000000000000a RSI: 0000000000000201 RDI: ffffffffc0e=
f6297
[  740.753408] RBP: ffffa05d3ac60000 R08: ffffffffc0f1eea0 R09: ffffa543c91=
23c58
[  740.753408] R10: 0000000000000000 R11: 073b28980328607f R12: ffffa05d3ac=
70000
[  740.753409] R13: ffffa05d720b42d0 R14: ffffa543c9123d30 R15: ffffa05d720=
b43f0
[  740.753413]  ? wg_index_hashtable_insert+0x57/0x110 [wireguard]
[  740.753416]  ? wg_index_hashtable_insert+0x7d/0x110 [wireguard]
[  740.753418]  wg_index_hashtable_insert+0x5c/0x110 [wireguard]
[  740.753421]  wg_noise_handshake_create_initiation+0x2d6/0x300 [wireguard=
]
[  740.753425]  wg_packet_send_handshake_initiation+0xc9/0x160 [wireguard]
[  740.753428]  wg_packet_handshake_send_worker+0x18/0x30 [wireguard]
[  740.753430]  process_one_work+0x1d1/0x3e0
[  740.753431]  worker_thread+0x4a/0x3d0
[  740.753433]  kthread+0xfd/0x130
[  740.753434]  ? process_one_work+0x3e0/0x3e0
[  740.753435]  ? kthread_park+0x90/0x90
[  740.753436]  ret_from_fork+0x22/0x40
[  768.146760] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [kworker/u=
64:5:808]
[  768.146762] Modules linked in: wireguard(OE) ip6_udp_tunnel udp_tunnel f=
use xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo iptabl=
e_nat xt_addrtype iptable_filter xt_conntrack nf_nat nf_conntrack nf_defrag=
_ipv6 nf_defrag_ipv4 br_netfilter bridge stp llc edac_mce_amd snd_hda_codec=
_hdmi arc4 nvidia_drm(POE) nvidia_modeset(POE) nls_iso8859_1 nls_cp437 vfat=
 fat kvm iwlmvm nvidia(POE) irqbypass mac80211 snd_hda_codec_realtek snd_hd=
a_codec_generic ledtrig_audio btusb btrtl crct10dif_pclmul btbcm snd_hda_in=
tel btintel crc32_pclmul ghash_clmulni_intel hid_uclogic joydev mousedev bl=
uetooth wmi_bmof input_leds iwlwifi snd_hda_codec drm_kms_helper snd_hda_co=
re ecdh_generic ecc snd_hwdep crc16 drm cfg80211 aesni_intel snd_pcm aes_x8=
6_64 agpgart crypto_simd cryptd ipmi_devintf igb glue_helper snd_timer ipmi=
_msghandler snd syscopyarea sp5100_tco sysfillrect i2c_piix4 ccp sysimgblt =
pcspkr fb_sys_fops evdev i2c_algo_bit soundcore rfkill rng_core dca mac_hid=
 pinctrl_amd wmi pcc_cpufreq
[  768.146785]  acpi_cpufreq sg crypto_user ip_tables x_tables btrfs libcrc=
32c crc32c_generic xor raid6_pq sd_mod hid_generic usbhid hid ahci libahci =
libata xhci_pci crc32c_intel scsi_mod xhci_hcd
[  768.146791] CPU: 2 PID: 808 Comm: kworker/u64:5 Tainted: P           OEL=
    5.2.1-arch1-1-ARCH #1
[  768.146791] Hardware name: Gigabyte Technology Co., Ltd. X570 I AORUS PR=
O WIFI/X570 I AORUS PRO WIFI, BIOS F3 06/13/2019
[  768.146797] Workqueue: wg-kex-intranet wg_packet_handshake_send_worker [=
wireguard]
[  768.146800] RIP: 0010:get_random_u32+0x21/0xa0
[  768.146801] Code: b8 01 00 00 00 eb cc 66 90 0f 1f 44 00 00 41 54 55 53 =
48 83 ec 08 0f 1f 44 00 00 ba 0a 00 00 00 eb 05 ba 0a 00 00 00 0f c7 f0 &lt=
;72&gt; 5f 83 ea 01 75 f6 48 8b 74 24 20 48 c7 c2 20 84 1c b5 48 c7 c7
[  768.146801] RSP: 0018:ffffa543c9123ca8 EFLAGS: 00000203 ORIG_RAX: ffffff=
ffffffff13
[  768.146802] RAX: 00000000ffffffff RBX: ffffa05d720b42c8 RCX: 00000000000=
00000
[  768.146802] RDX: 000000000000000a RSI: 0000000000000201 RDI: ffffffffc0e=
f6297
[  768.146802] RBP: ffffa05d3ac60000 R08: ffffffffc0f1eea0 R09: ffffa543c91=
23c58
[  768.146803] R10: 0000000000000000 R11: 073b28980328607f R12: ffffa05d3ac=
70000
[  768.146803] R13: ffffa05d720b42d0 R14: ffffa543c9123d30 R15: ffffa05d720=
b43f0
[  768.146804] FS:  0000000000000000(0000) GS:ffffa05dbe680000(0000) knlGS:=
0000000000000000
[  768.146804] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  768.146805] CR2: 00007efbdec04000 CR3: 00000007ebd58000 CR4: 00000000003=
40ee0
[  768.146805] Call Trace:
[  768.146808]  ? wg_index_hashtable_insert+0x6f/0x110 [wireguard]
[  768.146810]  wg_index_hashtable_insert+0x5c/0x110 [wireguard]
[  768.146813]  wg_noise_handshake_create_initiation+0x2d6/0x300 [wireguard=
]
[  768.146815]  wg_packet_send_handshake_initiation+0xc9/0x160 [wireguard]
[  768.146817]  wg_packet_handshake_send_worker+0x18/0x30 [wireguard]
[  768.146819]  process_one_work+0x1d1/0x3e0
[  768.146820]  worker_thread+0x4a/0x3d0
[  768.146821]  kthread+0xfd/0x130
[  768.146822]  ? process_one_work+0x3e0/0x3e0
[  768.146823]  ? kthread_park+0x90/0x90
[  768.146824]  ret_from_fork+0x22/0x40</code></pre></div></div></div>

--000000000000730910058e3a5d30--

--===============2796887246404958142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2796887246404958142==--
