Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7182a65
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Nov 2016 14:27:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb0352a5
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Nov 2016 14:27:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 59e83772
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Nov 2016 14:27:26 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id o141so13622713lff.1
 for <wireguard@lists.zx2c4.com>; Fri, 11 Nov 2016 06:29:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161111070445.GB10286@c3po>
References: <CAHmME9qr1v2pt6Ct8gy8vmQ4=z_yDyQQim0SJCnXRYT0SHNQUw@mail.gmail.com>
 <20161111070445.GB10286@c3po>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 11 Nov 2016 15:29:35 +0100
Message-ID: <CAHmME9p08K4M-+qvRO1kJiTScj66QDmFofu6d6nNK6eANTnYZA@mail.gmail.com>
To: n3ph <n3ph@terminal21.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] OpenWRT/MIPS Improvements
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey n3ph,

I have actually managed to reproduce the OOM situation in the latest
snapshot, which I'll be looking into addressing. More soon.

Regards,
Jason

On Fri, Nov 11, 2016 at 8:04 AM, n3ph <n3ph@terminal21.de> wrote:
>
> Hello Jason!
>
> I was reading the maillist carefully the last weeks and am very happy to
> see that work on this was straightfully ongoing. Big thanks to you and
> all MIPS maintainers!
>
> We will redrive our testbed next week. Hopefully we have good news to
> take back to you but I am very confident in this point ;-)
>
> best regards,
>
>
> n3ph
>
> On Thu, Nov 10, 2016 at 07:40:39PM +0100, Jason A. Donenfeld wrote:
> > Hey Jens & Folks,
> >
> > I now have the same hardware you do, and have been optimizing for it.
> >
> > I am now able to get almost 40mbps using WireGuard, which is
> > incredible. With the latest builds of WireGuard, I haven't been able
> > to trigger these OOM conditions either. Please test and let me how it
> > goes.
> >
> > CCd on this email is k, another LEDE user, who has spoken of general
> > high throughput stability improvements by enabling preemption. This
> > may or may not be related to your issues. But in either case, I think
> > you'll be quite pleased with the latest snapshot just published
> > (20161110).
> >
> > Regards,
> > Jason
> >
> > On Tue, Aug 16, 2016 at 12:46 AM, jens <jens@viisauksena.de> wrote:
> > > to our tests on tp-link841-v11 we tried to test fastd for direct comparison
> > >
> > > again, the setup is
> > >  laptop(iperf3) > tplink841v11 < fastd > tplink841v11 < laptop(iperf3)
> > >
> > > actual lede , fastdv18 both default - both build today
> > > TP-link841v11 is pretty cheap 560Mhz CPU 4 MB Flash, 32 MB RAM
> > >
> > > main result is that wireguard seem to be a little little faster  (TCP iperf)
> > > 15.5 Mbit for wireguard
> > > 14 Mbit for fastd
> > >
> > > but we observe on fastd also that we can crash the system with udp, (like we
> > > reported before for wireguard)
> > > on both systems throwing much udp traffic in the tunnel make the first
> > > tp-link unresponsive with load of 2.5 and much higher, pretty soon oomkiller
> > > kill random processes due to out-of-memory
> > >
> > > so maybe it is not that wireguard has a specific problem, than there is a
> > > general problem with lots of udp traffic
> > >
> > > following the TCP iperf, the udp iperf and the crashlog (dmesg)
> > >
> > > greetings ..
> > >
> > > jens
> > >
> > > fuzzle/ freifunk freiburg
> > >
> > > https://git.universe-factory.net/fastd
> > > http://fastd.readthedocs.org/
> > >
> > > ############################
> > > ####### first old wireguard tests  #####
> > > ############################
> > >
> > > [    0.000000] Linux version 4.4.15 (foo@bar) (gcc version 5.4.0 (LEDE GCC
> > > 5.4.0 r1119) ) #3 Thu Jul 28 01:05:08 UTC 2016
> > >
> > > iperf3 -c 192.168.2.23 -p 4000 -u -b 500M
> > > Connecting to host 192.168.2.23, port 4000
> > > [  4] local 192.168.1.23 port 52916 connected to 192.168.2.23 port 4000
> > > [ ID] Interval           Transfer     Bandwidth       Total Datagrams
> > > [  4]   0.00-1.00   sec  10.3 MBytes  86.6 Mbits/sec  1321
> > > [  4]   1.00-2.00   sec  11.4 MBytes  95.6 Mbits/sec  1459
> > > [  4]   2.00-3.00   sec  11.4 MBytes  95.6 Mbits/sec  1459
> > > [  4]   3.00-4.00   sec  11.4 MBytes  95.6 Mbits/sec  1458
> > > [  4]   4.00-5.00   sec  11.4 MBytes  95.6 Mbits/sec  1459
> > > [  4]   5.00-6.00   sec  11.4 MBytes  95.6 Mbits/sec  1459
> > > [  4]   6.00-7.00   sec  11.4 MBytes  95.6 Mbits/sec  1458
> > > [  4]   7.00-8.00   sec  11.4 MBytes  95.6 Mbits/sec  1459
> > > [  4]   8.00-9.00   sec  11.4 MBytes  95.6 Mbits/sec  1459
> > > [  4]   9.00-10.00  sec  11.4 MBytes  95.6 Mbits/sec  1459
> > > - - - - - - - - - - - - - - - - - - - - - - - - -
> > > [ ID] Interval           Transfer     Bandwidth       Jitter    Lost/Total
> > > Datagrams
> > > [  4]   0.00-10.00  sec   113 MBytes  94.7 Mbits/sec  3.981 ms  12138/14140
> > > (86%)
> > > [  4] Sent 14140 datagrams
> > >
> > > Server listening on 4000
> > > -----------------------------------------------------------
> > > Accepted connection from 192.168.1.23, port 52430
> > > [  5] local 192.168.2.23 port 4000 connected to 192.168.1.23 port 52916
> > > [ ID] Interval           Transfer     Bandwidth       Jitter    Lost/Total
> > > Datagrams
> > > [  5]   0.00-1.00   sec  2.38 MBytes  19.9 Mbits/sec  3.077 ms  783/1087
> > > (72%)
> > > [  5]   1.00-2.00   sec  3.17 MBytes  26.6 Mbits/sec  2.790 ms  1124/1530
> > > (73%)
> > > [  5]   2.00-3.00   sec  2.87 MBytes  24.1 Mbits/sec  3.588 ms  990/1357
> > > (73%)
> > > [  5]   3.00-4.00   sec  1.91 MBytes  16.0 Mbits/sec  3.824 ms  1207/1451
> > > (83%)
> > > [  5]   4.00-5.00   sec   656 KBytes  5.37 Mbits/sec  4.489 ms  1451/1533
> > > (95%)
> > > [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec  4.489 ms  0/0 (-nan%)
> > > [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec  4.489 ms  0/0 (-nan%)
> > > [  5]   7.00-8.00   sec  1.07 MBytes  8.98 Mbits/sec  2.991 ms  4254/4391
> > > (97%)
> > > [  5]   8.00-9.00   sec  2.05 MBytes  17.2 Mbits/sec  4.438 ms  724/986
> > > (73%)
> > > [  5]   9.00-10.00  sec  1.56 MBytes  13.1 Mbits/sec  3.981 ms  1605/1805
> > > (89%)
> > > [  5]  10.00-10.17  sec  0.00 Bytes  0.00 bits/sec  3.981 ms  0/0 (-nan%)
> > > - - - - - - - - - - - - - - - - - - - - - - - - -
> > > [ ID] Interval           Transfer     Bandwidth       Jitter    Lost/Total
> > > Datagrams
> > > [  5]   0.00-10.17  sec   113 MBytes  93.1 Mbits/sec  3.981 ms  12138/14140
> > > (86%)
> > >
> > > 0_k@K:~/wiki/freifunk$ iperf3 -c 192.168.2.23 -p 4000
> > > Connecting to host 192.168.2.23, port 4000
> > > [  4] local 192.168.1.23 port 52448 connected to 192.168.2.23 port 4000
> > > [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
> > > [  4]   0.00-1.00   sec  2.05 MBytes  17.2 Mbits/sec   59   13.4 KBytes
> > > [  4]   1.00-2.00   sec  1.92 MBytes  16.1 Mbits/sec   87   6.69 KBytes
> > > [  4]   2.00-3.00   sec  1.86 MBytes  15.6 Mbits/sec   82   9.37 KBytes
> > > [  4]   3.00-4.00   sec  1.92 MBytes  16.1 Mbits/sec   86   6.69 KBytes
> > > [  4]   4.00-5.00   sec  1.85 MBytes  15.5 Mbits/sec   88   5.36 KBytes
> > > [  4]   5.00-6.00   sec  1.83 MBytes  15.4 Mbits/sec   84   5.36 KBytes
> > > [  4]   6.00-7.00   sec  1.89 MBytes  15.9 Mbits/sec   79   8.03 KBytes
> > > [  4]   7.00-8.00   sec  1.85 MBytes  15.5 Mbits/sec   87   8.03 KBytes
> > > [  4]   8.00-9.00   sec  1.84 MBytes  15.4 Mbits/sec   79   8.03 KBytes
> > > [  4]   9.00-10.00  sec  1.86 MBytes  15.6 Mbits/sec   75   8.03 KBytes
> > > - - - - - - - - - - - - - - - - - - - - - - - - -
> > > [ ID] Interval           Transfer     Bandwidth       Retr
> > > [  4]   0.00-10.00  sec  18.9 MBytes  15.8 Mbits/sec  806             sender
> > > [  4]   0.00-10.00  sec  18.7 MBytes  15.7 Mbits/sec
> > > receiver
> > >
> > >
> > > ############################
> > > ############################
> > > ############################
> > > ############################
> > > ############################
> > >
> > > FASTD Test
> > >
> > > ##### fastd server script
> > > #!/bin/sh
> > > ifconfig eth1 10.0.0.2 netmask 255.255.255.0
> > > cat <<EOF > /tmp/fastdserver.conf
> > > bind 0.0.0.0:1234;
> > > mode tap;
> > > method "salsa2012+umac";
> > > method "null+salsa2012+umac";
> > > mtu 1426;
> > > forward yes;
> > > secret "a030db009057d0cc36ecef65ca05d4019c03392694b035d968962ed161dd5353";
> > > # user "nobody";
> > > log to syslog level info;
> > > include peers from "peers";
> > > interface "vpn";
> > > on up "
> > >   ip link set up $INTERFACE
> > >   ip addr add 10.10.0.2/24 dev $INTERFACE
> > > ";
> > > EOF
> > > mkdir -p /tmp/peers
> > > cat <<EOF > /tmp/peers/foo
> > > key "12218a16b0adbbf1141ada628c48540fcf2f0e706c97f5fdace77205406cd809";
> > > EOF
> > > fastd -d -c /tmp/fastdpeer.conf
> > >
> > >
> > > #### fastd client script
> > > #!/bin/sh
> > > ifconfig eth1 10.0.0.1 netmask 255.255.255.0
> > > cat <<EOF > /tmp/fastdpeer.conf
> > > interface "mesh-vpn";
> > > mtu 1426;
> > > log level debug;
> > > method "salsa2012+umac";
> > > method "null+salsa2012+umac";
> > > on up "
> > >   ip link set up mesh-vpn
> > >   ip addr add 10.10.0.1/24 dev mesh-vpn
> > > ";
> > > EOF
> > > mkdir -p /tmp/peers
> > > cat <<EOF > /tmp/peers/foo
> > > key "17076456b892b30876cd69b8387e1d9dc93ba067225ba22208a094fb376ad7cb";
> > > remote 10.0.0.2:1234;
> > > EOF
> > > fastd -d -c /tmp/fastdpeer.conf
> > >
> > > ####### you need to set ip route on laptop and tp-link accordingly
> > >
> > > ####### tcp test
> > >
> > > # iperf3 -c 192.168.2.23
> > > Connecting to host 192.168.2.23, port 5201
> > > [  4] local 192.168.1.23 port 53678 connected to 192.168.2.23 port 5201
> > > [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
> > > [  4]   0.00-1.00   sec  1.91 MBytes  16.0 Mbits/sec    0    109 KBytes
> > > [  4]   1.00-2.00   sec  1.85 MBytes  15.5 Mbits/sec    0    189 KBytes
> > > [  4]   2.00-3.00   sec  1.79 MBytes  15.0 Mbits/sec    0    271 KBytes
> > > [  4]   3.00-4.00   sec  1.85 MBytes  15.5 Mbits/sec    0    352 KBytes
> > > [  4]   4.00-5.00   sec  1.79 MBytes  15.0 Mbits/sec    0    433 KBytes
> > > [  4]   5.00-6.00   sec  1.85 MBytes  15.5 Mbits/sec    0    514 KBytes
> > > [  4]   6.00-7.00   sec  1.79 MBytes  15.0 Mbits/sec    0    594 KBytes
> > > [  4]   7.00-8.00   sec  1.85 MBytes  15.5 Mbits/sec    0    676 KBytes
> > > [  4]   8.00-9.00   sec  1.79 MBytes  15.0 Mbits/sec    0    757 KBytes
> > > [  4]   9.00-10.00  sec  1.85 MBytes  15.5 Mbits/sec    0    839 KBytes
> > > - - - - - - - - - - - - - - - - - - - - - - - - -
> > > [ ID] Interval           Transfer     Bandwidth       Retr
> > > [  4]   0.00-10.00  sec  18.3 MBytes  15.3 Mbits/sec    0             sender
> > > [  4]   0.00-10.00  sec  16.7 MBytes  14.0 Mbits/sec
> > > receiver
> > > iperf Done.
> > >
> > > ######## udp following
> > >
> > > -----------------------------------------------------------
> > > Server listening on 5201
> > > -----------------------------------------------------------
> > > Accepted connection from 192.168.1.23, port 53700
> > > [  5] local 192.168.2.23 port 5201 connected to 192.168.1.23 port 54213
> > > [ ID] Interval           Transfer     Bandwidth       Jitter    Lost/Total
> > > Datagrams
> > > [  5]   0.00-1.00   sec  1.60 MBytes  13.4 Mbits/sec  2.829 ms  0/205 (0%)
> > > [  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > > [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > > [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > > [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > > [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > > [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > > [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > > [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > > [  5]   9.00-10.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > > [  5]  10.00-11.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > > [  5]  11.00-12.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > > [  5]  12.00-13.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > > [  5]  13.00-14.00  sec  0.00 Bytes  0.00 bits/sec  2.829 ms  0/0 (-nan%)
> > >
> > >
> > >
> > > ########
> > > [   16.886432] jffs2_scan_eraseblock(): End of filesystem marker found at
> > > 0x0
> > > [   16.893692] jffs2_build_filesystem(): unlocking the mtd device... done.
> > > [   16.900556] jffs2_build_filesystem(): erasing all blocks after the end
> > > marker... done.
> > > [   20.120013] jffs2: notice: (863) jffs2_build_xattr_subsystem: complete
> > > building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref
> > > (0 dead, 0 orphan) found.
> > > [   21.402037] device eth0 entered promiscuous mode
> > > [   21.426164] IPv6: ADDRCONF(NETDEV_UP): br-lan: link is not ready
> > > [   21.533476] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
> > > [   23.521710] eth0: link up (1000Mbps/Full duplex)
> > > [   23.526563] br-lan: port 1(eth0) entered forwarding state
> > > [   23.532242] br-lan: port 1(eth0) entered forwarding state
> > > [   23.559247] IPv6: ADDRCONF(NETDEV_CHANGE): br-lan: link becomes ready
> > > [   24.232715] eth1: link up (100Mbps/Full duplex)
> > > [   24.237450] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
> > > [   25.529282] br-lan: port 1(eth0) entered forwarding state
> > > [   61.939236] random: nonblocking pool is initialized
> > > [  787.348920] eth1: link down
> > > [  789.350353] eth1: link up (100Mbps/Full duplex)
> > >
> > > [ 1767.367603] eth1: link down
> > > [ 1773.369029] eth1: link up (100Mbps/Full duplex)
> > > [ 1777.367595] eth1: link down
> > > [ 1778.369029] eth1: link up (100Mbps/Full duplex)
> > > [ 1781.367592] eth1: link down
> > > [ 1782.369026] eth1: link up (100Mbps/Full duplex)
> > > [ 1790.367591] eth1: link down
> > > [ 1791.369019] eth1: link up (100Mbps/Full duplex)
> > > [ 1794.367583] eth1: link down
> > > [ 1795.369025] eth1: link up (100Mbps/Full duplex)
> > > [ 1950.367465] eth1: link down
> > > [ 1951.368904] eth1: link up (100Mbps/Full duplex)
> > > [ 1953.367468] eth1: link down
> > > [ 1954.368901] eth1: link up (100Mbps/Full duplex)
> > > [ 2100.367360] eth1: link down
> > > [ 2101.368798] eth1: link up (100Mbps/Full duplex)
> > > [ 2103.367362] eth1: link down
> > > [ 2104.368796] eth1: link up (100Mbps/Full duplex)
> > > [ 3551.124559] udhcpc invoked oom-killer: gfp_mask=0x2420848, order=0,
> > > oom_score_adj=0
> > > [ 3551.132491] CPU: 0 PID: 1864 Comm: udhcpc Not tainted 4.4.15 #9
> > > [ 3551.138648] Stack : 803bf3a4 00000000 00000001 80410000 81829180 80406d63
> > > 803a0a6c 00000748
> > > [ 3551.138648]    80473798 8183dad4 00000000 00000006 00001b52 800a6f1c
> > > 00000006 803a9390
> > > [ 3551.138648]    00000000 00000000 803a44e4 8183d974 80476542 800a4e98
> > > 804063d0 00000000
> > > [ 3551.138648]    00000001 801f2100 00000000 00000000 00000000 00000000
> > > 00000000 00000000
> > > [ 3551.138648]    00000000 00000000 00000000 00000000 00000000 00000000
> > > 00000000 00000000
> > > [ 3551.138648]    ...
> > > [ 3551.175694] Call Trace:
> > > [ 3551.178242] [<80071aa8>] show_stack+0x50/0x84
> > > [ 3551.182747] [<800d39d0>] dump_header.isra.4+0x48/0x130
> > > [ 3551.188072] [<800d3db4>] oom_kill_process+0x98/0x43c
> > > [ 3551.193208] [<800d44bc>] out_of_memory+0x2e0/0x324
> > > [ 3551.198188] [<800d7dbc>] __alloc_pages_nodemask+0x684/0x6f0
> > > [ 3551.203981] [<800d0f60>] pagecache_get_page+0x154/0x278
> > > [ 3551.209410] [<80132218>] __getblk_slow+0x15c/0x374
> > > [ 3551.214388] [<80159668>] squashfs_read_data+0x1c8/0x6e8
> > > [ 3551.219798] [<8015d878>] squashfs_readpage_block+0x32c/0x4d8
> > > [ 3551.225662] [<8015b4f4>] squashfs_readpage+0x5bc/0x6d0
> > > [ 3551.230984] [<800db554>] __do_page_cache_readahead+0x1f8/0x264
> > > [ 3551.237037] [<800d2d08>] filemap_fault+0x1ac/0x458
> > > [ 3551.242004] [<800ed9a8>] __do_fault+0x3c/0xa8
> > > [ 3551.246622] [<800f0c4c>] handle_mm_fault+0x4e4/0xb84
> > > [ 3551.251772] [<80076758>] __do_page_fault+0x134/0x470
> > > [ 3551.256936] [<80060820>] ret_from_exception+0x0/0x10
> > > [ 3551.262057]
> > > [ 3551.263599] Mem-Info:
> > > [ 3551.265992] active_anon:323 inactive_anon:5 isolated_anon:0
> > > [ 3551.265992]  active_file:102 inactive_file:160 isolated_file:0
> > > [ 3551.265992]  unevictable:0 dirty:0 writeback:0 unstable:0
> > > [ 3551.265992]  slab_reclaimable:130 slab_unreclaimable:1213
> > > [ 3551.265992]  mapped:8 shmem:65 pagetables:52 bounce:0
> > > [ 3551.265992]  free:1024 free_pcp:0 free_cma:0
> > > [ 3551.298530] Normal free:4096kB min:4096kB low:5120kB high:6144kB
> > > active_anon:1292kB inactive_anon:20kB active_file:408kB inactive_file:640kB
> > > unevictable:0kB isolated(anon):0kB isolated(file):0kB present:32768kB
> > > managed:27976kB mlocked:0kB dirty:0kB writeback:0kB mapped:32kB shmem:260kB
> > > slab_reclaimable:520kB slab_unreclaimable:4852kB kernel_stack:320kB
> > > pagetables:208kB unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB
> > > free_cma:0kB writeback_tmp:0kB pages_scanned:6320 all_unreclaimable? yes
> > > [ 3551.343370] lowmem_reserve[]: 0 0
> > > [ 3551.346837] Normal: 128*4kB (U) 114*8kB (U) 79*16kB (U) 0*32kB 8*64kB
> > > (UM) 7*128kB (UM) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 4096kB
> > > [ 3551.359919] 331 total pagecache pages
> > > [ 3551.363704] 0 pages in swap cache
> > > [ 3551.367141] Swap cache stats: add 0, delete 0, find 0/0
> > > [ 3551.372536] Free swap  = 0kB
> > > [ 3551.375524] Total swap = 0kB
> > > [ 3551.378493] 8192 pages RAM
> > > [ 3551.381289] 0 pages HighMem/MovableOnly
> > > [ 3551.385268] 1198 pages reserved
> > > [ 3551.388512] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
> > > swapents oom_score_adj name
> > > [ 3551.397349] [  391]     0   391      297       17       3       0
> > > 0             0 ubusd
> > > [ 3551.406260] [  392]     0   392      224       10       4       0
> > > 0             0 askfirst
> > > [ 3551.415443] [  763]     0   763      307       35       4       0
> > > 0             0 logd
> > > [ 3551.424252] [  809]     0   809      426       41       4       0
> > > 0             0 netifd
> > > [ 3551.433254] [  835]     0   835      321       21       4       0
> > > 0             0 odhcpd
> > > [ 3551.442263] [ 1267]     0  1267      265       10       3       0
> > > 0             0 dropbear
> > > [ 3551.451445] [ 1281]     0  1281      282       25       3       0
> > > 0             0 dropbear
> > > [ 3551.460627] [ 1282]     0  1282      298       12       3       0
> > > 0             0 ash
> > > [ 3551.469363] [ 1449]     0  1449      296       12       3       0
> > > 0             0 ntpd
> > > [ 3551.478189] [ 1512]   453  1512      263       18       3       0
> > > 0             0 dnsmasq
> > > [ 3551.487286] [ 1864]     0  1864      296       10       3       0
> > > 0             0 udhcpc
> > > [ 3551.496291] [ 1865]     0  1865      230       11       4       0
> > > 0             0 odhcp6c
> > > [ 3551.505382] [ 1955]     0  1955      299       27       3       0
> > > 0             0 fastd
> > > [ 3551.514292] [ 1992]     0  1992      260        9       3       0
> > > 0             0 ntpd-hotplug
> > > [ 3551.523812] Out of memory: Kill process 809 (netifd) score 6 or sacrifice
> > > child
> > > [ 3551.531387] Killed process 1865 (odhcp6c) total-vm:920kB, anon-rss:40kB,
> > > file-rss:4kB
> > > [ 3552.130598] udhcpc invoked oom-killer: gfp_mask=0x2420848, order=0,
> > > oom_score_adj=0
> > > [ 3552.138589] CPU: 0 PID: 1864 Comm: udhcpc Not tainted 4.4.15 #9
> > > [ 3552.144722] Stack : 803bf3a4 00000000 00000001 80410000 81829180 80406d63
> > > 803a0a6c 00000748
> > > [ 3552.144722]    80473798 8183dad4 00000000 00000006 00001b52 800a6f1c
> > > 00000006 803a9390
> > > [ 3552.144722]    00000000 00000000 803a44e4 8183d974 80476542 800a4e98
> > > 804063d0 00000000
> > > [ 3552.144722]    00000001 801f2100 00000000 00000000 00000000 00000000
> > > 00000000 00000000
> > > [ 3552.144722]    00000000 00000000 00000000 00000000 00000000 00000000
> > > 00000000 00000000
> > > [ 3552.144722]    ...
> > > [ 3552.144722]    ...
> > > [ 3552.181759] Call Trace:
> > > [ 3552.184322] [<80071aa8>] show_stack+0x50/0x84
> > > [ 3552.188829] [<800d39d0>] dump_header.isra.4+0x48/0x130
> > > [ 3552.194137] [<800d3db4>] oom_kill_process+0x98/0x43c
> > > [ 3552.199282] [<800d44bc>] out_of_memory+0x2e0/0x324
> > > [ 3552.204245] [<800d7dbc>] __alloc_pages_nodemask+0x684/0x6f0
> > > [ 3552.210050] [<800d0f60>] pagecache_get_page+0x154/0x278
> > > [ 3552.215482] [<80132218>] __getblk_slow+0x15c/0x374
> > > [ 3552.220444] [<80159668>] squashfs_read_data+0x1c8/0x6e8
> > > [ 3552.225875] [<8015d878>] squashfs_readpage_block+0x32c/0x4d8
> > > [ 3552.231726] [<8015b4f4>] squashfs_readpage+0x5bc/0x6d0
> > > [ 3552.237068] [<800db554>] __do_page_cache_readahead+0x1f8/0x264
> > > [ 3552.243103] [<800d2d08>] filemap_fault+0x1ac/0x458
> > > [ 3552.248148] [<800ed9a8>] __do_fault+0x3c/0xa8
> > > [ 3552.252662] [<800f0c4c>] handle_mm_fault+0x4e4/0xb84
> > > [ 3552.257829] [<80076758>] __do_page_fault+0x134/0x470
> > > [ 3552.262960] [<80060820>] ret_from_exception+0x0/0x10
> > > [ 3552.268102]
> > > [ 3552.269646] Mem-Info:
> > > [ 3552.272015] active_anon:313 inactive_anon:5 isolated_anon:0
> > > [ 3552.272015]  active_file:147 inactive_file:160 isolated_file:0
> > > [ 3552.272015]  unevictable:0 dirty:0 writeback:0 unstable:0
> > > [ 3552.272015]  slab_reclaimable:130 slab_unreclaimable:1207
> > > [ 3552.272015]  mapped:15 shmem:65 pagetables:48 bounce:0
> > > [ 3552.272015]  free:1024 free_pcp:0 free_cma:0
> > > [ 3552.304640] Normal free:4096kB min:4096kB low:5120kB high:6144kB
> > > active_anon:1252kB inactive_anon:20kB active_file:588kB inactive_file:640kB
> > > unevictable:0kB isolated(anon):0kB isolated(file):0kB present:32768kB
> > > managed:27976kB mlocked:0kB dirty:0kB writeback:0kB mapped:60kB shmem:260kB
> > > slab_reclaimable:520kB slab_unreclaimable:4828kB kernel_stack:320kB
> > > pagetables:192kB unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB
> > > free_cma:0kB writeback_tmp:0kB pages_scanned:7888 all_unreclaimable? yes
> > > [ 3552.349479] lowmem_reserve[]: 0 0
> > > [ 3552.352928] Normal: 138*4kB (U) 113*8kB (U) 79*16kB (UM) 1*32kB (U)
> > > 7*64kB (UM) 7*128kB (UM) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 4096kB
> > > [ 3552.366486] 372 total pagecache pages
> > > [ 3552.370272] 0 pages in swap cache
> > > [ 3552.373692] Swap cache stats: add 0, delete 0, find 0/0
> > > [ 3552.379099] Free swap  = 0kB
> > > [ 3552.382076] Total swap = 0kB
> > > [ 3552.385066] 8192 pages RAM
> > > [ 3552.387865] 0 pages HighMem/MovableOnly
> > > [ 3552.391824] 1198 pages reserved
> > > [ 3552.395087] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
> > > swapents oom_score_adj name
> > > [ 3552.403906] [  391]     0   391      297       17       3       0
> > > 0             0 ubusd
> > > [ 3552.412819] [  392]     0   392      224       10       4       0
> > > 0             0 askfirst
> > > [ 3552.422002] [  763]     0   763      307       39       4       0
> > > 0             0 logd
> > > [ 3552.430825] [  809]     0   809      426       39       4       0
> > > 0             0 netifd
> > > [ 3552.439841] [  835]     0   835      321       25       4       0
> > > 0             0 odhcpd
> > > [ 3552.448846] [ 1267]     0  1267      265       10       3       0
> > > 0             0 dropbear
> > > [ 3552.458030] [ 1281]     0  1281      282       25       3       0
> > > 0             0 dropbear
> > > [ 3552.467214] [ 1282]     0  1282      298       12       3       0
> > > 0             0 ash
> > > [ 3552.475947] [ 1449]     0  1449      296       11       3       0
> > > 0             0 ntpd
> > > [ 3552.484774] [ 1512]   453  1512      263       18       3       0
> > > 0             0 dnsmasq
> > > [ 3552.493852] [ 1864]     0  1864      296       10       3       0
> > > 0             0 udhcpc
> > > [ 3552.502855] [ 1955]     0  1955      299       36       3       0
> > > 0             0 fastd
> > > [ 3552.511772] [ 1992]     0  1992      260        9       3       0
> > > 0             0 ntpd-hotplug
> > > [ 3552.521310] Out of memory: Kill process 763 (logd) score 6 or sacrifice
> > > child
> > > [ 3552.528701] Killed process 763 (logd) total-vm:1228kB, anon-rss:136kB,
> > > file-rss:20kB
> > > [ 3554.642313] udhcpc invoked oom-killer: gfp_mask=0x2420848, order=0,
> > > oom_score_adj=0
> > > [ 3554.650305] CPU: 0 PID: 1864 Comm: udhcpc Not tainted 4.4.15 #9
> > > [ 3554.656434] Stack : 803bf3a4 00000000 00000001 80410000 81829180 80406d63
> > > 803a0a6c 00000748
> > > [ 3554.656434]    80473798 8183dad4 00000000 00000007 00001b52 800a6f1c
> > > 00000006 803a9390
> > > [ 3554.656434]    00000000 00000000 803a44e4 8183d974 80476542 800a4e98
> > > 804063d0 00000000
> > > [ 3554.656434]    00000001 801f2100 00000000 00000000 00000000 00000000
> > > 00000000 00000000
> > > [ 3554.656434]    00000000 00000000 00000000 00000000 00000000 00000000
> > > 00000000 00000000
> > > [ 3554.656434]    ...
> > > [ 3554.693461] Call Trace:
> > > [ 3554.696023] [<80071aa8>] show_stack+0x50/0x84
> > > [ 3554.700532] [<800d39d0>] dump_header.isra.4+0x48/0x130
> > > [ 3554.705857] [<800d3db4>] oom_kill_process+0x98/0x43c
> > > [ 3554.710984] [<800d44bc>] out_of_memory+0x2e0/0x324
> > > [ 3554.715954] [<800d7dbc>] __alloc_pages_nodemask+0x684/0x6f0
> > > [ 3554.721739] [<800d0f60>] pagecache_get_page+0x154/0x278
> > > [ 3554.727168] [<80132218>] __getblk_slow+0x15c/0x374
> > > [ 3554.732128] [<80159668>] squashfs_read_data+0x1c8/0x6e8
> > > [ 3554.737549] [<8015d878>] squashfs_readpage_block+0x32c/0x4d8
> > > [ 3554.743401] [<8015b4f4>] squashfs_readpage+0x5bc/0x6d0
> > > [ 3554.748740] [<800db554>] __do_page_cache_readahead+0x1f8/0x264
> > > [ 3554.754795] [<800d2d08>] filemap_fault+0x1ac/0x458
> > > [ 3554.759765] [<800ed9a8>] __do_fault+0x3c/0xa8
> > > [ 3554.764283] [<800f0c4c>] handle_mm_fault+0x4e4/0xb84
> > > [ 3554.769424] [<80076758>] __do_page_fault+0x134/0x470
> > > [ 3554.774570] [<80060820>] ret_from_exception+0x0/0x10
> > > [ 3554.779689]
> > > [ 3554.781222] Mem-Info:
> > > [ 3554.783594] active_anon:279 inactive_anon:5 isolated_anon:0
> > > [ 3554.783594]  active_file:171 inactive_file:206 isolated_file:0
> > > [ 3554.783594]  unevictable:0 dirty:0 writeback:0 unstable:0
> > > [ 3554.783594]  slab_reclaimable:131 slab_unreclaimable:1214
> > > [ 3554.783594]  mapped:63 shmem:65 pagetables:44 bounce:0
> > > [ 3554.783594]  free:1024 free_pcp:0 free_cma:0
> > > [ 3554.816225] Normal free:4096kB min:4096kB low:5120kB high:6144kB
> > > active_anon:1116kB inactive_anon:20kB active_file:684kB inactive_file:824kB
> > > unevictable:0kB isolated(anon):0kB isolated(file):0kB present:32768kB
> > > managed:27976kB mlocked:0kB dirty:0kB writeback:0kB mapped:252kB shmem:260kB
> > > slab_reclaimable:524kB slab_unreclaimable:4856kB kernel_stack:312kB
> > > pagetables:176kB unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB
> > > free_cma:0kB writeback_tmp:0kB pages_scanned:9136 all_unreclaimable? yes
> > > [ 3554.861151] lowmem_reserve[]: 0 0
> > > [ 3554.864604] Normal: 126*4kB (UM) 107*8kB (UE) 81*16kB (UME) 9*32kB (UE)
> > > 6*64kB (UME) 6*128kB (M) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 4096kB
> > > [ 3554.878502] 442 total pagecache pages
> > > [ 3554.882288] 0 pages in swap cache
> > > [ 3554.885723] Swap cache stats: add 0, delete 0, find 0/0
> > > [ 3554.891117] Free swap  = 0kB
> > > [ 3554.894092] Total swap = 0kB
> > > [ 3554.897081] 8192 pages RAM
> > > [ 3554.899871] 0 pages HighMem/MovableOnly
> > > [ 3554.903832] 1198 pages reserved
> > > [ 3554.907090] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
> > > swapents oom_score_adj name
> > > [ 3554.915934] [  391]     0   391      297       19       3       0
> > > 0             0 ubusd
> > > [ 3554.924851] [  392]     0   392      224       10       4       0
> > > 0             0 askfirst
> > > [ 3554.934018] [  809]     0   809      426       37       4       0
> > > 0             0 netifd
> > > [ 3554.943020] [  835]     0   835      321       24       4       0
> > > 0             0 odhcpd
> > > [ 3554.952025] [ 1267]     0  1267      265       10       3       0
> > > 0             0 dropbear
> > > [ 3554.961208] [ 1281]     0  1281      282       25       3       0
> > > 0             0 dropbear
> > > [ 3554.970385] [ 1282]     0  1282      298       12       3       0
> > > 0             0 ash
> > > [ 3554.979119] [ 1449]     0  1449      296       10       3       0
> > > 0             0 ntpd
> > > [ 3554.987936] [ 1512]   453  1512      263       50       3       0
> > > 0             0 dnsmasq
> > > [ 3554.997021] [ 1864]     0  1864      296        9       3       0
> > > 0             0 udhcpc
> > > [ 3555.006017] [ 1955]     0  1955      299       49       3       0
> > > 0             0 fastd
> > > [ 3555.014942] [ 1992]     0  1992      260        9       3       0
> > > 0             0 ntpd-hotplug
> > > [ 3555.024488] Out of memory: Kill process 1512 (dnsmasq) score 7 or
> > > sacrifice child
> > > [ 3555.032226] Killed process 1512 (dnsmasq) total-vm:1052kB, anon-rss:64kB,
> > > file-rss:136kB
> > > [ 3723.936897] udhcpc invoked oom-killer: gfp_mask=0x2420848, order=0,
> > > oom_score_adj=0
> > > [ 3723.944879] CPU: 0 PID: 1864 Comm: udhcpc Not tainted 4.4.15 #9
> > > [ 3723.950988] Stack : 803bf3a4 00000000 00000001 80410000 81829180 80406d63
> > > 803a0a6c 00000748
> > > [ 3723.950988]    80473798 8183dad4 00000000 00000005 00001b52 800a6f1c
> > > 00000006 803a9390
> > > [ 3723.950988]    00000000 00000000 803a44e4 8183d974 80476542 800a4e98
> > > 804063d0 00000000
> > > [ 3723.950988]    00000001 801f2100 00000000 00000000 00000000 00000000
> > > 00000000 00000000
> > > [ 3723.950988]    00000000 00000000 00000000 00000000 00000000 00000000
> > > 00000000 00000000
> > > [ 3723.950988]    ...
> > > [ 3723.988055] Call Trace:
> > > [ 3723.990602] [<80071aa8>] show_stack+0x50/0x84
> > > [ 3723.995123] [<800d39d0>] dump_header.isra.4+0x48/0x130
> > > [ 3724.000434] [<800d3db4>] oom_kill_process+0x98/0x43c
> > > [ 3724.005573] [<800d44bc>] out_of_memory+0x2e0/0x324
> > > [ 3724.010532] [<800d7dbc>] __alloc_pages_nodemask+0x684/0x6f0
> > > [ 3724.016351] [<800d0f60>] pagecache_get_page+0x154/0x278
> > > [ 3724.021761] [<80132218>] __getblk_slow+0x15c/0x374
> > > [ 3724.026744] [<80159668>] squashfs_read_data+0x1c8/0x6e8
> > > [ 3724.032150] [<8015d878>] squashfs_readpage_block+0x32c/0x4d8
> > > [ 3724.038013] [<8015b4f4>] squashfs_readpage+0x5bc/0x6d0
> > > [ 3724.043335] [<800db554>] __do_page_cache_readahead+0x1f8/0x264
> > > [ 3724.049386] [<800d2d08>] filemap_fault+0x1ac/0x458
> > > [ 3724.054371] [<800ed9a8>] __do_fault+0x3c/0xa8
> > > [ 3724.058877] [<800f0c4c>] handle_mm_fault+0x4e4/0xb84
> > > [ 3724.064018] [<80076758>] __do_page_fault+0x134/0x470
> > > [ 3724.069163] [<80060820>] ret_from_exception+0x0/0x10
> > > [ 3724.074294]
> > > [ 3724.075834] Mem-Info:
> > > [ 3724.078204] active_anon:290 inactive_anon:5 isolated_anon:0
> > > [ 3724.078204]  active_file:165 inactive_file:206 isolated_file:0
> > > [ 3724.078204]  unevictable:0 dirty:0 writeback:0 unstable:0
> > > [ 3724.078204]  slab_reclaimable:129 slab_unreclaimable:1229
> > > [ 3724.078204]  mapped:2 shmem:65 pagetables:54 bounce:0
> > > [ 3724.078204]  free:1024 free_pcp:0 free_cma:0
> > > [ 3724.110737] Normal free:4096kB min:4096kB low:5120kB high:6144kB
> > > active_anon:1160kB inactive_anon:20kB active_file:660kB inactive_file:824kB
> > > unevictable:0kB isolated(anon):0kB isolated(file):0kB present:32768kB
> > > managed:27976kB mlocked:0kB dirty:0kB writeback:0kB mapped:8kB shmem:260kB
> > > slab_reclaimable:516kB slab_unreclaimable:4916kB kernel_stack:328kB
> > > pagetables:216kB unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB
> > > free_cma:0kB writeback_tmp:0kB pages_scanned:8976 all_unreclaimable? yes
> > > [ 3724.155485] lowmem_reserve[]: 0 0
> > > [ 3724.158929] Normal: 106*4kB (UE) 103*8kB (UM) 82*16kB (UE) 24*32kB (UME)
> > > 4*64kB (UE) 4*128kB (UM) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 4096kB
> > > [ 3724.172917] 436 total pagecache pages
> > > [ 3724.176716] 0 pages in swap cache
> > > [ 3724.180141] Swap cache stats: add 0, delete 0, find 0/0
> > > [ 3724.185545] Free swap  = 0kB
> > > [ 3724.188516] Total swap = 0kB
> > > [ 3724.191491] 8192 pages RAM
> > > [ 3724.194294] 0 pages HighMem/MovableOnly
> > > [ 3724.198255] 1198 pages reserved
> > > [ 3724.201500] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
> > > swapents oom_score_adj name
> > > [ 3724.210335] [  391]     0   391      297       17       3       0
> > > 0             0 ubusd
> > > [ 3724.219246] [  392]     0   392      224       10       4       0
> > > 0             0 askfirst
> > > [ 3724.228429] [  809]     0   809      426       37       4       0
> > > 0             0 netifd
> > > [ 3724.237434] [  835]     0   835      321       21       4       0
> > > 0             0 odhcpd
> > > [ 3724.246438] [ 1267]     0  1267      265       10       3       0
> > > 0             0 dropbear
> > > [ 3724.255615] [ 1281]     0  1281      282       25       3       0
> > > 0             0 dropbear
> > > [ 3724.264797] [ 1282]     0  1282      298       12       3       0
> > > 0             0 ash
> > > [ 3724.273511] [ 1449]     0  1449      296       10       3       0
> > > 0             0 ntpd
> > > [ 3724.282331] [ 1864]     0  1864      296        9       3       0
> > > 0             0 udhcpc
> > > [ 3724.291327] [ 1955]     0  1955      299       26       3       0
> > > 0             0 fastd
> > > [ 3724.300235] [ 1992]     0  1992      296        9       3       0
> > > 0             0 ntpd-hotplug
> > > [ 3724.309778] [ 1994]     0  1994      271       11       3       0
> > > 0             0 logd
> > > [ 3724.318603] [ 1995]     0  1995      255        8       3       0
> > > 0             0 dnsmasq
> > > [ 3724.327696] [ 1996]     0  1996      296        9       4       0
> > > 0             0 dhcpv6.sh
> > > [ 3724.336961] [ 1997]     0  1997      265        9       3       0
> > > 0             0 dropbear
> > > [ 3724.346131] Out of memory: Kill process 809 (netifd) score 5 or sacrifice
> > > child
> > > [ 3724.353693] Killed process 1996 (dhcpv6.sh) total-vm:1184kB,
> > > anon-rss:32kB, file-rss:4kB
> > > [ 3744.609886] odhcpd invoked oom-killer: gfp_mask=0x24201ca, order=0,
> > > oom_score_adj=0
> > > [ 3744.617880] CPU: 0 PID: 835 Comm: odhcpd Not tainted 4.4.15 #9
> > > [ 3744.623902] Stack : 803bf3a4 00000000 00000001 80410000 818eb480 80406d63
> > > 803a0a6c 00000343
> > > [ 3744.623902]    80473798 80f05d1c 00000000 00000005 00001b52 800a6f1c
> > > 00000006 803a9390
> > > [ 3744.623902]    00000000 00000000 803a44e4 80f05bbc 80476542 800a4e98
> > > 804063d0 00000000
> > > [ 3744.623902]    00000001 801f2100 00000000 00000000 00000000 00000000
> > > 00000000 00000000
> > > [ 3744.623902]    00000000 00000000 00000000 00000000 00000000 00000000
> > > 00000000 00000000
> > > [ 3744.623902]    ...
> > > [ 3744.660968] Call Trace:
> > > [ 3744.663516] [<80071aa8>] show_stack+0x50/0x84
> > > [ 3744.668038] [<800d39d0>] dump_header.isra.4+0x48/0x130
> > > [ 3744.673348] [<800d3db4>] oom_kill_process+0x98/0x43c
> > > [ 3744.678496] [<800d44bc>] out_of_memory+0x2e0/0x324
> > > [ 3744.683455] [<800d7dbc>] __alloc_pages_nodemask+0x684/0x6f0
> > > [ 3744.689268] [<800d2db4>] filemap_fault+0x258/0x458
> > > [ 3744.694246] [<800ed9a8>] __do_fault+0x3c/0xa8
> > > [ 3744.698754] [<800f0c4c>] handle_mm_fault+0x4e4/0xb84
> > > [ 3744.703893] [<80076758>] __do_page_fault+0x134/0x470
> > > [ 3744.709046] [<80060820>] ret_from_exception+0x0/0x10
> > > [ 3744.714179]
> > > [ 3744.715713] Mem-Info:
> > > [ 3744.718082] active_anon:276 inactive_anon:5 isolated_anon:0
> > > [ 3744.718082]  active_file:156 inactive_file:225 isolated_file:0
> > > [ 3744.718082]  unevictable:0 dirty:0 writeback:0 unstable:0
> > > [ 3744.718082]  slab_reclaimable:129 slab_unreclaimable:1235
> > > [ 3744.718082]  mapped:2 shmem:65 pagetables:47 bounce:0
> > > [ 3744.718082]  free:1024 free_pcp:0 free_cma:0
> > > [ 3744.750612] Normal free:4096kB min:4096kB low:5120kB high:6144kB
> > > active_anon:1104kB inactive_anon:20kB active_file:624kB inactive_file:900kB
> > > unevictable:0kB isolated(anon):0kB isolated(file):0kB present:32768kB
> > > managed:27976kB mlocked:0kB dirty:0kB writeback:0kB mapped:8kB shmem:260kB
> > > slab_reclaimable:516kB slab_unreclaimable:4940kB kernel_stack:320kB
> > > pagetables:188kB unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB
> > > free_cma:0kB writeback_tmp:0kB pages_scanned:9540 all_unreclaimable? yes
> > > [ 3744.795364] lowmem_reserve[]: 0 0
> > > [ 3744.798808] Normal: 100*4kB (UME) 98*8kB (UE) 78*16kB (UME) 34*32kB (UME)
> > > 5*64kB (UME) 2*128kB (M) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 4096kB
> > > [ 3744.812885] 446 total pagecache pages
> > > [ 3744.816684] 0 pages in swap cache
> > > [ 3744.820109] Swap cache stats: add 0, delete 0, find 0/0
> > > [ 3744.825514] Free swap  = 0kB
> > > [ 3744.828484] Total swap = 0kB
> > > [ 3744.831459] 8192 pages RAM
> > > [ 3744.834262] 0 pages HighMem/MovableOnly
> > > [ 3744.838223] 1198 pages reserved
> > > [ 3744.841468] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds
> > > swapents oom_score_adj name
> > > [ 3744.850302] [  391]     0   391      297       17       3       0
> > > 0             0 ubusd
> > > [ 3744.859214] [  392]     0   392      224       10       4       0
> > > 0             0 askfirst
> > > [ 3744.868398] [  809]     0   809      426       37       4       0
> > > 0             0 netifd
> > > [ 3744.877402] [  835]     0   835      321       21       4       0
> > > 0             0 odhcpd
> > > [ 3744.886407] [ 1267]     0  1267      265       10       3       0
> > > 0             0 dropbear
> > > [ 3744.895593] [ 1281]     0  1281      282       25       3       0
> > > 0             0 dropbear
> > > [ 3744.904776] [ 1449]     0  1449      296       10       3       0
> > > 0             0 ntpd
> > > [ 3744.913585] [ 1864]     0  1864      296        9       3       0
> > > 0             0 udhcpc
> > > [ 3744.922587] [ 1955]     0  1955      299       26       3       0
> > > 0             0 fastd
> > > [ 3744.931503] [ 1992]     0  1992      296        9       3       0
> > > 0             0 ntpd-hotplug
> > > [ 3744.941045] [ 1994]     0  1994      271       11       3       0
> > > 0             0 logd
> > > [ 3744.949872] [ 1995]     0  1995      255        8       3       0
> > > 0             0 dnsmasq
> > > [ 3744.958966] [ 1998]     0  1998      265        9       3       0
> > > 0             0 dropbear
> > > [ 3744.968143] Out of memory: Kill process 809 (netifd) score 5 or sacrifice
> > > child
> > > [ 3744.975720] Killed process 1864 (udhcpc) total-vm:1184kB, anon-rss:32kB,
> > > file-rss:4kB
> > > [ 4518.095013] eth0: link down
> > > [ 4518.098341] br-lan: port 1(eth0) entered disabled state
> > > [ 4520.095417] eth0: link up (1000Mbps/Full duplex)
> > > [ 4520.100261] br-lan: port 1(eth0) entered forwarding state
> > > [ 4520.105964] br-lan: port 1(eth0) entered forwarding state
> > >
> > >
> > > --
> > > make the world nicer, please use PGP encryption
> > >
> > >
> > > _______________________________________________
> > > WireGuard mailing list
> > > WireGuard@lists.zx2c4.com
> > > http://lists.zx2c4.com/mailman/listinfo/wireguard
> > >
>
> --
> Please use PGP - https://en.wikipedia.org/wiki/Pretty_Good_Privacy
>
