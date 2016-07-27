Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f5e9b5c
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 05:56:11 +0000 (UTC)
Received: from [192.168.0.38] (p4FF89D63.dip0.t-ipconnect.de [79.248.157.99])
 by openfreiburg.de (Postfix) with ESMTPSA id 9E0C310F23D85
 for <wireguard@lists.zx2c4.com>; Wed, 27 Jul 2016 07:58:48 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: jens <jens@viisauksena.de>
Message-ID: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
Date: Wed, 27 Jul 2016 07:55:39 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------75B5EEF201250468C056C848"
Subject: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
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
--------------75B5EEF201250468C056C848
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

last night we tested Wireguard with LEDE on a fairly weak mashine - TP
Link 841N v11.1 with 4MB flash, 32MB ram, and 650 MHz cpu.
we choose this router model because we have some hundred of them
deployed in our free wifi for the public networks around our city. (as
mentioned before Freifunk Freiburg https://freiburg.freifunk.net ) We
were interestet in Performance and what we (maybe) can do with wireguard

we described it in detail here
https://forum.freifunk.net/t/lede-test-wireguard-und-blanko-durchsatz-tp8=
41nv11-1-und-bug/13163

brief summary - sharing of experiences
netifd crashed via iperf3 test from   laptop - 841Nv11 - 841Nv11 - laptop=

iperf was running on laptops, wireguard as tunnel between 841Nv11
Routers, all connected via cable.

without wireguard, so plain routing we got 93 MBs (for refference)
and with Wireguard so far 15.5 MBs

there are clearly some heavy problems with netifd from LEDE/Openwrt ...
we simply ran in heavy load (2.6++) and out of memory

here some notes and dmesg output:

###############
# plain routing through 2 841v11.1

root@K:/home/k/wiki/wg-lede# iperf3 -c 192.168.2.23 -p 4000 -t 20
Connecting to host 192.168.2.23, port 4000
[  4] local 192.168.1.23 port 37940 connected to 192.168.2.23 port 4000
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  11.6 MBytes  96.9 Mbits/sec    0    127
KBytes      =20
[  4]   1.00-2.00   sec  11.4 MBytes  95.4 Mbits/sec    0    205
KBytes      =20
[  4]   2.00-3.00   sec  11.2 MBytes  93.8 Mbits/sec    1    165
KBytes      =20
[  4]   3.00-4.00   sec  11.1 MBytes  93.3 Mbits/sec    0    187
KBytes      =20
[  4]   4.00-5.00   sec  11.2 MBytes  94.4 Mbits/sec    0    187
KBytes      =20
[  4]   5.00-6.00   sec  11.2 MBytes  94.4 Mbits/sec    0    187
KBytes      =20
[  4]   6.00-7.00   sec  11.2 MBytes  93.8 Mbits/sec    0    187
KBytes      =20
[  4]   7.00-8.00   sec  11.1 MBytes  93.3 Mbits/sec    0    187
KBytes      =20
[  4]   8.00-9.00   sec  11.1 MBytes  93.3 Mbits/sec    2    146
KBytes      =20
[  4]   9.00-10.00  sec  11.2 MBytes  94.4 Mbits/sec    0    150
KBytes      =20
[  4]  10.00-11.00  sec  11.2 MBytes  93.8 Mbits/sec    0    150
KBytes      =20
[  4]  11.00-12.00  sec  11.1 MBytes  93.3 Mbits/sec    0    161
KBytes      =20
[  4]  12.00-13.00  sec  11.2 MBytes  93.8 Mbits/sec    0    167
KBytes      =20
[  4]  13.00-14.00  sec  11.2 MBytes  93.8 Mbits/sec    0    168
KBytes      =20
[  4]  14.00-15.00  sec  11.1 MBytes  93.3 Mbits/sec    0    173
KBytes      =20
[  4]  15.00-16.00  sec  11.1 MBytes  93.3 Mbits/sec    0    181
KBytes      =20
[  4]  16.00-17.00  sec  11.1 MBytes  93.3 Mbits/sec    2    120
KBytes      =20
[  4]  17.00-18.00  sec  11.2 MBytes  93.8 Mbits/sec    0    139
KBytes      =20
[  4]  18.00-19.00  sec  11.1 MBytes  92.8 Mbits/sec    1    151
KBytes      =20
[  4]  19.00-20.00  sec  11.2 MBytes  93.8 Mbits/sec    0    160
KBytes      =20
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-20.00  sec   224 MBytes  93.9 Mbits/sec    6             sen=
der
[  4]   0.00-20.00  sec   223 MBytes  93.7 Mbits/sec                =20
receiver
iperf Done.

# on lede router
CPU:   0% usr   6% sys   0% nic  42% idle   0% io   0% irq  51% sirq
CPU:   0% usr   6% sys   0% nic  38% idle   0% io   0% irq  53% sirq

##############
# Testergebnis durch wireguard=20

# iperf3 -c 192.168.2.23 -p 4000 -t 20
Connecting to host 192.168.2.23, port 4000
[  4] local 192.168.1.23 port 38526 connected to 192.168.2.23 port 4000
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  2.02 MBytes  17.0 Mbits/sec   70   8.03
KBytes      =20
[  4]   1.00-2.00   sec  1.79 MBytes  15.0 Mbits/sec   95   6.69
KBytes      =20
[  4]   2.00-3.00   sec  1.75 MBytes  14.7 Mbits/sec   82   6.69
KBytes      =20
[  4]   3.00-4.00   sec  1.82 MBytes  15.3 Mbits/sec   95   4.02
KBytes      =20
[  4]   4.00-5.00   sec  1.89 MBytes  15.9 Mbits/sec   84   8.03
KBytes      =20
[  4]   5.00-6.00   sec  1.86 MBytes  15.6 Mbits/sec   85   8.03
KBytes      =20
[  4]   6.00-7.00   sec  1.84 MBytes  15.4 Mbits/sec   86   6.69
KBytes      =20
[  4]   7.00-8.00   sec  1.82 MBytes  15.2 Mbits/sec   89   6.69
KBytes      =20
[  4]   8.00-9.00   sec  1.87 MBytes  15.7 Mbits/sec   86   6.69
KBytes      =20
[  4]   9.00-10.00  sec  1.94 MBytes  16.3 Mbits/sec   90   8.03
KBytes      =20
[  4]  10.00-11.00  sec  1.85 MBytes  15.5 Mbits/sec   79   8.03
KBytes      =20
[  4]  11.00-12.00  sec  1.84 MBytes  15.4 Mbits/sec   82   8.03
KBytes      =20
[  4]  12.00-13.00  sec  1.85 MBytes  15.5 Mbits/sec   84   6.69
KBytes      =20
[  4]  13.00-14.00  sec  1.87 MBytes  15.7 Mbits/sec   71   8.03
KBytes      =20
[  4]  14.00-15.00  sec  1.84 MBytes  15.5 Mbits/sec   75   6.69
KBytes      =20
[  4]  15.00-16.00  sec  1.78 MBytes  14.9 Mbits/sec   80   5.36
KBytes      =20
[  4]  16.00-17.00  sec  1.77 MBytes  14.9 Mbits/sec   89   8.03
KBytes      =20
[  4]  17.00-18.00  sec  1.85 MBytes  15.5 Mbits/sec   83   6.69
KBytes      =20
[  4]  18.00-19.00  sec  1.85 MBytes  15.5 Mbits/sec   86   5.36
KBytes      =20
[  4]  19.00-20.00  sec  1.80 MBytes  15.1 Mbits/sec   87   5.36
KBytes      =20
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-20.00  sec  36.9 MBytes  15.5 Mbits/sec  1678           =20
sender
[  4]   0.00-20.00  sec  36.8 MBytes  15.5 Mbits/sec                =20
receiver



[  5] local 192.168.2.23 port 4000 connected to 192.168.1.23 port 40859
[ ID] Interval           Transfer     Bandwidth       Jitter  =20
Lost/Total Datagrams
[  5]   0.00-1.00   sec  2.95 MBytes  24.7 Mbits/sec  1.482 ms  749/1126
(67%) =20
[  5]   1.00-2.00   sec  2.23 MBytes  18.7 Mbits/sec  2.896 ms  682/967
(71%) =20
[  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec  2.896 ms  0/0 (-nan%)=
 =20
[  5]   3.00-4.00   sec   256 KBytes  2.10 Mbits/sec  22.290 ms  100/132
(76%) =20
[  5]   4.00-5.00   sec  3.70 MBytes  31.1 Mbits/sec  3.353 ms=20
4220/4694 (90%) =20
[  5]   5.00-6.00   sec  3.85 MBytes  32.3 Mbits/sec  1.387 ms  929/1422
(65%) =20
[  5]   6.00-7.00   sec  4.63 MBytes  38.9 Mbits/sec  1.969 ms  860/1453
(59%) =20
[  5]   7.00-8.00   sec  4.66 MBytes  39.1 Mbits/sec  2.556 ms  882/1479
(60%) =20
[  5]   8.00-9.00   sec  4.66 MBytes  39.1 Mbits/sec  1.423 ms  838/1434
(58%) =20
[  5]   9.00-10.00  sec  4.56 MBytes  38.3 Mbits/sec  1.557 ms  872/1456
(60%) =20
[  5]  10.00-10.18  sec   904 KBytes  40.9 Mbits/sec  1.431 ms  172/285
(60%) =20
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Jitter  =20
Lost/Total Datagrams
[  5]   0.00-10.18  sec  0.00 Bytes  0.00 bits/sec  1.431 ms=20
10304/14448 (71%) =20


Accepted connection from 192.168.1.23, port 38608
[  5] local 192.168.2.23 port 4000 connected to 192.168.1.23 port 43867
[ ID] Interval           Transfer     Bandwidth       Jitter  =20
Lost/Total Datagrams
[  5]   0.00-1.00   sec  2.62 MBytes  22.0 Mbits/sec  3.046 ms  792/1128
(70%) =20
[  5]   1.00-2.00   sec  3.68 MBytes  30.9 Mbits/sec  2.537 ms=20
1008/1479 (68%) =20
[  5]   2.00-3.00   sec  2.19 MBytes  18.3 Mbits/sec  3.395 ms  698/978
(71%) =20
[  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec  3.395 ms  0/0 (-nan%)=
 =20
[  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec  3.395 ms  0/0 (-nan%)=
 =20
[  5]   5.00-6.00   sec  2.89 MBytes  24.3 Mbits/sec  2.331 ms=20
4314/4684 (92%) =20
[  5]   6.00-7.00   sec  1.27 MBytes  10.7 Mbits/sec  4.137 ms  556/719
(77%) =20
[  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec  4.137 ms  0/0 (-nan%)=
 =20
[  5]   8.00-9.00   sec   128 KBytes  1.05 Mbits/sec  5.360 ms=20
3788/3804 (1e+02%) =20
[  5]   9.00-10.00  sec   944 KBytes  7.73 Mbits/sec  3.892 ms  323/441
(73%) =20
[  5]  10.00-11.00  sec  0.00 Bytes  0.00 bits/sec  3.892 ms  0/0 (-nan%)=
 =20
[  5]  11.00-12.00  sec  0.00 Bytes  0.00 bits/sec  3.892 ms  0/0 (-nan%)=
 =20
[  5]  12.00-13.00  sec  1.18 MBytes  9.91 Mbits/sec  4.089 ms=20
5256/5407 (97%) =20
[  5]  13.00-14.00  sec  1.45 MBytes  12.2 Mbits/sec  1.968 ms  357/543
(66%) =20
[  5]  14.00-15.00  sec  0.00 Bytes  0.00 bits/sec  1.968 ms  0/0 (-nan%)=
 =20
[  5]  15.00-16.00  sec  1.66 MBytes  14.0 Mbits/sec  3.791 ms=20
3088/3301 (94%) =20
[  5]  16.00-17.00  sec  0.00 Bytes  0.00 bits/sec  3.791 ms  0/0 (-nan%)=
 =20
[  5]  17.00-18.00  sec   224 KBytes  1.84 Mbits/sec  22.987 ms=20
2942/2970 (99%) =20
[  5]  18.00-19.00  sec   224 KBytes  1.83 Mbits/sec  28.886 ms  906/934
(97%) =20
[  5]  19.00-20.00  sec   248 KBytes  2.03 Mbits/sec  23.137 ms=20
1432/1463 (98%) =20
[  5]  20.00-20.06  sec  0.00 Bytes  0.00 bits/sec  23.137 ms  0/0 (-nan%=
) =20
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Jitter  =20
Lost/Total Datagrams
[  5]   0.00-20.06  sec  0.00 Bytes  0.00 bits/sec  23.137 ms=20
25460/27851 (91%) =20


###### router fuzzle BUG - DMESG
[ 4316.816332] netifd invoked oom-killer: gfp_mask=3D0x24201ca, order=3D0=
,
oom_score_adj=3D0
[ 4316.824906] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2
[ 4316.831604] Stack : 803dc764 00000000 00000001 80430000 80c7db80
80426f63 803bde3c 000004ae
[ 4316.831604]           80493798 8086fd1c 00000000 00000005 00001b2f
800a68c8 00000006 80493bd8
[ 4316.831604]           00000000 00000000 803c18ac 8086fbbc 80496542
800a4894 c0000000 00000000
[ 4316.831604]           00000001 801f1100 00000000 00000000 00000000
00000000 00000000 00000000
[ 4316.831604]           00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4316.831604]           ...
[ 4316.870920] Call Trace:
[ 4316.873478] [<80071ac8>] show_stack+0x50/0x84
[ 4316.877981] [<800d2e84>] dump_header.isra.4+0x48/0x130
[ 4316.883879] [<800d3258>] oom_kill_process+0x98/0x440
[ 4316.889016] [<800d3978>] out_of_memory+0x2f4/0x330
[ 4316.894582] [<800d7234>] __alloc_pages_nodemask+0x67c/0x6e8
[ 4316.900975] [<800d2278>] filemap_fault+0x254/0x454
[ 4316.905956] [<800ecba4>] __do_fault+0x3c/0xa8
[ 4316.911081] [<800efdd0>] handle_mm_fault+0x4e0/0xb78
[ 4316.916239] [<800766e0>] __do_page_fault+0x134/0x474
[ 4316.921972] [<80060820>] ret_from_exception+0x0/0x10
[ 4316.927097]=20
[ 4316.928638] Mem-Info:
[ 4316.931586] active_anon:232 inactive_anon:6 isolated_anon:0
[ 4316.931586]  active_file:76 inactive_file:94 isolated_file:0
[ 4316.931586]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 4316.931586]  slab_reclaimable:130 slab_unreclaimable:1325
[ 4316.931586]  mapped:2 shmem:18 pagetables:41 bounce:0
[ 4316.931586]  free:165 free_pcp:0 free_cma:0
[ 4316.965566] Normal free:656kB min:660kB low:824kB high:988kB
active_anon:928kB inactive_anon:24kB active_file:304kB
inactive_file:376kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:72kB slab_reclaimable:520kB
slab_unreclaimable:5300kB kernel_stack:296kB pagetables:164kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[ 4317.010087] lowmem_reserve[]: 0 0
[ 4317.013547] Normal: 4*4kB (UE) 46*8kB (UME) 17*16kB (U) 0*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 656kB
[ 4317.026214] 188 total pagecache pages
[ 4317.030587] 0 pages in swap cache
[ 4317.034020] Swap cache stats: add 0, delete 0, find 0/0
[ 4317.039410] Free swap  =3D 0kB
[ 4317.042976] Total swap =3D 0kB
[ 4317.045952] 8192 pages RAM
[ 4317.048747] 0 pages HighMem/MovableOnly
[ 4317.053301] 1233 pages reserved
[ 4317.056553] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
swapents oom_score_adj name
[ 4317.065964] [  447]     0   447      294       15       3     =20
0        0             0 ubusd
[ 4317.075470] [  448]     0   448      223       10       4     =20
0        0             0 askfirst
[ 4317.085221] [  628]     0   628      306       35       5     =20
0        0             0 logd
[ 4317.094627] [  690]     0   690      337       23       3     =20
0        0             0 odhcpd
[ 4317.104209] [  723]     0   723      264       10       3     =20
0        0             0 dropbear
[ 4317.113960] [  821]     0   821      294       10       3     =20
0        0             0 ntpd
[ 4317.123373] [ 1198]     0  1198      408       34       4     =20
0        0             0 netifd
[ 4317.132944] [ 1305]   453  1305      262       18       3     =20
0        0             0 dnsmasq
[ 4317.142632] [ 1487]     0  1487      281       25       3     =20
0        0             0 dropbear
[ 4317.152400] [ 1488]     0  1488      295       10       3     =20
0        0             0 ash
[ 4317.161714] [ 1570]     0  1570      229       11       3     =20
0        0             0 odhcp6c
[ 4317.171385] Out of memory: Kill process 628 (logd) score 5 or
sacrifice child
[ 4317.178772] Killed process 628 (logd) total-vm:1224kB,
anon-rss:136kB, file-rss:4kB
[ 4318.256759] netifd invoked oom-killer: gfp_mask=3D0x24201ca, order=3D0=
,
oom_score_adj=3D0
[ 4318.280049] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2
[ 4318.286179] Stack : 803dc764 00000000 00000001 80430000 80c7db80
80426f63 803bde3c 000004ae
[ 4318.286179]           80493798 8086fd1c 00000000 00000005 00001b2f
800a68c8 00000006 803c6710
[ 4318.286179]           00000000 00000000 803c18ac 8086fbbc 80496542
800a4894 804265d0 00000000
[ 4318.286179]           00000001 801f1100 00000000 00000000 00000000
00000000 00000000 00000000
[ 4318.286179]           00000000 00000000 00000000
[ 4318.470646] netifd: page allocation failure: order:0, mode:0x2080120
[ 4318.470661] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2
[ 4318.470665] Stack : 803dc764 00000000 00000001 80430000 80c7db80
80426f63 803bde3c 000004ae
[ 4318.470685]           80493798 81823c20 00000060 00000000 80000000
800a68c8 00000006 00000000
[ 4318.470705]           00000000 00000000 803c18ac 8086f67c 80496542
800a4894 80f2d000 00000000
[ 4318.470725]           00000001 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4318.470743]           00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4318.470760]           ...
[ 4318.470766] Call Trace:
[ 4318.470791] [<80071ac8>] show_stack+0x50/0x84
[ 4318.470813] [<800d4ce0>] warn_alloc_failed+0xe8/0x10c
[ 4318.470827] [<800d7148>] __alloc_pages_nodemask+0x590/0x6e8
[ 4318.470837] [<800d7420>] __alloc_page_frag+0x74/0x174
[ 4318.470850] [<80232250>] ag71xx_fill_rx_buf+0x60/0xf0
[ 4318.470860] [<80233178>] ag71xx_poll+0x3d4/0x5bc
[ 4318.470900] [<802684b8>] net_rx_action+0x110/0x2c4
[ 4318.470921] [<80083b28>] __do_softirq+0x164/0x290
[ 4318.470958] [<8006a698>] plat_irq_dispatch+0xbc/0xf4
[ 4318.470963]=20
[ 4318.470965] Mem-Info:
[ 4318.470991] active_anon:198 inactive_anon:6 isolated_anon:0
[ 4318.470991]  active_file:126 inactive_file:204 isolated_file:0
[ 4318.470991]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 4318.470991]  slab_reclaimable:130 slab_unreclaimable:1345
[ 4318.470991]  mapped:2 shmem:18 pagetables:36 bounce:0
[ 4318.470991]  free:63 free_pcp:0 free_cma:0
[ 4318.471032] Normal free:252kB min:660kB low:824kB high:988kB
active_anon:792kB inactive_anon:24kB active_file:504kB
inactive_file:816kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:72kB slab_reclaimable:520kB
slab_unreclaimable:5380kB kernel_stack:296kB pagetables:144kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[ 4318.471034] lowmem_reserve[]: 0 0
[ 4318.471041] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 252kB
[ 4318.471083] 348 total pagecache pages
[ 4318.471094] 0 pages in swap cache
[ 4318.471100] Swap cache stats: add 0, delete 0, find 0/0
[ 4318.471102] Free swap  =3D 0kB
[ 4318.471105] Total swap =3D 0kB
[ 4318.471108] 8192 pages RAM
[ 4318.471111] 0 pages HighMem/MovableOnly
[ 4318.471113] 1233 pages reserved
[ 4318.486975] eth0: out of memory
[ 4318.628211] netifd: page allocation failure: order:0, mode:0x2080120
[ 4318.628224] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2
[ 4318.628229] Stack : 803dc764 00000000 00000001 80430000 80c7db80
80426f63 803bde3c 000004ae
[ 4318.628250]           80493798 81823c20 00000060 00000000 80000000
800a68c8 00000006 00000000
[ 4318.628269]           00000000 00000000 803c18ac 8086f67c 80496542
800a4894 80f2d000 00000000
[ 4318.628290]           00000001 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4318.628308]           00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4318.628325]           ...
[ 4318.628331] Call Trace:
[ 4318.628357] [<80071ac8>] show_stack+0x50/0x84
[ 4318.628378] [<800d4ce0>] warn_alloc_failed+0xe8/0x10c
[ 4318.628392] [<800d7148>] __alloc_pages_nodemask+0x590/0x6e8
[ 4318.628402] [<800d7420>] __alloc_page_frag+0x74/0x174
[ 4318.628414] [<80232250>] ag71xx_fill_rx_buf+0x60/0xf0
[ 4318.628424] [<80233178>] ag71xx_poll+0x3d4/0x5bc
[ 4318.628461] [<802684b8>] net_rx_action+0x110/0x2c4
[ 4318.628484] [<80083b28>] __do_softirq+0x164/0x290
[ 4318.628521] [<8006a698>] plat_irq_dispatch+0xbc/0xf4
[ 4318.628525]=20
[ 4318.628527] Mem-Info:
[ 4318.628552] active_anon:198 inactive_anon:6 isolated_anon:0
[ 4318.628552]  active_file:126 inactive_file:204 isolated_file:0
[ 4318.628552]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 4318.628552]  slab_reclaimable:130 slab_unreclaimable:1345
[ 4318.628552]  mapped:2 shmem:18 pagetables:36 bounce:0
[ 4318.628552]  free:63 free_pcp:0 free_cma:0
[ 4318.628593] Normal free:252kB min:660kB low:824kB high:988kB
active_anon:792kB inactive_anon:24kB active_file:504kB
inactive_file:816kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:72kB slab_reclaimable:520kB
slab_unreclaimable:5380kB kernel_stack:296kB pagetables:144kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[ 4318.628595] lowmem_reserve[]: 0 0
[ 4318.628603] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 252kB
[ 4318.628645] 348 total pagecache pages
[ 4318.628653] 0 pages in swap cache
[ 4318.628659] Swap cache stats: add 0, delete 0, find 0/0
[ 4318.628662] Free swap  =3D 0kB
[ 4318.628664] Total swap =3D 0kB
[ 4318.628667] 8192 pages RAM
[ 4318.628670] 0 pages HighMem/MovableOnly
[ 4318.628672] 1233 pages reserved
[ 4318.638804] eth0: out of memory
[ 4318.750599] netifd: page allocation failure: order:0, mode:0x2080120
[ 4318.750612] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2
[ 4318.750618] Stack : 803dc764 00000000 00000001 80430000 80c7db80
80426f63 803bde3c 000004ae
[ 4318.750639]           80493798 81823c20 00000060 00000000 80000000
800a68c8 00000006 00000000
[ 4318.750658]           00000000 00000000 803c18ac 8086f67c 80496542
800a4894 80f2d000 00000000
[ 4318.750678]           00000001 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4318.750696]           00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4318.750714]           ...
[ 4318.750720] Call Trace:
[ 4318.750746] [<80071ac8>] show_stack+0x50/0x84
[ 4318.750767] [<800d4ce0>] warn_alloc_failed+0xe8/0x10c
[ 4318.750781] [<800d7148>] __alloc_pages_nodemask+0x590/0x6e8
[ 4318.750791] [<800d7420>] __alloc_page_frag+0x74/0x174
[ 4318.750803] [<80232250>] ag71xx_fill_rx_buf+0x60/0xf0
[ 4318.750813] [<80233178>] ag71xx_poll+0x3d4/0x5bc
[ 4318.750851] [<802684b8>] net_rx_action+0x110/0x2c4
[ 4318.750875] [<80083b28>] __do_softirq+0x164/0x290
[ 4318.750909] [<8006a698>] plat_irq_dispatch+0xbc/0xf4
[ 4318.750913]=20
[ 4318.750916] Mem-Info:
[ 4318.750941] active_anon:198 inactive_anon:6 isolated_anon:0
[ 4318.750941]  active_file:126 inactive_file:204 isolated_file:0
[ 4318.750941]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 4318.750941]  slab_reclaimable:130 slab_unreclaimable:1344
[ 4318.750941]  mapped:2 shmem:18 pagetables:36 bounce:0
[ 4318.750941]  free:63 free_pcp:0 free_cma:0
[ 4318.750982] Normal free:252kB min:660kB low:824kB high:988kB
active_anon:792kB inactive_anon:24kB active_file:504kB
inactive_file:816kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:72kB slab_reclaimable:520kB
slab_unreclaimable:5376kB kernel_stack:296kB pagetables:144kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[ 4318.750984] lowmem_reserve[]: 0 0
[ 4318.750992] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 252kB
[ 4318.751034] 348 total pagecache pages
[ 4318.751044] 0 pages in swap cache
[ 4318.751050] Swap cache stats: add 0, delete 0, find 0/0
[ 4318.751053] Free swap  =3D 0kB
[ 4318.751055] Total swap =3D 0kB
[ 4318.751058] 8192 pages RAM
[ 4318.751061] 0 pages HighMem/MovableOnly
[ 4318.751063] 1233 pages reserved
[ 4318.766484] eth0: out of memory
[ 4318.931172] netifd: page allocation failure: order:0, mode:0x2080120
[ 4318.931184] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2
[ 4318.931189] Stack : 803dc764 00000000 00000001 80430000 80c7db80
80426f63 803bde3c 000004ae
[ 4318.931211]           80493798 81823c20 00000060 00000000 80000000
800a68c8 00000006 00000000
[ 4318.931231]           00000000 00000000 803c18ac 8086f67c 80496542
800a4894 80f2d000 00000000
[ 4318.931250]           00000001 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4318.931268]           00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4318.931286]           ...
[ 4318.931292] Call Trace:
[ 4318.931317] [<80071ac8>] show_stack+0x50/0x84
[ 4318.931338] [<800d4ce0>] warn_alloc_failed+0xe8/0x10c
[ 4318.931352] [<800d7148>] __alloc_pages_nodemask+0x590/0x6e8
[ 4318.931362] [<800d7420>] __alloc_page_frag+0x74/0x174
[ 4318.931373] [<80232250>] ag71xx_fill_rx_buf+0x60/0xf0
[ 4318.931383] [<80233178>] ag71xx_poll+0x3d4/0x5bc
[ 4318.931421] [<802684b8>] net_rx_action+0x110/0x2c4
[ 4318.931445] [<80083b28>] __do_softirq+0x164/0x290
[ 4318.931480] [<8006a698>] plat_irq_dispatch+0xbc/0xf4
[ 4318.931484]=20
[ 4318.931486] Mem-Info:
[ 4318.931511] active_anon:198 inactive_anon:6 isolated_anon:0
[ 4318.931511]  active_file:126 inactive_file:204 isolated_file:0
[ 4318.931511]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 4318.931511]  slab_reclaimable:130 slab_unreclaimable:1345
[ 4318.931511]  mapped:2 shmem:18 pagetables:36 bounce:0
[ 4318.931511]  free:63 free_pcp:0 free_cma:0
[ 4318.931553] Normal free:252kB min:660kB low:824kB high:988kB
active_anon:792kB inactive_anon:24kB active_file:504kB
inactive_file:816kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:72kB slab_reclaimable:520kB
slab_unreclaimable:5380kB kernel_stack:296kB pagetables:144kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[ 4318.931555] lowmem_reserve[]: 0 0
[ 4318.931562] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 252kB
[ 4318.931603] 348 total pagecache pages
[ 4318.931613] 0 pages in swap cache
[ 4318.931618] Swap cache stats: add 0, delete 0, find 0/0
[ 4318.931621] Free swap  =3D 0kB
[ 4318.931624] Total swap =3D 0kB
[ 4318.931626] 8192 pages RAM
[ 4318.931629] 0 pages HighMem/MovableOnly
[ 4318.931631] 1233 pages reserved
[ 4318.945413] eth0: out of memory
[ 4319.062308] netifd: page allocation failure: order:0, mode:0x2080120
[ 4319.062322] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2
[ 4319.062327] Stack : 803dc764 00000000 00000001 80430000 80c7db80
80426f63 803bde3c 000004ae
[ 4319.062348]           80493798 81823c20 00000060 00000000 80000000
800a68c8 00000006 8091a000
[ 4319.062368]           00000000 00000000 803c18ac 8086f67c 80496542
800a4894 00000000 00000000
[ 4319.062388]           00000001 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4319.062405]           00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4319.062423]           ...
[ 4319.062429] Call Trace:
[ 4319.062454] [<80071ac8>] show_stack+0x50/0x84
[ 4319.062476] [<800d4ce0>] warn_alloc_failed+0xe8/0x10c
[ 4319.062489] [<800d7148>] __alloc_pages_nodemask+0x590/0x6e8
[ 4319.062499] [<800d7420>] __alloc_page_frag+0x74/0x174
[ 4319.062511] [<80232250>] ag71xx_fill_rx_buf+0x60/0xf0
[ 4319.062521] [<80233178>] ag71xx_poll+0x3d4/0x5bc
[ 4319.062559] [<802684b8>] net_rx_action+0x110/0x2c4
[ 4319.062584] [<80083b28>] __do_softirq+0x164/0x290
[ 4319.062621] [<8006a698>] plat_irq_dispatch+0xbc/0xf4
[ 4319.062624]=20
[ 4319.062627] Mem-Info:
[ 4319.062653] active_anon:198 inactive_anon:6 isolated_anon:0
[ 4319.062653]  active_file:126 inactive_file:204 isolated_file:0
[ 4319.062653]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 4319.062653]  slab_reclaimable:130 slab_unreclaimable:1345
[ 4319.062653]  mapped:2 shmem:18 pagetables:36 bounce:0
[ 4319.062653]  free:63 free_pcp:0 free_cma:0
[ 4319.062694] Normal free:252kB min:660kB low:824kB high:988kB
active_anon:792kB inactive_anon:24kB active_file:504kB
inactive_file:816kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:72kB slab_reclaimable:520kB
slab_unreclaimable:5380kB kernel_stack:296kB pagetables:144kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[ 4319.062696] lowmem_reserve[]: 0 0
[ 4319.062703] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 252kB
[ 4319.062745] 348 total pagecache pages
[ 4319.062755] 0 pages in swap cache
[ 4319.062761] Swap cache stats: add 0, delete 0, find 0/0
[ 4319.062764] Free swap  =3D 0kB
[ 4319.062766] Total swap =3D 0kB
[ 4319.062769] 8192 pages RAM
[ 4319.062772] 0 pages HighMem/MovableOnly
[ 4319.062774] 1233 pages reserved
[ 4319.077033] eth0: out of memory
[ 4319.210833] netifd: page allocation failure: order:0, mode:0x2080120
[ 4319.210850] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2
[ 4319.210855] Stack : 803dc764 00000000 00000001 80430000 80c7db80
80426f63 803bde3c 000004ae
[ 4319.210875]           80493798 81823c20 00000060 00000000 80000000
800a68c8 00000006 00000000
[ 4319.210895]           00000000 00000000 803c18ac 8086f67c 80496542
800a4894 80f2d000 00000000
[ 4319.210915]           00000001 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4319.210933]           00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4319.210951]           ...
[ 4319.210957] Call Trace:
[ 4319.210984] [<80071ac8>] show_stack+0x50/0x84
[ 4319.211006] [<800d4ce0>] warn_alloc_failed+0xe8/0x10c
[ 4319.211019] [<800d7148>] __alloc_pages_nodemask+0x590/0x6e8
[ 4319.211030] [<800d7420>] __alloc_page_frag+0x74/0x174
[ 4319.211042] [<80232250>] ag71xx_fill_rx_buf+0x60/0xf0
[ 4319.211051] [<80233178>] ag71xx_poll+0x3d4/0x5bc
[ 4319.211088] [<802684b8>] net_rx_action+0x110/0x2c4
[ 4319.211110] [<80083b28>] __do_softirq+0x164/0x290
[ 4319.211147] [<8006a698>] plat_irq_dispatch+0xbc/0xf4
[ 4319.211151]=20
[ 4319.211153] Mem-Info:
[ 4319.211179] active_anon:198 inactive_anon:6 isolated_anon:0
[ 4319.211179]  active_file:126 inactive_file:204 isolated_file:0
[ 4319.211179]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 4319.211179]  slab_reclaimable:130 slab_unreclaimable:1344
[ 4319.211179]  mapped:2 shmem:18 pagetables:36 bounce:0
[ 4319.211179]  free:63 free_pcp:0 free_cma:0
[ 4319.211220] Normal free:252kB min:660kB low:824kB high:988kB
active_anon:792kB inactive_anon:24kB active_file:504kB
inactive_file:816kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:72kB slab_reclaimable:520kB
slab_unreclaimable:5376kB kernel_stack:296kB pagetables:144kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[ 4319.211222] lowmem_reserve[]: 0 0
[ 4319.211230] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 252kB
[ 4319.211272] 348 total pagecache pages
[ 4319.211284] 0 pages in swap cache
[ 4319.211289] Swap cache stats: add 0, delete 0, find 0/0
[ 4319.211292] Free swap  =3D 0kB
[ 4319.211295] Total swap =3D 0kB
[ 4319.211297] 8192 pages RAM
[ 4319.211300] 0 pages HighMem/MovableOnly
[ 4319.211303] 1233 pages reserved
[ 4319.224661] eth0: out of memory
[ 4319.342076] netifd: page allocation failure: order:0, mode:0x2080120
[ 4319.342090] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2
[ 4319.342095] Stack : 803dc764 00000000 00000001 80430000 80c7db80
80426f63 803bde3c 000004ae
[ 4319.342117]           80493798 81823c20 00000060 00000000 80000000
800a68c8 00000006 8026a3ac
[ 4319.342136]           00000000 00000000 803c18ac 8086f67c 80496542
800a4894 80f2d000 00000000
[ 4319.342156]           00000001 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4319.342174]           00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4319.342193]           ...
[ 4319.342199] Call Trace:
[ 4319.342222] [<80071ac8>] show_stack+0x50/0x84
[ 4319.342242] [<800d4ce0>] warn_alloc_failed+0xe8/0x10c
[ 4319.342256] [<800d7148>] __alloc_pages_nodemask+0x590/0x6e8
[ 4319.342266] [<800d7420>] __alloc_page_frag+0x74/0x174
[ 4319.342278] [<80232250>] ag71xx_fill_rx_buf+0x60/0xf0
[ 4319.342288] [<80233178>] ag71xx_poll+0x3d4/0x5bc
[ 4319.342325] [<802684b8>] net_rx_action+0x110/0x2c4
[ 4319.342349] [<80083b28>] __do_softirq+0x164/0x290
[ 4319.342383] [<8006a698>] plat_irq_dispatch+0xbc/0xf4
[ 4319.342387]=20
[ 4319.342390] Mem-Info:
[ 4319.342415] active_anon:198 inactive_anon:6 isolated_anon:0
[ 4319.342415]  active_file:126 inactive_file:204 isolated_file:0
[ 4319.342415]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 4319.342415]  slab_reclaimable:130 slab_unreclaimable:1345
[ 4319.342415]  mapped:2 shmem:18 pagetables:36 bounce:0
[ 4319.342415]  free:63 free_pcp:0 free_cma:0
[ 4319.342457] Normal free:252kB min:660kB low:824kB high:988kB
active_anon:792kB inactive_anon:24kB active_file:504kB
inactive_file:816kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:72kB slab_reclaimable:520kB
slab_unreclaimable:5380kB kernel_stack:296kB pagetables:144kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[ 4319.342460] lowmem_reserve[]: 0 0
[ 4319.342467] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 252kB
[ 4319.342509] 348 total pagecache pages
[ 4319.342520] 0 pages in swap cache
[ 4319.342525] Swap cache stats: add 0, delete 0, find 0/0
[ 4319.342528] Free swap  =3D 0kB
[ 4319.342530] Total swap =3D 0kB
[ 4319.342533] 8192 pages RAM
[ 4319.342536] 0 pages HighMem/MovableOnly
[ 4319.342538] 1233 pages reserved
[ 4319.357925] eth0: out of memory
[ 4319.470335] netifd: page allocation failure: order:0, mode:0x2080120
[ 4319.470348] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2
[ 4319.470353] Stack : 803dc764 00000000 00000001 80430000 80c7db80
80426f63 803bde3c 000004ae
[ 4319.470375]           80493798 81823c20 00000060 00000000 80000000
800a68c8 00000006 00000000
[ 4319.470395]           00000000 00000000 803c18ac 8086f67c 80496542
800a4894 80f2d000 00000000
[ 4319.470414]           00000001 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4319.470432]           00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4319.470450]           ...
[ 4319.470456] Call Trace:
[ 4319.470482] [<80071ac8>] show_stack+0x50/0x84
[ 4319.470504] [<800d4ce0>] warn_alloc_failed+0xe8/0x10c
[ 4319.470518] [<800d7148>] __alloc_pages_nodemask+0x590/0x6e8
[ 4319.470528] [<800d7420>] __alloc_page_frag+0x74/0x174
[ 4319.470539] [<80232250>] ag71xx_fill_rx_buf+0x60/0xf0
[ 4319.470549] [<80233178>] ag71xx_poll+0x3d4/0x5bc
[ 4319.470587] [<802684b8>] net_rx_action+0x110/0x2c4
[ 4319.470611] [<80083b28>] __do_softirq+0x164/0x290
[ 4319.470649] [<8006a698>] plat_irq_dispatch+0xbc/0xf4
[ 4319.470653]=20
[ 4319.470655] Mem-Info:
[ 4319.470681] active_anon:198 inactive_anon:6 isolated_anon:0
[ 4319.470681]  active_file:126 inactive_file:204 isolated_file:0
[ 4319.470681]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 4319.470681]  slab_reclaimable:130 slab_unreclaimable:1345
[ 4319.470681]  mapped:2 shmem:18 pagetables:36 bounce:0
[ 4319.470681]  free:63 free_pcp:0 free_cma:0
[ 4319.470722] Normal free:252kB min:660kB low:824kB high:988kB
active_anon:792kB inactive_anon:24kB active_file:504kB
inactive_file:816kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:72kB slab_reclaimable:520kB
slab_unreclaimable:5380kB kernel_stack:296kB pagetables:144kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[ 4319.470724] lowmem_reserve[]: 0 0
[ 4319.470731] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 252kB
[ 4319.470773] 348 total pagecache pages
[ 4319.470783] 0 pages in swap cache
[ 4319.470788] Swap cache stats: add 0, delete 0, find 0/0
[ 4319.470791] Free swap  =3D 0kB
[ 4319.470794] Total swap =3D 0kB
[ 4319.470797] 8192 pages RAM
[ 4319.470799] 0 pages HighMem/MovableOnly
[ 4319.470802] 1233 pages reserved
[ 4319.486164] eth0: out of memory
[ 4319.601313] netifd: page allocation failure: order:0, mode:0x2080120
[ 4319.601325] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2
[ 4319.601330] Stack : 803dc764 00000000 00000001 80430000 80c7db80
80426f63 803bde3c 000004ae
[ 4319.601351]           80493798 81823c20 00000060 00000000 80000000
800a68c8 00000006 00000000
[ 4319.601371]           00000000 00000000 803c18ac 8086f67c 80496542
800a4894 80f2d000 00000000
[ 4319.601391]           00000001 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4319.601409]           00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4319.601426]           ...
[ 4319.601432] Call Trace:
[ 4319.601457] [<80071ac8>] show_stack+0x50/0x84
[ 4319.601477] [<800d4ce0>] warn_alloc_failed+0xe8/0x10c
[ 4319.601491] [<800d7148>] __alloc_pages_nodemask+0x590/0x6e8
[ 4319.601501] [<800d7420>] __alloc_page_frag+0x74/0x174
[ 4319.601512] [<80232250>] ag71xx_fill_rx_buf+0x60/0xf0
[ 4319.601522] [<80233178>] ag71xx_poll+0x3d4/0x5bc
[ 4319.601560] [<802684b8>] net_rx_action+0x110/0x2c4
[ 4319.601584] [<80083b28>] __do_softirq+0x164/0x290
[ 4319.601621] [<8006a698>] plat_irq_dispatch+0xbc/0xf4
[ 4319.601624]=20
[ 4319.601626] Mem-Info:
[ 4319.601652] active_anon:198 inactive_anon:6 isolated_anon:0
[ 4319.601652]  active_file:126 inactive_file:204 isolated_file:0
[ 4319.601652]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 4319.601652]  slab_reclaimable:130 slab_unreclaimable:1345
[ 4319.601652]  mapped:2 shmem:18 pagetables:36 bounce:0
[ 4319.601652]  free:63 free_pcp:0 free_cma:0
[ 4319.601694] Normal free:252kB min:660kB low:824kB high:988kB
active_anon:792kB inactive_anon:24kB active_file:504kB
inactive_file:816kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:72kB slab_reclaimable:520kB
slab_unreclaimable:5380kB kernel_stack:296kB pagetables:144kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[ 4319.601696] lowmem_reserve[]: 0 0
[ 4319.601703] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 252kB
[ 4319.601745] 348 total pagecache pages
[ 4319.601755] 0 pages in swap cache
[ 4319.601761] Swap cache stats: add 0, delete 0, find 0/0
[ 4319.601763] Free swap  =3D 0kB
[ 4319.601766] Total swap =3D 0kB
[ 4319.601769] 8192 pages RAM
[ 4319.601771] 0 pages HighMem/MovableOnly
[ 4319.601774] 1233 pages reserved
[ 4319.616039] eth0: out of memory
[ 4319.730100] netifd: page allocation failure: order:0, mode:0x2080120
[ 4319.730112] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2
[ 4319.730117] Stack : 803dc764 00000000 00000001 80430000 80c7db80
80426f63 803bde3c 000004ae
[ 4319.730138]           80493798 81823c20 00000060 00000000 80000000
800a68c8 00000006 00000000
[ 4319.730158]           00000000 00000000 803c18ac 8086f67c 80496542
800a4894 80f2d000 00000000
[ 4319.730178]           00000001 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4319.730196]           00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 4319.730213]           ...
[ 4319.730219] Call Trace:
[ 4319.730243] [<80071ac8>] show_stack+0x50/0x84
[ 4319.730264] [<800d4ce0>] warn_alloc_failed+0xe8/0x10c
[ 4319.730277] [<800d7148>] __alloc_pages_nodemask+0x590/0x6e8
[ 4319.730287] [<800d7420>] __alloc_page_frag+0x74/0x174
[ 4319.730298] [<80232250>] ag71xx_fill_rx_buf+0x60/0xf0
[ 4319.730308] [<80233178>] ag71xx_poll+0x3d4/0x5bc
[ 4319.730345] [<802684b8>] net_rx_action+0x110/0x2c4
[ 4319.730367] [<80083b28>] __do_softirq+0x164/0x290
[ 4319.730400] [<8006a698>] plat_irq_dispatch+0xbc/0xf4
[ 4319.730404]=20
[ 4319.730406] Mem-Info:
[ 4319.730432] active_anon:198 inactive_anon:6 isolated_anon:0
[ 4319.730432]  active_file:126 inactive_file:204 isolated_file:0
[ 4319.730432]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 4319.730432]  slab_reclaimable:130 slab_unreclaimable:1345
[ 4319.730432]  mapped:2 shmem:18 pagetables:36 bounce:0
[ 4319.730432]  free:63 free_pcp:0 free_cma:0
[ 4319.730473] Normal free:252kB min:660kB low:824kB high:988kB
active_anon:792kB inactive_anon:24kB active_file:504kB
inactive_file:816kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:72kB slab_reclaimable:520kB
slab_unreclaimable:5380kB kernel_stack:296kB pagetables:144kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[ 4319.730475] lowmem_reserve[]: 0 0
[ 4319.730482] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 252kB
[ 4319.730523] 348 total pagecache pages
[ 4319.730533] 0 pages in swap cache
[ 4319.730538] Swap cache stats: add 0, delete 0, find 0/0
[ 4319.730541] Free swap  =3D 0kB
[ 4319.730544] Total swap =3D 0kB
[ 4319.730547] 8192 pages RAM
[ 4319.730549] 0 pages HighMem/MovableOnly
[ 4319.730552] 1233 pages reserved
[ 4319.738720] eth0: out of memory
[ 4319.866870] eth0: out of memory
[ 4319.987229] eth0: out of memory
[ 4320.117724] eth0: out of memory
[ 4320.255572] eth0: out of memory
[ 4320.378457] eth0: out of memory
[ 4320.512492] eth0: out of memory
[ 4320.648874] eth0: out of memory
[ 4320.774328] eth0: out of memory
[ 4320.906054] eth0: out of memory
[ 4321.013589] eth0: out of memory
[ 4321.093267]  00000000 00000000 00000000 00000000 00000000
[ 4321.095619]           ...
[ 4321.099805] Call Trace:
[ 4321.102364] [<80071ac8>] show_stack+0x50/0x84
[ 4321.106868] [<800d2e84>] dump_header.isra.4+0x48/0x130
[ 4321.112186] [<800d3258>] oom_kill_process+0x98/0x440
[ 4321.117319] [<800d3978>] out_of_memory+0x2f4/0x330
[ 4321.122283] [<800d7234>] __alloc_pages_nodemask+0x67c/0x6e8
[ 4321.128071] [<800d2278>] filemap_fault+0x254/0x454
[ 4321.133065] eth0: out of memory
[ 4321.136336] [<800ecba4>] __do_fault+0x3c/0xa8
[ 4321.140854] [<800efdd0>] handle_mm_fault+0x4e0/0xb78
[ 4321.145993] [<800766e0>] __do_page_fault+0x134/0x474
[ 4321.151135] [<80060820>] ret_from_exception+0x0/0x10
[ 4321.156260]=20
[ 4321.157793] Mem-Info:
[ 4321.160173] active_anon:198 inactive_anon:6 isolated_anon:0
[ 4321.160173]  active_file:126 inactive_file:204 isolated_file:0
[ 4321.160173]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 4321.160173]  slab_reclaimable:130 slab_unreclaimable:1344
[ 4321.160173]  mapped:2 shmem:18 pagetables:36 bounce:0
[ 4321.160173]  free:63 free_pcp:0 free_cma:0
[ 4321.192528] Normal free:252kB min:660kB low:824kB high:988kB
active_anon:792kB inactive_anon:24kB active_file:504kB
inactive_file:816kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:72kB slab_reclaimable:520kB
slab_unreclaimable:5376kB kernel_stack:296kB pagetables:144kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[ 4321.236373] lowmem_reserve[]: 0 0
[ 4321.239828] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB=20
[ 4321.250184] eth0: out of memory
[ 4321.253424] 0*4096kB =3D 252kB
[ 4321.256586] 348 total pagecache pages
[ 4321.260382] 0 pages in swap cache
[ 4321.263801] Swap cache stats: add 0, delete 0, find 0/0
[ 4321.269193] Free swap  =3D 0kB
[ 4321.272334] eth1: out of memory
[ 4321.275592] Total swap =3D 0kB
[ 4321.278566] 8192 pages RAM
[ 4321.281402] 0 pages HighMem/MovableOnly
[ 4321.285356] 1233 pages reserved
[ 4321.288602] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
swapents oom_score_adj name
[ 4321.297432] [  447]     0   447      294       15       3     =20
0        0             0 ubusd
[ 4321.306342] [  448]     0   448      223       10       4     =20
0        0             0 askfirst
[ 4321.315518] [  690]     0   690      337       23       3     =20
0        0             0 odhcpd
[ 4321.324513] [  723]     0   723      264       10       3     =20
0        0             0 dropbear
[ 4321.333689] [  821]     0   821      294       10       3     =20
0        0             0 ntpd
[ 4321.342504] [ 1198]     0  1198      408       34       4     =20
0        0             0 netifd
[ 4321.351500] [ 1305]   453  1305      262       18       3     =20
0        0             0 dnsmasq
[ 4321.360586] [ 1487]     0  1487      281       25       3     =20
0        0             0 dropbear
[ 4321.369751] [ 1488]     0  1488      295       10       3     =20
0        0             0 ash
[ 4321.378477] eth0: out of memory
[ 4321.381741] [ 1570]     0  1570      229       11       3     =20
0        0             0 odhcp6c
[ 4321.390819] eth1: out of memory
[ 4321.394064] Out of memory: Kill process 1198 (netifd) score 5 or
sacrifice child
[ 4321.401728] Killed process 1570 (odhcp6c) total-vm:916kB,
anon-rss:40kB, file-rss:4kB
[ 4321.511954] eth0: out of memory
[ 4321.644535] eth0: out of memory
[ 4321.900446] eth0: out of memory
[ 4329.109362] eth1: link down
[ 4330.397212] eth1: link up (100Mbps/Full duplex)



--=20
make the world nicer, please use PGP encryption


--------------75B5EEF201250468C056C848
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>last night we tested Wireguard with LEDE on a fairly weak mashine
      - TP Link 841N v11.1 with 4MB flash, 32MB ram, and 650 MHz cpu.<br>
      we choose this router model because we have some hundred of them
      deployed in our free wifi for the public networks around our city.
      (as mentioned before Freifunk Freiburg
      <a class="moz-txt-link-freetext" href="https://freiburg.freifunk.net">https://freiburg.freifunk.net</a> ) We were interestet in Performance
      and what we (maybe) can do with wireguard<br>
    </p>
    <p>we described it in detail here
<a class="moz-txt-link-freetext" href="https://forum.freifunk.net/t/lede-test-wireguard-und-blanko-durchsatz-tp841nv11-1-und-bug/13163">https://forum.freifunk.net/t/lede-test-wireguard-und-blanko-durchsatz-tp841nv11-1-und-bug/13163</a></p>
    <p>brief summary - sharing of experiences<br>
      netifd crashed via iperf3 test from   laptop - 841Nv11 - 841Nv11 -
      laptop<br>
      iperf was running on laptops, wireguard as tunnel between 841Nv11
      Routers, all connected via cable.<br>
    </p>
    <p>without wireguard, so plain routing we got 93 MBs (for
      refference)<br>
      and with Wireguard so far 15.5 MBs<br>
      <br>
      there are clearly some heavy problems with netifd from
      LEDE/Openwrt ... we simply ran in heavy load (2.6++) and out of
      memory<br>
    </p>
    <p>here some notes and dmesg output:</p>
    <div class="" id="magicdomid2"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">###############</span></div>
    <div class="" id="magicdomid3"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">#
        plain routing through 2 841v11.1</span></div>
    <div class="" id="magicdomid4"><br>
    </div>
    <div class="" id="magicdomid5"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">root@K:/home/k/wiki/wg-lede#
        iperf3 -c 192.168.2.23 -p 4000 -t 20</span></div>
    <div class="" id="magicdomid6"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">Connecting
        to host 192.168.2.23, port 4000</span></div>
    <div class="" id="magicdomid7"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4] local 192.168.1.23 port 37940 connected to 192.168.2.23 port
        4000</span></div>
    <div class="" id="magicdomid8"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        ID] Interval           Transfer     Bandwidth       Retr  Cwnd</span></div>
    <div class="" id="magicdomid9"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-1.00   sec  11.6 MBytes  96.9 Mbits/sec    0    127
        KBytes       </span></div>
    <div class="" id="magicdomid10"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   1.00-2.00   sec  11.4 MBytes  95.4 Mbits/sec    0    205
        KBytes       </span></div>
    <div class="" id="magicdomid11"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   2.00-3.00   sec  11.2 MBytes  93.8 Mbits/sec    1    165
        KBytes       </span></div>
    <div class="" id="magicdomid12"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   3.00-4.00   sec  11.1 MBytes  93.3 Mbits/sec    0    187
        KBytes       </span></div>
    <div class="" id="magicdomid13"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   4.00-5.00   sec  11.2 MBytes  94.4 Mbits/sec    0    187
        KBytes       </span></div>
    <div class="" id="magicdomid14"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   5.00-6.00   sec  11.2 MBytes  94.4 Mbits/sec    0    187
        KBytes       </span></div>
    <div class="" id="magicdomid15"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   6.00-7.00   sec  11.2 MBytes  93.8 Mbits/sec    0    187
        KBytes       </span></div>
    <div class="" id="magicdomid16"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   7.00-8.00   sec  11.1 MBytes  93.3 Mbits/sec    0    187
        KBytes       </span></div>
    <div class="" id="magicdomid17"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   8.00-9.00   sec  11.1 MBytes  93.3 Mbits/sec    2    146
        KBytes       </span></div>
    <div class="" id="magicdomid18"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   9.00-10.00  sec  11.2 MBytes  94.4 Mbits/sec    0    150
        KBytes       </span></div>
    <div class="" id="magicdomid19"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  10.00-11.00  sec  11.2 MBytes  93.8 Mbits/sec    0    150
        KBytes       </span></div>
    <div class="" id="magicdomid20"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  11.00-12.00  sec  11.1 MBytes  93.3 Mbits/sec    0    161
        KBytes       </span></div>
    <div class="" id="magicdomid21"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  12.00-13.00  sec  11.2 MBytes  93.8 Mbits/sec    0    167
        KBytes       </span></div>
    <div class="" id="magicdomid22"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  13.00-14.00  sec  11.2 MBytes  93.8 Mbits/sec    0    168
        KBytes       </span></div>
    <div class="" id="magicdomid23"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  14.00-15.00  sec  11.1 MBytes  93.3 Mbits/sec    0    173
        KBytes       </span></div>
    <div class="" id="magicdomid24"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  15.00-16.00  sec  11.1 MBytes  93.3 Mbits/sec    0    181
        KBytes       </span></div>
    <div class="" id="magicdomid25"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  16.00-17.00  sec  11.1 MBytes  93.3 Mbits/sec    2    120
        KBytes       </span></div>
    <div class="" id="magicdomid26"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  17.00-18.00  sec  11.2 MBytes  93.8 Mbits/sec    0    139
        KBytes       </span></div>
    <div class="" id="magicdomid27"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  18.00-19.00  sec  11.1 MBytes  92.8 Mbits/sec    1    151
        KBytes       </span></div>
    <div class="" id="magicdomid28"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  19.00-20.00  sec  11.2 MBytes  93.8 Mbits/sec    0    160
        KBytes       </span></div>
    <div class="" id="magicdomid29"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">-
        - - - - - - - - - - - - - - - - - - - - - - - -</span></div>
    <div class="" id="magicdomid30"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        ID] Interval           Transfer     Bandwidth       Retr</span></div>
    <div class="" id="magicdomid31"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-20.00  sec   224 MBytes  93.9 Mbits/sec   
        6             sender</span></div>
    <div class="" id="magicdomid32"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-20.00  sec   223 MBytes  93.7
        Mbits/sec                  receiver</span></div>
    <div class="" id="magicdomid33"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">iperf
        Done.</span></div>
    <div class="" id="magicdomid34"><br>
    </div>
    <div class="" id="magicdomid35"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">#
        on lede router</span></div>
    <div class="" id="magicdomid36"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">CPU:  
        0% usr   6% sys   0% nic  42% idle   0% io   0% irq  51% sirq</span></div>
    <div class="" id="magicdomid37"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">CPU:   0%
        usr   6% sys   0% nic  38% idle   0% io   0% irq  53% sirq</span></div>
    <div class="" id="magicdomid38"><br>
    </div>
    <div class="ace-line" id="magicdomid197"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">##############</span></div>
    <div class="ace-line" id="magicdomid233"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">#
        Testergebnis durch wireguard </span></div>
    <div class="ace-line" id="magicdomid235"><br>
    </div>
    <div class="ace-line" id="magicdomid236"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">#
        iperf3 -c 192.168.2.23 -p 4000 -t 20</span></div>
    <div class="ace-line" id="magicdomid237"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">Connecting
        to host 192.168.2.23, port 4000</span></div>
    <div class="ace-line" id="magicdomid238"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4] local 192.168.1.23 port 38526 connected to 192.168.2.23 port
        4000</span></div>
    <div class="ace-line" id="magicdomid239"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        ID] Interval           Transfer     Bandwidth       Retr  Cwnd</span></div>
    <div class="ace-line" id="magicdomid240"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-1.00   sec  2.02 MBytes  17.0 Mbits/sec   70   8.03
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid241"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   1.00-2.00   sec  1.79 MBytes  15.0 Mbits/sec   95   6.69
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid242"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   2.00-3.00   sec  1.75 MBytes  14.7 Mbits/sec   82   6.69
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid243"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   3.00-4.00   sec  1.82 MBytes  15.3 Mbits/sec   95   4.02
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid244"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   4.00-5.00   sec  1.89 MBytes  15.9 Mbits/sec   84   8.03
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid245"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   5.00-6.00   sec  1.86 MBytes  15.6 Mbits/sec   85   8.03
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid246"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   6.00-7.00   sec  1.84 MBytes  15.4 Mbits/sec   86   6.69
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid247"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   7.00-8.00   sec  1.82 MBytes  15.2 Mbits/sec   89   6.69
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid248"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   8.00-9.00   sec  1.87 MBytes  15.7 Mbits/sec   86   6.69
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid249"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   9.00-10.00  sec  1.94 MBytes  16.3 Mbits/sec   90   8.03
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid250"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  10.00-11.00  sec  1.85 MBytes  15.5 Mbits/sec   79   8.03
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid251"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  11.00-12.00  sec  1.84 MBytes  15.4 Mbits/sec   82   8.03
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid252"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  12.00-13.00  sec  1.85 MBytes  15.5 Mbits/sec   84   6.69
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid253"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  13.00-14.00  sec  1.87 MBytes  15.7 Mbits/sec   71   8.03
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid254"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  14.00-15.00  sec  1.84 MBytes  15.5 Mbits/sec   75   6.69
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid255"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  15.00-16.00  sec  1.78 MBytes  14.9 Mbits/sec   80   5.36
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid256"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  16.00-17.00  sec  1.77 MBytes  14.9 Mbits/sec   89   8.03
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid257"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  17.00-18.00  sec  1.85 MBytes  15.5 Mbits/sec   83   6.69
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid258"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  18.00-19.00  sec  1.85 MBytes  15.5 Mbits/sec   86   5.36
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid259"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]  19.00-20.00  sec  1.80 MBytes  15.1 Mbits/sec   87   5.36
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid260"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">-
        - - - - - - - - - - - - - - - - - - - - - - - -</span></div>
    <div class="ace-line" id="magicdomid261"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        ID] Interval           Transfer     Bandwidth       Retr</span></div>
    <div class="ace-line" id="magicdomid262"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-20.00  sec  36.9 MBytes  15.5 Mbits/sec 
        1678             sender</span></div>
    <div class="ace-line" id="magicdomid263"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-20.00  sec  36.8 MBytes  15.5
        Mbits/sec                  receiver</span></div>
    <div class="ace-line" id="magicdomid264"><br>
    </div>
    <div class="" id="magicdomid40"><br>
    </div>
    <br>
    <div class="ace-line" id="magicdomid963"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] local
        192.168.2.23 port 4000 connected to 192.168.1.23 port 40859</span></div>
    <div class="ace-line" id="magicdomid964"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[ ID]
        Interval           Transfer     Bandwidth       Jitter   
        Lost/Total Datagrams</span></div>
    <div class="ace-line" id="magicdomid965"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        0.00-1.00   sec  2.95 MBytes  24.7 Mbits/sec  1.482 ms  749/1126
        (67%)  </span></div>
    <div class="ace-line" id="magicdomid966"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        1.00-2.00   sec  2.23 MBytes  18.7 Mbits/sec  2.896 ms  682/967
        (71%)  </span></div>
    <div class="ace-line" id="magicdomid967"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        2.00-3.00   sec  0.00 Bytes  0.00 bits/sec  2.896 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid968"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        3.00-4.00   sec   256 KBytes  2.10 Mbits/sec  22.290 ms  100/132
        (76%)  </span></div>
    <div class="ace-line" id="magicdomid969"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        4.00-5.00   sec  3.70 MBytes  31.1 Mbits/sec  3.353 ms 
        4220/4694 (90%)  </span></div>
    <div class="ace-line" id="magicdomid970"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        5.00-6.00   sec  3.85 MBytes  32.3 Mbits/sec  1.387 ms  929/1422
        (65%)  </span></div>
    <div class="ace-line" id="magicdomid971"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        6.00-7.00   sec  4.63 MBytes  38.9 Mbits/sec  1.969 ms  860/1453
        (59%)  </span></div>
    <div class="ace-line" id="magicdomid972"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        7.00-8.00   sec  4.66 MBytes  39.1 Mbits/sec  2.556 ms  882/1479
        (60%)  </span></div>
    <div class="ace-line" id="magicdomid973"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        8.00-9.00   sec  4.66 MBytes  39.1 Mbits/sec  1.423 ms  838/1434
        (58%)  </span></div>
    <div class="ace-line" id="magicdomid974"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        9.00-10.00  sec  4.56 MBytes  38.3 Mbits/sec  1.557 ms  872/1456
        (60%)  </span></div>
    <div class="ace-line" id="magicdomid975"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] 
        10.00-10.18  sec   904 KBytes  40.9 Mbits/sec  1.431 ms  172/285
        (60%)  </span></div>
    <div class="ace-line" id="magicdomid976"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">- - - - - - -
        - - - - - - - - - - - - - - - - - -</span></div>
    <div class="ace-line" id="magicdomid977"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[ ID]
        Interval           Transfer     Bandwidth       Jitter   
        Lost/Total Datagrams</span></div>
    <div class="ace-line" id="magicdomid978"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        0.00-10.18  sec  0.00 Bytes  0.00 bits/sec  1.431 ms 
        10304/14448 (71%)  </span></div>
    <div class="ace-line" id="magicdomid1010"><br>
    </div>
    <div class="ace-line" id="magicdomid1009"><br>
    </div>
    <div class="ace-line" id="magicdomid982"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">Accepted
        connection from 192.168.1.23, port 38608</span></div>
    <div class="ace-line" id="magicdomid983"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] local
        192.168.2.23 port 4000 connected to 192.168.1.23 port 43867</span></div>
    <div class="ace-line" id="magicdomid984"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[ ID]
        Interval           Transfer     Bandwidth       Jitter   
        Lost/Total Datagrams</span></div>
    <div class="ace-line" id="magicdomid985"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        0.00-1.00   sec  2.62 MBytes  22.0 Mbits/sec  3.046 ms  792/1128
        (70%)  </span></div>
    <div class="ace-line" id="magicdomid986"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        1.00-2.00   sec  3.68 MBytes  30.9 Mbits/sec  2.537 ms 
        1008/1479 (68%)  </span></div>
    <div class="ace-line" id="magicdomid987"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        2.00-3.00   sec  2.19 MBytes  18.3 Mbits/sec  3.395 ms  698/978
        (71%)  </span></div>
    <div class="ace-line" id="magicdomid988"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        3.00-4.00   sec  0.00 Bytes  0.00 bits/sec  3.395 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid989"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        4.00-5.00   sec  0.00 Bytes  0.00 bits/sec  3.395 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid990"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        5.00-6.00   sec  2.89 MBytes  24.3 Mbits/sec  2.331 ms 
        4314/4684 (92%)  </span></div>
    <div class="ace-line" id="magicdomid991"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        6.00-7.00   sec  1.27 MBytes  10.7 Mbits/sec  4.137 ms  556/719
        (77%)  </span></div>
    <div class="ace-line" id="magicdomid992"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        7.00-8.00   sec  0.00 Bytes  0.00 bits/sec  4.137 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid993"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        8.00-9.00   sec   128 KBytes  1.05 Mbits/sec  5.360 ms 
        3788/3804 (1e+02%)  </span></div>
    <div class="ace-line" id="magicdomid994"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        9.00-10.00  sec   944 KBytes  7.73 Mbits/sec  3.892 ms  323/441
        (73%)  </span></div>
    <div class="ace-line" id="magicdomid995"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] 
        10.00-11.00  sec  0.00 Bytes  0.00 bits/sec  3.892 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid996"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] 
        11.00-12.00  sec  0.00 Bytes  0.00 bits/sec  3.892 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid997"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] 
        12.00-13.00  sec  1.18 MBytes  9.91 Mbits/sec  4.089 ms 
        5256/5407 (97%)  </span></div>
    <div class="ace-line" id="magicdomid998"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] 
        13.00-14.00  sec  1.45 MBytes  12.2 Mbits/sec  1.968 ms  357/543
        (66%)  </span></div>
    <div class="ace-line" id="magicdomid999"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] 
        14.00-15.00  sec  0.00 Bytes  0.00 bits/sec  1.968 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid1000"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] 
        15.00-16.00  sec  1.66 MBytes  14.0 Mbits/sec  3.791 ms 
        3088/3301 (94%)  </span></div>
    <div class="ace-line" id="magicdomid1001"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] 
        16.00-17.00  sec  0.00 Bytes  0.00 bits/sec  3.791 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid1002"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] 
        17.00-18.00  sec   224 KBytes  1.84 Mbits/sec  22.987 ms 
        2942/2970 (99%)  </span></div>
    <div class="ace-line" id="magicdomid1003"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] 
        18.00-19.00  sec   224 KBytes  1.83 Mbits/sec  28.886 ms 
        906/934 (97%)  </span></div>
    <div class="ace-line" id="magicdomid1004"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] 
        19.00-20.00  sec   248 KBytes  2.03 Mbits/sec  23.137 ms 
        1432/1463 (98%)  </span></div>
    <div class="ace-line" id="magicdomid1005"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5] 
        20.00-20.06  sec  0.00 Bytes  0.00 bits/sec  23.137 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid1006"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">- - - - - - -
        - - - - - - - - - - - - - - - - - -</span></div>
    <div class="ace-line" id="magicdomid1007"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[ ID]
        Interval           Transfer     Bandwidth       Jitter   
        Lost/Total Datagrams</span></div>
    <div class="ace-line" id="magicdomid1008"><span
        class="author-a-5uz72zz66zz85zbz89zpz122ztclxl82">[  5]  
        0.00-20.06  sec  0.00 Bytes  0.00 bits/sec  23.137 ms 
        25460/27851 (91%)  </span></div>
    <div class="ace-line" id="magicdomid408"><br>
    </div>
    <div class="ace-line" id="magicdomid409"><br>
    </div>
    <div class="ace-line" id="magicdomid448"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">######
        router fuzzle BUG - DMESG</span></div>
    <div class="ace-line" id="magicdomid451"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.816332] netifd invoked oom-killer: gfp_mask=0x24201ca,
        order=0, oom_score_adj=0</span></div>
    <div class="ace-line" id="magicdomid452"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.824906] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2</span></div>
    <div class="ace-line" id="magicdomid453"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.831604] Stack : 803dc764 00000000 00000001 80430000
        80c7db80 80426f63 803bde3c 000004ae</span></div>
    <div class="ace-line" id="magicdomid454"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.831604]           80493798 8086fd1c 00000000 00000005
        00001b2f 800a68c8 00000006 80493bd8</span></div>
    <div class="ace-line" id="magicdomid455"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.831604]           00000000 00000000 803c18ac 8086fbbc
        80496542 800a4894 c0000000 00000000</span></div>
    <div class="ace-line" id="magicdomid456"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.831604]           00000001 801f1100 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid457"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.831604]           00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid458"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.831604]           ...</span></div>
    <div class="ace-line" id="magicdomid459"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.870920] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid460"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.873478] [&lt;80071ac8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid461"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.877981] [&lt;800d2e84&gt;] dump_header.isra.4+0x48/0x130</span></div>
    <div class="ace-line" id="magicdomid462"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.883879] [&lt;800d3258&gt;] oom_kill_process+0x98/0x440</span></div>
    <div class="ace-line" id="magicdomid463"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.889016] [&lt;800d3978&gt;] out_of_memory+0x2f4/0x330</span></div>
    <div class="ace-line" id="magicdomid464"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.894582] [&lt;800d7234&gt;]
        __alloc_pages_nodemask+0x67c/0x6e8</span></div>
    <div class="ace-line" id="magicdomid465"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.900975] [&lt;800d2278&gt;] filemap_fault+0x254/0x454</span></div>
    <div class="ace-line" id="magicdomid466"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.905956] [&lt;800ecba4&gt;] __do_fault+0x3c/0xa8</span></div>
    <div class="ace-line" id="magicdomid467"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.911081] [&lt;800efdd0&gt;] handle_mm_fault+0x4e0/0xb78</span></div>
    <div class="ace-line" id="magicdomid468"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.916239] [&lt;800766e0&gt;] __do_page_fault+0x134/0x474</span></div>
    <div class="ace-line" id="magicdomid469"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.921972] [&lt;80060820&gt;] ret_from_exception+0x0/0x10</span></div>
    <div class="ace-line" id="magicdomid470"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.927097] </span></div>
    <div class="ace-line" id="magicdomid471"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.928638] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid472"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.931586] active_anon:232 inactive_anon:6 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid473"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.931586]  active_<a class="moz-txt-link-freetext" href="file:76">file:76</a> inactive_<a class="moz-txt-link-freetext" href="file:94">file:94</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid474"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.931586]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid475"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.931586]  slab_reclaimable:130 slab_unreclaimable:1325</span></div>
    <div class="ace-line" id="magicdomid476"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.931586]  mapped:2 shmem:18 pagetables:41 bounce:0</span></div>
    <div class="ace-line" id="magicdomid477"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.931586]  free:165 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid478"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4316.965566] Normal free:656kB min:660kB low:824kB high:988kB
        active_anon:928kB inactive_anon:24kB active_<a class="moz-txt-link-freetext" href="file:304kB">file:304kB</a>
        inactive_<a class="moz-txt-link-freetext" href="file:376kB">file:376kB</a> unevictable:0kB isolated(anon):0kB
        isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB
        dirty:0kB writeback:0kB mapped:8kB shmem:72kB
        slab_reclaimable:520kB slab_unreclaimable:5300kB
        kernel_stack:296kB pagetables:164kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:0 all_unreclaimable? no</span></div>
    <div class="ace-line" id="magicdomid479"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.010087] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid480"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.013547] Normal: 4*4kB (UE) 46*8kB (UME) 17*16kB (U) 0*32kB
        0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
        656kB</span></div>
    <div class="ace-line" id="magicdomid481"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.026214] 188 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid482"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.030587] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid483"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.034020] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid484"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.039410] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid485"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.042976] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid486"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.045952] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid487"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.048747] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid488"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.053301] 1233 pages reserved</span></div>
    <div class="ace-line" id="magicdomid489"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.056553] [ pid ]   uid  tgid total_vm      rss nr_ptes
        nr_pmds swapents oom_score_adj name</span></div>
    <div class="ace-line" id="magicdomid490"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.065964] [  447]     0   447      294       15       3      
        0        0             0 ubusd</span></div>
    <div class="ace-line" id="magicdomid491"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.075470] [  448]     0   448      223       10       4      
        0        0             0 askfirst</span></div>
    <div class="ace-line" id="magicdomid492"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.085221] [  628]     0   628      306       35       5      
        0        0             0 logd</span></div>
    <div class="ace-line" id="magicdomid493"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.094627] [  690]     0   690      337       23       3      
        0        0             0 odhcpd</span></div>
    <div class="ace-line" id="magicdomid494"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.104209] [  723]     0   723      264       10       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid495"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.113960] [  821]     0   821      294       10       3      
        0        0             0 ntpd</span></div>
    <div class="ace-line" id="magicdomid496"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.123373] [ 1198]     0  1198      408       34       4      
        0        0             0 netifd</span></div>
    <div class="ace-line" id="magicdomid497"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.132944] [ 1305]   453  1305      262       18       3      
        0        0             0 dnsmasq</span></div>
    <div class="ace-line" id="magicdomid498"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.142632] [ 1487]     0  1487      281       25       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid499"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.152400] [ 1488]     0  1488      295       10       3      
        0        0             0 ash</span></div>
    <div class="ace-line" id="magicdomid500"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.161714] [ 1570]     0  1570      229       11       3      
        0        0             0 odhcp6c</span></div>
    <div class="ace-line" id="magicdomid501"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.171385] Out of memory: Kill process 628 (logd) score 5 or
        sacrifice child</span></div>
    <div class="ace-line" id="magicdomid502"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4317.178772] Killed process 628 (logd) total-vm:1224kB,
        anon-rss:136kB, file-rss:4kB</span></div>
    <div class="ace-line" id="magicdomid503"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.256759] netifd invoked oom-killer: gfp_mask=0x24201ca,
        order=0, oom_score_adj=0</span></div>
    <div class="ace-line" id="magicdomid504"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.280049] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2</span></div>
    <div class="ace-line" id="magicdomid505"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.286179] Stack : 803dc764 00000000 00000001 80430000
        80c7db80 80426f63 803bde3c 000004ae</span></div>
    <div class="ace-line" id="magicdomid506"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.286179]           80493798 8086fd1c 00000000 00000005
        00001b2f 800a68c8 00000006 803c6710</span></div>
    <div class="ace-line" id="magicdomid507"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.286179]           00000000 00000000 803c18ac 8086fbbc
        80496542 800a4894 804265d0 00000000</span></div>
    <div class="ace-line" id="magicdomid508"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.286179]           00000001 801f1100 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid509"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.286179]           00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid510"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470646] netifd: page allocation failure: order:0,
        mode:0x2080120</span></div>
    <div class="ace-line" id="magicdomid511"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470661] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2</span></div>
    <div class="ace-line" id="magicdomid512"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470665] Stack : 803dc764 00000000 00000001 80430000
        80c7db80 80426f63 803bde3c 000004ae</span></div>
    <div class="ace-line" id="magicdomid513"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470685]           80493798 81823c20 00000060 00000000
        80000000 800a68c8 00000006 00000000</span></div>
    <div class="ace-line" id="magicdomid514"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470705]           00000000 00000000 803c18ac 8086f67c
        80496542 800a4894 80f2d000 00000000</span></div>
    <div class="ace-line" id="magicdomid515"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470725]           00000001 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid516"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470743]           00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid517"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470760]           ...</span></div>
    <div class="ace-line" id="magicdomid518"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470766] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid519"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470791] [&lt;80071ac8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid520"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470813] [&lt;800d4ce0&gt;] warn_alloc_failed+0xe8/0x10c</span></div>
    <div class="ace-line" id="magicdomid521"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470827] [&lt;800d7148&gt;]
        __alloc_pages_nodemask+0x590/0x6e8</span></div>
    <div class="ace-line" id="magicdomid522"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470837] [&lt;800d7420&gt;] __alloc_page_frag+0x74/0x174</span></div>
    <div class="ace-line" id="magicdomid523"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470850] [&lt;80232250&gt;] ag71xx_fill_rx_buf+0x60/0xf0</span></div>
    <div class="ace-line" id="magicdomid524"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470860] [&lt;80233178&gt;] ag71xx_poll+0x3d4/0x5bc</span></div>
    <div class="ace-line" id="magicdomid525"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470900] [&lt;802684b8&gt;] net_rx_action+0x110/0x2c4</span></div>
    <div class="ace-line" id="magicdomid526"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470921] [&lt;80083b28&gt;] __do_softirq+0x164/0x290</span></div>
    <div class="ace-line" id="magicdomid527"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470958] [&lt;8006a698&gt;] plat_irq_dispatch+0xbc/0xf4</span></div>
    <div class="ace-line" id="magicdomid528"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470963] </span></div>
    <div class="ace-line" id="magicdomid529"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470965] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid530"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470991] active_anon:198 inactive_anon:6 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid531"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470991]  active_<a class="moz-txt-link-freetext" href="file:126">file:126</a> inactive_<a class="moz-txt-link-freetext" href="file:204">file:204</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid532"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470991]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid533"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470991]  slab_reclaimable:130 slab_unreclaimable:1345</span></div>
    <div class="ace-line" id="magicdomid534"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470991]  mapped:2 shmem:18 pagetables:36 bounce:0</span></div>
    <div class="ace-line" id="magicdomid535"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.470991]  free:63 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid536"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.471032] Normal free:252kB min:660kB low:824kB high:988kB
        active_anon:792kB inactive_anon:24kB active_<a class="moz-txt-link-freetext" href="file:504kB">file:504kB</a>
        inactive_<a class="moz-txt-link-freetext" href="file:816kB">file:816kB</a> unevictable:0kB isolated(anon):0kB
        isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB
        dirty:0kB writeback:0kB mapped:8kB shmem:72kB
        slab_reclaimable:520kB slab_unreclaimable:5380kB
        kernel_stack:296kB pagetables:144kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:0 all_unreclaimable? no</span></div>
    <div class="ace-line" id="magicdomid537"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.471034] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid538"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.471041] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB
        0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
        252kB</span></div>
    <div class="ace-line" id="magicdomid539"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.471083] 348 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid540"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.471094] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid541"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.471100] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid542"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.471102] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid543"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.471105] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid544"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.471108] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid545"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.471111] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid546"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.471113] 1233 pages reserved</span></div>
    <div class="ace-line" id="magicdomid547"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.486975] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid548"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628211] netifd: page allocation failure: order:0,
        mode:0x2080120</span></div>
    <div class="ace-line" id="magicdomid549"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628224] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2</span></div>
    <div class="ace-line" id="magicdomid550"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628229] Stack : 803dc764 00000000 00000001 80430000
        80c7db80 80426f63 803bde3c 000004ae</span></div>
    <div class="ace-line" id="magicdomid551"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628250]           80493798 81823c20 00000060 00000000
        80000000 800a68c8 00000006 00000000</span></div>
    <div class="ace-line" id="magicdomid552"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628269]           00000000 00000000 803c18ac 8086f67c
        80496542 800a4894 80f2d000 00000000</span></div>
    <div class="ace-line" id="magicdomid553"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628290]           00000001 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid554"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628308]           00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid555"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628325]           ...</span></div>
    <div class="ace-line" id="magicdomid556"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628331] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid557"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628357] [&lt;80071ac8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid558"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628378] [&lt;800d4ce0&gt;] warn_alloc_failed+0xe8/0x10c</span></div>
    <div class="ace-line" id="magicdomid559"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628392] [&lt;800d7148&gt;]
        __alloc_pages_nodemask+0x590/0x6e8</span></div>
    <div class="ace-line" id="magicdomid560"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628402] [&lt;800d7420&gt;] __alloc_page_frag+0x74/0x174</span></div>
    <div class="ace-line" id="magicdomid561"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628414] [&lt;80232250&gt;] ag71xx_fill_rx_buf+0x60/0xf0</span></div>
    <div class="ace-line" id="magicdomid562"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628424] [&lt;80233178&gt;] ag71xx_poll+0x3d4/0x5bc</span></div>
    <div class="ace-line" id="magicdomid563"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628461] [&lt;802684b8&gt;] net_rx_action+0x110/0x2c4</span></div>
    <div class="ace-line" id="magicdomid564"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628484] [&lt;80083b28&gt;] __do_softirq+0x164/0x290</span></div>
    <div class="ace-line" id="magicdomid565"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628521] [&lt;8006a698&gt;] plat_irq_dispatch+0xbc/0xf4</span></div>
    <div class="ace-line" id="magicdomid566"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628525] </span></div>
    <div class="ace-line" id="magicdomid567"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628527] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid568"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628552] active_anon:198 inactive_anon:6 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid569"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628552]  active_<a class="moz-txt-link-freetext" href="file:126">file:126</a> inactive_<a class="moz-txt-link-freetext" href="file:204">file:204</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid570"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628552]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid571"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628552]  slab_reclaimable:130 slab_unreclaimable:1345</span></div>
    <div class="ace-line" id="magicdomid572"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628552]  mapped:2 shmem:18 pagetables:36 bounce:0</span></div>
    <div class="ace-line" id="magicdomid573"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628552]  free:63 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid574"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628593] Normal free:252kB min:660kB low:824kB high:988kB
        active_anon:792kB inactive_anon:24kB active_<a class="moz-txt-link-freetext" href="file:504kB">file:504kB</a>
        inactive_<a class="moz-txt-link-freetext" href="file:816kB">file:816kB</a> unevictable:0kB isolated(anon):0kB
        isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB
        dirty:0kB writeback:0kB mapped:8kB shmem:72kB
        slab_reclaimable:520kB slab_unreclaimable:5380kB
        kernel_stack:296kB pagetables:144kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:0 all_unreclaimable? no</span></div>
    <div class="ace-line" id="magicdomid575"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628595] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid576"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628603] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB
        0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
        252kB</span></div>
    <div class="ace-line" id="magicdomid577"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628645] 348 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid578"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628653] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid579"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628659] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid580"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628662] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid581"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628664] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid582"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628667] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid583"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628670] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid584"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.628672] 1233 pages reserved</span></div>
    <div class="ace-line" id="magicdomid585"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.638804] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid586"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750599] netifd: page allocation failure: order:0,
        mode:0x2080120</span></div>
    <div class="ace-line" id="magicdomid587"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750612] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2</span></div>
    <div class="ace-line" id="magicdomid588"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750618] Stack : 803dc764 00000000 00000001 80430000
        80c7db80 80426f63 803bde3c 000004ae</span></div>
    <div class="ace-line" id="magicdomid589"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750639]           80493798 81823c20 00000060 00000000
        80000000 800a68c8 00000006 00000000</span></div>
    <div class="ace-line" id="magicdomid590"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750658]           00000000 00000000 803c18ac 8086f67c
        80496542 800a4894 80f2d000 00000000</span></div>
    <div class="ace-line" id="magicdomid591"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750678]           00000001 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid592"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750696]           00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid593"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750714]           ...</span></div>
    <div class="ace-line" id="magicdomid594"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750720] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid595"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750746] [&lt;80071ac8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid596"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750767] [&lt;800d4ce0&gt;] warn_alloc_failed+0xe8/0x10c</span></div>
    <div class="ace-line" id="magicdomid597"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750781] [&lt;800d7148&gt;]
        __alloc_pages_nodemask+0x590/0x6e8</span></div>
    <div class="ace-line" id="magicdomid598"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750791] [&lt;800d7420&gt;] __alloc_page_frag+0x74/0x174</span></div>
    <div class="ace-line" id="magicdomid599"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750803] [&lt;80232250&gt;] ag71xx_fill_rx_buf+0x60/0xf0</span></div>
    <div class="ace-line" id="magicdomid600"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750813] [&lt;80233178&gt;] ag71xx_poll+0x3d4/0x5bc</span></div>
    <div class="ace-line" id="magicdomid601"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750851] [&lt;802684b8&gt;] net_rx_action+0x110/0x2c4</span></div>
    <div class="ace-line" id="magicdomid602"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750875] [&lt;80083b28&gt;] __do_softirq+0x164/0x290</span></div>
    <div class="ace-line" id="magicdomid603"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750909] [&lt;8006a698&gt;] plat_irq_dispatch+0xbc/0xf4</span></div>
    <div class="ace-line" id="magicdomid604"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750913] </span></div>
    <div class="ace-line" id="magicdomid605"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750916] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid606"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750941] active_anon:198 inactive_anon:6 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid607"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750941]  active_<a class="moz-txt-link-freetext" href="file:126">file:126</a> inactive_<a class="moz-txt-link-freetext" href="file:204">file:204</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid608"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750941]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid609"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750941]  slab_reclaimable:130 slab_unreclaimable:1344</span></div>
    <div class="ace-line" id="magicdomid610"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750941]  mapped:2 shmem:18 pagetables:36 bounce:0</span></div>
    <div class="ace-line" id="magicdomid611"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750941]  free:63 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid612"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750982] Normal free:252kB min:660kB low:824kB high:988kB
        active_anon:792kB inactive_anon:24kB active_<a class="moz-txt-link-freetext" href="file:504kB">file:504kB</a>
        inactive_<a class="moz-txt-link-freetext" href="file:816kB">file:816kB</a> unevictable:0kB isolated(anon):0kB
        isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB
        dirty:0kB writeback:0kB mapped:8kB shmem:72kB
        slab_reclaimable:520kB slab_unreclaimable:5376kB
        kernel_stack:296kB pagetables:144kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:0 all_unreclaimable? no</span></div>
    <div class="ace-line" id="magicdomid613"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750984] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid614"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.750992] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB
        0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
        252kB</span></div>
    <div class="ace-line" id="magicdomid615"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.751034] 348 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid616"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.751044] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid617"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.751050] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid618"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.751053] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid619"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.751055] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid620"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.751058] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid621"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.751061] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid622"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.751063] 1233 pages reserved</span></div>
    <div class="ace-line" id="magicdomid623"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.766484] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid624"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931172] netifd: page allocation failure: order:0,
        mode:0x2080120</span></div>
    <div class="ace-line" id="magicdomid625"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931184] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2</span></div>
    <div class="ace-line" id="magicdomid626"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931189] Stack : 803dc764 00000000 00000001 80430000
        80c7db80 80426f63 803bde3c 000004ae</span></div>
    <div class="ace-line" id="magicdomid627"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931211]           80493798 81823c20 00000060 00000000
        80000000 800a68c8 00000006 00000000</span></div>
    <div class="ace-line" id="magicdomid628"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931231]           00000000 00000000 803c18ac 8086f67c
        80496542 800a4894 80f2d000 00000000</span></div>
    <div class="ace-line" id="magicdomid629"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931250]           00000001 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid630"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931268]           00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid631"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931286]           ...</span></div>
    <div class="ace-line" id="magicdomid632"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931292] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid633"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931317] [&lt;80071ac8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid634"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931338] [&lt;800d4ce0&gt;] warn_alloc_failed+0xe8/0x10c</span></div>
    <div class="ace-line" id="magicdomid635"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931352] [&lt;800d7148&gt;]
        __alloc_pages_nodemask+0x590/0x6e8</span></div>
    <div class="ace-line" id="magicdomid636"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931362] [&lt;800d7420&gt;] __alloc_page_frag+0x74/0x174</span></div>
    <div class="ace-line" id="magicdomid637"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931373] [&lt;80232250&gt;] ag71xx_fill_rx_buf+0x60/0xf0</span></div>
    <div class="ace-line" id="magicdomid638"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931383] [&lt;80233178&gt;] ag71xx_poll+0x3d4/0x5bc</span></div>
    <div class="ace-line" id="magicdomid639"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931421] [&lt;802684b8&gt;] net_rx_action+0x110/0x2c4</span></div>
    <div class="ace-line" id="magicdomid640"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931445] [&lt;80083b28&gt;] __do_softirq+0x164/0x290</span></div>
    <div class="ace-line" id="magicdomid641"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931480] [&lt;8006a698&gt;] plat_irq_dispatch+0xbc/0xf4</span></div>
    <div class="ace-line" id="magicdomid642"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931484] </span></div>
    <div class="ace-line" id="magicdomid643"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931486] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid644"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931511] active_anon:198 inactive_anon:6 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid645"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931511]  active_<a class="moz-txt-link-freetext" href="file:126">file:126</a> inactive_<a class="moz-txt-link-freetext" href="file:204">file:204</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid646"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931511]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid647"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931511]  slab_reclaimable:130 slab_unreclaimable:1345</span></div>
    <div class="ace-line" id="magicdomid648"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931511]  mapped:2 shmem:18 pagetables:36 bounce:0</span></div>
    <div class="ace-line" id="magicdomid649"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931511]  free:63 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid650"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931553] Normal free:252kB min:660kB low:824kB high:988kB
        active_anon:792kB inactive_anon:24kB active_<a class="moz-txt-link-freetext" href="file:504kB">file:504kB</a>
        inactive_<a class="moz-txt-link-freetext" href="file:816kB">file:816kB</a> unevictable:0kB isolated(anon):0kB
        isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB
        dirty:0kB writeback:0kB mapped:8kB shmem:72kB
        slab_reclaimable:520kB slab_unreclaimable:5380kB
        kernel_stack:296kB pagetables:144kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:0 all_unreclaimable? no</span></div>
    <div class="ace-line" id="magicdomid651"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931555] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid652"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931562] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB
        0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
        252kB</span></div>
    <div class="ace-line" id="magicdomid653"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931603] 348 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid654"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931613] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid655"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931618] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid656"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931621] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid657"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931624] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid658"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931626] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid659"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931629] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid660"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.931631] 1233 pages reserved</span></div>
    <div class="ace-line" id="magicdomid661"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4318.945413] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid662"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062308] netifd: page allocation failure: order:0,
        mode:0x2080120</span></div>
    <div class="ace-line" id="magicdomid663"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062322] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2</span></div>
    <div class="ace-line" id="magicdomid664"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062327] Stack : 803dc764 00000000 00000001 80430000
        80c7db80 80426f63 803bde3c 000004ae</span></div>
    <div class="ace-line" id="magicdomid665"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062348]           80493798 81823c20 00000060 00000000
        80000000 800a68c8 00000006 8091a000</span></div>
    <div class="ace-line" id="magicdomid666"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062368]           00000000 00000000 803c18ac 8086f67c
        80496542 800a4894 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid667"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062388]           00000001 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid668"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062405]           00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid669"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062423]           ...</span></div>
    <div class="ace-line" id="magicdomid670"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062429] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid671"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062454] [&lt;80071ac8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid672"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062476] [&lt;800d4ce0&gt;] warn_alloc_failed+0xe8/0x10c</span></div>
    <div class="ace-line" id="magicdomid673"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062489] [&lt;800d7148&gt;]
        __alloc_pages_nodemask+0x590/0x6e8</span></div>
    <div class="ace-line" id="magicdomid674"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062499] [&lt;800d7420&gt;] __alloc_page_frag+0x74/0x174</span></div>
    <div class="ace-line" id="magicdomid675"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062511] [&lt;80232250&gt;] ag71xx_fill_rx_buf+0x60/0xf0</span></div>
    <div class="ace-line" id="magicdomid676"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062521] [&lt;80233178&gt;] ag71xx_poll+0x3d4/0x5bc</span></div>
    <div class="ace-line" id="magicdomid677"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062559] [&lt;802684b8&gt;] net_rx_action+0x110/0x2c4</span></div>
    <div class="ace-line" id="magicdomid678"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062584] [&lt;80083b28&gt;] __do_softirq+0x164/0x290</span></div>
    <div class="ace-line" id="magicdomid679"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062621] [&lt;8006a698&gt;] plat_irq_dispatch+0xbc/0xf4</span></div>
    <div class="ace-line" id="magicdomid680"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062624] </span></div>
    <div class="ace-line" id="magicdomid681"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062627] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid682"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062653] active_anon:198 inactive_anon:6 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid683"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062653]  active_<a class="moz-txt-link-freetext" href="file:126">file:126</a> inactive_<a class="moz-txt-link-freetext" href="file:204">file:204</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid684"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062653]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid685"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062653]  slab_reclaimable:130 slab_unreclaimable:1345</span></div>
    <div class="ace-line" id="magicdomid686"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062653]  mapped:2 shmem:18 pagetables:36 bounce:0</span></div>
    <div class="ace-line" id="magicdomid687"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062653]  free:63 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid688"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062694] Normal free:252kB min:660kB low:824kB high:988kB
        active_anon:792kB inactive_anon:24kB active_<a class="moz-txt-link-freetext" href="file:504kB">file:504kB</a>
        inactive_<a class="moz-txt-link-freetext" href="file:816kB">file:816kB</a> unevictable:0kB isolated(anon):0kB
        isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB
        dirty:0kB writeback:0kB mapped:8kB shmem:72kB
        slab_reclaimable:520kB slab_unreclaimable:5380kB
        kernel_stack:296kB pagetables:144kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:0 all_unreclaimable? no</span></div>
    <div class="ace-line" id="magicdomid689"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062696] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid690"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062703] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB
        0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
        252kB</span></div>
    <div class="ace-line" id="magicdomid691"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062745] 348 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid692"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062755] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid693"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062761] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid694"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062764] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid695"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062766] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid696"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062769] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid697"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062772] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid698"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.062774] 1233 pages reserved</span></div>
    <div class="ace-line" id="magicdomid699"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.077033] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid700"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.210833] netifd: page allocation failure: order:0,
        mode:0x2080120</span></div>
    <div class="ace-line" id="magicdomid701"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.210850] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2</span></div>
    <div class="ace-line" id="magicdomid702"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.210855] Stack : 803dc764 00000000 00000001 80430000
        80c7db80 80426f63 803bde3c 000004ae</span></div>
    <div class="ace-line" id="magicdomid703"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.210875]           80493798 81823c20 00000060 00000000
        80000000 800a68c8 00000006 00000000</span></div>
    <div class="ace-line" id="magicdomid704"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.210895]           00000000 00000000 803c18ac 8086f67c
        80496542 800a4894 80f2d000 00000000</span></div>
    <div class="ace-line" id="magicdomid705"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.210915]           00000001 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid706"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.210933]           00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid707"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.210951]           ...</span></div>
    <div class="ace-line" id="magicdomid708"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.210957] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid709"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.210984] [&lt;80071ac8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid710"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211006] [&lt;800d4ce0&gt;] warn_alloc_failed+0xe8/0x10c</span></div>
    <div class="ace-line" id="magicdomid711"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211019] [&lt;800d7148&gt;]
        __alloc_pages_nodemask+0x590/0x6e8</span></div>
    <div class="ace-line" id="magicdomid712"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211030] [&lt;800d7420&gt;] __alloc_page_frag+0x74/0x174</span></div>
    <div class="ace-line" id="magicdomid713"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211042] [&lt;80232250&gt;] ag71xx_fill_rx_buf+0x60/0xf0</span></div>
    <div class="ace-line" id="magicdomid714"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211051] [&lt;80233178&gt;] ag71xx_poll+0x3d4/0x5bc</span></div>
    <div class="ace-line" id="magicdomid715"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211088] [&lt;802684b8&gt;] net_rx_action+0x110/0x2c4</span></div>
    <div class="ace-line" id="magicdomid716"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211110] [&lt;80083b28&gt;] __do_softirq+0x164/0x290</span></div>
    <div class="ace-line" id="magicdomid717"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211147] [&lt;8006a698&gt;] plat_irq_dispatch+0xbc/0xf4</span></div>
    <div class="ace-line" id="magicdomid718"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211151] </span></div>
    <div class="ace-line" id="magicdomid719"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211153] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid720"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211179] active_anon:198 inactive_anon:6 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid721"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211179]  active_<a class="moz-txt-link-freetext" href="file:126">file:126</a> inactive_<a class="moz-txt-link-freetext" href="file:204">file:204</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid722"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211179]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid723"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211179]  slab_reclaimable:130 slab_unreclaimable:1344</span></div>
    <div class="ace-line" id="magicdomid724"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211179]  mapped:2 shmem:18 pagetables:36 bounce:0</span></div>
    <div class="ace-line" id="magicdomid725"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211179]  free:63 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid726"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211220] Normal free:252kB min:660kB low:824kB high:988kB
        active_anon:792kB inactive_anon:24kB active_<a class="moz-txt-link-freetext" href="file:504kB">file:504kB</a>
        inactive_<a class="moz-txt-link-freetext" href="file:816kB">file:816kB</a> unevictable:0kB isolated(anon):0kB
        isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB
        dirty:0kB writeback:0kB mapped:8kB shmem:72kB
        slab_reclaimable:520kB slab_unreclaimable:5376kB
        kernel_stack:296kB pagetables:144kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:0 all_unreclaimable? no</span></div>
    <div class="ace-line" id="magicdomid727"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211222] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid728"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211230] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB
        0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
        252kB</span></div>
    <div class="ace-line" id="magicdomid729"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211272] 348 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid730"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211284] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid731"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211289] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid732"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211292] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid733"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211295] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid734"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211297] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid735"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211300] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid736"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.211303] 1233 pages reserved</span></div>
    <div class="ace-line" id="magicdomid737"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.224661] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid738"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342076] netifd: page allocation failure: order:0,
        mode:0x2080120</span></div>
    <div class="ace-line" id="magicdomid739"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342090] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2</span></div>
    <div class="ace-line" id="magicdomid740"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342095] Stack : 803dc764 00000000 00000001 80430000
        80c7db80 80426f63 803bde3c 000004ae</span></div>
    <div class="ace-line" id="magicdomid741"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342117]           80493798 81823c20 00000060 00000000
        80000000 800a68c8 00000006 8026a3ac</span></div>
    <div class="ace-line" id="magicdomid742"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342136]           00000000 00000000 803c18ac 8086f67c
        80496542 800a4894 80f2d000 00000000</span></div>
    <div class="ace-line" id="magicdomid743"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342156]           00000001 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid744"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342174]           00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid745"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342193]           ...</span></div>
    <div class="ace-line" id="magicdomid746"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342199] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid747"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342222] [&lt;80071ac8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid748"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342242] [&lt;800d4ce0&gt;] warn_alloc_failed+0xe8/0x10c</span></div>
    <div class="ace-line" id="magicdomid749"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342256] [&lt;800d7148&gt;]
        __alloc_pages_nodemask+0x590/0x6e8</span></div>
    <div class="ace-line" id="magicdomid750"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342266] [&lt;800d7420&gt;] __alloc_page_frag+0x74/0x174</span></div>
    <div class="ace-line" id="magicdomid751"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342278] [&lt;80232250&gt;] ag71xx_fill_rx_buf+0x60/0xf0</span></div>
    <div class="ace-line" id="magicdomid752"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342288] [&lt;80233178&gt;] ag71xx_poll+0x3d4/0x5bc</span></div>
    <div class="ace-line" id="magicdomid753"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342325] [&lt;802684b8&gt;] net_rx_action+0x110/0x2c4</span></div>
    <div class="ace-line" id="magicdomid754"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342349] [&lt;80083b28&gt;] __do_softirq+0x164/0x290</span></div>
    <div class="ace-line" id="magicdomid755"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342383] [&lt;8006a698&gt;] plat_irq_dispatch+0xbc/0xf4</span></div>
    <div class="ace-line" id="magicdomid756"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342387] </span></div>
    <div class="ace-line" id="magicdomid757"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342390] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid758"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342415] active_anon:198 inactive_anon:6 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid759"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342415]  active_<a class="moz-txt-link-freetext" href="file:126">file:126</a> inactive_<a class="moz-txt-link-freetext" href="file:204">file:204</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid760"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342415]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid761"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342415]  slab_reclaimable:130 slab_unreclaimable:1345</span></div>
    <div class="ace-line" id="magicdomid762"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342415]  mapped:2 shmem:18 pagetables:36 bounce:0</span></div>
    <div class="ace-line" id="magicdomid763"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342415]  free:63 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid764"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342457] Normal free:252kB min:660kB low:824kB high:988kB
        active_anon:792kB inactive_anon:24kB active_<a class="moz-txt-link-freetext" href="file:504kB">file:504kB</a>
        inactive_<a class="moz-txt-link-freetext" href="file:816kB">file:816kB</a> unevictable:0kB isolated(anon):0kB
        isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB
        dirty:0kB writeback:0kB mapped:8kB shmem:72kB
        slab_reclaimable:520kB slab_unreclaimable:5380kB
        kernel_stack:296kB pagetables:144kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:0 all_unreclaimable? no</span></div>
    <div class="ace-line" id="magicdomid765"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342460] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid766"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342467] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB
        0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
        252kB</span></div>
    <div class="ace-line" id="magicdomid767"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342509] 348 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid768"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342520] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid769"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342525] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid770"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342528] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid771"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342530] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid772"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342533] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid773"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342536] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid774"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.342538] 1233 pages reserved</span></div>
    <div class="ace-line" id="magicdomid775"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.357925] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid776"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470335] netifd: page allocation failure: order:0,
        mode:0x2080120</span></div>
    <div class="ace-line" id="magicdomid777"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470348] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2</span></div>
    <div class="ace-line" id="magicdomid778"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470353] Stack : 803dc764 00000000 00000001 80430000
        80c7db80 80426f63 803bde3c 000004ae</span></div>
    <div class="ace-line" id="magicdomid779"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470375]           80493798 81823c20 00000060 00000000
        80000000 800a68c8 00000006 00000000</span></div>
    <div class="ace-line" id="magicdomid780"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470395]           00000000 00000000 803c18ac 8086f67c
        80496542 800a4894 80f2d000 00000000</span></div>
    <div class="ace-line" id="magicdomid781"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470414]           00000001 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid782"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470432]           00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid783"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470450]           ...</span></div>
    <div class="ace-line" id="magicdomid784"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470456] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid785"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470482] [&lt;80071ac8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid786"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470504] [&lt;800d4ce0&gt;] warn_alloc_failed+0xe8/0x10c</span></div>
    <div class="ace-line" id="magicdomid787"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470518] [&lt;800d7148&gt;]
        __alloc_pages_nodemask+0x590/0x6e8</span></div>
    <div class="ace-line" id="magicdomid788"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470528] [&lt;800d7420&gt;] __alloc_page_frag+0x74/0x174</span></div>
    <div class="ace-line" id="magicdomid789"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470539] [&lt;80232250&gt;] ag71xx_fill_rx_buf+0x60/0xf0</span></div>
    <div class="ace-line" id="magicdomid790"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470549] [&lt;80233178&gt;] ag71xx_poll+0x3d4/0x5bc</span></div>
    <div class="ace-line" id="magicdomid791"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470587] [&lt;802684b8&gt;] net_rx_action+0x110/0x2c4</span></div>
    <div class="ace-line" id="magicdomid792"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470611] [&lt;80083b28&gt;] __do_softirq+0x164/0x290</span></div>
    <div class="ace-line" id="magicdomid793"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470649] [&lt;8006a698&gt;] plat_irq_dispatch+0xbc/0xf4</span></div>
    <div class="ace-line" id="magicdomid794"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470653] </span></div>
    <div class="ace-line" id="magicdomid795"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470655] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid796"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470681] active_anon:198 inactive_anon:6 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid797"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470681]  active_<a class="moz-txt-link-freetext" href="file:126">file:126</a> inactive_<a class="moz-txt-link-freetext" href="file:204">file:204</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid798"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470681]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid799"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470681]  slab_reclaimable:130 slab_unreclaimable:1345</span></div>
    <div class="ace-line" id="magicdomid800"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470681]  mapped:2 shmem:18 pagetables:36 bounce:0</span></div>
    <div class="ace-line" id="magicdomid801"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470681]  free:63 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid802"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470722] Normal free:252kB min:660kB low:824kB high:988kB
        active_anon:792kB inactive_anon:24kB active_<a class="moz-txt-link-freetext" href="file:504kB">file:504kB</a>
        inactive_<a class="moz-txt-link-freetext" href="file:816kB">file:816kB</a> unevictable:0kB isolated(anon):0kB
        isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB
        dirty:0kB writeback:0kB mapped:8kB shmem:72kB
        slab_reclaimable:520kB slab_unreclaimable:5380kB
        kernel_stack:296kB pagetables:144kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:0 all_unreclaimable? no</span></div>
    <div class="ace-line" id="magicdomid803"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470724] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid804"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470731] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB
        0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
        252kB</span></div>
    <div class="ace-line" id="magicdomid805"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470773] 348 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid806"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470783] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid807"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470788] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid808"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470791] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid809"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470794] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid810"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470797] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid811"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470799] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid812"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.470802] 1233 pages reserved</span></div>
    <div class="ace-line" id="magicdomid813"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.486164] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid814"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601313] netifd: page allocation failure: order:0,
        mode:0x2080120</span></div>
    <div class="ace-line" id="magicdomid815"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601325] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2</span></div>
    <div class="ace-line" id="magicdomid816"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601330] Stack : 803dc764 00000000 00000001 80430000
        80c7db80 80426f63 803bde3c 000004ae</span></div>
    <div class="ace-line" id="magicdomid817"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601351]           80493798 81823c20 00000060 00000000
        80000000 800a68c8 00000006 00000000</span></div>
    <div class="ace-line" id="magicdomid818"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601371]           00000000 00000000 803c18ac 8086f67c
        80496542 800a4894 80f2d000 00000000</span></div>
    <div class="ace-line" id="magicdomid819"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601391]           00000001 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid820"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601409]           00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid821"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601426]           ...</span></div>
    <div class="ace-line" id="magicdomid822"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601432] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid823"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601457] [&lt;80071ac8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid824"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601477] [&lt;800d4ce0&gt;] warn_alloc_failed+0xe8/0x10c</span></div>
    <div class="ace-line" id="magicdomid825"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601491] [&lt;800d7148&gt;]
        __alloc_pages_nodemask+0x590/0x6e8</span></div>
    <div class="ace-line" id="magicdomid826"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601501] [&lt;800d7420&gt;] __alloc_page_frag+0x74/0x174</span></div>
    <div class="ace-line" id="magicdomid827"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601512] [&lt;80232250&gt;] ag71xx_fill_rx_buf+0x60/0xf0</span></div>
    <div class="ace-line" id="magicdomid828"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601522] [&lt;80233178&gt;] ag71xx_poll+0x3d4/0x5bc</span></div>
    <div class="ace-line" id="magicdomid829"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601560] [&lt;802684b8&gt;] net_rx_action+0x110/0x2c4</span></div>
    <div class="ace-line" id="magicdomid830"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601584] [&lt;80083b28&gt;] __do_softirq+0x164/0x290</span></div>
    <div class="ace-line" id="magicdomid831"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601621] [&lt;8006a698&gt;] plat_irq_dispatch+0xbc/0xf4</span></div>
    <div class="ace-line" id="magicdomid832"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601624] </span></div>
    <div class="ace-line" id="magicdomid833"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601626] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid834"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601652] active_anon:198 inactive_anon:6 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid835"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601652]  active_<a class="moz-txt-link-freetext" href="file:126">file:126</a> inactive_<a class="moz-txt-link-freetext" href="file:204">file:204</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid836"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601652]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid837"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601652]  slab_reclaimable:130 slab_unreclaimable:1345</span></div>
    <div class="ace-line" id="magicdomid838"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601652]  mapped:2 shmem:18 pagetables:36 bounce:0</span></div>
    <div class="ace-line" id="magicdomid839"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601652]  free:63 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid840"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601694] Normal free:252kB min:660kB low:824kB high:988kB
        active_anon:792kB inactive_anon:24kB active_<a class="moz-txt-link-freetext" href="file:504kB">file:504kB</a>
        inactive_<a class="moz-txt-link-freetext" href="file:816kB">file:816kB</a> unevictable:0kB isolated(anon):0kB
        isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB
        dirty:0kB writeback:0kB mapped:8kB shmem:72kB
        slab_reclaimable:520kB slab_unreclaimable:5380kB
        kernel_stack:296kB pagetables:144kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:0 all_unreclaimable? no</span></div>
    <div class="ace-line" id="magicdomid841"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601696] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid842"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601703] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB
        0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
        252kB</span></div>
    <div class="ace-line" id="magicdomid843"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601745] 348 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid844"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601755] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid845"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601761] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid846"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601763] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid847"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601766] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid848"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601769] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid849"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601771] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid850"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.601774] 1233 pages reserved</span></div>
    <div class="ace-line" id="magicdomid851"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.616039] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid852"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730100] netifd: page allocation failure: order:0,
        mode:0x2080120</span></div>
    <div class="ace-line" id="magicdomid853"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730112] CPU: 0 PID: 1198 Comm: netifd Not tainted 4.4.15 #2</span></div>
    <div class="ace-line" id="magicdomid854"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730117] Stack : 803dc764 00000000 00000001 80430000
        80c7db80 80426f63 803bde3c 000004ae</span></div>
    <div class="ace-line" id="magicdomid855"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730138]           80493798 81823c20 00000060 00000000
        80000000 800a68c8 00000006 00000000</span></div>
    <div class="ace-line" id="magicdomid856"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730158]           00000000 00000000 803c18ac 8086f67c
        80496542 800a4894 80f2d000 00000000</span></div>
    <div class="ace-line" id="magicdomid857"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730178]           00000001 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid858"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730196]           00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid859"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730213]           ...</span></div>
    <div class="ace-line" id="magicdomid860"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730219] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid861"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730243] [&lt;80071ac8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid862"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730264] [&lt;800d4ce0&gt;] warn_alloc_failed+0xe8/0x10c</span></div>
    <div class="ace-line" id="magicdomid863"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730277] [&lt;800d7148&gt;]
        __alloc_pages_nodemask+0x590/0x6e8</span></div>
    <div class="ace-line" id="magicdomid864"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730287] [&lt;800d7420&gt;] __alloc_page_frag+0x74/0x174</span></div>
    <div class="ace-line" id="magicdomid865"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730298] [&lt;80232250&gt;] ag71xx_fill_rx_buf+0x60/0xf0</span></div>
    <div class="ace-line" id="magicdomid866"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730308] [&lt;80233178&gt;] ag71xx_poll+0x3d4/0x5bc</span></div>
    <div class="ace-line" id="magicdomid867"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730345] [&lt;802684b8&gt;] net_rx_action+0x110/0x2c4</span></div>
    <div class="ace-line" id="magicdomid868"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730367] [&lt;80083b28&gt;] __do_softirq+0x164/0x290</span></div>
    <div class="ace-line" id="magicdomid869"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730400] [&lt;8006a698&gt;] plat_irq_dispatch+0xbc/0xf4</span></div>
    <div class="ace-line" id="magicdomid870"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730404] </span></div>
    <div class="ace-line" id="magicdomid871"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730406] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid872"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730432] active_anon:198 inactive_anon:6 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid873"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730432]  active_<a class="moz-txt-link-freetext" href="file:126">file:126</a> inactive_<a class="moz-txt-link-freetext" href="file:204">file:204</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid874"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730432]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid875"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730432]  slab_reclaimable:130 slab_unreclaimable:1345</span></div>
    <div class="ace-line" id="magicdomid876"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730432]  mapped:2 shmem:18 pagetables:36 bounce:0</span></div>
    <div class="ace-line" id="magicdomid877"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730432]  free:63 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid878"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730473] Normal free:252kB min:660kB low:824kB high:988kB
        active_anon:792kB inactive_anon:24kB active_<a class="moz-txt-link-freetext" href="file:504kB">file:504kB</a>
        inactive_<a class="moz-txt-link-freetext" href="file:816kB">file:816kB</a> unevictable:0kB isolated(anon):0kB
        isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB
        dirty:0kB writeback:0kB mapped:8kB shmem:72kB
        slab_reclaimable:520kB slab_unreclaimable:5380kB
        kernel_stack:296kB pagetables:144kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:0 all_unreclaimable? no</span></div>
    <div class="ace-line" id="magicdomid879"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730475] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid880"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730482] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB
        0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
        252kB</span></div>
    <div class="ace-line" id="magicdomid881"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730523] 348 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid882"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730533] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid883"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730538] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid884"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730541] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid885"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730544] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid886"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730547] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid887"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730549] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid888"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.730552] 1233 pages reserved</span></div>
    <div class="ace-line" id="magicdomid889"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.738720] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid890"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.866870] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid891"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4319.987229] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid892"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4320.117724] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid893"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4320.255572] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid894"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4320.378457] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid895"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4320.512492] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid896"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4320.648874] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid897"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4320.774328] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid898"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4320.906054] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid899"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.013589] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid900"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.093267]  00000000 00000000 00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid901"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.095619]           ...</span></div>
    <div class="ace-line" id="magicdomid902"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.099805] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid903"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.102364] [&lt;80071ac8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid904"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.106868] [&lt;800d2e84&gt;] dump_header.isra.4+0x48/0x130</span></div>
    <div class="ace-line" id="magicdomid905"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.112186] [&lt;800d3258&gt;] oom_kill_process+0x98/0x440</span></div>
    <div class="ace-line" id="magicdomid906"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.117319] [&lt;800d3978&gt;] out_of_memory+0x2f4/0x330</span></div>
    <div class="ace-line" id="magicdomid907"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.122283] [&lt;800d7234&gt;]
        __alloc_pages_nodemask+0x67c/0x6e8</span></div>
    <div class="ace-line" id="magicdomid908"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.128071] [&lt;800d2278&gt;] filemap_fault+0x254/0x454</span></div>
    <div class="ace-line" id="magicdomid909"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.133065] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid910"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.136336] [&lt;800ecba4&gt;] __do_fault+0x3c/0xa8</span></div>
    <div class="ace-line" id="magicdomid911"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.140854] [&lt;800efdd0&gt;] handle_mm_fault+0x4e0/0xb78</span></div>
    <div class="ace-line" id="magicdomid912"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.145993] [&lt;800766e0&gt;] __do_page_fault+0x134/0x474</span></div>
    <div class="ace-line" id="magicdomid913"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.151135] [&lt;80060820&gt;] ret_from_exception+0x0/0x10</span></div>
    <div class="ace-line" id="magicdomid914"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.156260] </span></div>
    <div class="ace-line" id="magicdomid915"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.157793] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid916"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.160173] active_anon:198 inactive_anon:6 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid917"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.160173]  active_<a class="moz-txt-link-freetext" href="file:126">file:126</a> inactive_<a class="moz-txt-link-freetext" href="file:204">file:204</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid918"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.160173]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid919"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.160173]  slab_reclaimable:130 slab_unreclaimable:1344</span></div>
    <div class="ace-line" id="magicdomid920"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.160173]  mapped:2 shmem:18 pagetables:36 bounce:0</span></div>
    <div class="ace-line" id="magicdomid921"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.160173]  free:63 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid922"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.192528] Normal free:252kB min:660kB low:824kB high:988kB
        active_anon:792kB inactive_anon:24kB active_<a class="moz-txt-link-freetext" href="file:504kB">file:504kB</a>
        inactive_<a class="moz-txt-link-freetext" href="file:816kB">file:816kB</a> unevictable:0kB isolated(anon):0kB
        isolated(file):0kB present:32768kB managed:27836kB mlocked:0kB
        dirty:0kB writeback:0kB mapped:8kB shmem:72kB
        slab_reclaimable:520kB slab_unreclaimable:5376kB
        kernel_stack:296kB pagetables:144kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:0 all_unreclaimable? no</span></div>
    <div class="ace-line" id="magicdomid923"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.236373] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid924"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.239828] Normal: 3*4kB (ME) 26*8kB (UME) 2*16kB (U) 0*32kB
        0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB </span></div>
    <div class="ace-line" id="magicdomid925"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.250184] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid926"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.253424] 0*4096kB = 252kB</span></div>
    <div class="ace-line" id="magicdomid927"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.256586] 348 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid928"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.260382] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid929"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.263801] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid930"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.269193] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid931"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.272334] eth1: out of memory</span></div>
    <div class="ace-line" id="magicdomid932"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.275592] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid933"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.278566] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid934"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.281402] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid935"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.285356] 1233 pages reserved</span></div>
    <div class="ace-line" id="magicdomid936"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.288602] [ pid ]   uid  tgid total_vm      rss nr_ptes
        nr_pmds swapents oom_score_adj name</span></div>
    <div class="ace-line" id="magicdomid937"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.297432] [  447]     0   447      294       15       3      
        0        0             0 ubusd</span></div>
    <div class="ace-line" id="magicdomid938"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.306342] [  448]     0   448      223       10       4      
        0        0             0 askfirst</span></div>
    <div class="ace-line" id="magicdomid939"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.315518] [  690]     0   690      337       23       3      
        0        0             0 odhcpd</span></div>
    <div class="ace-line" id="magicdomid940"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.324513] [  723]     0   723      264       10       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid941"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.333689] [  821]     0   821      294       10       3      
        0        0             0 ntpd</span></div>
    <div class="ace-line" id="magicdomid942"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.342504] [ 1198]     0  1198      408       34       4      
        0        0             0 netifd</span></div>
    <div class="ace-line" id="magicdomid943"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.351500] [ 1305]   453  1305      262       18       3      
        0        0             0 dnsmasq</span></div>
    <div class="ace-line" id="magicdomid944"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.360586] [ 1487]     0  1487      281       25       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid945"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.369751] [ 1488]     0  1488      295       10       3      
        0        0             0 ash</span></div>
    <div class="ace-line" id="magicdomid946"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.378477] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid947"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.381741] [ 1570]     0  1570      229       11       3      
        0        0             0 odhcp6c</span></div>
    <div class="ace-line" id="magicdomid948"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.390819] eth1: out of memory</span></div>
    <div class="ace-line" id="magicdomid949"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.394064] Out of memory: Kill process 1198 (netifd) score 5
        or sacrifice child</span></div>
    <div class="ace-line" id="magicdomid950"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.401728] Killed process 1570 (odhcp6c) total-vm:916kB,
        anon-rss:40kB, file-rss:4kB</span></div>
    <div class="ace-line" id="magicdomid951"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.511954] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid952"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.644535] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid953"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4321.900446] eth0: out of memory</span></div>
    <div class="ace-line" id="magicdomid954"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4329.109362] eth1: link down</span></div>
    <div class="ace-line" id="magicdomid955"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4330.397212] eth1: link up (100Mbps/Full duplex)</span></div>
    <p><br>
    </p>
    <br>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption</pre>
  </body>
</html>

--------------75B5EEF201250468C056C848--
