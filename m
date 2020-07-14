Return-Path: <SRS0=qPON=AZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7264C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jul 2020 17:55:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 295522256C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jul 2020 17:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 295522256C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emdete.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7b49293;
	Tue, 14 Jul 2020 17:33:09 +0000 (UTC)
Received: from emdete.de (emdete.de [46.4.107.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f7185d78
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Jul 2020 17:33:06 +0000 (UTC)
Received: from emdete.de (no-rdns.free.clues.ro [185.216.33.117])
 by emdete.de (OpenSMTPD) with ESMTPSA id 0aabb2b5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 14 Jul 2020 17:54:41 +0000 (UTC)
Received: from localhost (emdete.de [local])
 by emdete.de (OpenSMTPD) with ESMTPA id 5c9a8a11;
 Tue, 14 Jul 2020 17:54:41 +0000 (UTC)
Date: Tue, 14 Jul 2020 19:54:41 +0200
From: "M. Dietrich" <mdt@emdete.de>
Subject: Re: AW: two client connections -> crash?
To: Joachim Lindenberg <wireguard@lindenberg.one>
Cc: wireguard@lists.zx2c4.com
References: <08a201d65946$e9c84f90$bd58eeb0$@lindenberg.one>
 <1594720777.ugfhft3s9b.astroid@morple.none>
 <09a201d659e4$c6e01c80$54a05580$@lindenberg.one>
In-Reply-To: <09a201d659e4$c6e01c80$54a05580$@lindenberg.one>
MIME-Version: 1.0
User-Agent: astroid/v0.14-85-g540a5707 (https://github.com/astroidmail/astroid)
Message-Id: <1594747549.w4i9fibrno.astroid@morple.none>
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha512; boundary="=-qY37OH9g1iWeVPNlDZdR"
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

--=-qY37OH9g1iWeVPNlDZdR
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Quotation from Joachim Lindenberg at Juli 14, 2020 15:43:
> didn=C2=B4t find a good documentation on that.

Oh, there is, one doesnt recognize in the first place as a=20
beginner. ;)

> And obviously with one connection it wasn=C2=B4t that=20
> important to get it right.

depends on your demand. so if you put your setting 0.0.0.0/0=20
there all traffic goes into that tunnel. if the other end=20
doesnt know how to react this wont work neither. it's a=20
typical setup where you want to reach the internet via a VPN.

if you want to connect boxes into a network to be securly=20
reachable to each other this is a completly different demand.=20
you just give each box an IP and tell wiregard where to find=20
it.

> What IP addresses or network=20
> should AllowedIPs refer to? Client? Server? Tunnel?

there isnt really a client or server in wg. ;)

i typically use a star-topology for that. there is a box in=20
the middle, all others connect to that middle box. all the=20
boxes are in the network 172.16.0.0 and are numbered=20
172.16.0.1, 172.16.0.2, ...

the middle box has entries for each peer like

[Peer]
PublicKey =3D <key of the connecting box>
AllowedIPs =3D 172.16.0.1/32
...

while the box itself has an entry

[Peer]
PublicKey =3D <key of the center box>
AllowedIPs =3D 172.16.0.0/12
...

for the peer and the IP configured for the interface:

[Interface]
Address =3D 172.16.0.1
...

that should do. i agree: the setup is a bit notchy to=20
maintain but there are tools for that. i still do it manually=20
but i dont have that much peers.

best regards, Michael
M. Dietrich

--=-qY37OH9g1iWeVPNlDZdR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE8ECycNYHT6atlYQywVmjQWUJtykFAl8N8WEACgkQwVmjQWUJ
tyn9Qw/9GSbmMm3lL/7E0X38EtsYjDvILwSHSY7GTYVI3REz74sGLrcD9TrwT2Z5
DS38YzjcIbxZUSF8rLxMtUuqfFeiw+7+uI605RIi64HWpAQOwL4MnsSqG478pm9N
/yIil0iaz2MRjYozlUmvFEc0Ce03z3ZHyI9KuXGPvFh23zQ242c83sJo9P8hlq9X
sBcOBUdmcZPV8q3JkjoNrtAAwoJM9NmXC33r9+RJF5NTpSvAQEizqlN8GfUwfIQB
Vg+hA+ezpgnDpeOGMy0hHsVYasd6eIK8gbXvewTAqQN9K6NiM2sPQbyxv0VbOiYU
7+bmjgJSlflaHSR+lqLjlOOOc4+VlalgMIr1lyCeMYTynwyGjHzI61MkmO6OtjSp
wIOLDH6ZSUMQSSR8sBTnfuXd29jTSX+EREKbii2G7W2oyxkgqBXVWEJoSK8grzqc
dYA76+Y9jL0AlTMkPDfT5oYPktZs6eC0an6mgMaNB7xQsJh7BxB6M0l2vmEpRE2/
no14ntpQuP0rRjQnECan6ulobh0viRZXBuGh7yNf9FZLu0qrpbJPQMwObDpEk912
er/Tv02PLNhtgGdOoQhAJ64LmnPDV9xU/MK8AZtZO2spkR8Deov72Nk4idcTaH7k
i2bmk80/w+cmdexDSv59m3L3SybRhnoBULe9i/x/G1qaF3EtYqA=
=HAOo
-----END PGP SIGNATURE-----

--=-qY37OH9g1iWeVPNlDZdR--
