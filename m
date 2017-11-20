Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75717f47
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 16:02:14 +0000 (UTC)
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7931ffac
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 16:02:14 +0000 (UTC)
Received: from www (www.lan.vdorst.com [172.16.2.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 05D64137A7B5
 for <wireguard@lists.zx2c4.com>; Mon, 20 Nov 2017 17:07:53 +0100 (CET)
Date: Mon, 20 Nov 2017 16:07:04 +0000
Message-ID: <20171120160704.Horde.BsfBQSW63FEc1BxXECCXXS4@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: WireGuard list <wireguard@lists.zx2c4.com>
Subject: general protection fault: 0000 [#1] SMP with latest commit
 a073ccac17a85f0c453698d0213cc8b86ecc3dfe
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Latest commit [0] crashes at loading. Commit:  
https://git.zx2c4.com/WireGuard/commit/?id=a073ccac17a85f0c453698d0213cc8b86ecc3dfe


This commit it still works:  
https://git.zx2c4.com/WireGuard/commit/?id=0d7fc5f3cbb84d2f803a6add9f4b58875c12ad9b


Dmesg:

[    1.906839] wireguard: loading out-of-tree module taints kernel.
[    1.908347] wireguard: allowedips self-tests: pass
[    1.909216] wireguard: nonce counter self-tests: pass
[    1.910217] wireguard: curve25519 self-tests: pass
[    1.910735] general protection fault: 0000 [#1] SMP
[    1.911230] Modules linked in: wireguard(O+) ip6_udp_tunnel  
udp_tunnel tun crct10dif_pclmul crc32_pclmul ghash_clmulni_intel ppdev  
joydev evdev pcspkr serio_raw virtio_balloon virtio_console parport_pc  
parport button sunrpc ip_tables x_tables autofs4 ext4 crc16 mbcache  
jbd2 crc32c_generic fscrypto ecb ata_generic virtio_blk virtio_net  
crc32c_intel aesni_intel aes_x86_64 crypto_simd cryptd glue_helper  
psmouse ata_piix floppy libata scsi_mod i2c_piix4 virtio_pci  
virtio_ring virtio
[    1.915665] CPU: 0 PID: 555 Comm: modprobe Tainted: G           O    
  4.13.0-0.bpo.1-amd64 #1 Debian 4.13.4-2~bpo9+1
[    1.916752] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),  
BIOS 1.10.2-1.fc26 04/01/2014
[    1.917617] task: ffff965c0f5b8040 task.stack: ffffa58d00510000
[    1.918185] RIP: 0010:chacha20_ssse3+0x44/0xc20 [wireguard]
[    1.918646] RSP: 0000:ffffa58d00512dc8 EFLAGS: 00010292
[    1.919067] RAX: 0000000000000000 RBX: 000000000000007f RCX:  
ffffa58d00512ed0
[    1.919624] RDX: 0000000000000040 RSI: ffffa58d00512ff8 RDI:  
ffffa58d00512ff8
[    1.920253] RBP: ffffa58d00512ec0 R08: ffffa58d00512ef0 R09:  
ffffa58d00512e10
[    1.920983] R10: ffffa58d00513090 R11: ffffffff8ccd2ded R12:  
ffffa58d00512ec0
[    1.921680] R13: 0000000000000040 R14: 0000000000000001 R15:  
0000000000000001
[    1.922400] FS:  00007fe93e257700(0000) GS:ffff965c12800000(0000)  
knlGS:0000000000000000
[    1.923195] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.923759] CR2: 00007f80169f59b8 CR3: 000000000c46a000 CR4:  
00000000003406f0
[    1.924485] Call Trace:
[    1.924753]  ? chacha20_crypt.part.0+0x36/0x70 [wireguard]
[    1.925322]  ? chacha20_crypt+0x106/0x110 [wireguard]
[    1.925841]  ? __chacha20poly1305_encrypt+0xfd/0x3e0 [wireguard]
[    1.926489]  ? chacha20poly1305_encrypt+0x81/0xa0 [wireguard]
[    1.927103]  ? chacha20poly1305_encrypt+0x81/0xa0 [wireguard]
[    1.927702]  ? chacha20poly1305_selftest+0x68/0x225 [wireguard]
[    1.928337]  ? 0xffffffffc0345000
[    1.928692]  ? mod_init+0x37/0x8f [wireguard]
[    1.929124]  ? do_one_initcall+0x4e/0x190
[    1.929548]  ? __vunmap+0x71/0xb0
[    1.929887]  ? __vunmap+0x71/0xb0
[    1.930244]  ? do_init_module+0x5b/0x1f8
[    1.930656]  ? load_module+0x2587/0x2c70
[    1.931065]  ? SYSC_finit_module+0xd2/0x100
[    1.931456]  ? SYSC_finit_module+0xd2/0x100
[    1.931847]  ? system_call_fast_compare_end+0xc/0x97
[    1.932358] Code: 00 48 83 ec 48 66 0f 6f 05 7a 0f 01 00 f3 0f 6f  
09 f3 0f 6f 51 10 f3 41 0f 6f 18 66 0f 6f 35 44 0f 01 00 66 0f 6f 3d  
4c 0f 01 00 <66> 0f 7f 04 24 66 0f 7f 4c 24 10 66 0f 7f 54 24 20 66 0f  
7f 5c
[    1.934310] RIP: chacha20_ssse3+0x44/0xc20 [wireguard] RSP:  
ffffa58d00512dc8
[    1.935055] ---[ end trace 0c922123e56459c5 ]---

CPUINFO

Dual core:

root@gateway:~# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 94
model name      : Intel Core Processor (Skylake)
stepping        : 3
microcode       : 0x1
cpu MHz         : 3504.000
cache size      : 4096 KB
physical id     : 0
siblings        : 1
core id         : 0
cpu cores       : 1
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge  
mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb  
rdtscp lm constant_tsc rep_good nopl cpuid pni pclmulqdq ssse3 cx16  
pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave rdrand hypervisor  
lahf_lm abm 3dnowprefetch cpuid_fault fsgsbase tsc_adjust smep erms  
invpcid mpx rdseed smap clflushopt xsaveopt xsavec xgetbv1 xsaves arat
bugs            :
bogomips        : 7008.00
clflush size    : 64
cache_alignment : 64
address sizes   : 40 bits physical, 48 bits virtual
power management:


Distro: Debian 9, kernel 4.13.0-0.bpo.1-amd64 #1 SMP Debian  
4.13.4-2~bpo9+1 (2017-10-17) x86_64 GNU/Linux


Greats,

René van Dorst.
