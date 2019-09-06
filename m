Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15722C00307
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:53:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 108C520838
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=permerror (0-bit key) header.d=eggiecode.org header.i=@eggiecode.org header.b="hxWamMAm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 108C520838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eggiecode.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6de14e6a;
	Fri, 6 Sep 2019 19:52:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0718153a
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 19:52:54 +0000 (UTC)
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [IPv6:2a01:7c8:aab4:31b:1::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56381587
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 19:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail01.eggieservers.nl (Postfix) with ESMTP id 4BA551C37D2;
 Fri,  6 Sep 2019 22:22:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.vps01.eggieservers.nl
Received: from mail01.eggieservers.nl ([127.0.0.1])
 by localhost (vps01.eggieservers.nl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5SLZEoK4JPLu; Fri,  6 Sep 2019 22:21:42 +0200 (CEST)
Received: from olifant.lan.eggie.zone (unknown
 [IPv6:2a02:a454:d534:0:9553:9e39:79d2:4613])
 (Authenticated sender: egbert@eggiecode.org)
 by mail01.eggieservers.nl (Postfix) with ESMTPSA id 901E41C37B9;
 Fri,  6 Sep 2019 22:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=eggiecode.org;
 s=default; t=1567801302;
 bh=9q4Rc8umu6kuhEp6qhNM3+MnMnoSjRSkhcVqnIYvwoU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=hxWamMAmZQSWAm1Znl8+u4o0i9QvX3evcwCecO4OOmdNX45usZ/lHfM667gWH6HGY
 erep/jqVbbvKSOFuHQsYdYuahPxGOYFy5vyhA5P191PzCuRZeoDDN6AX12f75Aykps
 cJ4R3uSK+fDE2s2n1Gmv7Bq3wuvJNhllG2yvuIDk=
Message-ID: <3437989727b14b2ebe1a2c5fd5a7a9bc430ed2f4.camel@eggiecode.org>
Subject: Re: DMKS failed after Kernel Upgrade to 4.4.0-161-generic on Ubuntu
 16.04 LTS
From: Egbert Verhage <egbert@eggiecode.org>
To: Markus Grundmann <markus@activezone.de>
Date: Fri, 06 Sep 2019 21:51:46 +0200
In-Reply-To: <3a0ae2da89436159fbce7856a6a88d3e@activezone.de>
References: <a8a4d088-d5fd-5e3b-23ab-72e2c7932ff3@activezone.de>
 <CAHmME9pTAY5X3h2xwwz6LPjqWpgtd2R+Lw4C3-ZPqxve=4HCSw@mail.gmail.com>
 <3a0ae2da89436159fbce7856a6a88d3e@activezone.de>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4647737430169905431=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============4647737430169905431==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-JgBosj58f9iGynnsYefA"


--=-JgBosj58f9iGynnsYefA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Markus,=20

It shoud be fixed now! Just updated the ppa package en it shoud work.

Greetz,
Egbert

On Fri, 2019-09-06 at 17:00 +0200, Markus Grundmann wrote:
> No! No! Jason! You do not have to apologize. I think we have to
> thank=20
> you for WireGuard!
>=20
> -Markus
>=20
> Am 2019-09-06 16:06, schrieb Jason A. Donenfeld:
>=20
> > Sorry for the hassle. I'm not happy about the situation either, but
> > it
> > is what it is. Ubuntu isn't the best distro to deal with
> > unfortunately.
> >=20
> > I'll poke Egbert again to see if he can hurry up.

--=-JgBosj58f9iGynnsYefA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQKTBAABCgB9FiEE+OhqNTbreSu+mIfAlYuguCx20HwFAl1yuNJfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY4
RTg2QTM1MzZFQjc5MkJCRTk4ODdDMDk1OEJBMEI4MkM3NkQwN0MACgkQlYuguCx2
0HxH2A/+K1E0tGh3+22vScfD33GQKNyvRCpu25ZfWcZPrDYMU81g+pEP0etaw1oL
k9BV1jpDaVtSiQyRjfQEKrYuQiz2Zi7idM9M8Rdd3EeTxOVbj+vahOQiYzoPW849
NFSnygtE64ii/EsUXpc18DXJry2PJCsEIVg2tytYHHldAB8yToibdkWA69jdv1Vc
s2z//vrmOAvbkx6cDMf3BBJWqeFVuq3C+Vd4WSTGIITNU3uIhaXUZKWc37Bbd/z7
1vXATOsza1jiPkzTDCF6mw6uSOkb7TAPYa8VwMTquZxgNGYIVt+0jMXl3AAU8KBH
oRJQv66ffXScsQwbHSSD0OqBiR6taXL9uBLt+g4DdoZ/1GU0JgioiJ/FU80c1QnN
LqAfuxqF6zq8Gq913U5wRJko98Xa1FhlonCZY+r2impEup8ZilU9BLAptB7JVQoO
YLlp6akWI08E6e/06ZBj97/ng6Ezj267j2sNpmu+vZVjEAVtSwhQjtmJUdmt5A3L
K7nuWAXXHAOcCw13g7UOeEIJkxwl+ISLI9wcp8R1WJSd+gqkdnoSfutKwTdVxS+E
Vdb+v2ir104pTcPAJhh3JlF+Tbf0po/R6jWUNydOEJ6Jts+ZPXFacPZYcrUIl+FV
9I0aOfvgGdlf6oqV8evDd9Kk1LCkb57337OumPsSEgbZ+vuecqg=
=i+U7
-----END PGP SIGNATURE-----

--=-JgBosj58f9iGynnsYefA--


--===============4647737430169905431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4647737430169905431==--

