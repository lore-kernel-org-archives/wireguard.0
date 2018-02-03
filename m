Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89988c2b
 for <wireguard@lists.zx2c4.com>; Sat, 3 Feb 2018 19:11:41 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d2076e3
 for <wireguard@lists.zx2c4.com>; Sat, 3 Feb 2018 19:11:41 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 7AD371E30AB
 for <wireguard@lists.zx2c4.com>; Sat,  3 Feb 2018 14:17:11 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-70-165-110-240.om.om.cox.net
 [70.165.110.240])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 2CAA91E30A9
 for <wireguard@lists.zx2c4.com>; Sat,  3 Feb 2018 14:17:10 -0500 (EST)
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Content-Type: text/plain; charset=us-ascii
Subject: Embedded x86 Benchmarks v0.0.20180202
Message-Id: <0310C010-ADD8-4B72-86AB-6E2027261DEC@lonnie.abelbeck.com>
Date: Sat, 3 Feb 2018 13:17:09 -0600
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Greetings,

I have a collection of lower-end (embedded) x86 boxes that I use for =
testing with our AstLinux project.

I previously posted WireGuard performance results for v0.0.20171211 ...
Embedded x86 Benchmarks
https://lists.zx2c4.com/pipermail/wireguard/2017-December/002204.html

Results for v0.0.20180202 are below.

Executive summary, v0.0.20180202 ranges from 0.7% slower to 2.9% faster =
than v0.0.20171211.

If nothing else, a good sanity check.

Lonnie

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

All WireGuard endpoints:
Linux 3.16.51
WireGuard 0.0.20180202

Common "Server" endpoint:

VMware VM
x86_64, 2-core, 3.7 GHz Xeon E5-1620
--
vmware-vm ~ # iperf3 -s
--

"Client" endpoints:

Qotom Q190G4N-S07
x86_64, 4-core, 2.0 GHz Celeron J1900
--
[  4]   0.00-30.00  sec  3.03 GBytes   867 Mbits/sec   14             =
sender
[  4]   0.00-30.00  sec  3.03 GBytes   867 Mbits/sec                  =
receiver
--
0.7% slower than v0.0.20171211

Jetway NF9HG-2930
x86_64, 4-core, 1.8 GHz Celeron N2930
--
[  4]   0.00-30.00  sec  3.03 GBytes   867 Mbits/sec   11             =
sender
[  4]   0.00-30.00  sec  3.03 GBytes   866 Mbits/sec                  =
receiver
--
0.7% slower than v0.0.20171211

Lanner FW-7541D
x86_64, 2-core,4-thread, 1.8 GHz Atom D525
--
[  4]   0.00-30.00  sec  2.33 GBytes   668 Mbits/sec    0             =
sender
[  4]   0.00-30.00  sec  2.33 GBytes   667 Mbits/sec                  =
receiver
--
0.1% slower than v0.0.20171211

PC Engines APU2
x86_64, 4-core, 1.0 GHz AMD GX-412TC
--
[  4]   0.00-30.00  sec  1.84 GBytes   526 Mbits/sec    0             =
sender
[  4]   0.00-30.00  sec  1.83 GBytes   525 Mbits/sec                  =
receiver
--
2.9% faster than v0.0.20171211

Lanner LEC-7220-N4
i686, 2-core,4-thread, 1.9 GHz Atom N2800
--
[  4]   0.00-30.00  sec  1.15 GBytes   328 Mbits/sec    0             =
sender
[  4]   0.00-30.00  sec  1.14 GBytes   327 Mbits/sec                  =
receiver
--
0.9% faster than v0.0.20171211

Soekris net5501
i586, 1-core, 0.5 GHz AMD Geode LX
--
[  4]   0.00-30.00  sec  76.9 MBytes  21.5 Mbits/sec    0             =
sender
[  4]   0.00-30.00  sec  76.8 MBytes  21.5 Mbits/sec                  =
receiver
--
0.5% faster than v0.0.20171211

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=
