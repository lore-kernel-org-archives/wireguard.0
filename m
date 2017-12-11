Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 037eed40
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 17:25:15 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b09693fb
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 17:25:15 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id CA10D1165F
 for <wireguard@lists.zx2c4.com>; Mon, 11 Dec 2017 12:32:48 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-70-165-110-240.om.om.cox.net
 [70.165.110.240])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 83FAD11658
 for <wireguard@lists.zx2c4.com>; Mon, 11 Dec 2017 12:32:48 -0500 (EST)
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Content-Type: text/plain; charset=us-ascii
Subject: Embedded x86 Benchmarks
Message-Id: <7A32A237-8282-4BF3-82A3-B8008B99F893@lonnie.abelbeck.com>
Date: Mon, 11 Dec 2017 11:32:47 -0600
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

I ran iperf3 tests of WireGuard performance with a common "fast" VMware =
VM WireGuard endpoint.

Interestingly the J1900 and N2930 can saturate the 1 Gb interface with 1 =
to 1.5 CPU cores still available.  The similar OpenVPN performance maxes =
out at only 100 to 130 Mbps of tunneled traffic.

Also note that the Lanner Atom N2800 system is 32-bit (i686), so even =
with 'ssse3' it appears there is no optimization, and the performance =
reflects that.

Hopefully others find this interesting.

Lonnie

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

All WireGuard endpoints:
Linux 3.16.51
WireGuard 0.0.20171211

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
[  4]   0.00-30.00  sec  3.05 GBytes   874 Mbits/sec   14             =
sender
[  4]   0.00-30.00  sec  3.05 GBytes   873 Mbits/sec                  =
receiver
--

Jetway NF9HG-2930
x86_64, 4-core, 1.8 GHz Celeron N2930
--
[  4]   0.00-30.00  sec  3.05 GBytes   873 Mbits/sec   10             =
sender
[  4]   0.00-30.00  sec  3.05 GBytes   872 Mbits/sec                  =
receiver
--

Lanner FW-7541D
x86_64, 2-core,4-thread, 1.8 GHz Atom D525
--
[  4]   0.00-30.00  sec  2.34 GBytes   669 Mbits/sec    0             =
sender
[  4]   0.00-30.00  sec  2.33 GBytes   668 Mbits/sec                  =
receiver
--

PC Engines APU2
x86_64, 4-core, 1.0 GHz AMD GX-412TC
--
[  4]   0.00-30.00  sec  1.78 GBytes   510 Mbits/sec    0             =
sender
[  4]   0.00-30.00  sec  1.78 GBytes   510 Mbits/sec                  =
receiver
--

Lanner LEC-7220-N4
i686, 2-core,4-thread, 1.9 GHz Atom N2800
--
[  4]   0.00-30.00  sec  1.14 GBytes   325 Mbits/sec    0             =
sender
[  4]   0.00-30.00  sec  1.13 GBytes   324 Mbits/sec                  =
receiver
--

Soekris net5501
i586, 1-core, 0.5 GHz AMD Geode LX
--
[  4]   0.00-30.00  sec  76.6 MBytes  21.4 Mbits/sec    0             =
sender
[  4]   0.00-30.00  sec  76.5 MBytes  21.4 Mbits/sec                  =
receiver
--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=
