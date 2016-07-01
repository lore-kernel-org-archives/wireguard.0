Return-Path: tiernan@tiernanotoole.net
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0049.outbound.protection.outlook.com [104.47.1.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe141ef0
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 20:55:50 +0000 (UTC)
From: Tiernan OToole <tiernan@tiernanotoole.net>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>, 'Baptiste Jonglez'
 <baptiste@bitsofnetworks.org>
References: <34EBEFA02A9AAB1F.1117239f-f3e4-4320-907d-9a9edbb083c6@mail.outlook.com>
 <CAHmME9rL4jdWQV66hGOSbY5yymVXatq67bMjEJwVBFTxNRB-uA@mail.gmail.com>
 <045201d1d2b3$3eaa6b70$bbff4250$@tiernanotoole.net>
 <CAHmME9oa+k0h9s62ts5DpqqWiSnf6zQRfCZyeOCXNsObOHyVDA@mail.gmail.com>
 <FE551DD9-28B0-4B3D-89F3-EB0F142AB48B@tiernanotoole.net>
 <20160701093751.GA28109@lud.polynome.dn42>
 <CAHmME9oAU2GBjTw8Aschv=-ey1nvCbcoof5C+Hdchx+cvJitQw@mail.gmail.com>
In-Reply-To: <CAHmME9oAU2GBjTw8Aschv=-ey1nvCbcoof5C+Hdchx+cvJitQw@mail.gmail.com>
Date: Fri, 1 Jul 2016 21:54:23 +0100
Message-ID: <0bb801d1d3da$bf361960$3da24c20$@tiernanotoole.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-Path: tiernan@tiernanotoole.net
Cc: 'WireGuard mailing list' <WireGuard@lists.zx2c4.com>
Subject: Re: [WireGuard] Single client connecting to server multiple times
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Reuploaded wireguard.ko and it's at =
https://transfer.sh/W7xo9/wireguard.ko.=20

As for the question, its (or was) ECMP (Equal Cost, Multi Path). When I =
was using the older (default) Debian 8 Kernel (3.16), there was a "bug" =
where ECMP actually worked to my advantage (2 routes to 2 different IPs, =
but traffic was split between them). In V4.6, which I installed to get =
wireguard working, it's not working as planned... still testing mind =
you...

--Tiernan

-----Original Message-----
From: Jason A. Donenfeld [mailto:Jason@zx2c4.com]=20
Sent: 01 July 2016 21:45
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Cc: Tiernan OToole <tiernan@tiernanotoole.net>; WireGuard mailing list =
<WireGuard@lists.zx2c4.com>
Subject: Re: [WireGuard] Single client connecting to server multiple =
times

I have the same exact question as Baptiste. Is this with load-balancing, =
or is it vanilla? Also -- in your email with wireguard.ko, the link said =
"not found".
