Return-Path: tiernan@tiernanotoole.net
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20047.outbound.protection.outlook.com [40.107.2.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6496d38f
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 21:14:21 +0000 (UTC)
From: Tiernan OToole <tiernan@tiernanotoole.net>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
References: <34EBEFA02A9AAB1F.1117239f-f3e4-4320-907d-9a9edbb083c6@mail.outlook.com>
 <CAHmME9rL4jdWQV66hGOSbY5yymVXatq67bMjEJwVBFTxNRB-uA@mail.gmail.com>
 <045201d1d2b3$3eaa6b70$bbff4250$@tiernanotoole.net>
 <CAHmME9oa+k0h9s62ts5DpqqWiSnf6zQRfCZyeOCXNsObOHyVDA@mail.gmail.com>
 <FE551DD9-28B0-4B3D-89F3-EB0F142AB48B@tiernanotoole.net>
 <20160701093751.GA28109@lud.polynome.dn42>
 <CAHmME9oAU2GBjTw8Aschv=-ey1nvCbcoof5C+Hdchx+cvJitQw@mail.gmail.com>
 <0bb801d1d3da$bf361960$3da24c20$@tiernanotoole.net>
 <CAHmME9rzfr38ek74v4Giz1HaBPOAS=qMTwkHoOr3cQKV-jgncw@mail.gmail.com>
In-Reply-To: <CAHmME9rzfr38ek74v4Giz1HaBPOAS=qMTwkHoOr3cQKV-jgncw@mail.gmail.com>
Date: Fri, 1 Jul 2016 22:12:52 +0100
Message-ID: <0bbe01d1d3dd$544d4bc0$fce7e340$@tiernanotoole.net>
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

Kind of...=20

I cant compile Wireguard with kernel 3.16... it told me I need a 4.x =
version... but ECMP did work (using openvpn as the backend).

On 4.6, ECMP does not "seem" to work (just done some basic testing, and =
most traffic is going over one or the other connection, not both) but I =
was having perf issues with Wireguard, so went back to openvpn (still =
only 1 connection...)

--Tiernan

-----Original Message-----
From: Jason A. Donenfeld [mailto:Jason@zx2c4.com]=20
Sent: 01 July 2016 22:14
To: Tiernan OToole <tiernan@tiernanotoole.net>
Cc: Baptiste Jonglez <baptiste@bitsofnetworks.org>; WireGuard mailing =
list <WireGuard@lists.zx2c4.com>
Subject: Re: [WireGuard] Single client connecting to server multiple =
times

So do you mean to say that:

Kernel 3.16.
ECMP: works well
ECMP + wireguard: not tested

Kernel 4.6:
ECMP: does not work
ECMP + wireguard: does not work

Is this the case?
