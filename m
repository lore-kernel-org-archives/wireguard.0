Return-Path: opensource@vdorst.com
Received: from smtp01.bhosted.nl (smtp01.bhosted.nl [94.124.121.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1934a4a9
 for <wireguard@lists.zx2c4.com>; Wed, 3 Aug 2016 20:06:24 +0000 (UTC)
Received: from server3.bhosted.nl (unknown [94.124.120.17])
 by mx01.bhosted.nl (Halon Mail Gateway) with SMTP
 for <wireguard@lists.zx2c4.com>; Wed,  3 Aug 2016 22:09:55 +0200 (CEST)
Received: from www.lan.vdorst.com (www.lan.vdorst.com
 [IPv6:2a02:a441:63ae:0:5054:ff:feca:c4e1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 7D820751DA
 for <wireguard@lists.zx2c4.com>; Wed,  3 Aug 2016 22:09:54 +0200 (CEST)
Date: Wed, 03 Aug 2016 20:10:14 +0000
Message-ID: <20160803201014.Horde.RctXDT7A7Fi6hFbWMcqDmJs@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: wireguard@lists.zx2c4.com
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
 <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
 <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
 <DEB54C8F-1159-48AD-B2A3-CB2B4E05C896@viisauksena.de>
 <CAHmME9oveH4hLUzEjwWnZ8Nj8U63LEuVezgivsxVxgpZKL_PwQ@mail.gmail.com>
 <8eebb32d-b302-5975-726b-874a9ad12a84@viisauksena.de>
 <20160803064853.Horde.ZExiUp0by8SskYUmZW7CFq4@www.vdorst.com>
 <ce094d6d-2314-8bfe-72e1-879b88ec7141@viisauksena.de>
In-Reply-To: <ce094d6d-2314-8bfe-72e1-879b88ec7141@viisauksena.de>
Content-Type: multipart/alternative; boundary="=_FLlMoCZEG3VSv9m4cSN0cnF"
MIME-Version: 1.0
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

This message is in MIME format.

--=_FLlMoCZEG3VSv9m4cSN0cnF
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Description: Plaintext Message
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

  Hi Jens,

I see I made a typo about hardware version. It is v1.8 not v1.08.
LEDE version is Reboot (HEAD, r1178) of 29-july-2016.

I ran a 2 hour test for you and it did not crash. May be not long enough?
Results after around 2 hour testing udp iperf3 over wireguard

TOP output: UDP over Wireguard while running
Mem: 22900K used, 4912K free, 632K shrd, 1704K buff, 7096K cached
CPU:   1% usr  97% sys   0% nic   0% idle   0% io   0% irq   0% sirq
Load average: 1.04 1.03 1.00 2/43 3392
  PID  PPID USER     STAT   VSZ %VSZ %CPU COMMAND
 1747  1741 root     R     2800  10%  98% iperf3 -c 10.0.0.1 -u -b 1G -t 7200
  107     2 root     SW       0   0%   1% [kworker/0:1]
 3391  3385 root     R     1180   4%   0% top

UDP over WG
root@lede:~# iperf3 -c 10.0.0.1 -u -b 1G -t 7200
[  4] 7189.00-7190.00 sec  3.06 MBytes  25.7 Mbits/sec  392
[  4] 7190.00-7191.00 sec  3.07 MBytes  25.7 Mbits/sec  393
[  4] 7191.00-7192.00 sec  3.07 MBytes  25.7 Mbits/sec  393
[  4] 7192.00-7193.00 sec  3.06 MBytes  25.7 Mbits/sec  392
[  4] 7193.00-7194.00 sec  3.07 MBytes  25.7 Mbits/sec  393
[  4] 7194.00-7195.00 sec  3.07 MBytes  25.7 Mbits/sec  393
[  4] 7195.00-7196.00 sec  3.07 MBytes  25.7 Mbits/sec  393
[  4] 7196.00-7197.00 sec  3.06 MBytes  25.7 Mbits/sec  392
[  4] 7197.00-7198.00 sec  3.07 MBytes  25.7 Mbits/sec  393
[  4] 7198.00-7199.00 sec  3.07 MBytes  25.7 Mbits/sec  393
[  4] 7199.00-7200.00 sec  3.07 MBytes  25.7 Mbits/sec  393
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Jitter     
Lost/Total Datagrams
[  4]   0.00-7200.00 sec  21.5 GBytes  25.6 Mbits/sec  0.047 ms   
6/2814938 (0.00021%)
[  4] Sent 2814938 datagrams

UDP, plain
root@lede:~# iperf3 -c 192.168.2.222 -u -b 1G -t 7200
Connecting to host 192.168.2.222, port 5201
[  4] local 192.168.2.5 port 48815 connected to 192.168.2.222 port 5201
[ ID] Interval           Transfer     Bandwidth       Total Datagrams
[  4]   0.00-1.00   sec  28.2 MBytes   236 Mbits/sec  3605
[  4]   1.00-2.00   sec  28.0 MBytes   235 Mbits/sec  3582
[  4]   2.00-3.00   sec  28.2 MBytes   237 Mbits/sec  3609
[  4]   3.00-4.00   sec  28.2 MBytes   237 Mbits/sec  3614
[  4]   4.00-5.00   sec  28.1 MBytes   236 Mbits/sec  3598
[  4]   5.00-6.00   sec  28.2 MBytes   236 Mbits/sec  3609
[  4]   6.00-7.00   sec  27.9 MBytes   234 Mbits/sec  3577
[  4]   7.00-8.00   sec  28.2 MBytes   237 Mbits/sec  3609
[  4]   8.00-9.00   sec  28.1 MBytes   236 Mbits/sec  3597
[  4]   9.00-10.00  sec  28.2 MBytes   236 Mbits/sec  3608
[  4]  10.00-11.00  sec  28.1 MBytes   236 Mbits/sec  3593
[  4]  11.00-12.00  sec  28.1 MBytes   235 Mbits/sec  3594

TCP, plain
root@lede:/tmp# iperf3 -c 192.168.2.222
Connecting to host 192.168.2.222, port 5201
[  4] local 192.168.2.7 port 34732 connected to 192.168.2.222 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.02   sec  14.3 MBytes   117 Mbits/sec    2    132 KBytes
[  4]   1.02-2.08   sec  13.8 MBytes   109 Mbits/sec    0    132 KBytes
[  4]   2.08-3.04   sec  12.5 MBytes   109 Mbits/sec    0    132 KBytes
[  4]   3.04-4.00   sec  12.5 MBytes   110 Mbits/sec    1    132 KBytes
[  4]   4.00-5.09   sec  13.8 MBytes   106 Mbits/sec    0    132 KBytes
[  4]   5.09-6.05   sec  12.5 MBytes   109 Mbits/sec    0    132 KBytes
[  4]   6.05-7.01   sec  12.5 MBytes   109 Mbits/sec    0    132 KBytes
[  4]   7.01-8.07   sec  13.8 MBytes   109 Mbits/sec    1    132 KBytes
[  4]   8.07-9.03   sec  12.5 MBytes   109 Mbits/sec    0    132 KBytes
[  4]   9.03-10.12  sec  13.8 MBytes   106 Mbits/sec    0    132 KBytes

TCP over WG
iperf3 -c 10.0.0.1
Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.2 port 46832 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.37   sec  3.75 MBytes  22.9 Mbits/sec    0    134 KBytes
[  4]   1.37-2.27   sec  2.50 MBytes  23.4 Mbits/sec    0    134 KBytes
[  4]   2.27-3.17   sec  2.50 MBytes  23.4 Mbits/sec    0    134 KBytes
[  4]   3.17-4.06   sec  2.50 MBytes  23.4 Mbits/sec    0    134 KBytes
[  4]   4.06-5.40   sec  3.75 MBytes  23.6 Mbits/sec    0    141 KBytes
[  4]   5.40-6.28   sec  2.50 MBytes  23.6 Mbits/sec    0    141 KBytes
[  4]   6.28-7.17   sec  2.50 MBytes  23.7 Mbits/sec    0    141 KBytes
[  4]   7.17-8.06   sec  2.50 MBytes  23.7 Mbits/sec    0    141 KBytes
[  4]   8.06-9.38   sec  3.75 MBytes  23.7 Mbits/sec    0    141 KBytes
[  4]   9.38-10.27  sec  2.50 MBytes  23.7 Mbits/sec    0    141 KBytes

DMESG:
root@lede:~# dmesg
[    0.000000] Linux version 4.4.15 (buildbot@builds) (gcc version  
5.4.0 (LEDE GCC 5.4.0 r1178) ) #1 Fri Jul 29 22:27:49 UTC 2016
[    0.000000] MyLoader: sysp=b2822a22, boardp=aaa2a238, parts=aabaa2aa
[    0.000000] bootconsole [early0] enabled
[    0.000000] CPU0 revision is: 00019374 (MIPS 24Kc)
[    0.000000] SoC: Atheros AR9132 rev 2
[    0.000000] Determined physical RAM map:
[    0.000000]  memory: 02000000 @ 00000000 (usable)
[    0.000000] Initrd not found or empty - disabling initrd
[    0.000000] No valid device tree found, continuing without
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000000001ffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000001ffffff]
[    0.000000] Initmem setup node 0 [mem  
0x0000000000000000-0x0000000001ffffff]
[    0.000000] On node 0 totalpages: 8192
[    0.000000] free_area_init_node: node 0, pgdat 8042c5d0,  
node_mem_map 81000000
[    0.000000]   Normal zone: 64 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 8192 pages, LIFO batch:0
[    0.000000] Primary instruction cache 64kB, VIPT, 4-way, linesize 32 bytes.
[    0.000000] Primary data cache 32kB, 4-way, VIPT, cache aliases,  
linesize 32 bytes
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.   
Total pages: 8128
[    0.000000] Kernel command line: board=TL-WR1043ND   
console=ttyS0,115200 rootfstype=squashfs,jffs2 noinitrd
[    0.000000] PID hash table entries: 128 (order: -3, 512 bytes)
[    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000000] Writing ErrCtl register=00000000
[    0.000000] Readback ErrCtl register=00000000
[    0.000000] Memory: 27544K/32768K available (3076K kernel code,  
163K rwdata, 772K rodata, 268K init, 205K bss, 5224K reserved, 0K  
cma-reserved)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:51
[    0.000000] Clocks: CPU:400.000MHz, DDR:400.000MHz, AHB:200.000MHz,  
Ref:5.000MHz
[    0.000000] clocksource: MIPS: mask: 0xffffffff max_cycles:  
0xffffffff, max_idle_ns: 9556302233 ns
[    0.000013] sched_clock: 32 bits at 200MHz, resolution 5ns, wraps  
every 10737418237ns
[    0.007882] Calibrating delay loop... 265.42 BogoMIPS (lpj=1327104)
[    0.090589] pid_max: default: 32768 minimum: 301
[    0.095359] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.101977] Mountpoint-cache hash table entries: 1024 (order: 0,  
4096 bytes)
[    0.112308] clocksource: jiffies: mask: 0xffffffff max_cycles:  
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.123737] NET: Registered protocol family 16
[    0.129993] MIPS: machine is TP-LINK TL-WR1043ND
[    0.420183] clocksource: Switched to clocksource MIPS
[    0.426903] NET: Registered protocol family 2
[    0.432523] TCP established hash table entries: 1024 (order: 0, 4096 bytes)
[    0.439500] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.445920] TCP: Hash tables configured (established 1024 bind 1024)
[    0.452413] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.458259] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.464876] NET: Registered protocol family 1
[    0.469297] PCI: CLS 0 bytes, default 32
[    0.470638] futex hash table entries: 256 (order: -1, 3072 bytes)
[    0.476848] Crashlog allocated RAM at address 0x1f00000
[    0.504001] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.509833] jffs2: version 2.2 (NAND) (SUMMARY) (LZMA) (RTIME)  
(CMODE_PRIORITY) (c) 2001-2006 Red Hat, Inc.
[    0.522683] io scheduler noop registered
[    0.526609] io scheduler deadline registered (default)
[    0.532145] Serial: 8250/16550 driver, 16 ports, IRQ sharing enabled
[    0.542462] console [ttyS0] disabled
[    0.566070] serial8250.0: ttyS0 at MMIO 0x18020000 (irq = 11,  
base_baud = 12500000) is a 16550A
[    0.574774] console [ttyS0] enabled
[    0.581793] bootconsole [early0] disabled
[    0.596153] m25p80 spi0.0: found s25sl064p, expected m25p80
[    0.601854] m25p80 spi0.0: s25sl064p (8192 Kbytes)
[    0.607965] 5 tp-link partitions found on MTD device spi0.0
[    0.613633] Creating 5 MTD partitions on "spi0.0":
[    0.618465] 0x000000000000-0x000000020000 : "u-boot"
[    0.625295] 0x000000020000-0x000000172068 : "kernel"
[    0.632372] 0x000000172068-0x0000007f0000 : "rootfs"
[    0.639339] mtd: device 2 (rootfs) set to be root filesystem
[    0.645169] 1 squashfs-split partitions found on MTD device rootfs
[    0.651419] 0x000000350000-0x0000007f0000 : "rootfs_data"
[    0.658913] 0x0000007f0000-0x000000800000 : "art"
[    0.665756] 0x000000020000-0x0000007f0000 : "firmware"
[    0.674784] Realtek RTL8366RB ethernet switch driver version 0.2.4
[    0.790207] rtl8366rb rtl8366rb: using GPIO pins 18 (SDA) and 19 (SCK)
[    0.796934] rtl8366rb rtl8366rb: RTL5937 ver. 3 chip found
[    1.011341] libphy: rtl8366rb: probed
[    1.332238] eth0: Atheros AG71xx at 0xb9000000, irq 4, mode:RGMII
[    1.341465] NET: Registered protocol family 10
[    1.350976] NET: Registered protocol family 17
[    1.355555] bridge: automatic filtering via arp/ip/ip6tables has  
been deprecated. Update your scripts to load br_netfilter if you need  
this.
[    1.368356] Bridge firewalling registered
[    1.372578] 8021q: 802.1Q VLAN Support v1.8
[    1.378869] hctosys: unable to open rtc device (rtc0)
[    1.391003] VFS: Mounted root (squashfs filesystem) readonly on  
device 31:2.
[    1.399744] Freeing unused kernel memory: 268K (8044d000 - 80490000)
[    2.877793] init: Console is alive
[    2.881562] init: - watchdog -
[    4.201262] init: - preinit -
[    4.941373] ar71xx: pll_reg 0xb8050014: 0x1a000000
[    4.941412] eth0: link up (1000Mbps/Full duplex)
[    4.971517] random: procd urandom read with 8 bits of entropy available
[    8.155982] jffs2: notice: (368) jffs2_build_xattr_subsystem:  
complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan)  
and 0 of xref (0 dead, 0 orphan) found.
[    8.174917] mount_root: switching to jffs2 overlay
[    8.196628] urandom-seed: Seeding with /etc/urandom.seed
[    8.474797] eth0: link down
[    8.492080] procd: - early -
[    8.495110] procd: - watchdog -
[    9.077170] procd: - ubus -
[    9.134480] procd: - init -
[    9.821676] wireguard: WireGuard loaded. See www.wireguard.io for  
information.
[    9.828955] wireguard: (C) Copyright 2015-2016 Jason A. Donenfeld  
<Jason@zx2c4.com>. All Rights Reserved.
[    9.842593] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    9.868011] Loading modules backported from Linux version  
wt-2016-06-20-0-gbc17424
[    9.875704] Backport generated by backports.git  
backports-20160216-7-g5735958
[    9.886894] ip_tables: (C) 2000-2006 Netfilter Core Team
[    9.904908] nf_conntrack version 0.5.0 (434 buckets, 1736 max)
[    9.957814] xt_time: kernel timezone is -0000
[   10.034798] PPP generic driver version 2.4.2
[   10.042280] NET: Registered protocol family 24
[   10.138100] ath: EEPROM regdomain: 0x0
[   10.138128] ath: EEPROM indicates default country code should be used
[   10.138142] ath: doing EEPROM country->regdmn map search
[   10.138166] ath: country maps to regdmn code: 0x3a
[   10.138182] ath: Country alpha2 being used: US
[   10.138195] ath: Regpair used: 0x3a
[   10.179744] ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
[   10.183754] ieee80211 phy0: Atheros AR9100 MAC/BB Rev:7 AR2133 RF  
Rev:a2 mem=0xb80c0000, irq=2
[   19.824140] ar71xx: pll_reg 0xb8050014: 0x1a000000
[   19.824898] eth0: link up (1000Mbps/Full duplex)
[   19.846332] device eth0.1 entered promiscuous mode
[   19.851233] device eth0 entered promiscuous mode
[   19.867997] br-lan: port 1(eth0.1) entered forwarding state
[   19.873723] br-lan: port 1(eth0.1) entered forwarding state
[   21.870241] br-lan: port 1(eth0.1) entered forwarding state
[   76.210298] random: nonblocking pool is initialized
[  238.115582] br-lan: port 1(eth0.1) entered disabled state
[  238.271197] device eth0.1 left promiscuous mode
[  238.275779] device eth0 left promiscuous mode
[  238.280314] br-lan: port 1(eth0.1) entered disabled state
[  238.301614] IPv6: ADDRCONF(NETDEV_UP): eth0.1: link is not ready
[  238.745386] eth0: link down
[  243.024555] ar71xx: pll_reg 0xb8050014: 0x1a000000
[  243.024616] eth0: link up (1000Mbps/Full duplex)
[  243.046511] device eth0.1 entered promiscuous mode
[  243.051419] device eth0 entered promiscuous mode
[  243.067847] br-lan: port 1(eth0.1) entered forwarding state
[  243.073573] br-lan: port 1(eth0.1) entered forwarding state
[  245.070617] br-lan: port 1(eth0.1) entered forwarding state

This router is a spare router and only used for the vacations to share  
wifi connection.
I would like to use Wireguard to secure my trafic.

Greats,

René van Dorst.
 

> On 03.08.2016 08:48, René van Dorst wrote:
>
>> ...
>> I also tested wireguard on a router. TP-Link WR1043ND v1.08 with a  
>> Atheros AR9132 400MHz cpu.
>> Running LEDE 28-july-2016, wireguard & iperf3 via packagemanager.
>
>   so you do not observe crashing of the router like we do with the  
> tp-link wr841Nv11 -
>
>   do you also test iperf with udp packets , around 200 Mbit or so ?
> acording to openwrt wiki say that 1043v1.xx runs even slower cpu ,  
> but have 8Mb of flash
>
>
>   TL-WR1043ND 	     v1-v1.11 	     Atheros AR9132 	     400 	     8  
> 	     32 	     Atheros AR9100 (integrated) 	     b/g/n 	     5 	      
> 1x 2.0 	     Yes
>
>   as far as i understand is the lan also on the wifi chip, so this  
> differs .. 
> for the 841v11 it should be QCA9533-AL3A running with 560 MHz with  
> 32 MB Ram Zentel A3S56D40GTP-50L. switch QCA9533-BL3A built-in
>
>   https://wiki.openwrt.org/toh/TP-Link/tl-wr841nd
> https://wiki.openwrt.org/toh/TP-Link/tl-wr1043nd
> sidenode tplink name convention (to prevent confusion): mainly  
> important is running number like 1043 or 841 and the hardware  
> revision like v11, the N or ND are only antenna related, the .123  
> are factory firmware revision of the specific hardware revision -  
> which is more important for us here
>
>  

--=_FLlMoCZEG3VSv9m4cSN0cnF
Content-Type: text/html; charset=utf-8
Content-Description: HTML Message
Content-Disposition: inline

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
"http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title></title>
</head>
<body style="font-family:Arial;font-size:14px">
<p>Hi Jens,<br>
<br>
I see I made a typo about hardware version. It is v1.8 not v1.08.<br>
LEDE version is Reboot (HEAD, r1178) of 29-july-2016.<br>
<br>
I ran a 2 hour test for you and it did not crash. May be not long enough?<br>
Results after around 2 hour testing udp iperf3 over wireguard<br>
<br>
TOP output: UDP over Wireguard while running<br>
Mem: 22900K used, 4912K free, 632K shrd, 1704K buff, 7096K cached<br>
CPU:&nbsp;&nbsp; 1% usr&nbsp; 97% sys&nbsp;&nbsp; 0% nic&nbsp;&nbsp; 0% idle&nbsp;&nbsp; 0% io&nbsp;&nbsp; 0% irq&nbsp;&nbsp; 0% sirq<br>
Load average: 1.04 1.03 1.00 2/43 3392<br>
&nbsp; PID&nbsp; PPID USER&nbsp;&nbsp;&nbsp;&nbsp; STAT&nbsp;&nbsp; VSZ %VSZ %CPU COMMAND<br>
&nbsp;1747&nbsp; 1741 root&nbsp;&nbsp;&nbsp;&nbsp; R&nbsp;&nbsp;&nbsp;&nbsp; 2800&nbsp; 10%&nbsp; 98% iperf3 -c 10.0.0.1 -u -b 1G -t 7200<br>
&nbsp; 107&nbsp;&nbsp;&nbsp;&nbsp; 2 root&nbsp;&nbsp;&nbsp;&nbsp; SW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp; 0%&nbsp;&nbsp; 1% [kworker/0:1]<br>
&nbsp;3391&nbsp; 3385 root&nbsp;&nbsp;&nbsp;&nbsp; R&nbsp;&nbsp;&nbsp;&nbsp; 1180&nbsp;&nbsp; 4%&nbsp;&nbsp; 0% top<br>
<br>
UDP over WG<br>
root@lede:~# iperf3 -c 10.0.0.1 -u -b 1G -t 7200<br>
[&nbsp; 4] 7189.00-7190.00 sec&nbsp; 3.06 MBytes&nbsp; 25.7 Mbits/sec&nbsp; 392<br>
[&nbsp; 4] 7190.00-7191.00 sec&nbsp; 3.07 MBytes&nbsp; 25.7 Mbits/sec&nbsp; 393<br>
[&nbsp; 4] 7191.00-7192.00 sec&nbsp; 3.07 MBytes&nbsp; 25.7 Mbits/sec&nbsp; 393<br>
[&nbsp; 4] 7192.00-7193.00 sec&nbsp; 3.06 MBytes&nbsp; 25.7 Mbits/sec&nbsp; 392<br>
[&nbsp; 4] 7193.00-7194.00 sec&nbsp; 3.07 MBytes&nbsp; 25.7 Mbits/sec&nbsp; 393<br>
[&nbsp; 4] 7194.00-7195.00 sec&nbsp; 3.07 MBytes&nbsp; 25.7 Mbits/sec&nbsp; 393<br>
[&nbsp; 4] 7195.00-7196.00 sec&nbsp; 3.07 MBytes&nbsp; 25.7 Mbits/sec&nbsp; 393<br>
[&nbsp; 4] 7196.00-7197.00 sec&nbsp; 3.06 MBytes&nbsp; 25.7 Mbits/sec&nbsp; 392<br>
[&nbsp; 4] 7197.00-7198.00 sec&nbsp; 3.07 MBytes&nbsp; 25.7 Mbits/sec&nbsp; 393<br>
[&nbsp; 4] 7198.00-7199.00 sec&nbsp; 3.07 MBytes&nbsp; 25.7 Mbits/sec&nbsp; 393<br>
[&nbsp; 4] 7199.00-7200.00 sec&nbsp; 3.07 MBytes&nbsp; 25.7 Mbits/sec&nbsp; 393<br>
- - - - - - - - - - - - - - - - - - - - - - - - -<br>
[ ID] Interval&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Transfer&nbsp;&nbsp;&nbsp;&nbsp; Bandwidth&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jitter&nbsp;&nbsp;&nbsp; Lost/Total Datagrams<br>
[&nbsp; 4]&nbsp;&nbsp; 0.00-7200.00 sec&nbsp; 21.5 GBytes&nbsp; 25.6 Mbits/sec&nbsp; 0.047 ms&nbsp; 6/2814938 (0.00021%)<br>
[&nbsp; 4] Sent 2814938 datagrams<br>
<br>
UDP, plain<br>
root@lede:~# iperf3 -c 192.168.2.222 -u -b 1G -t 7200<br>
Connecting to host 192.168.2.222, port 5201<br>
[&nbsp; 4] local 192.168.2.5 port 48815 connected to 192.168.2.222 port 5201<br>
[ ID] Interval&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Transfer&nbsp;&nbsp;&nbsp;&nbsp; Bandwidth&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total Datagrams<br>
[&nbsp; 4]&nbsp;&nbsp; 0.00-1.00&nbsp;&nbsp; sec&nbsp; 28.2 MBytes&nbsp;&nbsp; 236 Mbits/sec&nbsp; 3605<br>
[&nbsp; 4]&nbsp;&nbsp; 1.00-2.00&nbsp;&nbsp; sec&nbsp; 28.0 MBytes&nbsp;&nbsp; 235 Mbits/sec&nbsp; 3582<br>
[&nbsp; 4]&nbsp;&nbsp; 2.00-3.00&nbsp;&nbsp; sec&nbsp; 28.2 MBytes&nbsp;&nbsp; 237 Mbits/sec&nbsp; 3609<br>
[&nbsp; 4]&nbsp;&nbsp; 3.00-4.00&nbsp;&nbsp; sec&nbsp; 28.2 MBytes&nbsp;&nbsp; 237 Mbits/sec&nbsp; 3614<br>
[&nbsp; 4]&nbsp;&nbsp; 4.00-5.00&nbsp;&nbsp; sec&nbsp; 28.1 MBytes&nbsp;&nbsp; 236 Mbits/sec&nbsp; 3598<br>
[&nbsp; 4]&nbsp;&nbsp; 5.00-6.00&nbsp;&nbsp; sec&nbsp; 28.2 MBytes&nbsp;&nbsp; 236 Mbits/sec&nbsp; 3609<br>
[&nbsp; 4]&nbsp;&nbsp; 6.00-7.00&nbsp;&nbsp; sec&nbsp; 27.9 MBytes&nbsp;&nbsp; 234 Mbits/sec&nbsp; 3577<br>
[&nbsp; 4]&nbsp;&nbsp; 7.00-8.00&nbsp;&nbsp; sec&nbsp; 28.2 MBytes&nbsp;&nbsp; 237 Mbits/sec&nbsp; 3609<br>
[&nbsp; 4]&nbsp;&nbsp; 8.00-9.00&nbsp;&nbsp; sec&nbsp; 28.1 MBytes&nbsp;&nbsp; 236 Mbits/sec&nbsp; 3597<br>
[&nbsp; 4]&nbsp;&nbsp; 9.00-10.00&nbsp; sec&nbsp; 28.2 MBytes&nbsp;&nbsp; 236 Mbits/sec&nbsp; 3608<br>
[&nbsp; 4]&nbsp; 10.00-11.00&nbsp; sec&nbsp; 28.1 MBytes&nbsp;&nbsp; 236 Mbits/sec&nbsp; 3593<br>
[&nbsp; 4]&nbsp; 11.00-12.00&nbsp; sec&nbsp; 28.1 MBytes&nbsp;&nbsp; 235 Mbits/sec&nbsp; 3594<br>
<br>
<br>
TCP, plain<br>
root@lede:/tmp# iperf3 -c 192.168.2.222<br>
Connecting to host 192.168.2.222, port 5201<br>
[&nbsp; 4] local 192.168.2.7 port 34732 connected to 192.168.2.222 port 5201<br>
[ ID] Interval&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Transfer&nbsp;&nbsp;&nbsp;&nbsp; Bandwidth&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Retr&nbsp; Cwnd<br>
[&nbsp; 4]&nbsp;&nbsp; 0.00-1.02&nbsp;&nbsp; sec&nbsp; 14.3 MBytes&nbsp;&nbsp; 117 Mbits/sec&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp; 132 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 1.02-2.08&nbsp;&nbsp; sec&nbsp; 13.8 MBytes&nbsp;&nbsp; 109 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 132 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 2.08-3.04&nbsp;&nbsp; sec&nbsp; 12.5 MBytes&nbsp;&nbsp; 109 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 132 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 3.04-4.00&nbsp;&nbsp; sec&nbsp; 12.5 MBytes&nbsp;&nbsp; 110 Mbits/sec&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp; 132 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 4.00-5.09&nbsp;&nbsp; sec&nbsp; 13.8 MBytes&nbsp;&nbsp; 106 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 132 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 5.09-6.05&nbsp;&nbsp; sec&nbsp; 12.5 MBytes&nbsp;&nbsp; 109 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 132 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 6.05-7.01&nbsp;&nbsp; sec&nbsp; 12.5 MBytes&nbsp;&nbsp; 109 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 132 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 7.01-8.07&nbsp;&nbsp; sec&nbsp; 13.8 MBytes&nbsp;&nbsp; 109 Mbits/sec&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp; 132 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 8.07-9.03&nbsp;&nbsp; sec&nbsp; 12.5 MBytes&nbsp;&nbsp; 109 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 132 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 9.03-10.12&nbsp; sec&nbsp; 13.8 MBytes&nbsp;&nbsp; 106 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 132 KBytes<br>
<br>
<br>
TCP over WG<br>
iperf3 -c 10.0.0.1<br>
Connecting to host 10.0.0.1, port 5201<br>
[&nbsp; 4] local 10.0.0.2 port 46832 connected to 10.0.0.1 port 5201<br>
[ ID] Interval&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Transfer&nbsp;&nbsp;&nbsp;&nbsp; Bandwidth&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Retr&nbsp; Cwnd<br>
[&nbsp; 4]&nbsp;&nbsp; 0.00-1.37&nbsp;&nbsp; sec&nbsp; 3.75 MBytes&nbsp; 22.9 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 134 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 1.37-2.27&nbsp;&nbsp; sec&nbsp; 2.50 MBytes&nbsp; 23.4 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 134 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 2.27-3.17&nbsp;&nbsp; sec&nbsp; 2.50 MBytes&nbsp; 23.4 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 134 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 3.17-4.06&nbsp;&nbsp; sec&nbsp; 2.50 MBytes&nbsp; 23.4 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 134 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 4.06-5.40&nbsp;&nbsp; sec&nbsp; 3.75 MBytes&nbsp; 23.6 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 141 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 5.40-6.28&nbsp;&nbsp; sec&nbsp; 2.50 MBytes&nbsp; 23.6 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 141 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 6.28-7.17&nbsp;&nbsp; sec&nbsp; 2.50 MBytes&nbsp; 23.7 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 141 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 7.17-8.06&nbsp;&nbsp; sec&nbsp; 2.50 MBytes&nbsp; 23.7 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 141 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 8.06-9.38&nbsp;&nbsp; sec&nbsp; 3.75 MBytes&nbsp; 23.7 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 141 KBytes<br>
[&nbsp; 4]&nbsp;&nbsp; 9.38-10.27&nbsp; sec&nbsp; 2.50 MBytes&nbsp; 23.7 Mbits/sec&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 141 KBytes<br>
<br>
<br>
DMESG:<br>
root@lede:~# dmesg<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Linux version 4.4.15 (buildbot@builds) (gcc version 5.4.0 (LEDE GCC 5.4.0 r1178) ) #1 Fri Jul 29 22:27:49 UTC 2016<br>
[&nbsp;&nbsp;&nbsp; 0.000000] MyLoader: sysp=b2822a22, boardp=aaa2a238, parts=aabaa2aa<br>
[&nbsp;&nbsp;&nbsp; 0.000000] bootconsole [early0] enabled<br>
[&nbsp;&nbsp;&nbsp; 0.000000] CPU0 revision is: 00019374 (MIPS 24Kc)<br>
[&nbsp;&nbsp;&nbsp; 0.000000] SoC: Atheros AR9132 rev 2<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Determined physical RAM map:<br>
[&nbsp;&nbsp;&nbsp; 0.000000]&nbsp; memory: 02000000 @ 00000000 (usable)<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Initrd not found or empty - disabling initrd<br>
[&nbsp;&nbsp;&nbsp; 0.000000] No valid device tree found, continuing without<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Zone ranges:<br>
[&nbsp;&nbsp;&nbsp; 0.000000]&nbsp;&nbsp; Normal&nbsp;&nbsp; [mem 0x0000000000000000-0x0000000001ffffff]<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Movable zone start for each node<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Early memory node ranges<br>
[&nbsp;&nbsp;&nbsp; 0.000000]&nbsp;&nbsp; node&nbsp;&nbsp; 0: [mem 0x0000000000000000-0x0000000001ffffff]<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000001ffffff]<br>
[&nbsp;&nbsp;&nbsp; 0.000000] On node 0 totalpages: 8192<br>
[&nbsp;&nbsp;&nbsp; 0.000000] free_area_init_node: node 0, pgdat 8042c5d0, node_mem_map 81000000<br>
[&nbsp;&nbsp;&nbsp; 0.000000]&nbsp;&nbsp; Normal zone: 64 pages used for memmap<br>
[&nbsp;&nbsp;&nbsp; 0.000000]&nbsp;&nbsp; Normal zone: 0 pages reserved<br>
[&nbsp;&nbsp;&nbsp; 0.000000]&nbsp;&nbsp; Normal zone: 8192 pages, LIFO batch:0<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Primary instruction cache 64kB, VIPT, 4-way, linesize 32 bytes.<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Primary data cache 32kB, 4-way, VIPT, cache aliases, linesize 32 bytes<br>
[&nbsp;&nbsp;&nbsp; 0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768<br>
[&nbsp;&nbsp;&nbsp; 0.000000] pcpu-alloc: [0] 0<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Built 1 zonelists in Zone order, mobility grouping on.&nbsp; Total pages: 8128<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Kernel command line: board=TL-WR1043ND&nbsp; console=ttyS0,115200 rootfstype=squashfs,jffs2 noinitrd<br>
[&nbsp;&nbsp;&nbsp; 0.000000] PID hash table entries: 128 (order: -3, 512 bytes)<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Writing ErrCtl register=00000000<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Readback ErrCtl register=00000000<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Memory: 27544K/32768K available (3076K kernel code, 163K rwdata, 772K rodata, 268K init, 205K bss, 5224K reserved, 0K cma-reserved)<br>
[&nbsp;&nbsp;&nbsp; 0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1<br>
[&nbsp;&nbsp;&nbsp; 0.000000] NR_IRQS:51<br>
[&nbsp;&nbsp;&nbsp; 0.000000] Clocks: CPU:400.000MHz, DDR:400.000MHz, AHB:200.000MHz, Ref:5.000MHz<br>
[&nbsp;&nbsp;&nbsp; 0.000000] clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 9556302233 ns<br>
[&nbsp;&nbsp;&nbsp; 0.000013] sched_clock: 32 bits at 200MHz, resolution 5ns, wraps every 10737418237ns<br>
[&nbsp;&nbsp;&nbsp; 0.007882] Calibrating delay loop... 265.42 BogoMIPS (lpj=1327104)<br>
[&nbsp;&nbsp;&nbsp; 0.090589] pid_max: default: 32768 minimum: 301<br>
[&nbsp;&nbsp;&nbsp; 0.095359] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)<br>
[&nbsp;&nbsp;&nbsp; 0.101977] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)<br>
[&nbsp;&nbsp;&nbsp; 0.112308] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns<br>
[&nbsp;&nbsp;&nbsp; 0.123737] NET: Registered protocol family 16<br>
[&nbsp;&nbsp;&nbsp; 0.129993] MIPS: machine is TP-LINK TL-WR1043ND<br>
[&nbsp;&nbsp;&nbsp; 0.420183] clocksource: Switched to clocksource MIPS<br>
[&nbsp;&nbsp;&nbsp; 0.426903] NET: Registered protocol family 2<br>
[&nbsp;&nbsp;&nbsp; 0.432523] TCP established hash table entries: 1024 (order: 0, 4096 bytes)<br>
[&nbsp;&nbsp;&nbsp; 0.439500] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)<br>
[&nbsp;&nbsp;&nbsp; 0.445920] TCP: Hash tables configured (established 1024 bind 1024)<br>
[&nbsp;&nbsp;&nbsp; 0.452413] UDP hash table entries: 256 (order: 0, 4096 bytes)<br>
[&nbsp;&nbsp;&nbsp; 0.458259] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)<br>
[&nbsp;&nbsp;&nbsp; 0.464876] NET: Registered protocol family 1<br>
[&nbsp;&nbsp;&nbsp; 0.469297] PCI: CLS 0 bytes, default 32<br>
[&nbsp;&nbsp;&nbsp; 0.470638] futex hash table entries: 256 (order: -1, 3072 bytes)<br>
[&nbsp;&nbsp;&nbsp; 0.476848] Crashlog allocated RAM at address 0x1f00000<br>
[&nbsp;&nbsp;&nbsp; 0.504001] squashfs: version 4.0 (2009/01/31) Phillip Lougher<br>
[&nbsp;&nbsp;&nbsp; 0.509833] jffs2: version 2.2 (NAND) (SUMMARY) (LZMA) (RTIME) (CMODE_PRIORITY) (c) 2001-2006 Red Hat, Inc.<br>
[&nbsp;&nbsp;&nbsp; 0.522683] io scheduler noop registered<br>
[&nbsp;&nbsp;&nbsp; 0.526609] io scheduler deadline registered (default)<br>
[&nbsp;&nbsp;&nbsp; 0.532145] Serial: 8250/16550 driver, 16 ports, IRQ sharing enabled<br>
[&nbsp;&nbsp;&nbsp; 0.542462] console [ttyS0] disabled<br>
[&nbsp;&nbsp;&nbsp; 0.566070] serial8250.0: ttyS0 at MMIO 0x18020000 (irq = 11, base_baud = 12500000) is a 16550A<br>
[&nbsp;&nbsp;&nbsp; 0.574774] console [ttyS0] enabled<br>
[&nbsp;&nbsp;&nbsp; 0.581793] bootconsole [early0] disabled<br>
[&nbsp;&nbsp;&nbsp; 0.596153] m25p80 spi0.0: found s25sl064p, expected m25p80<br>
[&nbsp;&nbsp;&nbsp; 0.601854] m25p80 spi0.0: s25sl064p (8192 Kbytes)<br>
[&nbsp;&nbsp;&nbsp; 0.607965] 5 tp-link partitions found on MTD device spi0.0<br>
[&nbsp;&nbsp;&nbsp; 0.613633] Creating 5 MTD partitions on "spi0.0":<br>
[&nbsp;&nbsp;&nbsp; 0.618465] 0x000000000000-0x000000020000 : "u-boot"<br>
[&nbsp;&nbsp;&nbsp; 0.625295] 0x000000020000-0x000000172068 : "kernel"<br>
[&nbsp;&nbsp;&nbsp; 0.632372] 0x000000172068-0x0000007f0000 : "rootfs"<br>
[&nbsp;&nbsp;&nbsp; 0.639339] mtd: device 2 (rootfs) set to be root filesystem<br>
[&nbsp;&nbsp;&nbsp; 0.645169] 1 squashfs-split partitions found on MTD device rootfs<br>
[&nbsp;&nbsp;&nbsp; 0.651419] 0x000000350000-0x0000007f0000 : "rootfs_data"<br>
[&nbsp;&nbsp;&nbsp; 0.658913] 0x0000007f0000-0x000000800000 : "art"<br>
[&nbsp;&nbsp;&nbsp; 0.665756] 0x000000020000-0x0000007f0000 : "firmware"<br>
[&nbsp;&nbsp;&nbsp; 0.674784] Realtek RTL8366RB ethernet switch driver version 0.2.4<br>
[&nbsp;&nbsp;&nbsp; 0.790207] rtl8366rb rtl8366rb: using GPIO pins 18 (SDA) and 19 (SCK)<br>
[&nbsp;&nbsp;&nbsp; 0.796934] rtl8366rb rtl8366rb: RTL5937 ver. 3 chip found<br>
[&nbsp;&nbsp;&nbsp; 1.011341] libphy: rtl8366rb: probed<br>
[&nbsp;&nbsp;&nbsp; 1.332238] eth0: Atheros AG71xx at 0xb9000000, irq 4, mode:RGMII<br>
[&nbsp;&nbsp;&nbsp; 1.341465] NET: Registered protocol family 10<br>
[&nbsp;&nbsp;&nbsp; 1.350976] NET: Registered protocol family 17<br>
[&nbsp;&nbsp;&nbsp; 1.355555] bridge: automatic filtering via arp/ip/ip6tables has been deprecated. Update your scripts to load br_netfilter if you need this.<br>
[&nbsp;&nbsp;&nbsp; 1.368356] Bridge firewalling registered<br>
[&nbsp;&nbsp;&nbsp; 1.372578] 8021q: 802.1Q VLAN Support v1.8<br>
[&nbsp;&nbsp;&nbsp; 1.378869] hctosys: unable to open rtc device (rtc0)<br>
[&nbsp;&nbsp;&nbsp; 1.391003] VFS: Mounted root (squashfs filesystem) readonly on device 31:2.<br>
[&nbsp;&nbsp;&nbsp; 1.399744] Freeing unused kernel memory: 268K (8044d000 - 80490000)<br>
[&nbsp;&nbsp;&nbsp; 2.877793] init: Console is alive<br>
[&nbsp;&nbsp;&nbsp; 2.881562] init: - watchdog -<br>
[&nbsp;&nbsp;&nbsp; 4.201262] init: - preinit -<br>
[&nbsp;&nbsp;&nbsp; 4.941373] ar71xx: pll_reg 0xb8050014: 0x1a000000<br>
[&nbsp;&nbsp;&nbsp; 4.941412] eth0: link up (1000Mbps/Full duplex)<br>
[&nbsp;&nbsp;&nbsp; 4.971517] random: procd urandom read with 8 bits of entropy available<br>
[&nbsp;&nbsp;&nbsp; 8.155982] jffs2: notice: (368) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.<br>
[&nbsp;&nbsp;&nbsp; 8.174917] mount_root: switching to jffs2 overlay<br>
[&nbsp;&nbsp;&nbsp; 8.196628] urandom-seed: Seeding with /etc/urandom.seed<br>
[&nbsp;&nbsp;&nbsp; 8.474797] eth0: link down<br>
[&nbsp;&nbsp;&nbsp; 8.492080] procd: - early -<br>
[&nbsp;&nbsp;&nbsp; 8.495110] procd: - watchdog -<br>
[&nbsp;&nbsp;&nbsp; 9.077170] procd: - ubus -<br>
[&nbsp;&nbsp;&nbsp; 9.134480] procd: - init -<br>
[&nbsp;&nbsp;&nbsp; 9.821676] wireguard: WireGuard loaded. See www.wireguard.io for information.<br>
[&nbsp;&nbsp;&nbsp; 9.828955] wireguard: (C) Copyright 2015-2016 Jason A. Donenfeld &lt;Jason@zx2c4.com&gt;. All Rights Reserved.<br>
[&nbsp;&nbsp;&nbsp; 9.842593] ip6_tables: (C) 2000-2006 Netfilter Core Team<br>
[&nbsp;&nbsp;&nbsp; 9.868011] Loading modules backported from Linux version wt-2016-06-20-0-gbc17424<br>
[&nbsp;&nbsp;&nbsp; 9.875704] Backport generated by backports.git backports-20160216-7-g5735958<br>
[&nbsp;&nbsp;&nbsp; 9.886894] ip_tables: (C) 2000-2006 Netfilter Core Team<br>
[&nbsp;&nbsp;&nbsp; 9.904908] nf_conntrack version 0.5.0 (434 buckets, 1736 max)<br>
[&nbsp;&nbsp;&nbsp; 9.957814] xt_time: kernel timezone is -0000<br>
[&nbsp;&nbsp; 10.034798] PPP generic driver version 2.4.2<br>
[&nbsp;&nbsp; 10.042280] NET: Registered protocol family 24<br>
[&nbsp;&nbsp; 10.138100] ath: EEPROM regdomain: 0x0<br>
[&nbsp;&nbsp; 10.138128] ath: EEPROM indicates default country code should be used<br>
[&nbsp;&nbsp; 10.138142] ath: doing EEPROM country-&gt;regdmn map search<br>
[&nbsp;&nbsp; 10.138166] ath: country maps to regdmn code: 0x3a<br>
[&nbsp;&nbsp; 10.138182] ath: Country alpha2 being used: US<br>
[&nbsp;&nbsp; 10.138195] ath: Regpair used: 0x3a<br>
[&nbsp;&nbsp; 10.179744] ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'<br>
[&nbsp;&nbsp; 10.183754] ieee80211 phy0: Atheros AR9100 MAC/BB Rev:7 AR2133 RF Rev:a2 mem=0xb80c0000, irq=2<br>
[&nbsp;&nbsp; 19.824140] ar71xx: pll_reg 0xb8050014: 0x1a000000<br>
[&nbsp;&nbsp; 19.824898] eth0: link up (1000Mbps/Full duplex)<br>
[&nbsp;&nbsp; 19.846332] device eth0.1 entered promiscuous mode<br>
[&nbsp;&nbsp; 19.851233] device eth0 entered promiscuous mode<br>
[&nbsp;&nbsp; 19.867997] br-lan: port 1(eth0.1) entered forwarding state<br>
[&nbsp;&nbsp; 19.873723] br-lan: port 1(eth0.1) entered forwarding state<br>
[&nbsp;&nbsp; 21.870241] br-lan: port 1(eth0.1) entered forwarding state<br>
[&nbsp;&nbsp; 76.210298] random: nonblocking pool is initialized<br>
[&nbsp; 238.115582] br-lan: port 1(eth0.1) entered disabled state<br>
[&nbsp; 238.271197] device eth0.1 left promiscuous mode<br>
[&nbsp; 238.275779] device eth0 left promiscuous mode<br>
[&nbsp; 238.280314] br-lan: port 1(eth0.1) entered disabled state<br>
[&nbsp; 238.301614] IPv6: ADDRCONF(NETDEV_UP): eth0.1: link is not ready<br>
[&nbsp; 238.745386] eth0: link down<br>
[&nbsp; 243.024555] ar71xx: pll_reg 0xb8050014: 0x1a000000<br>
[&nbsp; 243.024616] eth0: link up (1000Mbps/Full duplex)<br>
[&nbsp; 243.046511] device eth0.1 entered promiscuous mode<br>
[&nbsp; 243.051419] device eth0 entered promiscuous mode<br>
[&nbsp; 243.067847] br-lan: port 1(eth0.1) entered forwarding state<br>
[&nbsp; 243.073573] br-lan: port 1(eth0.1) entered forwarding state<br>
[&nbsp; 245.070617] br-lan: port 1(eth0.1) entered forwarding state<br>
<br>
<br>
This router is a spare router and only used for the vacations to share wifi connection.<br>
I would like to use Wireguard to secure my trafic.<br>
<br>
Greats,<br>
<br>
Ren&eacute; van Dorst.<br>
&nbsp;</p>
<blockquote style="border-left:2px solid blue;margin-left:2px;padding-left:12px;" type="cite">
<div class="moz-cite-prefix">On 03.08.2016 08:48, Ren&eacute; van Dorst wrote:</div>
<blockquote cite="mid:20160803064853.Horde.ZExiUp0by8SskYUmZW7CFq4@www.vdorst.com" type="cite">
<p>...<br>
I also tested wireguard on a router. TP-Link WR1043ND v1.08 with a Atheros AR9132 400MHz cpu.<br>
Running LEDE 28-july-2016, wireguard &amp; iperf3 via packagemanager.</p>
</blockquote>
<p>so you do not observe crashing of the router like we do with the tp-link wr841Nv11 -</p>
<p>do you also test iperf with udp packets , around 200 Mbit or so ?<br>
acording to openwrt wiki say that 1043v1.xx runs even slower cpu , but have 8Mb of flash</p>
<table class="inline dataplugin_table">
<tbody>
<tr>
<td class="leftalign model">TL-WR1043ND</td>
<td class="leftalign version">v1-v1.11</td>
<td class="leftalign platform">Atheros AR9132</td>
<td class="rightalign cpu_mhz">400</td>
<td class="rightalign flash_mb">8</td>
<td class="rightalign ram_mb">32</td>
<td class="leftalign wlan_hardware">Atheros AR9100 (integrated)</td>
<td class="leftalign wlan_24ghz">b/g/n</td>
<td class="rightalign ethernet_gbit_ports">5</td>
<td class="leftalign usb_ports">1x 2.0</td>
<td class="leftalign serial">Yes</td>
</tr>
</tbody>
</table>
<p>as far as i understand is the lan also on the wifi chip, so this differs ..&nbsp;<br>
for the 841v11 it should be QCA9533-AL3A running with 560 <abbr title="Megahertz">MHz with 32 MB Ram</abbr> Zentel A3S56D40GTP-50L. switch QCA9533-BL3A built-in</p>
<p><a class="moz-txt-link-freetext" href="https://wiki.openwrt.org/toh/TP-Link/tl-wr841nd">https://wiki.openwrt.org/toh/TP-Link/tl-wr841nd</a><br>
<a class="moz-txt-link-freetext" href="https://wiki.openwrt.org/toh/TP-Link/tl-wr1043nd">https://wiki.openwrt.org/toh/TP-Link/tl-wr1043nd</a></p>
sidenode tplink name convention (to prevent confusion): mainly important is running number like 1043 or 841 and the hardware revision like v11, the N or ND are only antenna related, the .123 are factory firmware revision of the specific hardware revision - which is more important for us here<br>
<br>
&nbsp;</blockquote>
</body>
</html>
--=_FLlMoCZEG3VSv9m4cSN0cnF--
