Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C05C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 07:32:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90E672086A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 07:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90E672086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emdete.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 690a0afd;
	Mon, 19 Nov 2018 07:26:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ef8592e
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 07:26:13 +0000 (UTC)
Received: from emdete.de (total-communication.vfnet.de [80.84.1.14])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8d10c14
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 07:26:13 +0000 (UTC)
Received: from localhost (emdete.de [local])
 by emdete.de (OpenSMTPD) with ESMTPA id f336ac55;
 Mon, 19 Nov 2018 07:32:09 +0000 (UTC)
Date: Mon, 19 Nov 2018 08:32:08 +0100
From: "M. Dietrich" <mdt@emdete.de>
Subject: Re: Traffic on port 53 fails on LTE but works on WiFi
To: John <graysky@archlinux.us>, wireguard@lists.zx2c4.com
References: <CAO_nJAZRTXB424FKTew726LUieeAtpj1crXucf2deoQXVyw__w@mail.gmail.com>
In-Reply-To: <CAO_nJAZRTXB424FKTew726LUieeAtpj1crXucf2deoQXVyw__w@mail.gmail.com>
User-Agent: astroid/v0.14-17-gcb9ebb01 (https://github.com/astroidmail/astroid)
Message-Id: <1542611942.d09p50zvb2.astroid@morple.none>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============1688789250799174277=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1688789250799174277==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha256; boundary="=-v2GFRRJZ4NSkQq4/xbga"

--=-v2GFRRJZ4NSkQq4/xbga
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi John,

Quotation from John at November 18, 2018 19:55:
> ... on port 53 ... do _not_ work when I connect via LTE
> (Verizon supplying the data).  On LTE, I am no longer able
> to transfer data to/from the server peer but I can handshake
> with it.

Vodafone blocks UDP traffic on port 53 in LTE.

> 1) What can I try on the server peer side to diagnose?

I would check with tcpdump. it seems Verizon does some package
inspection, maybe reducing MTU will do?

> 2) Do people feel that Verizon is actively blocking the
> connection on port 53?

Not with Verizon but Vodafone which does a complete block -
not even the handshake goes through. Not sure about the cause
for that, maybe they want to control your DNS that way.

Regards,
M. Dietrich
=

--=-v2GFRRJZ4NSkQq4/xbga
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE8ECycNYHT6atlYQywVmjQWUJtykFAlvyZvkACgkQwVmjQWUJ
tylDtg/9Etc+uhln3VI88ZCM0PVWa7QkEYhQm15PFDYpYnXc4XjzcTY6OgkJ9tsi
bv4e4p3b53F156uW/JhehZvjV7E65gIeh7D7mhn08N7QQWHgJHjNojf8NJAcOFZd
UxTcS5R7xGqldhxZ7SqYfUskZhHinLTm4AwimMOIBOHyDwaWQWB+mcJJoTR12hqv
Ah2moRVb9pU+PG4ljETxsKuuaOzjRamoa+zZA1QqY5+RJezkuip72mFSgrMtMt1m
S/Q+zyPy56TSd5qsvCz4x/UHxyjerWlXY8+32ikHQQEblYHCC3o5404YE/2kRNB+
h9oSV7dMmi8Pk8d8OJ1uZJXnJJuV7F7m4IkuEV1RTX9epqGhqhXJBwSRB5K58KUf
1XhPU8w31a8xBu5yEfJIIbhYNIie9Hz6PjeklwGTnruGDZ2nQVokzrb1VgJJemJs
VGCl/rJ4BNZ3FQDCSjzkst0Y38bEI0RkWyVIc8NakBoexXTxcVAJENC+HFC4mpAi
8PwbVcEuR91p26VygNIe33jwopkzLpC1zNmOj094xnOKrOdAd4Hhp4nExgCl5xXP
EqFihr5P4D9F9qug7S3M8+lSXKZ0UApEVmiA7/y53ef3Ko1Yr30jz4lsEsf8y/LW
rNSLP1iFiPfpf6mylAAYXvuHt1QcreENHUI9abyf/wXyKdmnYEc=
=jPxs
-----END PGP SIGNATURE-----

--=-v2GFRRJZ4NSkQq4/xbga--

--===============1688789250799174277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1688789250799174277==--
