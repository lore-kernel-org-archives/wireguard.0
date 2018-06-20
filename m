Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae6659a4
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 20:06:26 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e14ab70a
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 20:06:26 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 721B71E3037
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 16:11:14 -0400 (EDT)
Received: from macpro.priv.abelbeck.com (wsip-70-184-211-148.om.om.cox.net
 [70.184.211.148])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 315551E302F
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 16:11:14 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180620` Available
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <b9a4b41fbe912803@frisell.zx2c4.com>
Date: Wed, 20 Jun 2018 15:11:13 -0500
Message-Id: <8B706799-0A06-449B-960B-08C017C58412@lonnie.abelbeck.com>
References: <b9a4b41fbe912803@frisell.zx2c4.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> On Jun 20, 2018, at 2:19 PM, Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>=20
> A new snapshot, `0.0.20180620`, has been tagged in the git repository.

I find 0.0.20180620 much slower than previous version 0.0.20180531

All things being equal, only WireGuard version changes.

Both boxes:
# uname -a
Linux pbx 3.16.54-astlinux #1 SMP PREEMPT Mon Jun 11 09:17:57 CDT 2018 =
x86_64 GNU/Linux


Test: 0.0.20180531
--
Qotom Q190G4N-S07 NIC x4
# iperf3 -s

Jetway NF9HG-2930 NIC x4
# iperf3 -c 10.4.0.10 -t30 -P2

[SUM]   0.00-30.00  sec  2.65 GBytes   758 Mbits/sec  571             =
sender
[SUM]   0.00-30.02  sec  2.64 GBytes   756 Mbits/sec                  =
receiver
--

Test: 0.0.20180620
--
Qotom Q190G4N-S07 NIC x4
# iperf3 -s

Jetway NF9HG-2930 NIC x4
# iperf3 -c 10.4.0.10 -t30 -P2

[SUM]   0.00-30.00  sec  1.50 GBytes   430 Mbits/sec   96             =
sender
[SUM]   0.00-30.02  sec  1.50 GBytes   428 Mbits/sec                  =
receiver
--

Interesting note, using -P1 the difference is not as pronounced, but =
still slower.

Any ideas ?

Lonnie
