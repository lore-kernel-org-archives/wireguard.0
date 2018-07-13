Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84700404
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jul 2018 13:42:02 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id deb66c93
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jul 2018 13:42:02 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 3A1D11E3049
 for <wireguard@lists.zx2c4.com>; Fri, 13 Jul 2018 09:49:47 -0400 (EDT)
Received: from macpro.priv.abelbeck.com (wsip-70-184-211-148.om.om.cox.net
 [70.184.211.148])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 111431E3037
 for <wireguard@lists.zx2c4.com>; Fri, 13 Jul 2018 09:49:46 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: receive: use gro call instead of plain call
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <580E3DE0-4D06-46C5-A972-96C1F687A7B7@abelbeck.com>
Date: Fri, 13 Jul 2018 08:49:45 -0500
Message-Id: <F0797C8C-D288-4531-A21F-4FD38764544A@lonnie.abelbeck.com>
References: <CAHmME9rP8fE7U9VxLauQ_Ee-w6ox-DAAFkvAOjx52bxGT58w4w@mail.gmail.com>
 <580E3DE0-4D06-46C5-A972-96C1F687A7B7@abelbeck.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

For certain lower-end x86 boxes I test, I noticed WG 0.0.20180708 w/NAPI =
actually slowed down receive performance.

Jason recently added "receive: use gro call instead of plain call" [1] =
commit, which made a big performance improvement.

Here is a test on a PC Engines APU2 ...

pbx4: AMD GX-412TC SOC (1 GHz, 4-core)
      Ethernet controller: Intel Corporation I210

pbx:  Intel(R) Core(TM) i3-6100U CPU @ 2.30GHz
      Ethernet controller: Intel Corporation I211

# uname -a
Linux pbx4 3.16.57-astlinux #1 SMP PREEMPT Mon Jul 9 17:25:31 CDT 2018 =
x86_64 GNU/Linux

pbx ~ # iperf3 -s

pbx4 ~ # iperf3 -c 10.4.0.10 -P2 -R
-- 0.0.20180625 --
[SUM]   0.00-10.04  sec   466 MBytes   390 Mbits/sec  162             =
sender
[SUM]   0.00-10.00  sec   463 MBytes   389 Mbits/sec                  =
receiver
-- 0.0.20180708 --
[SUM]   0.00-10.04  sec   301 MBytes   252 Mbits/sec   30             =
sender
[SUM]   0.00-10.00  sec   300 MBytes   251 Mbits/sec                  =
receiver
-- 0.0.20180708 w/napi_gro_receive patch --
[SUM]   0.00-10.04  sec   596 MBytes   498 Mbits/sec   92             =
sender
[SUM]   0.00-10.00  sec   594 MBytes   498 Mbits/sec                  =
receiver
--

Kudos Jason !

Lonnie

[1] =
https://git.zx2c4.com/WireGuard/commit/?id=3D95951af7249912a4356b9a03cf3ad=
dc7e3f8f724=
