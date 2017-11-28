Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0f46756
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 12:14:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5be8bdd
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 12:14:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1b0806f
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 12:14:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 306afd0c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 12:14:14 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id b17so122337oth.2
 for <wireguard@lists.zx2c4.com>; Tue, 28 Nov 2017 04:20:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5A0ACF98.2734.3D2AE425@pageexec.freemail.hu>
References: <20171111080920.GA5705@localhost.localdomain>
 <5A0A3587.25804.3AD10FF8@pageexec.freemail.hu>
 <CAHmME9prMg_RuEUaO1XNy4Aj6MH3Cu=16kp=F_B-kKbSwO+qdQ@mail.gmail.com>
 <5A0ACF98.2734.3D2AE425@pageexec.freemail.hu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Nov 2017 13:20:05 +0100
Message-ID: <CAHmME9oL=p3snOEWevyqHYSy3yjdpDrtyQYViT__9BxJYU=1cw@mail.gmail.com>
Subject: Re: imer_setup() is not compatible with PaX's RAP
To: pageexec@freemail.hu
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Pipacs,

A user on IRC found another issue. This time it looks like it might be
a RAP bug, though. Below is the error output. So far as I can see, the
function pointer type and the function declaration match fine.
However, the function itself is implemented in assembly, which means
it can't itself be instrumented by RAP. What to do?

https://git.zx2c4.com/WireGuard/tree/src/crypto/chacha20poly1305.c#n567

Jason

[31312.560886] wireguard: loading out-of-tree module taints kernel.
[31312.561438] wireguard: WireGuard 0.0.20171127 loaded. See
www.wireguard.com for information.
[31312.561439] wireguard: Copyright (C) 2015-2017 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.
[31322.008508] PAX: RAP hash violation for function pointer:
poly1305_blocks_x86_64+0x0/0x100 [wireguard]
[31322.018515] PAX: overwritten function pointer detected: 0000 [#1] SMP
[31322.028152] Modules linked in: wireguard(O) ip6_udp_tunnel
udp_tunnel tun 8021q mrp ipt_MASQUERADE nf_nat_masquerade_ipv4 xt_nat
iptable_nat nf_nat_ipv4 ipt_REJECT nf_reject_ipv4 nf_log_ipv4
nf_conntrack_ipv4 nf_defrag_ipv4 xt_multiport iptable_filter
iptable_mangle ip_tables xt_TCPMSS xt_comment xt_tcpudp
ip6table_mangle ip6t_REJECT nf_reject_ipv6 nf_log_ipv6 nf_log_common
xt_LOG xt_limit xt_conntrack ip6table_filter ip6t_MASQUERADE
nf_nat_masquerade_ipv6 ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6
nf_nat_ipv6 nf_nat nf_conntrack ip6t_rpfilter ip6table_raw ip6_tables
x_tables ext4 crc16 jbd2 mbcache xfs libcrc32c exportfs af_packet ipv6
virtio_console psmouse serio_raw pcspkr igb ptp pps_core hwmon dca
i2c_algo_bit shpchp input_leds evdev joydev mousedev qemu_fw_cfg
floppy parport_pc parport tpm_tis
[31322.099742]  tpm_tis_core tpm dm_mod hid_generic usbhid hid uas
fbcon bitblit fbcon_rotate fbcon_ccw fbcon_ud fbcon_cw softcursor font
tileblit virtio_balloon button xhci_pci xhci_hcd uhci_hcd bochs_drm
ttm drm_kms_helper drm fb_sys_fops syscopyarea sysfillrect sysimgblt
ata_generic pata_acpi ata_piix libata virtio_pci virtio_ring virtio
i2c_piix4 i2c_core intel_agp intel_gtt agpgart loop crc32c_generic
btrfs xor raid6_pq usb_storage sd_mod scsi_mod
[31322.157368] CPU: 0 PID: 3344 Comm: kworker/0:2 Tainted: G
O    4.9.65-1-hardened #2-Alpine
[31322.173073] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS rel-1.10.2-0-g5f4c7b1-prebuilt.qemu-project.org 04/01/2014
[31322.205545] Workqueue: wg-kex-lansecure
packet_handshake_receive_worker [wireguard]
[31322.222496] task: ffff8800b93f4bc0 task.stack: ffffc90003074000
[31322.239610] RIP: 0010:[<ffffffffa01ee17e>]  [<ffffffffa01ee17e>]
poly1305_update+0x18e/0x1b0 [wireguard]
[31322.257251] RSP: 0000:ffffc90003077998  EFLAGS: 00000216
[31322.274886] RAX: ffffffffa01f93c0 RBX: 0000000000000020 RCX: ffffffffa01ef7b3
[31322.292663] RDX: 0000000000000020 RSI: ffffc90003077ce7 RDI: ffffc90003077a70
[31322.310467] RBP: ffffc900030779d0 R08: ffffffffa01f93c0 R09: 0000000000000000
[31322.328276] R10: ffffc90003077b78 R11: 58e1b4d500000000 R12: ffffc90003077a70
[31322.346218] R13: 0000000000000000 R14: ffffc90003077ce7 R15: 0000000000000020
[31322.364271] FS:  0000000000000000(0000) GS:ffff8800bfa00000(0000)
knlGS:0000000000000000
[31322.382681] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[31322.401247] CR2: 0000000000000000 CR3: 00000000bae07000 CR4: 00000000000006b0
[31322.420111] Stack:
[31322.438912]  799bb7f3dc82ba87 5ecf70918324bcec ffffc90003077c87
ffffc90003077bb8
[31322.458357]  ffffc90003077a20 0000000000000001 0000000000000020
ffffc90003077c40
[31322.477912]  ffffffffa01ef7da b3326dec53956add 4bd3dddee06cadf2
0000000000000020
[31322.497565] Call Trace:
[31322.517082]  [<ffffffffa01ef7da>]
chacha20poly1305_decrypt+0x21a/0x8e0 [wireguard]
[31322.537124]  [<ffffffff8130ebc2>] ? memzero_explicit+0x1f/0x40
[31322.557308]  [<ffffffffa01f93c0>] ? poly1305_init_x86_64+0x40/0x40
[wireguard]
[31322.577686]  [<ffffffffa01f94c0>] ?
poly1305_blocks_x86_64+0x100/0x100 [wireguard]
[31322.598313]  [<ffffffffa01d73c6>]
noise_handshake_consume_initiation+0x286/0x6e0 [wireguard]
[31322.619328]  [<ffffffff8130ebc2>] ? memzero_explicit+0x1f/0x40
[31322.640488]  [<ffffffffa01e3259>] ? compute_mac1+0xc9/0x120 [wireguard]
[31322.661930]  [<ffffffffa01dcbdb>]
packet_handshake_receive_worker+0x2cb/0x430 [wireguard]
[31322.683748]  [<ffffffff8109b918>] process_one_work+0x260/0x40e
[31322.705478]  [<ffffffff8109ca87>] worker_thread+0x3f1/0x586
[31322.727402]  [<ffffffff8109c696>] ? rescuer_thread+0x443/0x443
[31322.749450]  [<ffffffff810a34e1>] kthread+0x15e/0x170
[31322.771493]  [<ffffffff810a3383>] ? kthread_park+0xa4/0xa4
[31322.793619]  [<ffffffff810a3383>] ? kthread_park+0xa4/0xa4
[31322.815512]  [<ffffffff8167051b>] ret_from_fork+0x5b/0x70
[31322.837338] Code: 8d bc 2f d0 00 00 00 4c 01 eb eb 0b b4 0c 76 cd
ff ff ff ff cc cc cc e8 41 62 12 e1 49 89 9c 24 e0 00 00 00 e9 4b ff
ff ff cd 82 <cd> 82 cd 83 0f 1f 40 00 66 2e 0f 1f 84 00 00 00 00 00 cc
cc cc
[31322.881717] RIP  [<ffffffffa01ee17e>] poly1305_update+0x18e/0x1b0 [wireguard]
[31322.903292]  RSP <ffffc90003077998>
[31322.961174] ---[ end trace f0299ab1621f48bd ]---
