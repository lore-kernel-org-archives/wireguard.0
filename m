Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36bedd98
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Aug 2016 22:45:37 +0000 (UTC)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Matthias Schiffer <mschiffer@universe-factory.net>, n3ph <n3ph@terminal21.de>
From: jens <jens@viisauksena.de>
Message-ID: <101056cc-e944-a049-f194-c61567a1dcf1@viisauksena.de>
Date: Tue, 16 Aug 2016 00:46:43 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------1149BC53547E57371C07290A"
Subject: [WireGuard] wireguard comparing to fastd - tests
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------1149BC53547E57371C07290A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

to our tests on tp-link841-v11 we tried to test fastd for direct comparis=
on

again, the setup is
 laptop(iperf3) > tplink841v11 < fastd > tplink841v11 < laptop(iperf3)

actual lede , fastdv18 both default - both build today
TP-link841v11 is pretty cheap 560Mhz CPU 4 MB Flash, 32 MB RAM

main result is that wireguard seem to be a little little faster  (TCP ipe=
rf)
15.5 Mbit for wireguard
14 Mbit for fastd

but we observe on fastd also that we can crash the system with udp,
(like we reported before for wireguard)
on both systems throwing much udp traffic in the tunnel make the first
tp-link unresponsive with load of 2.5 and much higher, pretty soon
oomkiller kill random processes due to out-of-memory

so maybe it is not that wireguard has a specific problem, than there is
a general problem with lots of udp traffic

following the TCP iperf, the udp iperf and the crashlog (dmesg)

greetings ..

jens

fuzzle/ freifunk freiburg

https://git.universe-factory.net/fastd
http://fastd.readthedocs.org/

############################
####### first old wireguard tests  #####
############################

[    0.000000] Linux version 4.4.15 (foo@bar) (gcc version 5.4.0 (LEDE
GCC 5.4.0 r1119) ) #3 Thu Jul 28 01:05:08 UTC 2016

iperf3 -c 192.168.2.23 -p 4000 -u -b 500M
Connecting to host 192.168.2.23, port 4000
[  4] local 192.168.1.23 port 52916 connected to 192.168.2.23 port 4000
[ ID] Interval           Transfer     Bandwidth       Total Datagrams
[  4]   0.00-1.00   sec  10.3 MBytes  86.6 Mbits/sec  1321 =20
[  4]   1.00-2.00   sec  11.4 MBytes  95.6 Mbits/sec  1459 =20
[  4]   2.00-3.00   sec  11.4 MBytes  95.6 Mbits/sec  1459 =20
[  4]   3.00-4.00   sec  11.4 MBytes  95.6 Mbits/sec  1458 =20
[  4]   4.00-5.00   sec  11.4 MBytes  95.6 Mbits/sec  1459 =20
[  4]   5.00-6.00   sec  11.4 MBytes  95.6 Mbits/sec  1459 =20
[  4]   6.00-7.00   sec  11.4 MBytes  95.6 Mbits/sec  1458 =20
[  4]   7.00-8.00   sec  11.4 MBytes  95.6 Mbits/sec  1459 =20
[  4]   8.00-9.00   sec  11.4 MBytes  95.6 Mbits/sec  1459 =20
[  4]   9.00-10.00  sec  11.4 MBytes  95.6 Mbits/sec  1459 =20
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Jitter  =20
Lost/Total Datagrams
[  4]   0.00-10.00  sec   113 MBytes  94.7 Mbits/sec  3.981 ms=20
12138/14140 (86%) =20
[  4] Sent 14140 datagrams

Server listening on 4000
-----------------------------------------------------------
Accepted connection from 192.168.1.23, port 52430
[  5] local 192.168.2.23 port 4000 connected to 192.168.1.23 port 52916
[ ID] Interval           Transfer     Bandwidth       Jitter  =20
Lost/Total Datagrams
[  5]   0.00-1.00   sec  2.38 MBytes  19.9 Mbits/sec  3.077 ms  783/1087
(72%) =20
[  5]   1.00-2.00   sec  3.17 MBytes  26.6 Mbits/sec  2.790 ms=20
1124/1530 (73%) =20
[  5]   2.00-3.00   sec  2.87 MBytes  24.1 Mbits/sec  3.588 ms  990/1357
(73%) =20
[  5]   3.00-4.00   sec  1.91 MBytes  16.0 Mbits/sec  3.824 ms=20
1207/1451 (83%) =20
[  5]   4.00-5.00   sec   656 KBytes  5.37 Mbits/sec  4.489 ms=20
1451/1533 (95%) =20
[  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec  4.489 ms  0/0 (-nan%)=
 =20
[  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec  4.489 ms  0/0 (-nan%)=
 =20
[  5]   7.00-8.00   sec  1.07 MBytes  8.98 Mbits/sec  2.991 ms=20
4254/4391 (97%) =20
[  5]   8.00-9.00   sec  2.05 MBytes  17.2 Mbits/sec  4.438 ms  724/986
(73%) =20
[  5]   9.00-10.00  sec  1.56 MBytes  13.1 Mbits/sec  3.981 ms=20
1605/1805 (89%) =20
[  5]  10.00-10.17  sec  0.00 Bytes  0.00 bits/sec  3.981 ms  0/0 (-nan%)=
 =20
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Jitter  =20
Lost/Total Datagrams
[  5]   0.00-10.17  sec   113 MBytes  93.1 Mbits/sec  3.981 ms=20
12138/14140 (86%)

0_k@K:~/wiki/freifunk$ iperf3 -c 192.168.2.23 -p 4000
Connecting to host 192.168.2.23, port 4000
[  4] local 192.168.1.23 port 52448 connected to 192.168.2.23 port 4000
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  2.05 MBytes  17.2 Mbits/sec   59   13.4
KBytes      =20
[  4]   1.00-2.00   sec  1.92 MBytes  16.1 Mbits/sec   87   6.69
KBytes      =20
[  4]   2.00-3.00   sec  1.86 MBytes  15.6 Mbits/sec   82   9.37
KBytes      =20
[  4]   3.00-4.00   sec  1.92 MBytes  16.1 Mbits/sec   86   6.69
KBytes      =20
[  4]   4.00-5.00   sec  1.85 MBytes  15.5 Mbits/sec   88   5.36
KBytes      =20
[  4]   5.00-6.00   sec  1.83 MBytes  15.4 Mbits/sec   84   5.36
KBytes      =20
[  4]   6.00-7.00   sec  1.89 MBytes  15.9 Mbits/sec   79   8.03
KBytes      =20
[  4]   7.00-8.00   sec  1.85 MBytes  15.5 Mbits/sec   87   8.03
KBytes      =20
[  4]   8.00-9.00   sec  1.84 MBytes  15.4 Mbits/sec   79   8.03
KBytes      =20
[  4]   9.00-10.00  sec  1.86 MBytes  15.6 Mbits/sec   75   8.03
KBytes      =20
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  18.9 MBytes  15.8 Mbits/sec  806             sen=
der
[  4]   0.00-10.00  sec  18.7 MBytes  15.7 Mbits/sec                =20
receiver


############################
############################
############################
############################
############################

FASTD Test

##### fastd server script
#!/bin/sh
ifconfig eth1 10.0.0.2 netmask 255.255.255.0
cat <<EOF > /tmp/fastdserver.conf
bind 0.0.0.0:1234;
mode tap;
method "salsa2012+umac";
method "null+salsa2012+umac";
mtu 1426;
forward yes;
secret "a030db009057d0cc36ecef65ca05d4019c03392694b035d968962ed161dd5353"=
;
# user "nobody";
log to syslog level info;
include peers from "peers";
interface "vpn";
on up "
  ip link set up $INTERFACE
  ip addr add 10.10.0.2/24 dev $INTERFACE
";
EOF
mkdir -p /tmp/peers
cat <<EOF > /tmp/peers/foo
key "12218a16b0adbbf1141ada628c48540fcf2f0e706c97f5fdace77205406cd809";
EOF
fastd -d -c /tmp/fastdpeer.conf


#### fastd client script
#!/bin/sh
ifconfig eth1 10.0.0.1 netmask 255.255.255.0
cat <<EOF > /tmp/fastdpeer.conf
interface "mesh-vpn";
mtu 1426;
log level debug;
method "salsa2012+umac";
method "null+salsa2012+umac";
on up "
  ip link set up mesh-vpn
  ip addr add 10.10.0.1/24 dev mesh-vpn
";
EOF
mkdir -p /tmp/peers
cat <<EOF > /tmp/peers/foo
key "17076456b892b30876cd69b8387e1d9dc93ba067225ba22208a094fb376ad7cb";
remote 10.0.0.2:1234;
EOF
fastd -d -c /tmp/fastdpeer.conf

####### you need to set ip route on laptop and tp-link accordingly

####### tcp test

# iperf3 -c 192.168.2.23=20
Connecting to host 192.168.2.23, port 5201
[  4] local 192.168.1.23 port 53678 connected to 192.168.2.23 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  1.91 MBytes  16.0 Mbits/sec    0    109
KBytes      =20
[  4]   1.00-2.00   sec  1.85 MBytes  15.5 Mbits/sec    0    189
KBytes      =20
[  4]   2.00-3.00   sec  1.79 MBytes  15.0 Mbits/sec    0    271
KBytes      =20
[  4]   3.00-4.00   sec  1.85 MBytes  15.5 Mbits/sec    0    352
KBytes      =20
[  4]   4.00-5.00   sec  1.79 MBytes  15.0 Mbits/sec    0    433
KBytes      =20
[  4]   5.00-6.00   sec  1.85 MBytes  15.5 Mbits/sec    0    514
KBytes      =20
[  4]   6.00-7.00   sec  1.79 MBytes  15.0 Mbits/sec    0    594
KBytes      =20
[  4]   7.00-8.00   sec  1.85 MBytes  15.5 Mbits/sec    0    676
KBytes      =20
[  4]   8.00-9.00   sec  1.79 MBytes  15.0 Mbits/sec    0    757
KBytes      =20
[  4]   9.00-10.00  sec  1.85 MBytes  15.5 Mbits/sec    0    839
KBytes      =20
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  18.3 MBytes  15.3 Mbits/sec    0             sen=
der
[  4]   0.00-10.00  sec  16.7 MBytes  14.0 Mbits/sec                =20
receiver
iperf Done.

######## udp following=20

-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
Accepted connection from 192.168.1.23, port 53700
[  5] local 192.168.2.23 port 5201 connected to 192.168.1.23 port 54213
[ ID] Interval           Transfer     Bandwidth       Jitter  =20
Lost/Total Datagrams
[  5]   0.00-1.00   sec  1.60 MBytes  13.4 Mbits/sec  2.829 ms  0/205 (0%=
) =20
[  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20
[  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20
[  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20
[  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20
[  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20
[  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20
[  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20
[  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20
[  5]   9.00-10.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20
[  5]  10.00-11.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20
[  5]  11.00-12.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20
[  5]  12.00-13.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20
[  5]  13.00-14.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)=
 =20



########=20
[   16.886432] jffs2_scan_eraseblock(): End of filesystem marker found
at 0x0
[   16.893692] jffs2_build_filesystem(): unlocking the mtd device... done=
=2E
[   16.900556] jffs2_build_filesystem(): erasing all blocks after the
end marker... done.
[   20.120013] jffs2: notice: (863) jffs2_build_xattr_subsystem:
complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan)
and 0 of xref (0 dead, 0 orphan) found.
[   21.402037] device eth0 entered promiscuous mode
[   21.426164] IPv6: ADDRCONF(NETDEV_UP): br-lan: link is not ready
[   21.533476] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
[   23.521710] eth0: link up (1000Mbps/Full duplex)
[   23.526563] br-lan: port 1(eth0) entered forwarding state
[   23.532242] br-lan: port 1(eth0) entered forwarding state
[   23.559247] IPv6: ADDRCONF(NETDEV_CHANGE): br-lan: link becomes ready
[   24.232715] eth1: link up (100Mbps/Full duplex)
[   24.237450] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
[   25.529282] br-lan: port 1(eth0) entered forwarding state
[   61.939236] random: nonblocking pool is initialized
[  787.348920] eth1: link down
[  789.350353] eth1: link up (100Mbps/Full duplex)

[ 1767.367603] eth1: link down
[ 1773.369029] eth1: link up (100Mbps/Full duplex)
[ 1777.367595] eth1: link down
[ 1778.369029] eth1: link up (100Mbps/Full duplex)
[ 1781.367592] eth1: link down
[ 1782.369026] eth1: link up (100Mbps/Full duplex)
[ 1790.367591] eth1: link down
[ 1791.369019] eth1: link up (100Mbps/Full duplex)
[ 1794.367583] eth1: link down
[ 1795.369025] eth1: link up (100Mbps/Full duplex)
[ 1950.367465] eth1: link down
[ 1951.368904] eth1: link up (100Mbps/Full duplex)
[ 1953.367468] eth1: link down
[ 1954.368901] eth1: link up (100Mbps/Full duplex)
[ 2100.367360] eth1: link down
[ 2101.368798] eth1: link up (100Mbps/Full duplex)
[ 2103.367362] eth1: link down
[ 2104.368796] eth1: link up (100Mbps/Full duplex)
[ 3551.124559] udhcpc invoked oom-killer: gfp_mask=3D0x2420848, order=3D0=
,
oom_score_adj=3D0
[ 3551.132491] CPU: 0 PID: 1864 Comm: udhcpc Not tainted 4.4.15 #9
[ 3551.138648] Stack : 803bf3a4 00000000 00000001 80410000 81829180
80406d63 803a0a6c 00000748
[ 3551.138648]    80473798 8183dad4 00000000 00000006 00001b52 800a6f1c
00000006 803a9390
[ 3551.138648]    00000000 00000000 803a44e4 8183d974 80476542 800a4e98
804063d0 00000000
[ 3551.138648]    00000001 801f2100 00000000 00000000 00000000 00000000
00000000 00000000
[ 3551.138648]    00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[ 3551.138648]    ...
[ 3551.175694] Call Trace:
[ 3551.178242] [<80071aa8>] show_stack+0x50/0x84
[ 3551.182747] [<800d39d0>] dump_header.isra.4+0x48/0x130
[ 3551.188072] [<800d3db4>] oom_kill_process+0x98/0x43c
[ 3551.193208] [<800d44bc>] out_of_memory+0x2e0/0x324
[ 3551.198188] [<800d7dbc>] __alloc_pages_nodemask+0x684/0x6f0
[ 3551.203981] [<800d0f60>] pagecache_get_page+0x154/0x278
[ 3551.209410] [<80132218>] __getblk_slow+0x15c/0x374
[ 3551.214388] [<80159668>] squashfs_read_data+0x1c8/0x6e8
[ 3551.219798] [<8015d878>] squashfs_readpage_block+0x32c/0x4d8
[ 3551.225662] [<8015b4f4>] squashfs_readpage+0x5bc/0x6d0
[ 3551.230984] [<800db554>] __do_page_cache_readahead+0x1f8/0x264
[ 3551.237037] [<800d2d08>] filemap_fault+0x1ac/0x458
[ 3551.242004] [<800ed9a8>] __do_fault+0x3c/0xa8
[ 3551.246622] [<800f0c4c>] handle_mm_fault+0x4e4/0xb84
[ 3551.251772] [<80076758>] __do_page_fault+0x134/0x470
[ 3551.256936] [<80060820>] ret_from_exception+0x0/0x10
[ 3551.262057]
[ 3551.263599] Mem-Info:
[ 3551.265992] active_anon:323 inactive_anon:5 isolated_anon:0
[ 3551.265992]  active_file:102 inactive_file:160 isolated_file:0
[ 3551.265992]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 3551.265992]  slab_reclaimable:130 slab_unreclaimable:1213
[ 3551.265992]  mapped:8 shmem:65 pagetables:52 bounce:0
[ 3551.265992]  free:1024 free_pcp:0 free_cma:0
[ 3551.298530] Normal free:4096kB min:4096kB low:5120kB high:6144kB
active_anon:1292kB inactive_anon:20kB active_file:408kB
inactive_file:640kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27976kB mlocked:0kB dirty:0kB
writeback:0kB mapped:32kB shmem:260kB slab_reclaimable:520kB
slab_unreclaimable:4852kB kernel_stack:320kB pagetables:208kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:6320 all_unreclaimable? yes
[ 3551.343370] lowmem_reserve[]: 0 0
[ 3551.346837] Normal: 128*4kB (U) 114*8kB (U) 79*16kB (U) 0*32kB 8*64kB
(UM) 7*128kB (UM) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 4096kB
[ 3551.359919] 331 total pagecache pages
[ 3551.363704] 0 pages in swap cache
[ 3551.367141] Swap cache stats: add 0, delete 0, find 0/0
[ 3551.372536] Free swap  =3D 0kB
[ 3551.375524] Total swap =3D 0kB
[ 3551.378493] 8192 pages RAM
[ 3551.381289] 0 pages HighMem/MovableOnly
[ 3551.385268] 1198 pages reserved
[ 3551.388512] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
swapents oom_score_adj name
[ 3551.397349] [  391]     0   391      297       17       3     =20
0        0             0 ubusd
[ 3551.406260] [  392]     0   392      224       10       4     =20
0        0             0 askfirst
[ 3551.415443] [  763]     0   763      307       35       4     =20
0        0             0 logd
[ 3551.424252] [  809]     0   809      426       41       4     =20
0        0             0 netifd
[ 3551.433254] [  835]     0   835      321       21       4     =20
0        0             0 odhcpd
[ 3551.442263] [ 1267]     0  1267      265       10       3     =20
0        0             0 dropbear
[ 3551.451445] [ 1281]     0  1281      282       25       3     =20
0        0             0 dropbear
[ 3551.460627] [ 1282]     0  1282      298       12       3     =20
0        0             0 ash
[ 3551.469363] [ 1449]     0  1449      296       12       3     =20
0        0             0 ntpd
[ 3551.478189] [ 1512]   453  1512      263       18       3     =20
0        0             0 dnsmasq
[ 3551.487286] [ 1864]     0  1864      296       10       3     =20
0        0             0 udhcpc
[ 3551.496291] [ 1865]     0  1865      230       11       4     =20
0        0             0 odhcp6c
[ 3551.505382] [ 1955]     0  1955      299       27       3     =20
0        0             0 fastd
[ 3551.514292] [ 1992]     0  1992      260        9       3     =20
0        0             0 ntpd-hotplug
[ 3551.523812] Out of memory: Kill process 809 (netifd) score 6 or
sacrifice child
[ 3551.531387] Killed process 1865 (odhcp6c) total-vm:920kB,
anon-rss:40kB, file-rss:4kB
[ 3552.130598] udhcpc invoked oom-killer: gfp_mask=3D0x2420848, order=3D0=
,
oom_score_adj=3D0
[ 3552.138589] CPU: 0 PID: 1864 Comm: udhcpc Not tainted 4.4.15 #9
[ 3552.144722] Stack : 803bf3a4 00000000 00000001 80410000 81829180
80406d63 803a0a6c 00000748
[ 3552.144722]    80473798 8183dad4 00000000 00000006 00001b52 800a6f1c
00000006 803a9390
[ 3552.144722]    00000000 00000000 803a44e4 8183d974 80476542 800a4e98
804063d0 00000000
[ 3552.144722]    00000001 801f2100 00000000 00000000 00000000 00000000
00000000 00000000
[ 3552.144722]    00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[ 3552.144722]    ...
[ 3552.144722]    ...
[ 3552.181759] Call Trace:
[ 3552.184322] [<80071aa8>] show_stack+0x50/0x84
[ 3552.188829] [<800d39d0>] dump_header.isra.4+0x48/0x130
[ 3552.194137] [<800d3db4>] oom_kill_process+0x98/0x43c
[ 3552.199282] [<800d44bc>] out_of_memory+0x2e0/0x324
[ 3552.204245] [<800d7dbc>] __alloc_pages_nodemask+0x684/0x6f0
[ 3552.210050] [<800d0f60>] pagecache_get_page+0x154/0x278
[ 3552.215482] [<80132218>] __getblk_slow+0x15c/0x374
[ 3552.220444] [<80159668>] squashfs_read_data+0x1c8/0x6e8
[ 3552.225875] [<8015d878>] squashfs_readpage_block+0x32c/0x4d8
[ 3552.231726] [<8015b4f4>] squashfs_readpage+0x5bc/0x6d0
[ 3552.237068] [<800db554>] __do_page_cache_readahead+0x1f8/0x264
[ 3552.243103] [<800d2d08>] filemap_fault+0x1ac/0x458
[ 3552.248148] [<800ed9a8>] __do_fault+0x3c/0xa8
[ 3552.252662] [<800f0c4c>] handle_mm_fault+0x4e4/0xb84
[ 3552.257829] [<80076758>] __do_page_fault+0x134/0x470
[ 3552.262960] [<80060820>] ret_from_exception+0x0/0x10
[ 3552.268102]
[ 3552.269646] Mem-Info:
[ 3552.272015] active_anon:313 inactive_anon:5 isolated_anon:0
[ 3552.272015]  active_file:147 inactive_file:160 isolated_file:0
[ 3552.272015]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 3552.272015]  slab_reclaimable:130 slab_unreclaimable:1207
[ 3552.272015]  mapped:15 shmem:65 pagetables:48 bounce:0
[ 3552.272015]  free:1024 free_pcp:0 free_cma:0
[ 3552.304640] Normal free:4096kB min:4096kB low:5120kB high:6144kB
active_anon:1252kB inactive_anon:20kB active_file:588kB
inactive_file:640kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27976kB mlocked:0kB dirty:0kB
writeback:0kB mapped:60kB shmem:260kB slab_reclaimable:520kB
slab_unreclaimable:4828kB kernel_stack:320kB pagetables:192kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:7888 all_unreclaimable? yes
[ 3552.349479] lowmem_reserve[]: 0 0
[ 3552.352928] Normal: 138*4kB (U) 113*8kB (U) 79*16kB (UM) 1*32kB (U)
7*64kB (UM) 7*128kB (UM) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 4=
096kB
[ 3552.366486] 372 total pagecache pages
[ 3552.370272] 0 pages in swap cache
[ 3552.373692] Swap cache stats: add 0, delete 0, find 0/0
[ 3552.379099] Free swap  =3D 0kB
[ 3552.382076] Total swap =3D 0kB
[ 3552.385066] 8192 pages RAM
[ 3552.387865] 0 pages HighMem/MovableOnly
[ 3552.391824] 1198 pages reserved
[ 3552.395087] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
swapents oom_score_adj name
[ 3552.403906] [  391]     0   391      297       17       3     =20
0        0             0 ubusd
[ 3552.412819] [  392]     0   392      224       10       4     =20
0        0             0 askfirst
[ 3552.422002] [  763]     0   763      307       39       4     =20
0        0             0 logd
[ 3552.430825] [  809]     0   809      426       39       4     =20
0        0             0 netifd
[ 3552.439841] [  835]     0   835      321       25       4     =20
0        0             0 odhcpd
[ 3552.448846] [ 1267]     0  1267      265       10       3     =20
0        0             0 dropbear
[ 3552.458030] [ 1281]     0  1281      282       25       3     =20
0        0             0 dropbear
[ 3552.467214] [ 1282]     0  1282      298       12       3     =20
0        0             0 ash
[ 3552.475947] [ 1449]     0  1449      296       11       3     =20
0        0             0 ntpd
[ 3552.484774] [ 1512]   453  1512      263       18       3     =20
0        0             0 dnsmasq
[ 3552.493852] [ 1864]     0  1864      296       10       3     =20
0        0             0 udhcpc
[ 3552.502855] [ 1955]     0  1955      299       36       3     =20
0        0             0 fastd
[ 3552.511772] [ 1992]     0  1992      260        9       3     =20
0        0             0 ntpd-hotplug
[ 3552.521310] Out of memory: Kill process 763 (logd) score 6 or
sacrifice child
[ 3552.528701] Killed process 763 (logd) total-vm:1228kB,
anon-rss:136kB, file-rss:20kB
[ 3554.642313] udhcpc invoked oom-killer: gfp_mask=3D0x2420848, order=3D0=
,
oom_score_adj=3D0
[ 3554.650305] CPU: 0 PID: 1864 Comm: udhcpc Not tainted 4.4.15 #9
[ 3554.656434] Stack : 803bf3a4 00000000 00000001 80410000 81829180
80406d63 803a0a6c 00000748
[ 3554.656434]    80473798 8183dad4 00000000 00000007 00001b52 800a6f1c
00000006 803a9390
[ 3554.656434]    00000000 00000000 803a44e4 8183d974 80476542 800a4e98
804063d0 00000000
[ 3554.656434]    00000001 801f2100 00000000 00000000 00000000 00000000
00000000 00000000
[ 3554.656434]    00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[ 3554.656434]    ...
[ 3554.693461] Call Trace:
[ 3554.696023] [<80071aa8>] show_stack+0x50/0x84
[ 3554.700532] [<800d39d0>] dump_header.isra.4+0x48/0x130
[ 3554.705857] [<800d3db4>] oom_kill_process+0x98/0x43c
[ 3554.710984] [<800d44bc>] out_of_memory+0x2e0/0x324
[ 3554.715954] [<800d7dbc>] __alloc_pages_nodemask+0x684/0x6f0
[ 3554.721739] [<800d0f60>] pagecache_get_page+0x154/0x278
[ 3554.727168] [<80132218>] __getblk_slow+0x15c/0x374
[ 3554.732128] [<80159668>] squashfs_read_data+0x1c8/0x6e8
[ 3554.737549] [<8015d878>] squashfs_readpage_block+0x32c/0x4d8
[ 3554.743401] [<8015b4f4>] squashfs_readpage+0x5bc/0x6d0
[ 3554.748740] [<800db554>] __do_page_cache_readahead+0x1f8/0x264
[ 3554.754795] [<800d2d08>] filemap_fault+0x1ac/0x458
[ 3554.759765] [<800ed9a8>] __do_fault+0x3c/0xa8
[ 3554.764283] [<800f0c4c>] handle_mm_fault+0x4e4/0xb84
[ 3554.769424] [<80076758>] __do_page_fault+0x134/0x470
[ 3554.774570] [<80060820>] ret_from_exception+0x0/0x10
[ 3554.779689]
[ 3554.781222] Mem-Info:
[ 3554.783594] active_anon:279 inactive_anon:5 isolated_anon:0
[ 3554.783594]  active_file:171 inactive_file:206 isolated_file:0
[ 3554.783594]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 3554.783594]  slab_reclaimable:131 slab_unreclaimable:1214
[ 3554.783594]  mapped:63 shmem:65 pagetables:44 bounce:0
[ 3554.783594]  free:1024 free_pcp:0 free_cma:0
[ 3554.816225] Normal free:4096kB min:4096kB low:5120kB high:6144kB
active_anon:1116kB inactive_anon:20kB active_file:684kB
inactive_file:824kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27976kB mlocked:0kB dirty:0kB
writeback:0kB mapped:252kB shmem:260kB slab_reclaimable:524kB
slab_unreclaimable:4856kB kernel_stack:312kB pagetables:176kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:9136 all_unreclaimable? yes
[ 3554.861151] lowmem_reserve[]: 0 0
[ 3554.864604] Normal: 126*4kB (UM) 107*8kB (UE) 81*16kB (UME) 9*32kB
(UE) 6*64kB (UME) 6*128kB (M) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB
=3D 4096kB
[ 3554.878502] 442 total pagecache pages
[ 3554.882288] 0 pages in swap cache
[ 3554.885723] Swap cache stats: add 0, delete 0, find 0/0
[ 3554.891117] Free swap  =3D 0kB
[ 3554.894092] Total swap =3D 0kB
[ 3554.897081] 8192 pages RAM
[ 3554.899871] 0 pages HighMem/MovableOnly
[ 3554.903832] 1198 pages reserved
[ 3554.907090] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
swapents oom_score_adj name
[ 3554.915934] [  391]     0   391      297       19       3     =20
0        0             0 ubusd
[ 3554.924851] [  392]     0   392      224       10       4     =20
0        0             0 askfirst
[ 3554.934018] [  809]     0   809      426       37       4     =20
0        0             0 netifd
[ 3554.943020] [  835]     0   835      321       24       4     =20
0        0             0 odhcpd
[ 3554.952025] [ 1267]     0  1267      265       10       3     =20
0        0             0 dropbear
[ 3554.961208] [ 1281]     0  1281      282       25       3     =20
0        0             0 dropbear
[ 3554.970385] [ 1282]     0  1282      298       12       3     =20
0        0             0 ash
[ 3554.979119] [ 1449]     0  1449      296       10       3     =20
0        0             0 ntpd
[ 3554.987936] [ 1512]   453  1512      263       50       3     =20
0        0             0 dnsmasq
[ 3554.997021] [ 1864]     0  1864      296        9       3     =20
0        0             0 udhcpc
[ 3555.006017] [ 1955]     0  1955      299       49       3     =20
0        0             0 fastd
[ 3555.014942] [ 1992]     0  1992      260        9       3     =20
0        0             0 ntpd-hotplug
[ 3555.024488] Out of memory: Kill process 1512 (dnsmasq) score 7 or
sacrifice child
[ 3555.032226] Killed process 1512 (dnsmasq) total-vm:1052kB,
anon-rss:64kB, file-rss:136kB
[ 3723.936897] udhcpc invoked oom-killer: gfp_mask=3D0x2420848, order=3D0=
,
oom_score_adj=3D0
[ 3723.944879] CPU: 0 PID: 1864 Comm: udhcpc Not tainted 4.4.15 #9
[ 3723.950988] Stack : 803bf3a4 00000000 00000001 80410000 81829180
80406d63 803a0a6c 00000748
[ 3723.950988]    80473798 8183dad4 00000000 00000005 00001b52 800a6f1c
00000006 803a9390
[ 3723.950988]    00000000 00000000 803a44e4 8183d974 80476542 800a4e98
804063d0 00000000
[ 3723.950988]    00000001 801f2100 00000000 00000000 00000000 00000000
00000000 00000000
[ 3723.950988]    00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[ 3723.950988]    ...
[ 3723.988055] Call Trace:
[ 3723.990602] [<80071aa8>] show_stack+0x50/0x84
[ 3723.995123] [<800d39d0>] dump_header.isra.4+0x48/0x130
[ 3724.000434] [<800d3db4>] oom_kill_process+0x98/0x43c
[ 3724.005573] [<800d44bc>] out_of_memory+0x2e0/0x324
[ 3724.010532] [<800d7dbc>] __alloc_pages_nodemask+0x684/0x6f0
[ 3724.016351] [<800d0f60>] pagecache_get_page+0x154/0x278
[ 3724.021761] [<80132218>] __getblk_slow+0x15c/0x374
[ 3724.026744] [<80159668>] squashfs_read_data+0x1c8/0x6e8
[ 3724.032150] [<8015d878>] squashfs_readpage_block+0x32c/0x4d8
[ 3724.038013] [<8015b4f4>] squashfs_readpage+0x5bc/0x6d0
[ 3724.043335] [<800db554>] __do_page_cache_readahead+0x1f8/0x264
[ 3724.049386] [<800d2d08>] filemap_fault+0x1ac/0x458
[ 3724.054371] [<800ed9a8>] __do_fault+0x3c/0xa8
[ 3724.058877] [<800f0c4c>] handle_mm_fault+0x4e4/0xb84
[ 3724.064018] [<80076758>] __do_page_fault+0x134/0x470
[ 3724.069163] [<80060820>] ret_from_exception+0x0/0x10
[ 3724.074294]
[ 3724.075834] Mem-Info:
[ 3724.078204] active_anon:290 inactive_anon:5 isolated_anon:0
[ 3724.078204]  active_file:165 inactive_file:206 isolated_file:0
[ 3724.078204]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 3724.078204]  slab_reclaimable:129 slab_unreclaimable:1229
[ 3724.078204]  mapped:2 shmem:65 pagetables:54 bounce:0
[ 3724.078204]  free:1024 free_pcp:0 free_cma:0
[ 3724.110737] Normal free:4096kB min:4096kB low:5120kB high:6144kB
active_anon:1160kB inactive_anon:20kB active_file:660kB
inactive_file:824kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27976kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:260kB slab_reclaimable:516kB
slab_unreclaimable:4916kB kernel_stack:328kB pagetables:216kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:8976 all_unreclaimable? yes
[ 3724.155485] lowmem_reserve[]: 0 0
[ 3724.158929] Normal: 106*4kB (UE) 103*8kB (UM) 82*16kB (UE) 24*32kB
(UME) 4*64kB (UE) 4*128kB (UM) 0*256kB 0*512kB 0*1024kB 0*2048kB
0*4096kB =3D 4096kB
[ 3724.172917] 436 total pagecache pages
[ 3724.176716] 0 pages in swap cache
[ 3724.180141] Swap cache stats: add 0, delete 0, find 0/0
[ 3724.185545] Free swap  =3D 0kB
[ 3724.188516] Total swap =3D 0kB
[ 3724.191491] 8192 pages RAM
[ 3724.194294] 0 pages HighMem/MovableOnly
[ 3724.198255] 1198 pages reserved
[ 3724.201500] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
swapents oom_score_adj name
[ 3724.210335] [  391]     0   391      297       17       3     =20
0        0             0 ubusd
[ 3724.219246] [  392]     0   392      224       10       4     =20
0        0             0 askfirst
[ 3724.228429] [  809]     0   809      426       37       4     =20
0        0             0 netifd
[ 3724.237434] [  835]     0   835      321       21       4     =20
0        0             0 odhcpd
[ 3724.246438] [ 1267]     0  1267      265       10       3     =20
0        0             0 dropbear
[ 3724.255615] [ 1281]     0  1281      282       25       3     =20
0        0             0 dropbear
[ 3724.264797] [ 1282]     0  1282      298       12       3     =20
0        0             0 ash
[ 3724.273511] [ 1449]     0  1449      296       10       3     =20
0        0             0 ntpd
[ 3724.282331] [ 1864]     0  1864      296        9       3     =20
0        0             0 udhcpc
[ 3724.291327] [ 1955]     0  1955      299       26       3     =20
0        0             0 fastd
[ 3724.300235] [ 1992]     0  1992      296        9       3     =20
0        0             0 ntpd-hotplug
[ 3724.309778] [ 1994]     0  1994      271       11       3     =20
0        0             0 logd
[ 3724.318603] [ 1995]     0  1995      255        8       3     =20
0        0             0 dnsmasq
[ 3724.327696] [ 1996]     0  1996      296        9       4     =20
0        0             0 dhcpv6.sh
[ 3724.336961] [ 1997]     0  1997      265        9       3     =20
0        0             0 dropbear
[ 3724.346131] Out of memory: Kill process 809 (netifd) score 5 or
sacrifice child
[ 3724.353693] Killed process 1996 (dhcpv6.sh) total-vm:1184kB,
anon-rss:32kB, file-rss:4kB
[ 3744.609886] odhcpd invoked oom-killer: gfp_mask=3D0x24201ca, order=3D0=
,
oom_score_adj=3D0
[ 3744.617880] CPU: 0 PID: 835 Comm: odhcpd Not tainted 4.4.15 #9
[ 3744.623902] Stack : 803bf3a4 00000000 00000001 80410000 818eb480
80406d63 803a0a6c 00000343
[ 3744.623902]    80473798 80f05d1c 00000000 00000005 00001b52 800a6f1c
00000006 803a9390
[ 3744.623902]    00000000 00000000 803a44e4 80f05bbc 80476542 800a4e98
804063d0 00000000
[ 3744.623902]    00000001 801f2100 00000000 00000000 00000000 00000000
00000000 00000000
[ 3744.623902]    00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[ 3744.623902]    ...
[ 3744.660968] Call Trace:
[ 3744.663516] [<80071aa8>] show_stack+0x50/0x84
[ 3744.668038] [<800d39d0>] dump_header.isra.4+0x48/0x130
[ 3744.673348] [<800d3db4>] oom_kill_process+0x98/0x43c
[ 3744.678496] [<800d44bc>] out_of_memory+0x2e0/0x324
[ 3744.683455] [<800d7dbc>] __alloc_pages_nodemask+0x684/0x6f0
[ 3744.689268] [<800d2db4>] filemap_fault+0x258/0x458
[ 3744.694246] [<800ed9a8>] __do_fault+0x3c/0xa8
[ 3744.698754] [<800f0c4c>] handle_mm_fault+0x4e4/0xb84
[ 3744.703893] [<80076758>] __do_page_fault+0x134/0x470
[ 3744.709046] [<80060820>] ret_from_exception+0x0/0x10
[ 3744.714179]
[ 3744.715713] Mem-Info:
[ 3744.718082] active_anon:276 inactive_anon:5 isolated_anon:0
[ 3744.718082]  active_file:156 inactive_file:225 isolated_file:0
[ 3744.718082]  unevictable:0 dirty:0 writeback:0 unstable:0
[ 3744.718082]  slab_reclaimable:129 slab_unreclaimable:1235
[ 3744.718082]  mapped:2 shmem:65 pagetables:47 bounce:0
[ 3744.718082]  free:1024 free_pcp:0 free_cma:0
[ 3744.750612] Normal free:4096kB min:4096kB low:5120kB high:6144kB
active_anon:1104kB inactive_anon:20kB active_file:624kB
inactive_file:900kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:32768kB managed:27976kB mlocked:0kB dirty:0kB
writeback:0kB mapped:8kB shmem:260kB slab_reclaimable:516kB
slab_unreclaimable:4940kB kernel_stack:320kB pagetables:188kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:9540 all_unreclaimable? yes
[ 3744.795364] lowmem_reserve[]: 0 0
[ 3744.798808] Normal: 100*4kB (UME) 98*8kB (UE) 78*16kB (UME) 34*32kB
(UME) 5*64kB (UME) 2*128kB (M) 0*256kB 0*512kB 0*1024kB 0*2048kB
0*4096kB =3D 4096kB
[ 3744.812885] 446 total pagecache pages
[ 3744.816684] 0 pages in swap cache
[ 3744.820109] Swap cache stats: add 0, delete 0, find 0/0
[ 3744.825514] Free swap  =3D 0kB
[ 3744.828484] Total swap =3D 0kB
[ 3744.831459] 8192 pages RAM
[ 3744.834262] 0 pages HighMem/MovableOnly
[ 3744.838223] 1198 pages reserved
[ 3744.841468] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
swapents oom_score_adj name
[ 3744.850302] [  391]     0   391      297       17       3     =20
0        0             0 ubusd
[ 3744.859214] [  392]     0   392      224       10       4     =20
0        0             0 askfirst
[ 3744.868398] [  809]     0   809      426       37       4     =20
0        0             0 netifd
[ 3744.877402] [  835]     0   835      321       21       4     =20
0        0             0 odhcpd
[ 3744.886407] [ 1267]     0  1267      265       10       3     =20
0        0             0 dropbear
[ 3744.895593] [ 1281]     0  1281      282       25       3     =20
0        0             0 dropbear
[ 3744.904776] [ 1449]     0  1449      296       10       3     =20
0        0             0 ntpd
[ 3744.913585] [ 1864]     0  1864      296        9       3     =20
0        0             0 udhcpc
[ 3744.922587] [ 1955]     0  1955      299       26       3     =20
0        0             0 fastd
[ 3744.931503] [ 1992]     0  1992      296        9       3     =20
0        0             0 ntpd-hotplug
[ 3744.941045] [ 1994]     0  1994      271       11       3     =20
0        0             0 logd
[ 3744.949872] [ 1995]     0  1995      255        8       3     =20
0        0             0 dnsmasq
[ 3744.958966] [ 1998]     0  1998      265        9       3     =20
0        0             0 dropbear
[ 3744.968143] Out of memory: Kill process 809 (netifd) score 5 or
sacrifice child
[ 3744.975720] Killed process 1864 (udhcpc) total-vm:1184kB,
anon-rss:32kB, file-rss:4kB
[ 4518.095013] eth0: link down
[ 4518.098341] br-lan: port 1(eth0) entered disabled state
[ 4520.095417] eth0: link up (1000Mbps/Full duplex)
[ 4520.100261] br-lan: port 1(eth0) entered forwarding state
[ 4520.105964] br-lan: port 1(eth0) entered forwarding state


--=20
make the world nicer, please use PGP encryption


--------------1149BC53547E57371C07290A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>to our tests on tp-link841-v11 we tried to test fastd for direct
      comparison</p>
    <p>again, the setup is <br>
       laptop(iperf3) &gt; tplink841v11 &lt; fastd &gt; tplink841v11
      &lt; laptop(iperf3)<br>
    </p>
    <p>actual lede , fastdv18 both default - both build today<br>
      TP-link841v11 is pretty cheap 560Mhz CPU 4 MB Flash, 32 MB RAM<br>
    </p>
    <p>main result is that wireguard seem to be a little little faster 
      (TCP iperf)<br>
      15.5 Mbit for wireguard<br>
      14 Mbit for fastd</p>
    <p>but we observe on fastd also that we can crash the system with
      udp, (like we reported before for wireguard)<br>
      on both systems throwing much udp traffic in the tunnel make the
      first tp-link unresponsive with load of 2.5 and much higher,
      pretty soon oomkiller kill random processes due to out-of-memory</p>
    <p>so maybe it is not that wireguard has a specific problem, than
      there is a general problem with lots of udp traffic <br>
    </p>
    <p>following the TCP iperf, the udp iperf and the crashlog (dmesg)<br>
    </p>
    <p>greetings .. <br>
    </p>
    <div class="ace-line" id="magicdomid91"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">jens<br>
        <br>
        fuzzle/ freifunk freiburg<br>
        <br>
        <a class="moz-txt-link-freetext" href="https://git.universe-factory.net/fastd">https://git.universe-factory.net/fastd</a><br>
        <a class="moz-txt-link-freetext" href="http://fastd.readthedocs.org/">http://fastd.readthedocs.org/</a><br>
        <br>
        ############################<br>
        ####### first old wireguard tests  #####<br>
        ############################<br>
        <br>
      </span></div>
    <div class="ace-line" id="magicdomid92"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[   
        0.000000] Linux version 4.4.15 (foo@bar) (gcc version 5.4.0
        (LEDE GCC 5.4.0 r1119) ) #3 Thu Jul 28 01:05:08 UTC 2016</span></div>
    <div class="ace-line" id="magicdomid87"><br>
    </div>
    <div class="ace-line" id="magicdomid8"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">iperf3
        -c 192.168.2.23 -p 4000 -u -b 500M</span></div>
    <div class="ace-line" id="magicdomid9"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">Connecting
        to host 192.168.2.23, port 4000</span></div>
    <div class="ace-line" id="magicdomid10"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4] local 192.168.1.23 port 52916 connected to 192.168.2.23 port
        4000</span></div>
    <div class="ace-line" id="magicdomid11"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        ID] Interval           Transfer     Bandwidth       Total
        Datagrams</span></div>
    <div class="ace-line" id="magicdomid12"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-1.00   sec  10.3 MBytes  86.6 Mbits/sec  1321  </span></div>
    <div class="ace-line" id="magicdomid13"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   1.00-2.00   sec  11.4 MBytes  95.6 Mbits/sec  1459  </span></div>
    <div class="ace-line" id="magicdomid14"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   2.00-3.00   sec  11.4 MBytes  95.6 Mbits/sec  1459  </span></div>
    <div class="ace-line" id="magicdomid15"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   3.00-4.00   sec  11.4 MBytes  95.6 Mbits/sec  1458  </span></div>
    <div class="ace-line" id="magicdomid16"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   4.00-5.00   sec  11.4 MBytes  95.6 Mbits/sec  1459  </span></div>
    <div class="ace-line" id="magicdomid17"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   5.00-6.00   sec  11.4 MBytes  95.6 Mbits/sec  1459  </span></div>
    <div class="ace-line" id="magicdomid18"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   6.00-7.00   sec  11.4 MBytes  95.6 Mbits/sec  1458  </span></div>
    <div class="ace-line" id="magicdomid19"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   7.00-8.00   sec  11.4 MBytes  95.6 Mbits/sec  1459  </span></div>
    <div class="ace-line" id="magicdomid20"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   8.00-9.00   sec  11.4 MBytes  95.6 Mbits/sec  1459  </span></div>
    <div class="ace-line" id="magicdomid21"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   9.00-10.00  sec  11.4 MBytes  95.6 Mbits/sec  1459  </span></div>
    <div class="ace-line" id="magicdomid22"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">-
        - - - - - - - - - - - - - - - - - - - - - - - -</span></div>
    <div class="ace-line" id="magicdomid23"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        ID] Interval           Transfer     Bandwidth       Jitter   
        Lost/Total Datagrams</span></div>
    <div class="ace-line" id="magicdomid24"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-10.00  sec   113 MBytes  94.7 Mbits/sec  3.981 ms 
        12138/14140 (86%)  </span></div>
    <div class="ace-line" id="magicdomid25"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4] Sent 14140 datagrams</span></div>
    <div class="ace-line" id="magicdomid26"><br>
    </div>
    <div class="ace-line" id="magicdomid27"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">Server
        listening on 4000</span></div>
    <div class="ace-line" id="magicdomid28"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">-----------------------------------------------------------</span></div>
    <div class="ace-line" id="magicdomid29"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">Accepted
        connection from 192.168.1.23, port 52430</span></div>
    <div class="ace-line" id="magicdomid30"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5] local 192.168.2.23 port 4000 connected to 192.168.1.23 port
        52916</span></div>
    <div class="ace-line" id="magicdomid31"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[
        ID] Interval           Transfer     Bandwidth       Jitter   
        Lost/Total Datagrams</span></div>
    <div class="ace-line" id="magicdomid32"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   0.00-1.00   sec  2.38 MBytes  19.9 Mbits/sec  3.077 ms 
        783/1087 (72%)  </span></div>
    <div class="ace-line" id="magicdomid33"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   1.00-2.00   sec  3.17 MBytes  26.6 Mbits/sec  2.790 ms 
        1124/1530 (73%)  </span></div>
    <div class="ace-line" id="magicdomid34"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   2.00-3.00   sec  2.87 MBytes  24.1 Mbits/sec  3.588 ms 
        990/1357 (73%)  </span></div>
    <div class="ace-line" id="magicdomid35"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   3.00-4.00   sec  1.91 MBytes  16.0 Mbits/sec  3.824 ms 
        1207/1451 (83%)  </span></div>
    <div class="ace-line" id="magicdomid36"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   4.00-5.00   sec   656 KBytes  5.37 Mbits/sec  4.489 ms 
        1451/1533 (95%)  </span></div>
    <div class="ace-line" id="magicdomid37"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec  4.489 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid38"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec  4.489 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid39"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   7.00-8.00   sec  1.07 MBytes  8.98 Mbits/sec  2.991 ms 
        4254/4391 (97%)  </span></div>
    <div class="ace-line" id="magicdomid40"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   8.00-9.00   sec  2.05 MBytes  17.2 Mbits/sec  4.438 ms 
        724/986 (73%)  </span></div>
    <div class="ace-line" id="magicdomid41"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   9.00-10.00  sec  1.56 MBytes  13.1 Mbits/sec  3.981 ms 
        1605/1805 (89%)  </span></div>
    <div class="ace-line" id="magicdomid42"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]  10.00-10.17  sec  0.00 Bytes  0.00 bits/sec  3.981 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid43"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">-
        - - - - - - - - - - - - - - - - - - - - - - - -</span></div>
    <div class="ace-line" id="magicdomid44"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[
        ID] Interval           Transfer     Bandwidth       Jitter   
        Lost/Total Datagrams</span></div>
    <div class="ace-line" id="magicdomid46"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   0.00-10.17  sec   113 MBytes  93.1 Mbits/sec  3.981 ms 
        12138/14140 (86%)</span></div>
    <div class="ace-line" id="magicdomid48"><br>
    </div>
    <div class="ace-line" id="magicdomid49"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">0_k@K:~/wiki/freifunk$
        iperf3 -c 192.168.2.23 -p 4000</span></div>
    <div class="ace-line" id="magicdomid50"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">Connecting
        to host 192.168.2.23, port 4000</span></div>
    <div class="ace-line" id="magicdomid51"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4] local 192.168.1.23 port 52448 connected to 192.168.2.23 port
        4000</span></div>
    <div class="ace-line" id="magicdomid52"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        ID] Interval           Transfer     Bandwidth       Retr  Cwnd</span></div>
    <div class="ace-line" id="magicdomid53"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-1.00   sec  2.05 MBytes  17.2 Mbits/sec   59   13.4
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid54"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   1.00-2.00   sec  1.92 MBytes  16.1 Mbits/sec   87   6.69
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid55"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   2.00-3.00   sec  1.86 MBytes  15.6 Mbits/sec   82   9.37
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid56"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   3.00-4.00   sec  1.92 MBytes  16.1 Mbits/sec   86   6.69
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid57"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   4.00-5.00   sec  1.85 MBytes  15.5 Mbits/sec   88   5.36
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid58"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   5.00-6.00   sec  1.83 MBytes  15.4 Mbits/sec   84   5.36
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid59"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   6.00-7.00   sec  1.89 MBytes  15.9 Mbits/sec   79   8.03
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid60"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   7.00-8.00   sec  1.85 MBytes  15.5 Mbits/sec   87   8.03
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid61"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   8.00-9.00   sec  1.84 MBytes  15.4 Mbits/sec   79   8.03
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid62"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   9.00-10.00  sec  1.86 MBytes  15.6 Mbits/sec   75   8.03
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid63"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">-
        - - - - - - - - - - - - - - - - - - - - - - - -</span></div>
    <div class="ace-line" id="magicdomid64"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        ID] Interval           Transfer     Bandwidth       Retr</span></div>
    <div class="ace-line" id="magicdomid65"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-10.00  sec  18.9 MBytes  15.8 Mbits/sec 
        806             sender</span></div>
    <div class="ace-line" id="magicdomid66"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-10.00  sec  18.7 MBytes  15.7
        Mbits/sec                  receiver</span></div>
    <div class="ace-line" id="magicdomid67"><br>
    </div>
    <div class="ace-line" id="magicdomid69"><br>
    </div>
    <div class="ace-line" id="magicdomid72"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">############################</span></div>
    <div class="ace-line" id="magicdomid75"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">############################</span></div>
    <div class="ace-line" id="magicdomid78"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">############################</span></div>
    <div class="ace-line" id="magicdomid81"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">############################</span></div>
    <div class="ace-line" id="magicdomid84"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">############################</span></div>
    <div class="ace-line" id="magicdomid93"><br>
    </div>
    <div class="ace-line" id="magicdomid109"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">FASTD
        Test<br>
        <br>
      </span></div>
    <div class="ace-line" id="magicdomid518"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">#####
        fastd server script</span></div>
    <div class="ace-line" id="magicdomid520"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">#!/bin/sh</span></div>
    <div class="ace-line" id="magicdomid526"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">ifconfig
        eth1 10.0.0.2 netmask 255.255.255.0</span></div>
    <div class="ace-line" id="magicdomid558"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">cat
        &lt;&lt;EOF &gt; /tmp/fastdserver.conf</span></div>
    <div class="ace-line" id="magicdomid471"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">bind
        0.0.0.0:1234;</span></div>
    <div class="ace-line" id="magicdomid472"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">mode
        tap;</span></div>
    <div class="ace-line" id="magicdomid473"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">method
        "salsa2012+umac";</span></div>
    <div class="ace-line" id="magicdomid474"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">method
        "null+salsa2012+umac";</span></div>
    <div class="ace-line" id="magicdomid475"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">mtu
        1426;</span></div>
    <div class="ace-line" id="magicdomid476"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">forward
        yes;</span></div>
    <div class="ace-line" id="magicdomid477"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">secret
"a030db009057d0cc36ecef65ca05d4019c03392694b035d968962ed161dd5353";</span></div>
    <div class="ace-line" id="magicdomid478"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">#
        user "nobody";</span></div>
    <div class="ace-line" id="magicdomid479"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">log
        to syslog level info;</span></div>
    <div class="ace-line" id="magicdomid480"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">include
        peers from "peers";</span></div>
    <div class="ace-line" id="magicdomid481"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">interface
        "vpn";</span></div>
    <div class="ace-line" id="magicdomid482"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">on
        up "</span></div>
    <div class="ace-line" id="magicdomid483"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z"> 
        ip link set up $INTERFACE</span></div>
    <div class="ace-line" id="magicdomid484"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z"> 
        ip addr add 10.10.0.2/24 dev $INTERFACE</span></div>
    <div class="ace-line" id="magicdomid559"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">";</span></div>
    <div class="ace-line" id="magicdomid563"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">EOF</span></div>
    <div class="ace-line" id="magicdomid565"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">mkdir
        -p /tmp/peers</span></div>
    <div class="ace-line" id="magicdomid566"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">cat
        &lt;&lt;EOF &gt; /tmp/peers/foo</span></div>
    <div class="ace-line" id="magicdomid637"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">key
"12218a16b0adbbf1141ada628c48540fcf2f0e706c97f5fdace77205406cd809";</span></div>
    <div class="ace-line" id="magicdomid569"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">EOF</span></div>
    <div class="ace-line" id="magicdomid676"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">fastd
        -d -c /tmp/fastdpeer.conf</span></div>
    <div class="ace-line" id="magicdomid487"><br>
      <br>
    </div>
    <div class="ace-line" id="magicdomid207"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">####
        fastd client script<br>
      </span></div>
    <div class="ace-line" id="magicdomid189"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">#!/bin/sh</span></div>
    <div class="ace-line" id="magicdomid192"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">ifconfig
        eth1 10.0.0.1 netmask 255.255.255.0</span></div>
    <div class="ace-line" id="magicdomid252"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">cat
        &lt;&lt;EOF &gt; /tmp/fastdpeer.conf</span></div>
    <div class="ace-line" id="magicdomid242"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">interface
        "mesh-vpn";</span></div>
    <div class="ace-line" id="magicdomid398"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">mtu
        1426;</span></div>
    <div class="ace-line" id="magicdomid244"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">log
        level debug;</span></div>
    <div class="ace-line" id="magicdomid245"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">method
        "salsa2012+umac";</span></div>
    <div class="ace-line" id="magicdomid246"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">method
        "null+salsa2012+umac";</span></div>
    <div class="ace-line" id="magicdomid371"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">on
        up "</span></div>
    <div class="ace-line" id="magicdomid372"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z"> 
        ip link set up mesh-vpn</span></div>
    <div class="ace-line" id="magicdomid396"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z"> 
        ip addr add 10.10.0.1/24 dev mesh-vpn</span></div>
    <div class="ace-line" id="magicdomid374"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">";</span></div>
    <div class="ace-line" id="magicdomid277"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">EOF</span></div>
    <div class="ace-line" id="magicdomid298"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">mkdir
        -p /tmp/peers</span></div>
    <div class="ace-line" id="magicdomid334"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">cat
        &lt;&lt;EOF &gt; /tmp/peers/foo</span></div>
    <div class="ace-line" id="magicdomid376"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">key
"17076456b892b30876cd69b8387e1d9dc93ba067225ba22208a094fb376ad7cb";</span></div>
    <div class="ace-line" id="magicdomid379"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">remote
        10.0.0.2:1234;</span></div>
    <div class="ace-line" id="magicdomid335"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">EOF</span></div>
    <div class="ace-line" id="magicdomid675"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">fastd
        -d -c /tmp/fastdpeer.conf</span></div>
    <div class="ace-line" id="magicdomid677"><br>
      ####### you need to set ip route on laptop and tp-link accordingly<br>
      <br>
    </div>
    <div class="ace-line" id="magicdomid693"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">#######
        tcp test</span></div>
    <div class="ace-line" id="magicdomid401"><br>
    </div>
    <div class="ace-line" id="magicdomid402"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">#
        iperf3 -c 192.168.2.23 </span></div>
    <div class="ace-line" id="magicdomid403"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">Connecting
        to host 192.168.2.23, port 5201</span></div>
    <div class="ace-line" id="magicdomid404"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4] local 192.168.1.23 port 53678 connected to 192.168.2.23 port
        5201</span></div>
    <div class="ace-line" id="magicdomid405"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        ID] Interval           Transfer     Bandwidth       Retr  Cwnd</span></div>
    <div class="ace-line" id="magicdomid406"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-1.00   sec  1.91 MBytes  16.0 Mbits/sec    0    109
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid407"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   1.00-2.00   sec  1.85 MBytes  15.5 Mbits/sec    0    189
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid408"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   2.00-3.00   sec  1.79 MBytes  15.0 Mbits/sec    0    271
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid409"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   3.00-4.00   sec  1.85 MBytes  15.5 Mbits/sec    0    352
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid410"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   4.00-5.00   sec  1.79 MBytes  15.0 Mbits/sec    0    433
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid411"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   5.00-6.00   sec  1.85 MBytes  15.5 Mbits/sec    0    514
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid412"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   6.00-7.00   sec  1.79 MBytes  15.0 Mbits/sec    0    594
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid413"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   7.00-8.00   sec  1.85 MBytes  15.5 Mbits/sec    0    676
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid414"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   8.00-9.00   sec  1.79 MBytes  15.0 Mbits/sec    0    757
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid415"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   9.00-10.00  sec  1.85 MBytes  15.5 Mbits/sec    0    839
        KBytes       </span></div>
    <div class="ace-line" id="magicdomid416"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">-
        - - - - - - - - - - - - - - - - - - - - - - - -</span></div>
    <div class="ace-line" id="magicdomid417"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        ID] Interval           Transfer     Bandwidth       Retr</span></div>
    <div class="ace-line" id="magicdomid418"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-10.00  sec  18.3 MBytes  15.3 Mbits/sec   
        0             sender</span></div>
    <div class="ace-line" id="magicdomid423"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        4]   0.00-10.00  sec  16.7 MBytes  14.0
        Mbits/sec                  receiver</span></div>
    <div class="ace-line" id="magicdomid421"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">iperf
        Done.</span></div>
    <div class="ace-line" id="magicdomid467"><br>
    </div>
    <div class="ace-line" id="magicdomid469"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">########
        udp following </span></div>
    <div class="ace-line" id="magicdomid425"><br>
    </div>
    <div class="ace-line" id="magicdomid426"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">-----------------------------------------------------------</span></div>
    <div class="ace-line" id="magicdomid427"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">Server
        listening on 5201</span></div>
    <div class="ace-line" id="magicdomid428"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">-----------------------------------------------------------</span></div>
    <div class="ace-line" id="magicdomid429"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">Accepted
        connection from 192.168.1.23, port 53700</span></div>
    <div class="ace-line" id="magicdomid430"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5] local 192.168.2.23 port 5201 connected to 192.168.1.23 port
        54213</span></div>
    <div class="ace-line" id="magicdomid431"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[
        ID] Interval           Transfer     Bandwidth       Jitter   
        Lost/Total Datagrams</span></div>
    <div class="ace-line" id="magicdomid432"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   0.00-1.00   sec  1.60 MBytes  13.4 Mbits/sec  2.829 ms 
        0/205 (0%)  </span></div>
    <div class="ace-line" id="magicdomid433"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid434"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid435"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid436"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid437"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid438"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid439"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid440"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid441"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]   9.00-10.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid442"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]  10.00-11.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid443"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]  11.00-12.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid444"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]  12.00-13.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid445"><span
        class="author-a-z70zz74zz72zfz70zz79zz76zz83zz71zz67zz89zz78zqnvz76z">[ 
        5]  13.00-14.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0
        (-nan%)  </span></div>
    <div class="ace-line" id="magicdomid446"><br>
    </div>
    <div class="ace-line" id="magicdomid694"><br>
    </div>
    <div class="ace-line" id="magicdomid695"><br>
    </div>
    <div class="ace-line" id="magicdomid1036"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">######## </span></div>
    <div class="ace-line" id="magicdomid1154"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        16.886432] jffs2_scan_eraseblock(): End of filesystem marker
        found at 0x0</span></div>
    <div class="ace-line" id="magicdomid1155"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        16.893692] jffs2_build_filesystem(): unlocking the mtd device...
        done.</span></div>
    <div class="ace-line" id="magicdomid1156"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        16.900556] jffs2_build_filesystem(): erasing all blocks after
        the end marker... done.</span></div>
    <div class="ace-line" id="magicdomid1157"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        20.120013] jffs2: notice: (863) jffs2_build_xattr_subsystem:
        complete building xattr subsystem, 0 of xdatum (0 unchecked, 0
        orphan) and 0 of xref (0 dead, 0 orphan) found.</span></div>
    <div class="ace-line" id="magicdomid1158"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        21.402037] device eth0 entered promiscuous mode</span></div>
    <div class="ace-line" id="magicdomid1159"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        21.426164] IPv6: ADDRCONF(NETDEV_UP): br-lan: link is not ready</span></div>
    <div class="ace-line" id="magicdomid1160"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        21.533476] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready</span></div>
    <div class="ace-line" id="magicdomid1161"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        23.521710] eth0: link up (1000Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid1162"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        23.526563] br-lan: port 1(eth0) entered forwarding state</span></div>
    <div class="ace-line" id="magicdomid1163"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        23.532242] br-lan: port 1(eth0) entered forwarding state</span></div>
    <div class="ace-line" id="magicdomid1164"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        23.559247] IPv6: ADDRCONF(NETDEV_CHANGE): br-lan: link becomes
        ready</span></div>
    <div class="ace-line" id="magicdomid1165"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        24.232715] eth1: link up (100Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid1166"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        24.237450] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes
        ready</span></div>
    <div class="ace-line" id="magicdomid1167"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        25.529282] br-lan: port 1(eth0) entered forwarding state</span></div>
    <div class="ace-line" id="magicdomid1168"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[  
        61.939236] random: nonblocking pool is initialized</span></div>
    <div class="ace-line" id="magicdomid1169"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        787.348920] eth1: link down</span></div>
    <div class="ace-line" id="magicdomid1170"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[ 
        789.350353] eth1: link up (100Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid1171"><br>
    </div>
    <div class="ace-line" id="magicdomid947"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1767.367603] eth1: link down</span></div>
    <div class="ace-line" id="magicdomid948"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1773.369029] eth1: link up (100Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid949"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1777.367595] eth1: link down</span></div>
    <div class="ace-line" id="magicdomid950"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1778.369029] eth1: link up (100Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid951"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1781.367592] eth1: link down</span></div>
    <div class="ace-line" id="magicdomid952"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1782.369026] eth1: link up (100Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid953"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1790.367591] eth1: link down</span></div>
    <div class="ace-line" id="magicdomid954"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1791.369019] eth1: link up (100Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid955"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1794.367583] eth1: link down</span></div>
    <div class="ace-line" id="magicdomid956"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1795.369025] eth1: link up (100Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid957"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1950.367465] eth1: link down</span></div>
    <div class="ace-line" id="magicdomid958"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1951.368904] eth1: link up (100Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid959"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1953.367468] eth1: link down</span></div>
    <div class="ace-line" id="magicdomid960"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        1954.368901] eth1: link up (100Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid961"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        2100.367360] eth1: link down</span></div>
    <div class="ace-line" id="magicdomid962"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        2101.368798] eth1: link up (100Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid963"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        2103.367362] eth1: link down</span></div>
    <div class="ace-line" id="magicdomid964"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        2104.368796] eth1: link up (100Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid965"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.124559] udhcpc invoked oom-killer: gfp_mask=0x2420848,
        order=0, oom_score_adj=0</span></div>
    <div class="ace-line" id="magicdomid966"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.132491] CPU: 0 PID: 1864 Comm: udhcpc Not tainted 4.4.15 #9</span></div>
    <div class="ace-line" id="magicdomid967"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.138648] Stack : 803bf3a4 00000000 00000001 80410000
        81829180 80406d63 803a0a6c 00000748</span></div>
    <div class="ace-line" id="magicdomid968"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.138648]    80473798 8183dad4 00000000 00000006 00001b52
        800a6f1c 00000006 803a9390</span></div>
    <div class="ace-line" id="magicdomid969"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.138648]    00000000 00000000 803a44e4 8183d974 80476542
        800a4e98 804063d0 00000000</span></div>
    <div class="ace-line" id="magicdomid970"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.138648]    00000001 801f2100 00000000 00000000 00000000
        00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid971"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.138648]    00000000 00000000 00000000 00000000 00000000
        00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid972"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.138648]    ...</span></div>
    <div class="ace-line" id="magicdomid973"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.175694] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid974"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.178242] [&lt;80071aa8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid975"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.182747] [&lt;800d39d0&gt;] dump_header.isra.4+0x48/0x130</span></div>
    <div class="ace-line" id="magicdomid976"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.188072] [&lt;800d3db4&gt;] oom_kill_process+0x98/0x43c</span></div>
    <div class="ace-line" id="magicdomid977"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.193208] [&lt;800d44bc&gt;] out_of_memory+0x2e0/0x324</span></div>
    <div class="ace-line" id="magicdomid978"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.198188] [&lt;800d7dbc&gt;]
        __alloc_pages_nodemask+0x684/0x6f0</span></div>
    <div class="ace-line" id="magicdomid979"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.203981] [&lt;800d0f60&gt;] pagecache_get_page+0x154/0x278</span></div>
    <div class="ace-line" id="magicdomid980"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.209410] [&lt;80132218&gt;] __getblk_slow+0x15c/0x374</span></div>
    <div class="ace-line" id="magicdomid981"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.214388] [&lt;80159668&gt;] squashfs_read_data+0x1c8/0x6e8</span></div>
    <div class="ace-line" id="magicdomid982"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.219798] [&lt;8015d878&gt;]
        squashfs_readpage_block+0x32c/0x4d8</span></div>
    <div class="ace-line" id="magicdomid983"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.225662] [&lt;8015b4f4&gt;] squashfs_readpage+0x5bc/0x6d0</span></div>
    <div class="ace-line" id="magicdomid984"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.230984] [&lt;800db554&gt;]
        __do_page_cache_readahead+0x1f8/0x264</span></div>
    <div class="ace-line" id="magicdomid985"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.237037] [&lt;800d2d08&gt;] filemap_fault+0x1ac/0x458</span></div>
    <div class="ace-line" id="magicdomid986"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.242004] [&lt;800ed9a8&gt;] __do_fault+0x3c/0xa8</span></div>
    <div class="ace-line" id="magicdomid987"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.246622] [&lt;800f0c4c&gt;] handle_mm_fault+0x4e4/0xb84</span></div>
    <div class="ace-line" id="magicdomid988"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.251772] [&lt;80076758&gt;] __do_page_fault+0x134/0x470</span></div>
    <div class="ace-line" id="magicdomid989"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.256936] [&lt;80060820&gt;] ret_from_exception+0x0/0x10</span></div>
    <div class="ace-line" id="magicdomid990"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.262057]</span></div>
    <div class="ace-line" id="magicdomid991"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.263599] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid992"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.265992] active_anon:323 inactive_anon:5 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid993"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.265992]  active_<a class="moz-txt-link-freetext" href="file:102">file:102</a> inactive_<a class="moz-txt-link-freetext" href="file:160">file:160</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid994"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.265992]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid995"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.265992]  slab_reclaimable:130 slab_unreclaimable:1213</span></div>
    <div class="ace-line" id="magicdomid996"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.265992]  mapped:8 shmem:65 pagetables:52 bounce:0</span></div>
    <div class="ace-line" id="magicdomid997"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.265992]  free:1024 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid998"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.298530] Normal free:4096kB min:4096kB low:5120kB
        high:6144kB active_anon:1292kB inactive_anon:20kB
        active_<a class="moz-txt-link-freetext" href="file:408kB">file:408kB</a> inactive_<a class="moz-txt-link-freetext" href="file:640kB">file:640kB</a> unevictable:0kB
        isolated(anon):0kB isolated(file):0kB present:32768kB
        managed:27976kB mlocked:0kB dirty:0kB writeback:0kB mapped:32kB
        shmem:260kB slab_reclaimable:520kB slab_unreclaimable:4852kB
        kernel_stack:320kB pagetables:208kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:6320 all_unreclaimable? yes</span></div>
    <div class="ace-line" id="magicdomid999"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.343370] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid1000"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.346837] Normal: 128*4kB (U) 114*8kB (U) 79*16kB (U) 0*32kB
        8*64kB (UM) 7*128kB (UM) 0*256kB 0*512kB 0*1024kB 0*2048kB
        0*4096kB = 4096kB</span></div>
    <div class="ace-line" id="magicdomid1001"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.359919] 331 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid1002"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.363704] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid1003"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.367141] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid1004"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.372536] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid1005"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.375524] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid1006"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.378493] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid1007"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.381289] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid1008"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.385268] 1198 pages reserved</span></div>
    <div class="ace-line" id="magicdomid1009"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.388512] [ pid ]   uid  tgid total_vm      rss nr_ptes
        nr_pmds swapents oom_score_adj name</span></div>
    <div class="ace-line" id="magicdomid1010"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.397349] [  391]     0   391      297       17       3      
        0        0             0 ubusd</span></div>
    <div class="ace-line" id="magicdomid1011"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.406260] [  392]     0   392      224       10       4      
        0        0             0 askfirst</span></div>
    <div class="ace-line" id="magicdomid1012"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.415443] [  763]     0   763      307       35       4      
        0        0             0 logd</span></div>
    <div class="ace-line" id="magicdomid1013"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.424252] [  809]     0   809      426       41       4      
        0        0             0 netifd</span></div>
    <div class="ace-line" id="magicdomid1014"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.433254] [  835]     0   835      321       21       4      
        0        0             0 odhcpd</span></div>
    <div class="ace-line" id="magicdomid1015"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.442263] [ 1267]     0  1267      265       10       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid1016"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.451445] [ 1281]     0  1281      282       25       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid1017"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.460627] [ 1282]     0  1282      298       12       3      
        0        0             0 ash</span></div>
    <div class="ace-line" id="magicdomid1018"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.469363] [ 1449]     0  1449      296       12       3      
        0        0             0 ntpd</span></div>
    <div class="ace-line" id="magicdomid1019"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.478189] [ 1512]   453  1512      263       18       3      
        0        0             0 dnsmasq</span></div>
    <div class="ace-line" id="magicdomid1020"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.487286] [ 1864]     0  1864      296       10       3      
        0        0             0 udhcpc</span></div>
    <div class="ace-line" id="magicdomid1021"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.496291] [ 1865]     0  1865      230       11       4      
        0        0             0 odhcp6c</span></div>
    <div class="ace-line" id="magicdomid1022"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.505382] [ 1955]     0  1955      299       27       3      
        0        0             0 fastd</span></div>
    <div class="ace-line" id="magicdomid1023"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.514292] [ 1992]     0  1992      260        9       3      
        0        0             0 ntpd-hotplug</span></div>
    <div class="ace-line" id="magicdomid1024"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.523812] Out of memory: Kill process 809 (netifd) score 6 or
        sacrifice child</span></div>
    <div class="ace-line" id="magicdomid1025"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3551.531387] Killed process 1865 (odhcp6c) total-vm:920kB,
        anon-rss:40kB, file-rss:4kB</span></div>
    <div class="ace-line" id="magicdomid1026"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.130598] udhcpc invoked oom-killer: gfp_mask=0x2420848,
        order=0, oom_score_adj=0</span></div>
    <div class="ace-line" id="magicdomid1027"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.138589] CPU: 0 PID: 1864 Comm: udhcpc Not tainted 4.4.15 #9</span></div>
    <div class="ace-line" id="magicdomid1028"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.144722] Stack : 803bf3a4 00000000 00000001 80410000
        81829180 80406d63 803a0a6c 00000748</span></div>
    <div class="ace-line" id="magicdomid1029"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.144722]    80473798 8183dad4 00000000 00000006 00001b52
        800a6f1c 00000006 803a9390</span></div>
    <div class="ace-line" id="magicdomid1030"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.144722]    00000000 00000000 803a44e4 8183d974 80476542
        800a4e98 804063d0 00000000</span></div>
    <div class="ace-line" id="magicdomid1031"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.144722]    00000001 801f2100 00000000 00000000 00000000
        00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid1032"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.144722]    00000000 00000000 00000000 00000000 00000000
        00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid1035"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.144722]    ...</span></div>
    <div class="ace-line" id="magicdomid824"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.144722]    ...</span></div>
    <div class="ace-line" id="magicdomid825"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.181759] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid826"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.184322] [&lt;80071aa8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid827"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.188829] [&lt;800d39d0&gt;] dump_header.isra.4+0x48/0x130</span></div>
    <div class="ace-line" id="magicdomid828"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.194137] [&lt;800d3db4&gt;] oom_kill_process+0x98/0x43c</span></div>
    <div class="ace-line" id="magicdomid829"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.199282] [&lt;800d44bc&gt;] out_of_memory+0x2e0/0x324</span></div>
    <div class="ace-line" id="magicdomid830"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.204245] [&lt;800d7dbc&gt;]
        __alloc_pages_nodemask+0x684/0x6f0</span></div>
    <div class="ace-line" id="magicdomid831"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.210050] [&lt;800d0f60&gt;] pagecache_get_page+0x154/0x278</span></div>
    <div class="ace-line" id="magicdomid832"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.215482] [&lt;80132218&gt;] __getblk_slow+0x15c/0x374</span></div>
    <div class="ace-line" id="magicdomid833"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.220444] [&lt;80159668&gt;] squashfs_read_data+0x1c8/0x6e8</span></div>
    <div class="ace-line" id="magicdomid834"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.225875] [&lt;8015d878&gt;]
        squashfs_readpage_block+0x32c/0x4d8</span></div>
    <div class="ace-line" id="magicdomid835"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.231726] [&lt;8015b4f4&gt;] squashfs_readpage+0x5bc/0x6d0</span></div>
    <div class="ace-line" id="magicdomid836"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.237068] [&lt;800db554&gt;]
        __do_page_cache_readahead+0x1f8/0x264</span></div>
    <div class="ace-line" id="magicdomid837"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.243103] [&lt;800d2d08&gt;] filemap_fault+0x1ac/0x458</span></div>
    <div class="ace-line" id="magicdomid838"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.248148] [&lt;800ed9a8&gt;] __do_fault+0x3c/0xa8</span></div>
    <div class="ace-line" id="magicdomid839"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.252662] [&lt;800f0c4c&gt;] handle_mm_fault+0x4e4/0xb84</span></div>
    <div class="ace-line" id="magicdomid840"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.257829] [&lt;80076758&gt;] __do_page_fault+0x134/0x470</span></div>
    <div class="ace-line" id="magicdomid841"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.262960] [&lt;80060820&gt;] ret_from_exception+0x0/0x10</span></div>
    <div class="ace-line" id="magicdomid842"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.268102]</span></div>
    <div class="ace-line" id="magicdomid843"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.269646] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid844"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.272015] active_anon:313 inactive_anon:5 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid845"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.272015]  active_<a class="moz-txt-link-freetext" href="file:147">file:147</a> inactive_<a class="moz-txt-link-freetext" href="file:160">file:160</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid846"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.272015]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid847"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.272015]  slab_reclaimable:130 slab_unreclaimable:1207</span></div>
    <div class="ace-line" id="magicdomid848"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.272015]  mapped:15 shmem:65 pagetables:48 bounce:0</span></div>
    <div class="ace-line" id="magicdomid849"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.272015]  free:1024 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid850"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.304640] Normal free:4096kB min:4096kB low:5120kB
        high:6144kB active_anon:1252kB inactive_anon:20kB
        active_<a class="moz-txt-link-freetext" href="file:588kB">file:588kB</a> inactive_<a class="moz-txt-link-freetext" href="file:640kB">file:640kB</a> unevictable:0kB
        isolated(anon):0kB isolated(file):0kB present:32768kB
        managed:27976kB mlocked:0kB dirty:0kB writeback:0kB mapped:60kB
        shmem:260kB slab_reclaimable:520kB slab_unreclaimable:4828kB
        kernel_stack:320kB pagetables:192kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:7888 all_unreclaimable? yes</span></div>
    <div class="ace-line" id="magicdomid851"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.349479] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid852"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.352928] Normal: 138*4kB (U) 113*8kB (U) 79*16kB (UM) 1*32kB
        (U) 7*64kB (UM) 7*128kB (UM) 0*256kB 0*512kB 0*1024kB 0*2048kB
        0*4096kB = 4096kB</span></div>
    <div class="ace-line" id="magicdomid853"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.366486] 372 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid854"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.370272] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid855"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.373692] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid856"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.379099] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid857"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.382076] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid858"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.385066] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid859"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.387865] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid860"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.391824] 1198 pages reserved</span></div>
    <div class="ace-line" id="magicdomid861"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.395087] [ pid ]   uid  tgid total_vm      rss nr_ptes
        nr_pmds swapents oom_score_adj name</span></div>
    <div class="ace-line" id="magicdomid862"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.403906] [  391]     0   391      297       17       3      
        0        0             0 ubusd</span></div>
    <div class="ace-line" id="magicdomid863"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.412819] [  392]     0   392      224       10       4      
        0        0             0 askfirst</span></div>
    <div class="ace-line" id="magicdomid864"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.422002] [  763]     0   763      307       39       4      
        0        0             0 logd</span></div>
    <div class="ace-line" id="magicdomid865"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.430825] [  809]     0   809      426       39       4      
        0        0             0 netifd</span></div>
    <div class="ace-line" id="magicdomid866"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.439841] [  835]     0   835      321       25       4      
        0        0             0 odhcpd</span></div>
    <div class="ace-line" id="magicdomid867"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.448846] [ 1267]     0  1267      265       10       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid868"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.458030] [ 1281]     0  1281      282       25       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid869"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.467214] [ 1282]     0  1282      298       12       3      
        0        0             0 ash</span></div>
    <div class="ace-line" id="magicdomid870"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.475947] [ 1449]     0  1449      296       11       3      
        0        0             0 ntpd</span></div>
    <div class="ace-line" id="magicdomid871"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.484774] [ 1512]   453  1512      263       18       3      
        0        0             0 dnsmasq</span></div>
    <div class="ace-line" id="magicdomid872"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.493852] [ 1864]     0  1864      296       10       3      
        0        0             0 udhcpc</span></div>
    <div class="ace-line" id="magicdomid873"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.502855] [ 1955]     0  1955      299       36       3      
        0        0             0 fastd</span></div>
    <div class="ace-line" id="magicdomid874"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.511772] [ 1992]     0  1992      260        9       3      
        0        0             0 ntpd-hotplug</span></div>
    <div class="ace-line" id="magicdomid875"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.521310] Out of memory: Kill process 763 (logd) score 6 or
        sacrifice child</span></div>
    <div class="ace-line" id="magicdomid876"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3552.528701] Killed process 763 (logd) total-vm:1228kB,
        anon-rss:136kB, file-rss:20kB</span></div>
    <div class="ace-line" id="magicdomid877"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.642313] udhcpc invoked oom-killer: gfp_mask=0x2420848,
        order=0, oom_score_adj=0</span></div>
    <div class="ace-line" id="magicdomid878"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.650305] CPU: 0 PID: 1864 Comm: udhcpc Not tainted 4.4.15 #9</span></div>
    <div class="ace-line" id="magicdomid879"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.656434] Stack : 803bf3a4 00000000 00000001 80410000
        81829180 80406d63 803a0a6c 00000748</span></div>
    <div class="ace-line" id="magicdomid880"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.656434]    80473798 8183dad4 00000000 00000007 00001b52
        800a6f1c 00000006 803a9390</span></div>
    <div class="ace-line" id="magicdomid881"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.656434]    00000000 00000000 803a44e4 8183d974 80476542
        800a4e98 804063d0 00000000</span></div>
    <div class="ace-line" id="magicdomid882"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.656434]    00000001 801f2100 00000000 00000000 00000000
        00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid883"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.656434]    00000000 00000000 00000000 00000000 00000000
        00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid884"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.656434]    ...</span></div>
    <div class="ace-line" id="magicdomid885"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.693461] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid886"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.696023] [&lt;80071aa8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid887"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.700532] [&lt;800d39d0&gt;] dump_header.isra.4+0x48/0x130</span></div>
    <div class="ace-line" id="magicdomid888"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.705857] [&lt;800d3db4&gt;] oom_kill_process+0x98/0x43c</span></div>
    <div class="ace-line" id="magicdomid889"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.710984] [&lt;800d44bc&gt;] out_of_memory+0x2e0/0x324</span></div>
    <div class="ace-line" id="magicdomid890"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.715954] [&lt;800d7dbc&gt;]
        __alloc_pages_nodemask+0x684/0x6f0</span></div>
    <div class="ace-line" id="magicdomid891"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.721739] [&lt;800d0f60&gt;] pagecache_get_page+0x154/0x278</span></div>
    <div class="ace-line" id="magicdomid892"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.727168] [&lt;80132218&gt;] __getblk_slow+0x15c/0x374</span></div>
    <div class="ace-line" id="magicdomid893"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.732128] [&lt;80159668&gt;] squashfs_read_data+0x1c8/0x6e8</span></div>
    <div class="ace-line" id="magicdomid894"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.737549] [&lt;8015d878&gt;]
        squashfs_readpage_block+0x32c/0x4d8</span></div>
    <div class="ace-line" id="magicdomid895"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.743401] [&lt;8015b4f4&gt;] squashfs_readpage+0x5bc/0x6d0</span></div>
    <div class="ace-line" id="magicdomid896"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.748740] [&lt;800db554&gt;]
        __do_page_cache_readahead+0x1f8/0x264</span></div>
    <div class="ace-line" id="magicdomid897"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.754795] [&lt;800d2d08&gt;] filemap_fault+0x1ac/0x458</span></div>
    <div class="ace-line" id="magicdomid898"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.759765] [&lt;800ed9a8&gt;] __do_fault+0x3c/0xa8</span></div>
    <div class="ace-line" id="magicdomid899"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.764283] [&lt;800f0c4c&gt;] handle_mm_fault+0x4e4/0xb84</span></div>
    <div class="ace-line" id="magicdomid900"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.769424] [&lt;80076758&gt;] __do_page_fault+0x134/0x470</span></div>
    <div class="ace-line" id="magicdomid901"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.774570] [&lt;80060820&gt;] ret_from_exception+0x0/0x10</span></div>
    <div class="ace-line" id="magicdomid902"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.779689]</span></div>
    <div class="ace-line" id="magicdomid903"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.781222] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid904"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.783594] active_anon:279 inactive_anon:5 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid905"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.783594]  active_<a class="moz-txt-link-freetext" href="file:171">file:171</a> inactive_<a class="moz-txt-link-freetext" href="file:206">file:206</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid906"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.783594]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid907"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.783594]  slab_reclaimable:131 slab_unreclaimable:1214</span></div>
    <div class="ace-line" id="magicdomid908"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.783594]  mapped:63 shmem:65 pagetables:44 bounce:0</span></div>
    <div class="ace-line" id="magicdomid909"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.783594]  free:1024 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid910"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.816225] Normal free:4096kB min:4096kB low:5120kB
        high:6144kB active_anon:1116kB inactive_anon:20kB
        active_<a class="moz-txt-link-freetext" href="file:684kB">file:684kB</a> inactive_<a class="moz-txt-link-freetext" href="file:824kB">file:824kB</a> unevictable:0kB
        isolated(anon):0kB isolated(file):0kB present:32768kB
        managed:27976kB mlocked:0kB dirty:0kB writeback:0kB mapped:252kB
        shmem:260kB slab_reclaimable:524kB slab_unreclaimable:4856kB
        kernel_stack:312kB pagetables:176kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:9136 all_unreclaimable? yes</span></div>
    <div class="ace-line" id="magicdomid911"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.861151] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid912"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.864604] Normal: 126*4kB (UM) 107*8kB (UE) 81*16kB (UME)
        9*32kB (UE) 6*64kB (UME) 6*128kB (M) 0*256kB 0*512kB 0*1024kB
        0*2048kB 0*4096kB = 4096kB</span></div>
    <div class="ace-line" id="magicdomid913"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.878502] 442 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid914"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.882288] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid915"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.885723] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid916"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.891117] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid917"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.894092] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid918"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.897081] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid919"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.899871] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid920"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.903832] 1198 pages reserved</span></div>
    <div class="ace-line" id="magicdomid921"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.907090] [ pid ]   uid  tgid total_vm      rss nr_ptes
        nr_pmds swapents oom_score_adj name</span></div>
    <div class="ace-line" id="magicdomid922"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.915934] [  391]     0   391      297       19       3      
        0        0             0 ubusd</span></div>
    <div class="ace-line" id="magicdomid923"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.924851] [  392]     0   392      224       10       4      
        0        0             0 askfirst</span></div>
    <div class="ace-line" id="magicdomid924"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.934018] [  809]     0   809      426       37       4      
        0        0             0 netifd</span></div>
    <div class="ace-line" id="magicdomid925"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.943020] [  835]     0   835      321       24       4      
        0        0             0 odhcpd</span></div>
    <div class="ace-line" id="magicdomid926"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.952025] [ 1267]     0  1267      265       10       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid927"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.961208] [ 1281]     0  1281      282       25       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid928"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.970385] [ 1282]     0  1282      298       12       3      
        0        0             0 ash</span></div>
    <div class="ace-line" id="magicdomid929"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.979119] [ 1449]     0  1449      296       10       3      
        0        0             0 ntpd</span></div>
    <div class="ace-line" id="magicdomid930"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.987936] [ 1512]   453  1512      263       50       3      
        0        0             0 dnsmasq</span></div>
    <div class="ace-line" id="magicdomid931"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3554.997021] [ 1864]     0  1864      296        9       3      
        0        0             0 udhcpc</span></div>
    <div class="ace-line" id="magicdomid932"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3555.006017] [ 1955]     0  1955      299       49       3      
        0        0             0 fastd</span></div>
    <div class="ace-line" id="magicdomid933"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3555.014942] [ 1992]     0  1992      260        9       3      
        0        0             0 ntpd-hotplug</span></div>
    <div class="ace-line" id="magicdomid934"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3555.024488] Out of memory: Kill process 1512 (dnsmasq) score 7
        or sacrifice child</span></div>
    <div class="ace-line" id="magicdomid935"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3555.032226] Killed process 1512 (dnsmasq) total-vm:1052kB,
        anon-rss:64kB, file-rss:136kB</span></div>
    <div class="ace-line" id="magicdomid936"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3723.936897] udhcpc invoked oom-killer: gfp_mask=0x2420848,
        order=0, oom_score_adj=0</span></div>
    <div class="ace-line" id="magicdomid937"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3723.944879] CPU: 0 PID: 1864 Comm: udhcpc Not tainted 4.4.15 #9</span></div>
    <div class="ace-line" id="magicdomid938"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3723.950988] Stack : 803bf3a4 00000000 00000001 80410000
        81829180 80406d63 803a0a6c 00000748</span></div>
    <div class="ace-line" id="magicdomid939"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3723.950988]    80473798 8183dad4 00000000 00000005 00001b52
        800a6f1c 00000006 803a9390</span></div>
    <div class="ace-line" id="magicdomid940"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3723.950988]    00000000 00000000 803a44e4 8183d974 80476542
        800a4e98 804063d0 00000000</span></div>
    <div class="ace-line" id="magicdomid941"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3723.950988]    00000001 801f2100 00000000 00000000 00000000
        00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid944"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3723.950988]    00000000 00000000 00000000 00000000 00000000
        00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid822"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3723.950988]    ...</span></div>
    <div class="ace-line" id="magicdomid707"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3723.988055] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid708"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3723.990602] [&lt;80071aa8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid709"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3723.995123] [&lt;800d39d0&gt;] dump_header.isra.4+0x48/0x130</span></div>
    <div class="ace-line" id="magicdomid710"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.000434] [&lt;800d3db4&gt;] oom_kill_process+0x98/0x43c</span></div>
    <div class="ace-line" id="magicdomid711"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.005573] [&lt;800d44bc&gt;] out_of_memory+0x2e0/0x324</span></div>
    <div class="ace-line" id="magicdomid712"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.010532] [&lt;800d7dbc&gt;]
        __alloc_pages_nodemask+0x684/0x6f0</span></div>
    <div class="ace-line" id="magicdomid713"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.016351] [&lt;800d0f60&gt;] pagecache_get_page+0x154/0x278</span></div>
    <div class="ace-line" id="magicdomid714"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.021761] [&lt;80132218&gt;] __getblk_slow+0x15c/0x374</span></div>
    <div class="ace-line" id="magicdomid715"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.026744] [&lt;80159668&gt;] squashfs_read_data+0x1c8/0x6e8</span></div>
    <div class="ace-line" id="magicdomid716"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.032150] [&lt;8015d878&gt;]
        squashfs_readpage_block+0x32c/0x4d8</span></div>
    <div class="ace-line" id="magicdomid717"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.038013] [&lt;8015b4f4&gt;] squashfs_readpage+0x5bc/0x6d0</span></div>
    <div class="ace-line" id="magicdomid718"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.043335] [&lt;800db554&gt;]
        __do_page_cache_readahead+0x1f8/0x264</span></div>
    <div class="ace-line" id="magicdomid719"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.049386] [&lt;800d2d08&gt;] filemap_fault+0x1ac/0x458</span></div>
    <div class="ace-line" id="magicdomid720"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.054371] [&lt;800ed9a8&gt;] __do_fault+0x3c/0xa8</span></div>
    <div class="ace-line" id="magicdomid721"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.058877] [&lt;800f0c4c&gt;] handle_mm_fault+0x4e4/0xb84</span></div>
    <div class="ace-line" id="magicdomid722"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.064018] [&lt;80076758&gt;] __do_page_fault+0x134/0x470</span></div>
    <div class="ace-line" id="magicdomid723"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.069163] [&lt;80060820&gt;] ret_from_exception+0x0/0x10</span></div>
    <div class="ace-line" id="magicdomid724"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.074294]</span></div>
    <div class="ace-line" id="magicdomid725"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.075834] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid726"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.078204] active_anon:290 inactive_anon:5 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid727"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.078204]  active_<a class="moz-txt-link-freetext" href="file:165">file:165</a> inactive_<a class="moz-txt-link-freetext" href="file:206">file:206</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid728"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.078204]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid729"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.078204]  slab_reclaimable:129 slab_unreclaimable:1229</span></div>
    <div class="ace-line" id="magicdomid730"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.078204]  mapped:2 shmem:65 pagetables:54 bounce:0</span></div>
    <div class="ace-line" id="magicdomid731"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.078204]  free:1024 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid732"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.110737] Normal free:4096kB min:4096kB low:5120kB
        high:6144kB active_anon:1160kB inactive_anon:20kB
        active_<a class="moz-txt-link-freetext" href="file:660kB">file:660kB</a> inactive_<a class="moz-txt-link-freetext" href="file:824kB">file:824kB</a> unevictable:0kB
        isolated(anon):0kB isolated(file):0kB present:32768kB
        managed:27976kB mlocked:0kB dirty:0kB writeback:0kB mapped:8kB
        shmem:260kB slab_reclaimable:516kB slab_unreclaimable:4916kB
        kernel_stack:328kB pagetables:216kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:8976 all_unreclaimable? yes</span></div>
    <div class="ace-line" id="magicdomid733"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.155485] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid734"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.158929] Normal: 106*4kB (UE) 103*8kB (UM) 82*16kB (UE)
        24*32kB (UME) 4*64kB (UE) 4*128kB (UM) 0*256kB 0*512kB 0*1024kB
        0*2048kB 0*4096kB = 4096kB</span></div>
    <div class="ace-line" id="magicdomid735"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.172917] 436 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid736"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.176716] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid737"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.180141] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid738"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.185545] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid739"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.188516] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid740"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.191491] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid741"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.194294] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid742"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.198255] 1198 pages reserved</span></div>
    <div class="ace-line" id="magicdomid743"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.201500] [ pid ]   uid  tgid total_vm      rss nr_ptes
        nr_pmds swapents oom_score_adj name</span></div>
    <div class="ace-line" id="magicdomid744"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.210335] [  391]     0   391      297       17       3      
        0        0             0 ubusd</span></div>
    <div class="ace-line" id="magicdomid745"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.219246] [  392]     0   392      224       10       4      
        0        0             0 askfirst</span></div>
    <div class="ace-line" id="magicdomid746"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.228429] [  809]     0   809      426       37       4      
        0        0             0 netifd</span></div>
    <div class="ace-line" id="magicdomid747"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.237434] [  835]     0   835      321       21       4      
        0        0             0 odhcpd</span></div>
    <div class="ace-line" id="magicdomid748"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.246438] [ 1267]     0  1267      265       10       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid749"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.255615] [ 1281]     0  1281      282       25       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid750"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.264797] [ 1282]     0  1282      298       12       3      
        0        0             0 ash</span></div>
    <div class="ace-line" id="magicdomid751"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.273511] [ 1449]     0  1449      296       10       3      
        0        0             0 ntpd</span></div>
    <div class="ace-line" id="magicdomid752"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.282331] [ 1864]     0  1864      296        9       3      
        0        0             0 udhcpc</span></div>
    <div class="ace-line" id="magicdomid753"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.291327] [ 1955]     0  1955      299       26       3      
        0        0             0 fastd</span></div>
    <div class="ace-line" id="magicdomid754"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.300235] [ 1992]     0  1992      296        9       3      
        0        0             0 ntpd-hotplug</span></div>
    <div class="ace-line" id="magicdomid755"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.309778] [ 1994]     0  1994      271       11       3      
        0        0             0 logd</span></div>
    <div class="ace-line" id="magicdomid756"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.318603] [ 1995]     0  1995      255        8       3      
        0        0             0 dnsmasq</span></div>
    <div class="ace-line" id="magicdomid757"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.327696] [ 1996]     0  1996      296        9       4      
        0        0             0 dhcpv6.sh</span></div>
    <div class="ace-line" id="magicdomid758"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.336961] [ 1997]     0  1997      265        9       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid759"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.346131] Out of memory: Kill process 809 (netifd) score 5 or
        sacrifice child</span></div>
    <div class="ace-line" id="magicdomid760"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3724.353693] Killed process 1996 (dhcpv6.sh) total-vm:1184kB,
        anon-rss:32kB, file-rss:4kB</span></div>
    <div class="ace-line" id="magicdomid761"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.609886] odhcpd invoked oom-killer: gfp_mask=0x24201ca,
        order=0, oom_score_adj=0</span></div>
    <div class="ace-line" id="magicdomid762"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.617880] CPU: 0 PID: 835 Comm: odhcpd Not tainted 4.4.15 #9</span></div>
    <div class="ace-line" id="magicdomid763"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.623902] Stack : 803bf3a4 00000000 00000001 80410000
        818eb480 80406d63 803a0a6c 00000343</span></div>
    <div class="ace-line" id="magicdomid764"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.623902]    80473798 80f05d1c 00000000 00000005 00001b52
        800a6f1c 00000006 803a9390</span></div>
    <div class="ace-line" id="magicdomid765"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.623902]    00000000 00000000 803a44e4 80f05bbc 80476542
        800a4e98 804063d0 00000000</span></div>
    <div class="ace-line" id="magicdomid766"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.623902]    00000001 801f2100 00000000 00000000 00000000
        00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid767"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.623902]    00000000 00000000 00000000 00000000 00000000
        00000000 00000000 00000000</span></div>
    <div class="ace-line" id="magicdomid768"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.623902]    ...</span></div>
    <div class="ace-line" id="magicdomid769"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.660968] Call Trace:</span></div>
    <div class="ace-line" id="magicdomid770"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.663516] [&lt;80071aa8&gt;] show_stack+0x50/0x84</span></div>
    <div class="ace-line" id="magicdomid771"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.668038] [&lt;800d39d0&gt;] dump_header.isra.4+0x48/0x130</span></div>
    <div class="ace-line" id="magicdomid772"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.673348] [&lt;800d3db4&gt;] oom_kill_process+0x98/0x43c</span></div>
    <div class="ace-line" id="magicdomid773"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.678496] [&lt;800d44bc&gt;] out_of_memory+0x2e0/0x324</span></div>
    <div class="ace-line" id="magicdomid774"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.683455] [&lt;800d7dbc&gt;]
        __alloc_pages_nodemask+0x684/0x6f0</span></div>
    <div class="ace-line" id="magicdomid775"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.689268] [&lt;800d2db4&gt;] filemap_fault+0x258/0x458</span></div>
    <div class="ace-line" id="magicdomid776"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.694246] [&lt;800ed9a8&gt;] __do_fault+0x3c/0xa8</span></div>
    <div class="ace-line" id="magicdomid777"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.698754] [&lt;800f0c4c&gt;] handle_mm_fault+0x4e4/0xb84</span></div>
    <div class="ace-line" id="magicdomid778"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.703893] [&lt;80076758&gt;] __do_page_fault+0x134/0x470</span></div>
    <div class="ace-line" id="magicdomid779"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.709046] [&lt;80060820&gt;] ret_from_exception+0x0/0x10</span></div>
    <div class="ace-line" id="magicdomid780"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.714179]</span></div>
    <div class="ace-line" id="magicdomid781"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.715713] Mem-Info:</span></div>
    <div class="ace-line" id="magicdomid782"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.718082] active_anon:276 inactive_anon:5 isolated_anon:0</span></div>
    <div class="ace-line" id="magicdomid783"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.718082]  active_<a class="moz-txt-link-freetext" href="file:156">file:156</a> inactive_<a class="moz-txt-link-freetext" href="file:225">file:225</a> isolated_<a class="moz-txt-link-freetext" href="file:0">file:0</a></span></div>
    <div class="ace-line" id="magicdomid784"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.718082]  unevictable:0 dirty:0 writeback:0 unstable:0</span></div>
    <div class="ace-line" id="magicdomid785"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.718082]  slab_reclaimable:129 slab_unreclaimable:1235</span></div>
    <div class="ace-line" id="magicdomid786"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.718082]  mapped:2 shmem:65 pagetables:47 bounce:0</span></div>
    <div class="ace-line" id="magicdomid787"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.718082]  free:1024 free_pcp:0 free_cma:0</span></div>
    <div class="ace-line" id="magicdomid788"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.750612] Normal free:4096kB min:4096kB low:5120kB
        high:6144kB active_anon:1104kB inactive_anon:20kB
        active_<a class="moz-txt-link-freetext" href="file:624kB">file:624kB</a> inactive_<a class="moz-txt-link-freetext" href="file:900kB">file:900kB</a> unevictable:0kB
        isolated(anon):0kB isolated(file):0kB present:32768kB
        managed:27976kB mlocked:0kB dirty:0kB writeback:0kB mapped:8kB
        shmem:260kB slab_reclaimable:516kB slab_unreclaimable:4940kB
        kernel_stack:320kB pagetables:188kB unstable:0kB bounce:0kB
        free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
        pages_scanned:9540 all_unreclaimable? yes</span></div>
    <div class="ace-line" id="magicdomid789"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.795364] lowmem_reserve[]: 0 0</span></div>
    <div class="ace-line" id="magicdomid790"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.798808] Normal: 100*4kB (UME) 98*8kB (UE) 78*16kB (UME)
        34*32kB (UME) 5*64kB (UME) 2*128kB (M) 0*256kB 0*512kB 0*1024kB
        0*2048kB 0*4096kB = 4096kB</span></div>
    <div class="ace-line" id="magicdomid791"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.812885] 446 total pagecache pages</span></div>
    <div class="ace-line" id="magicdomid792"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.816684] 0 pages in swap cache</span></div>
    <div class="ace-line" id="magicdomid793"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.820109] Swap cache stats: add 0, delete 0, find 0/0</span></div>
    <div class="ace-line" id="magicdomid794"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.825514] Free swap  = 0kB</span></div>
    <div class="ace-line" id="magicdomid795"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.828484] Total swap = 0kB</span></div>
    <div class="ace-line" id="magicdomid796"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.831459] 8192 pages RAM</span></div>
    <div class="ace-line" id="magicdomid797"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.834262] 0 pages HighMem/MovableOnly</span></div>
    <div class="ace-line" id="magicdomid798"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.838223] 1198 pages reserved</span></div>
    <div class="ace-line" id="magicdomid799"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.841468] [ pid ]   uid  tgid total_vm      rss nr_ptes
        nr_pmds swapents oom_score_adj name</span></div>
    <div class="ace-line" id="magicdomid800"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.850302] [  391]     0   391      297       17       3      
        0        0             0 ubusd</span></div>
    <div class="ace-line" id="magicdomid801"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.859214] [  392]     0   392      224       10       4      
        0        0             0 askfirst</span></div>
    <div class="ace-line" id="magicdomid802"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.868398] [  809]     0   809      426       37       4      
        0        0             0 netifd</span></div>
    <div class="ace-line" id="magicdomid803"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.877402] [  835]     0   835      321       21       4      
        0        0             0 odhcpd</span></div>
    <div class="ace-line" id="magicdomid804"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.886407] [ 1267]     0  1267      265       10       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid805"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.895593] [ 1281]     0  1281      282       25       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid806"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.904776] [ 1449]     0  1449      296       10       3      
        0        0             0 ntpd</span></div>
    <div class="ace-line" id="magicdomid807"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.913585] [ 1864]     0  1864      296        9       3      
        0        0             0 udhcpc</span></div>
    <div class="ace-line" id="magicdomid808"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.922587] [ 1955]     0  1955      299       26       3      
        0        0             0 fastd</span></div>
    <div class="ace-line" id="magicdomid809"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.931503] [ 1992]     0  1992      296        9       3      
        0        0             0 ntpd-hotplug</span></div>
    <div class="ace-line" id="magicdomid810"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.941045] [ 1994]     0  1994      271       11       3      
        0        0             0 logd</span></div>
    <div class="ace-line" id="magicdomid811"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.949872] [ 1995]     0  1995      255        8       3      
        0        0             0 dnsmasq</span></div>
    <div class="ace-line" id="magicdomid812"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.958966] [ 1998]     0  1998      265        9       3      
        0        0             0 dropbear</span></div>
    <div class="ace-line" id="magicdomid813"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.968143] Out of memory: Kill process 809 (netifd) score 5 or
        sacrifice child</span></div>
    <div class="ace-line" id="magicdomid814"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        3744.975720] Killed process 1864 (udhcpc) total-vm:1184kB,
        anon-rss:32kB, file-rss:4kB</span></div>
    <div class="ace-line" id="magicdomid815"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4518.095013] eth0: link down</span></div>
    <div class="ace-line" id="magicdomid816"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4518.098341] br-lan: port 1(eth0) entered disabled state</span></div>
    <div class="ace-line" id="magicdomid817"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4520.095417] eth0: link up (1000Mbps/Full duplex)</span></div>
    <div class="ace-line" id="magicdomid818"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4520.100261] br-lan: port 1(eth0) entered forwarding state</span></div>
    <div class="ace-line" id="magicdomid819"><span
        class="author-a-z69zqz87zljz77z4z84zz83zz122zaz67zj3z88zz89z">[
        4520.105964] br-lan: port 1(eth0) entered forwarding state</span></div>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption</pre>
  </body>
</html>

--------------1149BC53547E57371C07290A--
