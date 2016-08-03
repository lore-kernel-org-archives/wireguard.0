Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e852925
 for <wireguard@lists.zx2c4.com>; Wed, 3 Aug 2016 16:14:37 +0000 (UTC)
Received: from [10.60.12.144] (unknown [185.66.194.30])
 by openfreiburg.de (Postfix) with ESMTPSA id 9C8F210F24097
 for <wireguard@lists.zx2c4.com>; Wed,  3 Aug 2016 18:18:08 +0200 (CEST)
To: wireguard@lists.zx2c4.com
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
 <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
 <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
 <DEB54C8F-1159-48AD-B2A3-CB2B4E05C896@viisauksena.de>
 <CAHmME9oveH4hLUzEjwWnZ8Nj8U63LEuVezgivsxVxgpZKL_PwQ@mail.gmail.com>
 <8eebb32d-b302-5975-726b-874a9ad12a84@viisauksena.de>
 <20160803064853.Horde.ZExiUp0by8SskYUmZW7CFq4@www.vdorst.com>
From: jens <jens@viisauksena.de>
Message-ID: <ce094d6d-2314-8bfe-72e1-879b88ec7141@viisauksena.de>
Date: Wed, 3 Aug 2016 18:14:44 +0200
MIME-Version: 1.0
In-Reply-To: <20160803064853.Horde.ZExiUp0by8SskYUmZW7CFq4@www.vdorst.com>
Content-Type: multipart/alternative;
 boundary="------------37F563402E79D0924F7D3CA3"
Subject: Re: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
 crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------37F563402E79D0924F7D3CA3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 03.08.2016 08:48, René van Dorst wrote:
> ...
> I also tested wireguard on a router. TP-Link WR1043ND v1.08 with a
> Atheros AR9132 400MHz cpu.
> Running LEDE 28-july-2016, wireguard & iperf3 via packagemanager. 

so you do not observe crashing of the router like we do with the tp-link
wr841Nv11 -

do you also test iperf with udp packets , around 200 Mbit or so ?
acording to openwrt wiki say that 1043v1.xx runs even slower cpu , but
have 8Mb of flash

TL-WR1043ND 	v1-v1.11 	Atheros AR9132 	400 	8 	32 	Atheros AR9100
(integrated) 	b/g/n 	5 	1x 2.0 	Yes

as far as i understand is the lan also on the wifi chip, so this differs
.. 
for the 841v11 it should be QCA9533-AL3A running with 560 MHz with 32 MB
Ram Zentel A3S56D40GTP-50L. switch QCA9533-BL3A built-in

https://wiki.openwrt.org/toh/TP-Link/tl-wr841nd
https://wiki.openwrt.org/toh/TP-Link/tl-wr1043nd

sidenode tplink name convention (to prevent confusion): mainly important
is running number like 1043 or 841 and the hardware revision like v11,
the N or ND are only antenna related, the .123 are factory firmware
revision of the specific hardware revision - which is more important for
us here


On 03.08.2016 08:48, René van Dorst wrote:
> Hi Jens,
>
> I would like to share my results on a MIPS cpu.
>
> I also tested wireguard on a router. TP-Link WR1043ND v1.08 with a
> Atheros AR9132 400MHz cpu.
> Running LEDE 28-july-2016, wireguard & iperf3 via packagemanager.
> For my test I run wireguard and iperf3 on the same device on both sides.
> Other side is a AMD A6-5400 with debian unstable running inside KVM.
> Both connected to a gigabit switch.
>
> My results iperf:
> - Plain ~100MBits
> - WG ~24Mbits (TCP test)
>
> Greats,
>
> René van Dorst.
>
> Quoting jens <jens@viisauksena.de>:
>
>> On 27.07.2016 13:05, Jason A. Donenfeld wrote:
>>
>>> On Wed, Jul 27, 2016 at 12:26 PM, Jens Viisauksena
>>> <jens@viisauksena.de> wrote:
>>>> It should however not lead to netifd outofmemory, load of 2.6 and the
>>>> oomkiller berserking around at all... even if its not directly wg
>>>> fault.
>>> One thing to try would be removing these lines from src/socket.c:
>>>
>>> socket.c
>>> 386:    sk_clear_memalloc(sock);
>>> 394:    sk_set_memalloc(sock->sk);
>>>
>>> I'd be interested to learn if that fixes things.
>>
>> sorry if you waited for answers ..
>> we redo the testing with latest kernel
>> [    0.000000] Linux version 4.4.15 (fuzzle@builder) (gcc version 5.4.0
>> (LEDE GCC 5.4.0 r1119) ) #3 Thu Jul 28 01:05:08 UTC 2016
>> build from latest trunk by ourselve, before we use default packages and
>> lede like this
>> [    0.000000] Linux version 4.4.15 (buildbot@builds) (gcc version 5.4.0
>> (LEDE GCC 5.4.0 r1114) ) #2 Tue Jul 26 17:57:45 UTC 2016
>>
>> and with wireguard source from 27.7. also including your suggestions.
>>
>> still the same
>>
>> more detailed  :
>>
>> we got out of memory and big cpuload when testing iperf with udp
>> packets, (we forget to notice that before in our first testings which
>> mode killed all the memory)
>> and from the heavy load and low memory lede/openwrt shut down stuff and
>> things broke apart
>> (Reminder, Lede/Openwrt on TP link 841 v11 with 650 Mhz CPU and 32Mb
>> Ram)
>>
>> with tcp traffic we got this time stable 16 Mbit, which sounds like a
>> reasonable limit for this kind of small cpu without any optimzation.
>> Also cpu load was lower.
>>
>> we wonder how to use more sophisticated tools on our testsetup with 2
>> real tplink routers connected + behind each one laptop to measure
>> throughput with iperf3. this maybe is not possible at all without
>> getting serial console access
>>
>> 2 lessons learned: 1. problem arises with upd traffic and result quickly
>> in out of memory (with transmission peak at the beginning higher than
>> the 15 mbit with tcp packets))  2. tcp is stable with 15-16 Mbit
>> some more thoughts: all this could maybe slightly increased by code
>> optimization, slightly different cipher, maybe encrypting is harder than
>> decrypting, which means download will be faster - while encryption is
>> happen on big servers in Net
>>
>> to compare again with fastd - this are the numbers we could get fastd
>> through the cpu/wire (we didnt did that testing in this special setup,
>> maybe some time soon - at least i am curious)
>>
>>
>>
>>
>>
>> ### just the dmesg before crashing
>> [    0.000000] MyLoader: sysp=9fb7db5d, boardp=d56f3f67, parts=bfae9f0c
>> [    0.000000] bootconsole [early0] enabled
>> [    0.000000] CPU0 revision is: 00019374 (MIPS 24Kc)
>> [    0.000000] SoC: Qualcomm Atheros QCA9533 ver 2 rev 0
>> [    0.000000] Determined physical RAM map:
>> [    0.000000]  memory: 02000000 @ 00000000 (usable)
>> [    0.000000] Initrd not found or empty - disabling initrd
>> [    0.000000] No valid device tree found, continuing without
>> [    0.000000] Zone ranges:
>> [    0.000000]   Normal   [mem 0x0000000000000000-0x0000000001ffffff]
>> [    0.000000] Movable zone start for each node
>> [    0.000000] Early memory node ranges
>> [    0.000000]   node   0: [mem 0x0000000000000000-0x0000000001ffffff]
>> [    0.000000] Initmem setup node 0 [mem
>> 0x0000000000000000-0x0000000001ffffff]
>> [    0.000000] On node 0 totalpages: 8192
>> [    0.000000] free_area_init_node: node 0, pgdat 804003d0, node_mem_map
>> 81000000
>> [    0.000000]   Normal zone: 64 pages used for memmap
>> [    0.000000]   Normal zone: 0 pages reserved
>> [    0.000000]   Normal zone: 8192 pages, LIFO batch:0
>> [    0.000000] Primary instruction cache 64kB, VIPT, 4-way, linesize 32
>> bytes.
>> [    0.000000] Primary data cache 32kB, 4-way, VIPT, cache aliases,
>> linesize 32 bytes
>> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
>> [    0.000000] pcpu-alloc: [0] 0
>> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
>> Total pages: 8128
>> [    0.000000] Kernel command line:  board=TL-WR841N-v11
>> console=ttyS0,115200 rootfstype=squashfs,jffs2 noinitrd
>> [    0.000000] PID hash table entries: 128 (order: -3, 512 bytes)
>> [    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384
>> bytes)
>> [    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192
>> bytes)
>> [    0.000000] Writing ErrCtl register=00000000
>> [    0.000000] Readback ErrCtl register=00000000
>> [    0.000000] Memory: 27740K/32768K available (2933K kernel code, 151K
>> rwdata, 744K rodata, 260K init, 200K bss, 5028K reserved, 0K
>> cma-reserved)
>> [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1,
>> Nodes=1
>> [    0.000000] NR_IRQS:51
>> [    0.000000] Clocks: CPU:650.000MHz, DDR:393.066MHz, AHB:216.666MHz,
>> Ref:25.000MHz
>> [    0.000000] clocksource: MIPS: mask: 0xffffffff max_cycles:
>> 0xffffffff, max_idle_ns: 5880801374 ns
>> [    0.000009] sched_clock: 32 bits at 325MHz, resolution 3ns, wraps
>> every 6607641598ns
>> [    0.008234] Calibrating delay loop... 432.53 BogoMIPS (lpj=2162688)
>> [    0.071106] pid_max: default: 32768 minimum: 301
>> [    0.076110] Mount-cache hash table entries: 1024 (order: 0, 4096
>> bytes)
>> [    0.083096] Mountpoint-cache hash table entries: 1024 (order: 0, 4096
>> bytes)
>> [    0.093471] clocksource: jiffies: mask: 0xffffffff max_cycles:
>> 0xffffffff, max_idle_ns: 19112604462750000 ns
>> [    0.104645] NET: Registered protocol family 16
>> [    0.110870] MIPS: machine is TP-LINK TL-WR841N/ND v11
>> [    0.568855] clocksource: Switched to clocksource MIPS
>> [    0.575559] NET: Registered protocol family 2
>> [    0.581064] TCP established hash table entries: 1024 (order: 0, 4096
>> bytes)
>> [    0.588427] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
>> [    0.595202] TCP: Hash tables configured (established 1024 bind 1024)
>> [    0.602025] UDP hash table entries: 256 (order: 0, 4096 bytes)
>> [    0.608200] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
>> [    0.615203] NET: Registered protocol family 1
>> [    0.619896] PCI: CLS 0 bytes, default 32
>> [    0.620920] futex hash table entries: 256 (order: -1, 3072 bytes)
>> [    0.644082] squashfs: version 4.0 (2009/01/31) Phillip Lougher
>> [    0.650332] jffs2: version 2.2 (NAND) (SUMMARY) (LZMA) (RTIME)
>> (CMODE_PRIORITY) (c) 2001-2006 Red Hat, Inc.
>> [    0.663484] io scheduler noop registered
>> [    0.667635] io scheduler deadline registered (default)
>> [    0.673325] Serial: 8250/16550 driver, 1 ports, IRQ sharing disabled
>> [    0.680545] console [ttyS0] disabled
>> [    0.704475] serial8250.0: ttyS0 at MMIO 0x18020000 (irq = 11,
>> base_baud = 1562500) is a 16550A
>> [    0.713586] console [ttyS0] enabled
>> [    0.721147] bootconsole [early0] disabled
>> [    0.732999] m25p80 spi0.0: found gd25q32, expected m25p80
>> [    0.738601] m25p80 spi0.0: gd25q32 (4096 Kbytes)
>> [    0.744708] 5 tp-link partitions found on MTD device spi0.0
>> [    0.750531] Creating 5 MTD partitions on "spi0.0":
>> [    0.755489] 0x000000000000-0x000000020000 : "u-boot"
>> [    0.762184] 0x000000020000-0x000000162710 : "kernel"
>> [    0.769118] 0x000000162710-0x0000003f0000 : "rootfs"
>> [    0.775937] mtd: device 2 (rootfs) set to be root filesystem
>> [    0.781932] 1 squashfs-split partitions found on MTD device rootfs
>> [    0.788320] 0x000000340000-0x0000003f0000 : "rootfs_data"
>> [    0.795617] 0x0000003f0000-0x000000400000 : "art"
>> [    0.802259] 0x000000020000-0x0000003f0000 : "firmware"
>> [    0.829961] libphy: ag71xx_mdio: probed
>> [    1.421422] ag71xx-mdio.1: Found an AR934X built-in switch
>> [    1.464748] eth0: Atheros AG71xx at 0xba000000, irq 5, mode:GMII
>> [    2.061807] ag71xx ag71xx.0: connected to PHY at ag71xx-mdio.1:04
>> [uid=004dd042, driver=Generic PHY]
>> [    2.072011] eth1: Atheros AG71xx at 0xb9000000, irq 4, mode:MII
>> [    2.080973] NET: Registered protocol family 10
>> [    2.090540] NET: Registered protocol family 17
>> [    2.095219] bridge: automatic filtering via arp/ip/ip6tables has been
>> deprecated. Update your scripts to load br_netfilter if you need this.
>> [    2.108444] 8021q: 802.1Q VLAN Support v1.8
>> [    2.121115] VFS: Mounted root (squashfs filesystem) readonly on
>> device 31:2.
>> [    2.130267] Freeing unused kernel memory: 260K (8041f000 - 80460000)
>> [    3.221171] init: Console is alive
>> [    3.224937] init: - watchdog -
>> [    4.185893] init: - preinit -
>> [    4.817211] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
>> [    4.844857] random: procd urandom read with 7 bits of entropy
>> available
>> [    6.910299] eth0: link up (1000Mbps/Full duplex)
>> [    6.916280] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
>> [    8.090413] jffs2_scan_eraseblock(): End of filesystem marker found
>> at 0x10000
>> [    8.097897] jffs2_build_filesystem(): unlocking the mtd device...
>> done.
>> [    8.104748] jffs2_build_filesystem(): erasing all blocks after the
>> end marker... done.
>> [   10.739288] jffs2: notice: (349) jffs2_build_xattr_subsystem:
>> complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan)
>> and 0 of xref (0 dead, 0 orphan) found.
>> [   10.756968] mount_root: overlay filesystem has not been fully
>> initialized yet
>> [   10.768400] mount_root: switching to jffs2 overlay
>> [   10.999300] urandom-seed: Seed file not found (/etc/urandom.seed)
>> [   11.109948] eth0: link down
>> [   11.125253] procd: - early -
>> [   11.128356] procd: - watchdog -
>> [   11.738352] procd: - ubus -
>> [   11.793781] procd: - init -
>> [   12.094265] tun: Universal TUN/TAP device driver, 1.6
>> [   12.099567] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
>> [   12.120149] wireguard: WireGuard loaded. See www.wireguard.io for
>> information.
>> [   12.127621] wireguard: (C) Copyright 2015-2016 Jason A. Donenfeld
>> <Jason@zx2c4.com>. All Rights Reserved.
>> [   12.140039] ip6_tables: (C) 2000-2006 Netfilter Core Team
>> [   12.160019] Loading modules backported from Linux version
>> wt-2016-06-20-0-gbc17424
>> [   12.167850] Backport generated by backports.git
>> backports-20160216-7-g5735958
>> [   12.178703] ip_tables: (C) 2000-2006 Netfilter Core Team
>> [   12.195189] nf_conntrack version 0.5.0 (437 buckets, 1748 max)
>> [   12.244145] xt_time: kernel timezone is -0000
>> [   12.314522] PPP generic driver version 2.4.2
>> [   12.321763] NET: Registered protocol family 24
>> [   12.376518] ath: EEPROM regdomain: 0x0
>> [   12.376545] ath: EEPROM indicates default country code should be used
>> [   12.376554] ath: doing EEPROM country->regdmn map search
>> [   12.376576] ath: country maps to regdmn code: 0x3a
>> [   12.376587] ath: Country alpha2 being used: US
>> [   12.376595] ath: Regpair used: 0x3a
>> [   12.388362] ieee80211 phy0: Selected rate control algorithm
>> 'minstrel_ht'
>> [   12.392478] ieee80211 phy0: Atheros AR9531 Rev:2 mem=0xb8100000,
>> irq=47
>> [   20.576096] device eth0 entered promiscuous mode
>> [   20.599684] IPv6: ADDRCONF(NETDEV_UP): br-lan: link is not ready
>> [   20.645872] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
>> [   22.270331] eth0: link up (1000Mbps/Full duplex)
>> [   22.275169] br-lan: port 1(eth0) entered forwarding state
>> [   22.280839] br-lan: port 1(eth0) entered forwarding state
>> [   22.322565] IPv6: ADDRCONF(NETDEV_CHANGE): br-lan: link becomes ready
>> [   23.352464] eth1: link up (100Mbps/Full duplex)
>> [   23.357197] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
>> [   24.278939] br-lan: port 1(eth0) entered forwarding state
>> [   77.338893] random: nonblocking pool is initialized
>> [ 2545.780086] eth0: link down
>> [ 2545.783413] br-lan: port 1(eth0) entered disabled state
>> [ 2547.280148] eth0: link up (1000Mbps/Full duplex)
>> [ 2547.284988] br-lan: port 1(eth0) entered forwarding state
>> [ 2547.290680] br-lan: port 1(eth0) entered forwarding state
>> [ 2549.288710] br-lan: port 1(eth0) entered forwarding state
>> [ 2751.342810] netifd invoked oom-killer: gfp_mask=0x24201ca, order=0,
>> oom_score_adj=0
>> [ 2751.351333] CPU: 0 PID: 695 Comm: netifd Not tainted 4.4.15 #3
>> [ 2751.357358] Stack : 803ba2c4 00000000 00000001 80410000 8197ea80
>> 80400d63 8039b9e4 000002b7
>> [ 2751.357358]       80463798 80febd1c 00000000 00000006 00001b58
>> 800a6820 00000006 ffffffff
>> [ 2751.357358]       00000000 00000000 8039f45c 80febbbc 80466542
>> 800a47ec 804003d0 00000000
>> [ 2751.357358]       00000001 801ef300 00000000 00000000 00000000
>> 00000000 00000000 00000000
>> [ 2751.357358]       00000000 00000000 00000000 00000000 00000000
>> 00000000 00000000 00000000
>> [ 2751.357358]       ...
>> [ 2751.396800] Call Trace:
>> [ 2751.399910] [<80071a20>] show_stack+0x50/0x84
>> [ 2751.404425] [<800d2ddc>] dump_header.isra.4+0x48/0x130
>> [ 2751.410546] [<800d31b0>] oom_kill_process+0x98/0x440
>> [ 2751.415683] [<800d38d0>] out_of_memory+0x2f4/0x330
>> [ 2751.421212] [<800d718c>] __alloc_pages_nodemask+0x67c/0x6e8
>> [ 2751.427014] [<800d21d0>] filemap_fault+0x254/0x454
>> [ 2751.432560] [<800ecafc>] __do_fault+0x3c/0xa8
>> [ 2751.437076] [<800efd28>] handle_mm_fault+0x4e0/0xb78
>> [ 2751.442797] [<80076638>] __do_page_fault+0x134/0x474
>> [ 2751.447940] [<80060820>] ret_from_exception+0x0/0x10
>> [ 2751.453625]
>> [ 2751.455172] Mem-Info:
>> [ 2751.457542] active_anon:246 inactive_anon:4 isolated_anon:0
>> [ 2751.457542]  active_file:51 inactive_file:80 isolated_file:0
>> [ 2751.457542]  unevictable:0 dirty:0 writeback:0 unstable:0
>> [ 2751.457542]  slab_reclaimable:120 slab_unreclaimable:1272
>> [ 2751.457542]  mapped:10 shmem:36 pagetables:39 bounce:0
>> [ 2751.457542]  free:164 free_pcp:0 free_cma:0
>> [ 2751.490694] Normal free:660kB min:664kB low:828kB high:996kB
>> active_anon:984kB inactive_anon:16kB active_file:204kB
>> inactive_file:320kB unevictable:0kB isolated(anon):0kB
>> isolated(file):0kB present:32768kB managed:28000kB mlocked:0kB dirty:0kB
>> writeback:0kB mapped:40kB shmem:144kB slab_reclaimable:480kB
>> slab_unreclaimable:5088kB kernel_stack:304kB pagetables:156kB
>> unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
>> writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
>> [ 2751.535274] lowmem_reserve[]: 0 0
>> [ 2751.539269] Normal: 3*4kB (U) 41*8kB (UM) 20*16kB (U) 0*32kB 0*64kB
>> 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 660kB
>> [ 2751.551718] 167 total pagecache pages
>> [ 2751.555511] 0 pages in swap cache
>> [ 2751.559484] Swap cache stats: add 0, delete 0, find 0/0
>> [ 2751.564887] Free swap  = 0kB
>> [ 2751.567862] Total swap = 0kB
>> [ 2751.571632] 8192 pages RAM
>> [ 2751.574438] 0 pages HighMem/MovableOnly
>> [ 2751.578399] 1192 pages reserved
>> [ 2751.582198] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
>> swapents oom_score_adj name
>> [ 2751.591592] [  395]     0   395      294       15       3
>> 0        0             0 ubusd
>> [ 2751.601044] [  396]     0   396      223       10       3
>> 0        0             0 askfirst
>> [ 2751.610769] [  659]     0   659      306       35       3
>> 0        0             0 logd
>> [ 2751.620386] [  695]     0   695      408       40       4
>> 0        0             0 netifd
>> [ 2751.629944] [  722]     0   722      320       21       3
>> 0        0             0 odhcpd
>> [ 2751.639492] [  754]     0   754      264       10       3
>> 0        0             0 dropbear
>> [ 2751.648664] [  856]     0   856      294       15       3
>> 0        0             0 ntpd
>> [ 2751.658041] [  915]   453   915      262       18       4
>> 0        0             0 dnsmasq
>> [ 2751.667679] [ 1003]     0  1003      229       11       3
>> 0        0             0 odhcp6c
>> [ 2751.677561] [ 1051]     0  1051      281       25       3
>> 0        0             0 dropbear
>> [ 2751.687291] [ 1052]     0  1052      295       11       3
>> 0        0             0 ash
>> [ 2751.696563] Out of memory: Kill process 695 (netifd) score 6 or
>> sacrifice child
>> [ 2751.704694] Killed process 1003 (odhcp6c) total-vm:916kB,
>> anon-rss:40kB, file-rss:4kB
>> root@lede:/tmp# Connection to 192.168.1.1 closed.
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> http://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard

-- 
make the world nicer, please use PGP encryption


--------------37F563402E79D0924F7D3CA3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 03.08.2016 08:48, René van Dorst
      wrote:<br>
    </div>
    <blockquote
      cite="mid:20160803064853.Horde.ZExiUp0by8SskYUmZW7CFq4@www.vdorst.com"
      type="cite">...<br>
      I also tested wireguard on a router. TP-Link WR1043ND v1.08 with a
      Atheros AR9132 400MHz cpu.<br>
      Running LEDE 28-july-2016, wireguard &amp; iperf3 via
      packagemanager.
    </blockquote>
    <p>so you do not observe crashing of the router like we do with the
      tp-link wr841Nv11 - <br>
    </p>
    <p>do you also test iperf with udp packets , around 200 Mbit or so ?
      <br>
      acording to openwrt wiki say that 1043v1.xx runs even slower cpu ,
      but have 8Mb of flash<br>
    </p>
    <table class="inline dataplugin_table ">
      <tbody>
        <tr>
          <td class="leftalign model">TL-WR1043ND</td>
          <td class="leftalign version">v1-v1.11</td>
          <td class="leftalign platform">Atheros AR9132</td>
          <td class="rightalign cpu_mhz">400</td>
          <td class="rightalign flash_mb">8</td>
          <td class="rightalign ram_mb">32</td>
          <td class="leftalign wlan_hardware">Atheros AR9100
            (integrated)</td>
          <td class="leftalign wlan_24ghz">b/g/n</td>
          <td class="rightalign ethernet_gbit_ports">5</td>
          <td class="leftalign usb_ports">1x 2.0</td>
          <td class="leftalign serial">Yes</td>
        </tr>
      </tbody>
    </table>
    <p>as far as i understand is the lan also on the wifi chip, so this
      differs ..  <br>
      for the 841v11 it should be QCA9533-AL3A running with 560 <abbr
        title="Megahertz">MHz with 32 MB Ram</abbr> Zentel
      A3S56D40GTP-50L. switch QCA9533-BL3A built-in</p>
    <p><a class="moz-txt-link-freetext" href="https://wiki.openwrt.org/toh/TP-Link/tl-wr841nd">https://wiki.openwrt.org/toh/TP-Link/tl-wr841nd</a><br>
      <a class="moz-txt-link-freetext" href="https://wiki.openwrt.org/toh/TP-Link/tl-wr1043nd">https://wiki.openwrt.org/toh/TP-Link/tl-wr1043nd</a><br>
    </p>
    sidenode tplink name convention (to prevent confusion): mainly
    important is running number like 1043 or 841 and the hardware
    revision like v11, the N or ND are only antenna related, the .123
    are factory firmware revision of the specific hardware revision -
    which is more important for us here<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 03.08.2016 08:48, René van Dorst
      wrote:<br>
    </div>
    <blockquote
      cite="mid:20160803064853.Horde.ZExiUp0by8SskYUmZW7CFq4@www.vdorst.com"
      type="cite">Hi Jens,
      <br>
      <br>
      I would like to share my results on a MIPS cpu.
      <br>
      <br>
      I also tested wireguard on a router. TP-Link WR1043ND v1.08 with a
      Atheros AR9132 400MHz cpu.
      <br>
      Running LEDE 28-july-2016, wireguard &amp; iperf3 via
      packagemanager.
      <br>
      For my test I run wireguard and iperf3 on the same device on both
      sides.
      <br>
      Other side is a AMD A6-5400 with debian unstable running inside
      KVM.
      <br>
      Both connected to a gigabit switch.
      <br>
      <br>
      My results iperf:
      <br>
      - Plain ~100MBits
      <br>
      - WG ~24Mbits (TCP test)
      <br>
      <br>
      Greats,
      <br>
      <br>
      René van Dorst.
      <br>
      <br>
      Quoting jens <a class="moz-txt-link-rfc2396E" href="mailto:jens@viisauksena.de">&lt;jens@viisauksena.de&gt;</a>:
      <br>
      <br>
      <blockquote type="cite">On 27.07.2016 13:05, Jason A. Donenfeld
        wrote:
        <br>
        <br>
        <blockquote type="cite">On Wed, Jul 27, 2016 at 12:26 PM, Jens
          Viisauksena <a class="moz-txt-link-rfc2396E" href="mailto:jens@viisauksena.de">&lt;jens@viisauksena.de&gt;</a> wrote:
          <br>
          <blockquote type="cite">It should however not lead to netifd
            outofmemory, load of 2.6 and the
            <br>
            oomkiller berserking around at all... even if its not
            directly wg fault.
            <br>
          </blockquote>
          One thing to try would be removing these lines from
          src/socket.c:
          <br>
          <br>
          socket.c
          <br>
          386:    sk_clear_memalloc(sock);
          <br>
          394:    sk_set_memalloc(sock-&gt;sk);
          <br>
          <br>
          I'd be interested to learn if that fixes things.
          <br>
        </blockquote>
        <br>
        sorry if you waited for answers ..
        <br>
        we redo the testing with latest kernel
        <br>
        [    0.000000] Linux version 4.4.15 (fuzzle@builder) (gcc
        version 5.4.0
        <br>
        (LEDE GCC 5.4.0 r1119) ) #3 Thu Jul 28 01:05:08 UTC 2016
        <br>
        build from latest trunk by ourselve, before we use default
        packages and
        <br>
        lede like this
        <br>
        [    0.000000] Linux version 4.4.15 (buildbot@builds) (gcc
        version 5.4.0
        <br>
        (LEDE GCC 5.4.0 r1114) ) #2 Tue Jul 26 17:57:45 UTC 2016
        <br>
        <br>
        and with wireguard source from 27.7. also including your
        suggestions.
        <br>
        <br>
        still the same
        <br>
        <br>
        more detailed  :
        <br>
        <br>
        we got out of memory and big cpuload when testing iperf with udp
        <br>
        packets, (we forget to notice that before in our first testings
        which
        <br>
        mode killed all the memory)
        <br>
        and from the heavy load and low memory lede/openwrt shut down
        stuff and
        <br>
        things broke apart
        <br>
        (Reminder, Lede/Openwrt on TP link 841 v11 with 650 Mhz CPU and
        32Mb Ram)
        <br>
        <br>
        with tcp traffic we got this time stable 16 Mbit, which sounds
        like a
        <br>
        reasonable limit for this kind of small cpu without any
        optimzation.
        <br>
        Also cpu load was lower.
        <br>
        <br>
        we wonder how to use more sophisticated tools on our testsetup
        with 2
        <br>
        real tplink routers connected + behind each one laptop to
        measure
        <br>
        throughput with iperf3. this maybe is not possible at all
        without
        <br>
        getting serial console access
        <br>
        <br>
        2 lessons learned: 1. problem arises with upd traffic and result
        quickly
        <br>
        in out of memory (with transmission peak at the beginning higher
        than
        <br>
        the 15 mbit with tcp packets))  2. tcp is stable with 15-16 Mbit
        <br>
        some more thoughts: all this could maybe slightly increased by
        code
        <br>
        optimization, slightly different cipher, maybe encrypting is
        harder than
        <br>
        decrypting, which means download will be faster - while
        encryption is
        <br>
        happen on big servers in Net
        <br>
        <br>
        to compare again with fastd - this are the numbers we could get
        fastd
        <br>
        through the cpu/wire (we didnt did that testing in this special
        setup,
        <br>
        maybe some time soon - at least i am curious)
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        ### just the dmesg before crashing
        <br>
        [    0.000000] MyLoader: sysp=9fb7db5d, boardp=d56f3f67,
        parts=bfae9f0c
        <br>
        [    0.000000] bootconsole [early0] enabled
        <br>
        [    0.000000] CPU0 revision is: 00019374 (MIPS 24Kc)
        <br>
        [    0.000000] SoC: Qualcomm Atheros QCA9533 ver 2 rev 0
        <br>
        [    0.000000] Determined physical RAM map:
        <br>
        [    0.000000]  memory: 02000000 @ 00000000 (usable)
        <br>
        [    0.000000] Initrd not found or empty - disabling initrd
        <br>
        [    0.000000] No valid device tree found, continuing without
        <br>
        [    0.000000] Zone ranges:
        <br>
        [    0.000000]   Normal   [mem
        0x0000000000000000-0x0000000001ffffff]
        <br>
        [    0.000000] Movable zone start for each node
        <br>
        [    0.000000] Early memory node ranges
        <br>
        [    0.000000]   node   0: [mem
        0x0000000000000000-0x0000000001ffffff]
        <br>
        [    0.000000] Initmem setup node 0 [mem
        <br>
        0x0000000000000000-0x0000000001ffffff]
        <br>
        [    0.000000] On node 0 totalpages: 8192
        <br>
        [    0.000000] free_area_init_node: node 0, pgdat 804003d0,
        node_mem_map
        <br>
        81000000
        <br>
        [    0.000000]   Normal zone: 64 pages used for memmap
        <br>
        [    0.000000]   Normal zone: 0 pages reserved
        <br>
        [    0.000000]   Normal zone: 8192 pages, LIFO batch:0
        <br>
        [    0.000000] Primary instruction cache 64kB, VIPT, 4-way,
        linesize 32
        <br>
        bytes.
        <br>
        [    0.000000] Primary data cache 32kB, 4-way, VIPT, cache
        aliases,
        <br>
        linesize 32 bytes
        <br>
        [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
        <br>
        [    0.000000] pcpu-alloc: [0] 0
        <br>
        [    0.000000] Built 1 zonelists in Zone order, mobility
        grouping on.
        <br>
        Total pages: 8128
        <br>
        [    0.000000] Kernel command line:  board=TL-WR841N-v11
        <br>
        console=ttyS0,115200 rootfstype=squashfs,jffs2 noinitrd
        <br>
        [    0.000000] PID hash table entries: 128 (order: -3, 512
        bytes)
        <br>
        [    0.000000] Dentry cache hash table entries: 4096 (order: 2,
        16384 bytes)
        <br>
        [    0.000000] Inode-cache hash table entries: 2048 (order: 1,
        8192 bytes)
        <br>
        [    0.000000] Writing ErrCtl register=00000000
        <br>
        [    0.000000] Readback ErrCtl register=00000000
        <br>
        [    0.000000] Memory: 27740K/32768K available (2933K kernel
        code, 151K
        <br>
        rwdata, 744K rodata, 260K init, 200K bss, 5028K reserved, 0K
        cma-reserved)
        <br>
        [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0,
        CPUs=1, Nodes=1
        <br>
        [    0.000000] NR_IRQS:51
        <br>
        [    0.000000] Clocks: CPU:650.000MHz, DDR:393.066MHz,
        AHB:216.666MHz,
        <br>
        Ref:25.000MHz
        <br>
        [    0.000000] clocksource: MIPS: mask: 0xffffffff max_cycles:
        <br>
        0xffffffff, max_idle_ns: 5880801374 ns
        <br>
        [    0.000009] sched_clock: 32 bits at 325MHz, resolution 3ns,
        wraps
        <br>
        every 6607641598ns
        <br>
        [    0.008234] Calibrating delay loop... 432.53 BogoMIPS
        (lpj=2162688)
        <br>
        [    0.071106] pid_max: default: 32768 minimum: 301
        <br>
        [    0.076110] Mount-cache hash table entries: 1024 (order: 0,
        4096 bytes)
        <br>
        [    0.083096] Mountpoint-cache hash table entries: 1024 (order:
        0, 4096
        <br>
        bytes)
        <br>
        [    0.093471] clocksource: jiffies: mask: 0xffffffff
        max_cycles:
        <br>
        0xffffffff, max_idle_ns: 19112604462750000 ns
        <br>
        [    0.104645] NET: Registered protocol family 16
        <br>
        [    0.110870] MIPS: machine is TP-LINK TL-WR841N/ND v11
        <br>
        [    0.568855] clocksource: Switched to clocksource MIPS
        <br>
        [    0.575559] NET: Registered protocol family 2
        <br>
        [    0.581064] TCP established hash table entries: 1024 (order:
        0, 4096
        <br>
        bytes)
        <br>
        [    0.588427] TCP bind hash table entries: 1024 (order: 0, 4096
        bytes)
        <br>
        [    0.595202] TCP: Hash tables configured (established 1024
        bind 1024)
        <br>
        [    0.602025] UDP hash table entries: 256 (order: 0, 4096
        bytes)
        <br>
        [    0.608200] UDP-Lite hash table entries: 256 (order: 0, 4096
        bytes)
        <br>
        [    0.615203] NET: Registered protocol family 1
        <br>
        [    0.619896] PCI: CLS 0 bytes, default 32
        <br>
        [    0.620920] futex hash table entries: 256 (order: -1, 3072
        bytes)
        <br>
        [    0.644082] squashfs: version 4.0 (2009/01/31) Phillip
        Lougher
        <br>
        [    0.650332] jffs2: version 2.2 (NAND) (SUMMARY) (LZMA)
        (RTIME)
        <br>
        (CMODE_PRIORITY) (c) 2001-2006 Red Hat, Inc.
        <br>
        [    0.663484] io scheduler noop registered
        <br>
        [    0.667635] io scheduler deadline registered (default)
        <br>
        [    0.673325] Serial: 8250/16550 driver, 1 ports, IRQ sharing
        disabled
        <br>
        [    0.680545] console [ttyS0] disabled
        <br>
        [    0.704475] serial8250.0: ttyS0 at MMIO 0x18020000 (irq = 11,
        <br>
        base_baud = 1562500) is a 16550A
        <br>
        [    0.713586] console [ttyS0] enabled
        <br>
        [    0.721147] bootconsole [early0] disabled
        <br>
        [    0.732999] m25p80 spi0.0: found gd25q32, expected m25p80
        <br>
        [    0.738601] m25p80 spi0.0: gd25q32 (4096 Kbytes)
        <br>
        [    0.744708] 5 tp-link partitions found on MTD device spi0.0
        <br>
        [    0.750531] Creating 5 MTD partitions on "spi0.0":
        <br>
        [    0.755489] 0x000000000000-0x000000020000 : "u-boot"
        <br>
        [    0.762184] 0x000000020000-0x000000162710 : "kernel"
        <br>
        [    0.769118] 0x000000162710-0x0000003f0000 : "rootfs"
        <br>
        [    0.775937] mtd: device 2 (rootfs) set to be root filesystem
        <br>
        [    0.781932] 1 squashfs-split partitions found on MTD device
        rootfs
        <br>
        [    0.788320] 0x000000340000-0x0000003f0000 : "rootfs_data"
        <br>
        [    0.795617] 0x0000003f0000-0x000000400000 : "art"
        <br>
        [    0.802259] 0x000000020000-0x0000003f0000 : "firmware"
        <br>
        [    0.829961] libphy: ag71xx_mdio: probed
        <br>
        [    1.421422] ag71xx-mdio.1: Found an AR934X built-in switch
        <br>
        [    1.464748] eth0: Atheros AG71xx at 0xba000000, irq 5,
        mode:GMII
        <br>
        [    2.061807] ag71xx ag71xx.0: connected to PHY at
        ag71xx-mdio.1:04
        <br>
        [uid=004dd042, driver=Generic PHY]
        <br>
        [    2.072011] eth1: Atheros AG71xx at 0xb9000000, irq 4,
        mode:MII
        <br>
        [    2.080973] NET: Registered protocol family 10
        <br>
        [    2.090540] NET: Registered protocol family 17
        <br>
        [    2.095219] bridge: automatic filtering via arp/ip/ip6tables
        has been
        <br>
        deprecated. Update your scripts to load br_netfilter if you need
        this.
        <br>
        [    2.108444] 8021q: 802.1Q VLAN Support v1.8
        <br>
        [    2.121115] VFS: Mounted root (squashfs filesystem) readonly
        on
        <br>
        device 31:2.
        <br>
        [    2.130267] Freeing unused kernel memory: 260K (8041f000 -
        80460000)
        <br>
        [    3.221171] init: Console is alive
        <br>
        [    3.224937] init: - watchdog -
        <br>
        [    4.185893] init: - preinit -
        <br>
        [    4.817211] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not
        ready
        <br>
        [    4.844857] random: procd urandom read with 7 bits of entropy
        available
        <br>
        [    6.910299] eth0: link up (1000Mbps/Full duplex)
        <br>
        [    6.916280] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes
        ready
        <br>
        [    8.090413] jffs2_scan_eraseblock(): End of filesystem marker
        found
        <br>
        at 0x10000
        <br>
        [    8.097897] jffs2_build_filesystem(): unlocking the mtd
        device... done.
        <br>
        [    8.104748] jffs2_build_filesystem(): erasing all blocks
        after the
        <br>
        end marker... done.
        <br>
        [   10.739288] jffs2: notice: (349) jffs2_build_xattr_subsystem:
        <br>
        complete building xattr subsystem, 0 of xdatum (0 unchecked, 0
        orphan)
        <br>
        and 0 of xref (0 dead, 0 orphan) found.
        <br>
        [   10.756968] mount_root: overlay filesystem has not been fully
        <br>
        initialized yet
        <br>
        [   10.768400] mount_root: switching to jffs2 overlay
        <br>
        [   10.999300] urandom-seed: Seed file not found
        (/etc/urandom.seed)
        <br>
        [   11.109948] eth0: link down
        <br>
        [   11.125253] procd: - early -
        <br>
        [   11.128356] procd: - watchdog -
        <br>
        [   11.738352] procd: - ubus -
        <br>
        [   11.793781] procd: - init -
        <br>
        [   12.094265] tun: Universal TUN/TAP device driver, 1.6
        <br>
        [   12.099567] tun: (C) 1999-2004 Max Krasnyansky
        <a class="moz-txt-link-rfc2396E" href="mailto:maxk@qualcomm.com">&lt;maxk@qualcomm.com&gt;</a>
        <br>
        [   12.120149] wireguard: WireGuard loaded. See <a class="moz-txt-link-abbreviated" href="http://www.wireguard.io">www.wireguard.io</a>
        for
        <br>
        information.
        <br>
        [   12.127621] wireguard: (C) Copyright 2015-2016 Jason A.
        Donenfeld
        <br>
        <a class="moz-txt-link-rfc2396E" href="mailto:Jason@zx2c4.com">&lt;Jason@zx2c4.com&gt;</a>. All Rights Reserved.
        <br>
        [   12.140039] ip6_tables: (C) 2000-2006 Netfilter Core Team
        <br>
        [   12.160019] Loading modules backported from Linux version
        <br>
        wt-2016-06-20-0-gbc17424
        <br>
        [   12.167850] Backport generated by backports.git
        <br>
        backports-20160216-7-g5735958
        <br>
        [   12.178703] ip_tables: (C) 2000-2006 Netfilter Core Team
        <br>
        [   12.195189] nf_conntrack version 0.5.0 (437 buckets, 1748
        max)
        <br>
        [   12.244145] xt_time: kernel timezone is -0000
        <br>
        [   12.314522] PPP generic driver version 2.4.2
        <br>
        [   12.321763] NET: Registered protocol family 24
        <br>
        [   12.376518] ath: EEPROM regdomain: 0x0
        <br>
        [   12.376545] ath: EEPROM indicates default country code should
        be used
        <br>
        [   12.376554] ath: doing EEPROM country-&gt;regdmn map search
        <br>
        [   12.376576] ath: country maps to regdmn code: 0x3a
        <br>
        [   12.376587] ath: Country alpha2 being used: US
        <br>
        [   12.376595] ath: Regpair used: 0x3a
        <br>
        [   12.388362] ieee80211 phy0: Selected rate control algorithm
        'minstrel_ht'
        <br>
        [   12.392478] ieee80211 phy0: Atheros AR9531 Rev:2
        mem=0xb8100000, irq=47
        <br>
        [   20.576096] device eth0 entered promiscuous mode
        <br>
        [   20.599684] IPv6: ADDRCONF(NETDEV_UP): br-lan: link is not
        ready
        <br>
        [   20.645872] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not
        ready
        <br>
        [   22.270331] eth0: link up (1000Mbps/Full duplex)
        <br>
        [   22.275169] br-lan: port 1(eth0) entered forwarding state
        <br>
        [   22.280839] br-lan: port 1(eth0) entered forwarding state
        <br>
        [   22.322565] IPv6: ADDRCONF(NETDEV_CHANGE): br-lan: link
        becomes ready
        <br>
        [   23.352464] eth1: link up (100Mbps/Full duplex)
        <br>
        [   23.357197] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes
        ready
        <br>
        [   24.278939] br-lan: port 1(eth0) entered forwarding state
        <br>
        [   77.338893] random: nonblocking pool is initialized
        <br>
        [ 2545.780086] eth0: link down
        <br>
        [ 2545.783413] br-lan: port 1(eth0) entered disabled state
        <br>
        [ 2547.280148] eth0: link up (1000Mbps/Full duplex)
        <br>
        [ 2547.284988] br-lan: port 1(eth0) entered forwarding state
        <br>
        [ 2547.290680] br-lan: port 1(eth0) entered forwarding state
        <br>
        [ 2549.288710] br-lan: port 1(eth0) entered forwarding state
        <br>
        [ 2751.342810] netifd invoked oom-killer: gfp_mask=0x24201ca,
        order=0,
        <br>
        oom_score_adj=0
        <br>
        [ 2751.351333] CPU: 0 PID: 695 Comm: netifd Not tainted 4.4.15
        #3
        <br>
        [ 2751.357358] Stack : 803ba2c4 00000000 00000001 80410000
        8197ea80
        <br>
        80400d63 8039b9e4 000002b7
        <br>
        [ 2751.357358]       80463798 80febd1c 00000000 00000006
        00001b58
        <br>
        800a6820 00000006 ffffffff
        <br>
        [ 2751.357358]       00000000 00000000 8039f45c 80febbbc
        80466542
        <br>
        800a47ec 804003d0 00000000
        <br>
        [ 2751.357358]       00000001 801ef300 00000000 00000000
        00000000
        <br>
        00000000 00000000 00000000
        <br>
        [ 2751.357358]       00000000 00000000 00000000 00000000
        00000000
        <br>
        00000000 00000000 00000000
        <br>
        [ 2751.357358]       ...
        <br>
        [ 2751.396800] Call Trace:
        <br>
        [ 2751.399910] [&lt;80071a20&gt;] show_stack+0x50/0x84
        <br>
        [ 2751.404425] [&lt;800d2ddc&gt;] dump_header.isra.4+0x48/0x130
        <br>
        [ 2751.410546] [&lt;800d31b0&gt;] oom_kill_process+0x98/0x440
        <br>
        [ 2751.415683] [&lt;800d38d0&gt;] out_of_memory+0x2f4/0x330
        <br>
        [ 2751.421212] [&lt;800d718c&gt;]
        __alloc_pages_nodemask+0x67c/0x6e8
        <br>
        [ 2751.427014] [&lt;800d21d0&gt;] filemap_fault+0x254/0x454
        <br>
        [ 2751.432560] [&lt;800ecafc&gt;] __do_fault+0x3c/0xa8
        <br>
        [ 2751.437076] [&lt;800efd28&gt;] handle_mm_fault+0x4e0/0xb78
        <br>
        [ 2751.442797] [&lt;80076638&gt;] __do_page_fault+0x134/0x474
        <br>
        [ 2751.447940] [&lt;80060820&gt;] ret_from_exception+0x0/0x10
        <br>
        [ 2751.453625]
        <br>
        [ 2751.455172] Mem-Info:
        <br>
        [ 2751.457542] active_anon:246 inactive_anon:4 isolated_anon:0
        <br>
        [ 2751.457542]  active_<a class="moz-txt-link-freetext" href="file:51">file:51</a> inactive_<a class="moz-txt-link-freetext" href="file:80">file:80</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a>
        <br>
        [ 2751.457542]  unevictable:0 dirty:0 writeback:0 unstable:0
        <br>
        [ 2751.457542]  slab_reclaimable:120 slab_unreclaimable:1272
        <br>
        [ 2751.457542]  mapped:10 shmem:36 pagetables:39 bounce:0
        <br>
        [ 2751.457542]  free:164 free_pcp:0 free_cma:0
        <br>
        [ 2751.490694] Normal free:660kB min:664kB low:828kB high:996kB
        <br>
        active_anon:984kB inactive_anon:16kB active_<a class="moz-txt-link-freetext" href="file:204kB">file:204kB</a>
        <br>
        inactive_<a class="moz-txt-link-freetext" href="file:320kB">file:320kB</a> unevictable:0kB isolated(anon):0kB
        <br>
        isolated(file):0kB present:32768kB managed:28000kB mlocked:0kB
        dirty:0kB
        <br>
        writeback:0kB mapped:40kB shmem:144kB slab_reclaimable:480kB
        <br>
        slab_unreclaimable:5088kB kernel_stack:304kB pagetables:156kB
        <br>
        unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
        <br>
        writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
        <br>
        [ 2751.535274] lowmem_reserve[]: 0 0
        <br>
        [ 2751.539269] Normal: 3*4kB (U) 41*8kB (UM) 20*16kB (U) 0*32kB
        0*64kB
        <br>
        0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 660kB
        <br>
        [ 2751.551718] 167 total pagecache pages
        <br>
        [ 2751.555511] 0 pages in swap cache
        <br>
        [ 2751.559484] Swap cache stats: add 0, delete 0, find 0/0
        <br>
        [ 2751.564887] Free swap  = 0kB
        <br>
        [ 2751.567862] Total swap = 0kB
        <br>
        [ 2751.571632] 8192 pages RAM
        <br>
        [ 2751.574438] 0 pages HighMem/MovableOnly
        <br>
        [ 2751.578399] 1192 pages reserved
        <br>
        [ 2751.582198] [ pid ]   uid  tgid total_vm      rss nr_ptes
        nr_pmds
        <br>
        swapents oom_score_adj name
        <br>
        [ 2751.591592] [  395]     0   395      294       15       3
        <br>
        0        0             0 ubusd
        <br>
        [ 2751.601044] [  396]     0   396      223       10       3
        <br>
        0        0             0 askfirst
        <br>
        [ 2751.610769] [  659]     0   659      306       35       3
        <br>
        0        0             0 logd
        <br>
        [ 2751.620386] [  695]     0   695      408       40       4
        <br>
        0        0             0 netifd
        <br>
        [ 2751.629944] [  722]     0   722      320       21       3
        <br>
        0        0             0 odhcpd
        <br>
        [ 2751.639492] [  754]     0   754      264       10       3
        <br>
        0        0             0 dropbear
        <br>
        [ 2751.648664] [  856]     0   856      294       15       3
        <br>
        0        0             0 ntpd
        <br>
        [ 2751.658041] [  915]   453   915      262       18       4
        <br>
        0        0             0 dnsmasq
        <br>
        [ 2751.667679] [ 1003]     0  1003      229       11       3
        <br>
        0        0             0 odhcp6c
        <br>
        [ 2751.677561] [ 1051]     0  1051      281       25       3
        <br>
        0        0             0 dropbear
        <br>
        [ 2751.687291] [ 1052]     0  1052      295       11       3
        <br>
        0        0             0 ash
        <br>
        [ 2751.696563] Out of memory: Kill process 695 (netifd) score 6
        or
        <br>
        sacrifice child
        <br>
        [ 2751.704694] Killed process 1003 (odhcp6c) total-vm:916kB,
        <br>
        anon-rss:40kB, file-rss:4kB
        <br>
        root@lede:/tmp# Connection to 192.168.1.1 closed.
        <br>
        <br>
        _______________________________________________
        <br>
        WireGuard mailing list
        <br>
        <a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
        <br>
        <a class="moz-txt-link-freetext" href="http://lists.zx2c4.com/mailman/listinfo/wireguard">http://lists.zx2c4.com/mailman/listinfo/wireguard</a>
        <br>
      </blockquote>
      <br>
      <br>
      <br>
      _______________________________________________
      <br>
      WireGuard mailing list
      <br>
      <a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
      <br>
      <a class="moz-txt-link-freetext" href="http://lists.zx2c4.com/mailman/listinfo/wireguard">http://lists.zx2c4.com/mailman/listinfo/wireguard</a>
      <br>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption</pre>
  </body>
</html>

--------------37F563402E79D0924F7D3CA3--
