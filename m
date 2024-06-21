Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BDEC27C4F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jun 2024 11:15:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fa2dc2c;
	Fri, 21 Jun 2024 11:15:27 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e050c2a2
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jun 2024 11:15:25 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 9D2FB20DC1
 for <wireguard@lists.zx2c4.com>; Fri, 21 Jun 2024 13:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1718968525;
 bh=q8UlJPHAwUQ8prrbYafX9rbw3j0qrPa/iqvujPSVXN8=;
 h=From:To:Subject:Date:From;
 b=bRvOAi9w9nwCF5qHTHakGxMU4gSn+segIVeZjMa/euvuyZ7pnQyGP9Iyd+PM1xhKR
 19B7FkEB+6YUpTKbGOIxpvPVkT+wYN6aemv3jw+RDIwFzHxhrYbaFOx4m0ADuASwR+
 wSrgZIeUwZAhjpdqtTzQrpGJZXNLThpuY+haBS5gcNJUseg3rdT0AXdkea4r6JC4CZ
 IKrfydHDLZyYGQsyucLiL0wG2qdNLx4CmqkQV5GlROYmJBu+EwklMLzINSLdTz4jwQ
 0RCi+0A7EiEvmRkX5selPmDk9GZ8gLpr88EOoatZc2LqCMtwzlk3daJW9Z2z4Bj2DN
 ZcqBRTSFFfJJg==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id AE22C1A6A2B4; Fri, 21 Jun 2024 13:13:27 +0200 (CEST)
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Wireguard uses incorrect interface - routing issue
Date: Fri, 21 Jun 2024 13:13:27 +0200
Message-ID: <878qyyim5k.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hello again,

I'm sorry to flood the mailing list with wireguard bugs, but it seems
there is yet another routing bug in wireguard - happy to be wrong, but
here are my findings:

a) system has source based routing on via ip rule:

[11:07] server141.place10:~# ip rule ls
0:      from all lookup local
32765:  from 192.168.1.0/24 lookup 42
32766:  from all lookup main
32767:  from all lookup default
[11:07] server141.place10:~# ip route sh table 42
194.5.220.0/24 via 192.168.1.254 dev eth1 proto bird metric 32=20
194.187.90.23 via 192.168.1.254 dev eth1 proto bird metric 32=20
212.103.65.231 via 192.168.1.254 dev eth1 proto bird metric 32=20
[11:08] server141.place10:~#=20

This should ensure that packets towards 194.187.90.23 travel via eth1.

b) tcpdump for verification

Using "tcpdump -ni any port 4000" I observe:

11:10:22.445638 eth0  Out IP 192.168.1.149.58591 > 194.187.90.23.4000: UDP,=
 length 148
11:10:27.447026 eth0  Out IP 192.168.1.149.58591 > 194.187.90.23.4000: UDP,=
 length 148
11:10:32.448329 eth0  Out IP 192.168.1.149.58591 > 194.187.90.23.4000: UDP,=
 length 148
11:10:37.449719 eth0  Out IP 192.168.1.149.58591 > 194.187.90.23.4000: UDP,=
 length 148

c) Route in main table

There is indeed a route in the main routing table that matches, too:

[11:08] server141.place10:~# ip r get 194.187.90.23
194.187.90.23 via 10.5.2.123 dev eth0 src 192.168.1.149 uid 0=20
    cache=20

d) ip rule not working (?)

So from what I can observe it is that ip rule does not work together
with wireguard / wireguard routing takes the route from main fib instead
of from the separate table.

I am not sure if this is related at all to the IP address binding bug,
but it appears in a similar context from our tests.

BR,

Nico

=2D-=20
Sustainable and modern Infrastructures by ungleich.ch

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJRBAEBCgA7FiEEZZsNkehufiT9FWnQxykhoSk/LSQFAmZ1YFcdHG5pY28uc2No
b3R0ZWxpdXNAdW5nbGVpY2guY2gACgkQxykhoSk/LSTVhBAAjrfvo/HSM4cucPv3
dOFbtWQsam7b/2I/LlEakdeYtdh83pNwK6Ug0aJXA5X5f9NHOQXWQ1roe+t3XdjD
GFsaNpTPRT7tZZk8yCgUMKO/anFJ2ARA9RvJhqjbh0qCEXiKL/Z65oWeX93TyCay
zZbFD+N9XKPsqMPVhHh0giJxq/0UKpvKzxGUxWYFYUqI8J4vZcBUVE7yiudKAqYE
C+1TM41AiGjeobpcP5jVW+Bq9mVLD+mYMw/gvcpsr+pfXHPxnq4sQo//sGQACPY7
W2TKy3xs1mf35iEJ+U34iwOaG+sDjytsSM6Rn1oPGs3Jo8Y2BcJWhaEWQoKg60p9
MCCiSf4H1/jT6hpYGY7TusKbVPwvbA4HI1ceI+YkE8pVLc3g8GdR4mtdgBDWBaOJ
m+lAVAxIIojOAnL21cgm7qaNG18HSbo894ldEyo5woPtqIQwQa9kTc6MBx9UOkRc
rBNGw0DyAqlgz41M3StZHeqWQY1n/pYd53goyxoq94UKMr8dL7uOFyB7C645tLrj
VX4MUHXlOe+KOAiYSkEvxOKYTT6hejlUj0C2lByOQwHcTpyZsoUGQfL0dGHGfKgc
f1tLQPfUKycBc8Q+8XoBBQnQCpmL3xsdEgWitqfPDFGJKKz6+hikV7U+5VqBJmFy
ezgS0F2mIelp5STRw142bZvWISU=
=wl9S
-----END PGP SIGNATURE-----
--=-=-=--
