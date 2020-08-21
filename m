Return-Path: <SRS0=L39c=CA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772FDC433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Aug 2020 19:01:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C362075E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Aug 2020 19:01:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="g0MkBeBn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C362075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 872b16aa;
	Sat, 22 Aug 2020 18:34:40 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 303bf7ff
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Aug 2020 20:16:13 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id C52F02400FB
 for <wireguard@lists.zx2c4.com>; Fri, 21 Aug 2020 22:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1598042567; bh=wmkIacrL0aH9h/lstTb70HlsvXY2U9h7JuUi3spTwOI=;
 h=To:From:Subject:Autocrypt:Date:From;
 b=g0MkBeBnXLnX3GApNGtks3ZG/E3V/i1B5PHjC9cPiDQqqUJ4Db+NzapzIyO3Vu+DD
 xWk3wJMVXfQ0aHueUaKugbTHzNQ9ZMuRvSRvlveQq8J8Op2OIoFh3Tye5TubT0iQT1
 f15vC4O1u9ZFyh9v7/1OO6sR5d/7YEZ5vnzR/aKT3wU0PkVTLzkYwMVHr4Pnuqt2fG
 ZnNAYIAGQBoG46SII8E/cPyZvhQbcc8PqzkwE0EEmZT6kykdPxcS5P7Rg5No+XqrEO
 BMjyib8JvNA9z0gRXCZXgy8k45EU1HM9y7pNA8GsrTdvG11UvaJBmXWS1Cjfvfx9LL
 Gp1rrwILmlT1A==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4BYD3q2Zvnz6tmB
 for <wireguard@lists.zx2c4.com>; Fri, 21 Aug 2020 22:42:47 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: Eicke Herbertz <wolletd@posteo.de>
Subject: Invalid handshake initiation after peer reboot: bug?
Autocrypt: addr=wolletd@posteo.de; prefer-encrypt=mutual; keydata=
 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
 53DKA8rg
Message-ID: <e120a0a3-2170-4d2f-eaf5-878b09a0ab61@posteo.de>
Date: Fri, 21 Aug 2020 22:42:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Q3CO4HRyjDIq7PNn7y0nNXwbPeeikg134"
X-Mailman-Approved-At: Sat, 22 Aug 2020 20:34:36 +0200
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Q3CO4HRyjDIq7PNn7y0nNXwbPeeikg134
Content-Type: multipart/mixed; boundary="PbX1EjQOP2KVmsRNkCgyCrAh9yIRfSLVl"

--PbX1EjQOP2KVmsRNkCgyCrAh9yIRfSLVl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

we are currently rolling out some OpenWrt devices that are clients to a
WireGuard VPN. Everything was normal while they were in-house, but since
they are in the customers network, we got issues.

The first connection succeeds, but after a reboot of the client, the
server logs an Invalid handshake initiation. A restart of the servers
WireGuard interfaces makes a connection possible again.

As we strongly suspected issues in the customers network, we waited
without checking at first =E2=80=93 and apparently, it takes two to three=
 hours
of invalid handshakes until some, yet unknown, thing happens that
enables the connection without restarting the interface.

Clients are running:
OpenWrt 19.07.3 (r11063-85e04e9f46)
Kernel 4.14.180
WireGuard 1.0.20200506

Server is running Kernel 5.8.2 with in-tree WireGuard.

I am unable to reproduce this in my home and company networks with
identical devices. Several other devices work fine as well. I am not
sure were to look and what to look for.

Any help is appreciated!
Eicke


--PbX1EjQOP2KVmsRNkCgyCrAh9yIRfSLVl--

--Q3CO4HRyjDIq7PNn7y0nNXwbPeeikg134
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEysrPy4/39JJpWQvjrB2FpvudpmIFAl9AMcYACgkQrB2Fpvud
pmIGgg//fVhd3fCcwTGzzyGhv8W5zLFYUa3UmZ/NJbGheVpsfMZrTwZafSP6wll9
PsL/Oge3hs6A3JEn6Wov7ejEzUCz/zOMHnuAcNxIQy3CTxc+tP6NNQ5i0NC7yJdL
3XvzG/f0lcxQM778a4fvRnIAC17K5ILRDjxPV0iuMdKmIFkfdNjwfzj3RybKMs64
Adg6Bhzvis9e2YemvVQwUjnAKIpJATCwXrvDTASHEOcMZkOhNjE0kD9lgFQhGOKH
ZkFV+PDoe4zfo2deoo//bnA/lpGgirQcqJgPrta4W5Bzxv7FanHgJKQhGeduT7Xr
98PZrKgpiemvSEKUhAkCDq7Rge9YKruD8Plml4vuMJxltMxhchzz7ozEbrtp403x
djF3d4wBPL6LVZL34Q4DKyIqyYqlnzXg+WqmatUB/RzNIy26fnBk/XEiZ3x2TocY
7Okm9QueUH2yMfuhPswkGEPEqX0NdOv+TGvATS/AaVic90fKwRFDa7y7z4/paGuu
eF75PTKhZFFhPrUoHC6ytOxnoPOUH6LO3L5wM0H/fvL/hfGDtIxzTCj5NHmUUA6T
Dy0JtmYo5uhvbB0/FW3FbZe7E/aw9vE3lLr3mbreXr/mQDxiORSxDtd1G6+Z/upY
uZj3nV0McDqekLAj1opGuOLMPNGyToBZFrWEJbhhaEeHjojYi6A=
=erio
-----END PGP SIGNATURE-----

--Q3CO4HRyjDIq7PNn7y0nNXwbPeeikg134--
