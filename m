Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff215d9b
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jul 2018 21:09:34 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a972fd3
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jul 2018 21:09:34 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: receive: use gro call instead of plain call
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAHmME9rUf87VA2u0Nqh2jQ=_D2aAug1z4vYz6ctHXznarkA0KQ@mail.gmail.com>
Date: Fri, 13 Jul 2018 16:17:18 -0500
Message-Id: <5B4A607E-C728-4D5D-8214-4D84B40B5B23@lonnie.abelbeck.com>
References: <CAHmME9rP8fE7U9VxLauQ_Ee-w6ox-DAAFkvAOjx52bxGT58w4w@mail.gmail.com>
 <580E3DE0-4D06-46C5-A972-96C1F687A7B7@abelbeck.com>
 <F0797C8C-D288-4531-A21F-4FD38764544A@lonnie.abelbeck.com>
 <CAHmME9rUf87VA2u0Nqh2jQ=_D2aAug1z4vYz6ctHXznarkA0KQ@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> On Jul 13, 2018, at 1:27 PM, Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>=20
> Hey Lonnie,
>=20
> Wow, thanks for benching that (and watching the git repo for the
> experiment-of-the-day). This performance increase certainly exceeds my
> expectations; I'm quite pleased it's working so well.

Another huge improvement ...

pbx3: Intel(R) Celeron(R) CPU  N2930  @ 1.83GHz
      Ethernet controller: Intel Corporation I211

pbx:  Intel(R) Core(TM) i3-6100U CPU @ 2.30GHz
      Ethernet controller: Intel Corporation I211


pbx ~ # iperf3 -s

pbx3 ~ # iperf3 -c 10.4.0.10 -P2 -R
-- 0.0.20180625 --
[SUM]   0.00-10.03  sec   940 MBytes   786 Mbits/sec  251             =
sender
[SUM]   0.00-10.00  sec   933 MBytes   782 Mbits/sec                  =
receiver
-- 0.0.20180708 --
[SUM]   0.00-10.05  sec   730 MBytes   609 Mbits/sec  186             =
sender
[SUM]   0.00-10.01  sec   726 MBytes   608 Mbits/sec                  =
receiver
-- 0.0.20180708 w/napi_gro_receive patch --
[SUM]   0.00-10.04  sec   973 MBytes   813 Mbits/sec  289             =
sender
[SUM]   0.00-10.00  sec   969 MBytes   813 Mbits/sec                  =
receiver
--

Lonnie
