Return-Path: <SRS0=qPON=AZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444A6C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jul 2020 13:43:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC40224B2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jul 2020 13:43:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="U2P4FGI1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC40224B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e39a425;
	Tue, 14 Jul 2020 13:22:10 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f7e5565c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Jul 2020 13:22:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BD13A28DFDD; Tue, 14 Jul 2020 15:43:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1594734217;
 h=from:sender:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/OvyygtEd1Gqt8/Tn9DCLObFoaRj+OZQ86XmSoFJi2U=;
 b=U2P4FGI1jOtpzHA3jxpNkYfkYm1NHS2FR7jG69ZG8h69SWkgEg4Yt2tuRvcI08O4c6JkHm
 CXCUuG2sM9NlOT0i31G9SzM3o4lANqmdP4veJ5UHvg/lcSSTRDueRwfUDSMlQ74vEptumQ
 h+Pj2ceusCJdOdhfgTaYLgYs3YdShD+iIuUq4tOfzsrJhXRMjKG8juzlEDDaT+12WsV0B6
 DjsLOcR4XaftAiTS8U2PALEsXfFM38xxu/L1nWlQe1Dp4i1abmFYPuZaTAx23s246BL0Nw
 bdzDQbFgbxQVFzOSkoAB8verunuQF39IYoSWL/ZaruOe26UEPPNk+Qkf9Ye/uA==
From: "Joachim Lindenberg" <wireguard@lindenberg.one>
To: "'M. Dietrich'" <mdt@emdete.de>
Cc: <wireguard@lists.zx2c4.com>
References: <08a201d65946$e9c84f90$bd58eeb0$@lindenberg.one>
 <1594720777.ugfhft3s9b.astroid@morple.none>
In-Reply-To: <1594720777.ugfhft3s9b.astroid@morple.none>
Subject: AW: two client connections -> crash?
Date: Tue, 14 Jul 2020 15:43:37 +0200
Message-ID: <09a201d659e4$c6e01c80$54a05580$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Thread-Index: AQH4Yw2c9ZJa5jZqt71DuJomCcR4JAJ1SSEgqK9YODA=
Content-Language: en-de
X-Last-TLS-Session-Version: TLSv1.2
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

Good observation. I never really understood  what IPs I should put there =
and also didn=C2=B4t find a good  documentation on that. And obviously =
with one connection it wasn=C2=B4t that important to get it right. What =
IP addresses or network should AllowedIPs refer to? Client? Server? =
Tunnel?
Thanks, Joachim

-----Urspr=C3=BCngliche Nachricht-----
Von: M. Dietrich <mdt@emdete.de>=20
Gesendet: Tuesday, 14 July 2020 12:11
An: wireguard@lindenberg.one; 'WireGuard mailing list' =
<wireguard@lists.zx2c4.com>
Betreff: Re: two client connections -> crash?


Quotation from wireguard@lindenberg.one at Juli 13, 2020 20:53:
> I am trying to configure one client system (Ubuntu 18.04.4 LTS=20
> (GNU/Linux 5.3.0-62-generic x86_64)) against two servers. The=20
> configuration is very similar:
>=20
> root@Mailcow:/home/joachim# cat /etc/wireguard/wg0-client.conf=20
> [Interface] Address =3D 10.200.200.2/24 PrivateKey =3D *** DNS =3D =
8.8.8.8=20
> #10.200.200.1
>=20
> [Peer]
> PublicKey =3D qn6CTz578gbrYpzYkvV2okoqkIFHKye+mRj4i/I8Sz8=3D
> Endpoint =3D fire.lindenberg.one:51820
> AllowedIPs =3D 0.0.0.0/0
> PersistentKeepalive =3D 21
>=20
> root@Mailcow:/home/joachim# cat /etc/wireguard/wg1-client.conf=20
> [Interface] Address =3D 10.200.201.2/24 PrivateKey =3D *** DNS =3D =
8.8.8.8=20
> #10.200.200.1
>=20
> [Peer]
> PublicKey =3D QAJANxtuAvdT+HR3fP1I2DXq0Azl0T3jF5s+cW7foSA=3D
> Endpoint =3D nc.lindenberg.one:51820
> AllowedIPs =3D 0.0.0.0/0
> PersistentKeepalive =3D 21
>=20
> Wg-quick up wg0-client ist at system startup. Now unfortunately when I =

> do wg-quick up wg1-client the network stack kind of crashes. The=20
> command does not terminate, and connectivity on all interfaces is=20
> broken.
> Is this a configuration issue? Should I change ports to be different?=20
> Is there some other issue?

The ports are fine because the IPs are different. You use the same =
AllowedIPs for both. And they cover the whole network.=20
This cannot work. What is the intention of that config?

> Do I have to define two interfaces or could I have just one with=20
> multiple peers? But how could I then specify which tunnel to use?

Depends on what you want to achieve. Sure you can use multiple peers for =
one interface.

