Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A885DC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 17:32:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F4272196F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 17:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F4272196F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emdete.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bf8e81e;
	Sun, 17 Feb 2019 17:23:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 981cecb6
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 17:23:27 +0000 (UTC)
Received: from emdete.de (emdete.de [46.4.107.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee6caf6f
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 17:23:27 +0000 (UTC)
Received: from emdete.de (185.62.205.103 [185.62.205.103])
 by emdete.de (OpenSMTPD) with ESMTPSA id 7c71199e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Sun, 17 Feb 2019 17:31:43 +0000 (UTC)
Received: from localhost (emdete.de [local])
 by emdete.de (OpenSMTPD) with ESMTPA id b8197ed9;
 Sun, 17 Feb 2019 17:31:38 +0000 (UTC)
Date: Sun, 17 Feb 2019 18:31:38 +0100
From: "M. Dietrich" <mdt@emdete.de>
Subject: Re: dynamic reload of configuration file
To: Raffaele Spazzoli <rspazzol@redhat.com>, wireguard@lists.zx2c4.com
References: <CACOeLqLQjM1AQPpi31F_Fxvv02tFgD+27qFGjnLnW8KFcy66Kw@mail.gmail.com>
In-Reply-To: <CACOeLqLQjM1AQPpi31F_Fxvv02tFgD+27qFGjnLnW8KFcy66Kw@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/v0.14-49-g4b052e2b (https://github.com/astroidmail/astroid)
Message-Id: <1550417524.ondhfeso9t.astroid@morple.none>
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
Content-Type: multipart/mixed; boundary="===============7146148039759841560=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7146148039759841560==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha256; boundary="=-4eIvWf9m5nWr/BCuutjI"

--=-4eIvWf9m5nWr/BCuutjI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Quotation from Raffaele Spazzoli at Februar 17, 2019 16:21:
> I'm using wireguard to build a VPN mesh. The nodes of the mesh are dynami=
c
> and can come and go at any time. Is there a way to reconfigure a wireguar=
d
> device without restarting it or losing the current connections?

yes.

> If yes, how can it be done?

other way around: configure wireguard with the `wg` command
and  that is persisted to the configuration file.

on restart the file is read and your config applied.

M. Dietrich

--=-4eIvWf9m5nWr/BCuutjI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE8ECycNYHT6atlYQywVmjQWUJtykFAlxpmnoACgkQwVmjQWUJ
tykSrRAAmKzJwVa1psFOoH44L+x7meRPmPOkk6OMayKTKukrgMAbaeAPXVTnYioQ
wHiZVcRRdAJj9mzToH6t/kT9ptyktDj62qgE/IS29xg5pTcD2doKB9MGLQpzYtvI
/dkp7s+2PmZvp5toGnUXY1cXwROr/mmqwR35poe5RxUHbvKQ9FUBL5QDkahr31Xp
HTfiwtHaEia/c3Fs3icQpgs4Fw7xVHfWxhN4WF8OR2fVst6vnnUAMn+3ltxUweDm
GIDB04aNzHkcb9h5ppDhMJIVV3PycIAK1rS5fxNrQSJVzcZkrtmBe/R1Syc4i0d4
1Bf4rlSwroXizAJBHJmZwOGg3II1IfDoMsiKZCzBm4I+ENvT5aYfelBBWbjwlzPN
9dUAsdbAiXBuRCDkxNzh3JC1pRkxgqHK9ZqGiec1m+fqAvldxHGwZQixIMletPW+
c8vg4u+g2U5rKoyOnMTmaCuQTJX1BxBSY+xMng10jrF398cYbjqvebwySlBAB++n
Mqxb+7cunq3pZr6ME/f1Ypw2dXnANtjLNmhzNM2jCwrwoEKUrEvXVdcM5S7dADai
3Lnh1aqwwjmj3I21FP8tJncNus9w46YR0E9HnXqeU5fH6w5iULWHSExyDxrnF6vN
wPh2xgvQapA5UDKSqbWssj/rL/G1RBN/oEEcTSSrRC4pmP18Bxk=
=jD+c
-----END PGP SIGNATURE-----

--=-4eIvWf9m5nWr/BCuutjI--

--===============7146148039759841560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7146148039759841560==--
