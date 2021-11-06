Return-Path: <SRS0=nQDx=PZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D497C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Nov 2021 16:54:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 126CB60EBC
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Nov 2021 16:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 126CB60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aaronmdjones.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b296dba;
	Sat, 6 Nov 2021 16:54:51 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b72d1118
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Nov 2021 16:54:49 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 805813200B5E;
 Sat,  6 Nov 2021 12:54:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 06 Nov 2021 12:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 aaronmdjones.net; h=subject:to:references:cc:from:message-id
 :date:mime-version:in-reply-to:content-type; s=fm2; bh=v2Z31bglm
 WsXqLBHMaBTmp1OD+3MSzi/5zJ1cLAInMk=; b=TGiLinBrQ5d3JhApYlivE82sE
 tQ7MO5dEpuyXFpxwylHDcCeo1imj2IBPoOFuph5EdFDTFsfrcZotW97f0D3r0GBd
 7uOSVMis8+0YukSd3RyU7JLqaeHKUhI8HpWrrY6jdQ2uU5sya26z09P6LNK1nhzc
 RBI2ucAUU1rfnbP1OMsPWx6GwokHmXKQ49YwZppqN9igNIiaiUDvqh0Y2HVjpiV4
 Y702JOfl29SliPNAcQ7/aZwZY9RuxB+bl8qmeggCteMNFd4/GstKeaW201eYNBFH
 sD2vZ3a5mSCMd4sQmVsL5+GVrKB9OxHdZd5M5PY0AMi91IXU23GbAK6MCh84A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=v2Z31b
 glmWsXqLBHMaBTmp1OD+3MSzi/5zJ1cLAInMk=; b=Wiwb46s9dCuvHwWs9tDu5u
 x49KuHD8x/xe1e1sjbarXNZCrZgeQsaj+ivSxBFHdgrtGyN23bNxdWhGuJzWtuAs
 it3dy5+1LPqqVFzpA3dLxEpx+4S/ETUNgnybt2ckKpR9jQLgFt92XAcqxYHIiOr9
 KxaveXkeCoAWo3m5EO6L6YisJ0CkUwxaMOn8IBUOaOjZuYG5EUSmm2TphAl7NtCF
 SGKr8sFjTkfPSuVMnFEtcmHJTeXwyz6G3+zRouNN5bVZL07OyWyVEfR+MWa3XFym
 +Qg3ZqEnz7TP0mpdhGx41WwPfcL8gNq3O9P21eV/IuUrYt5wkOC7/kK6fyXEgtWg
 ==
X-ME-Sender: <xms:VrOGYQxnErOw6QJaDe3W-ay8PoTguMrMthbURhc4LrgAASc073k2sA>
 <xme:VrOGYUTEcHahf0g6Bs4LX8RkCMCz3dECN72Y593_4uw3W81q1T0L1TVGHveH_g_8A
 -MGCrEs8-bOPbLx6EY>
X-ME-Received: <xmr:VrOGYSUBaZzkZNtTzrtjESNjqiVmEVJoH8Edk5IaAtUb4pzWJPtzpV5ljDZARp7uLM7aEU3H9w1SV6LYSWYe0AmgKrmuT6t78jIYMvCcsrte0ghWxSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdekgdelvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhfhkffffgggjggtsehgtderof
 dtfeejnecuhfhrohhmpeetrghrohhnucflohhnvghsuceomhgvsegrrghrohhnmhgujhho
 nhgvshdrnhgvtheqnecuggftrfgrthhtvghrnhepveekkeeiieeugfegfffhtdegffettd
 ekkeefteeihfevgeetieeiffetteefjedvnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgvsegrrghrohhnmhgujhhonhgvshdrnhgvth
X-ME-Proxy: <xmx:VrOGYegmvFiEkBr9YbA_AGItnoSeGj0oTo9tnAfYSSIXcw2s3OSgOQ>
 <xmx:VrOGYSDFNB2FxGuDGfihzL2VTiVOqzdkZTJrcvxu_4WjYfD7it4vFQ>
 <xmx:VrOGYfJK-dK1U3Fn3E7zq2SQ6XlYTH7NbFTosGfyZOxeV4la48Xdlg>
 <xmx:V7OGYdo95a5QNW5Ov-9lnl2MkVeFQRan6Qm-nNUrWXAuDme9-NPhmQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Nov 2021 12:54:46 -0400 (EDT)
Subject: Re: Android app: length of name
To: wireguard@lists.zx2c4.com
References: <6b07934f-f0ce-5909-0595-3d50bc2a7c3a@chil.at>
Cc: Christoph Loesch <wireguard-mail@chil.at>
From: Aaron Jones <me@aaronmdjones.net>
Message-ID: <1c7c517e-f0ee-8d02-75e1-5db2d92268f0@aaronmdjones.net>
Date: Sat, 6 Nov 2021 16:54:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6b07934f-f0ce-5909-0595-3d50bc2a7c3a@chil.at>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UEV4Q97GNJ6TexBjPmmjEMBYh9gZy6VZQ"
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
--UEV4Q97GNJ6TexBjPmmjEMBYh9gZy6VZQ
Content-Type: multipart/mixed; boundary="SqSwV2GLaMEV3jv3nbdgGdkdTjRBRisRK";
 protected-headers="v1"
From: Aaron Jones <me@aaronmdjones.net>
To: wireguard@lists.zx2c4.com
Cc: Christoph Loesch <wireguard-mail@chil.at>
Message-ID: <1c7c517e-f0ee-8d02-75e1-5db2d92268f0@aaronmdjones.net>
Subject: Re: Android app: length of name
References: <6b07934f-f0ce-5909-0595-3d50bc2a7c3a@chil.at>
In-Reply-To: <6b07934f-f0ce-5909-0595-3d50bc2a7c3a@chil.at>

--SqSwV2GLaMEV3jv3nbdgGdkdTjRBRisRK
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 06/11/2021 13:22, Christoph Loesch wrote:
> Hi,
>
> in the android app the name is limited to 15 characters.
>
> Does that have a specific reason?
> Is it possible to allow a longer name like e.g. 32 characters?
>
> On importing a file the error "Invalid name" could be more specific
> to that. Because I had to struggle with the file name until I found
> out it is just a limitation of the length.
>
> Kind regards,
> Christoph

The network name determines the interface name, and on Linux, the
length of an interface name (e.g. "eth0") is limited to 15 characters.

Regards,
Aaron Jones



--SqSwV2GLaMEV3jv3nbdgGdkdTjRBRisRK--

--UEV4Q97GNJ6TexBjPmmjEMBYh9gZy6VZQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEUh8K0NtYMbn+mJWCVjfoBb/oPSQFAmGGs1IACgkQVjfoBb/o
PSSl9A//S+zn3An+Q9VrFyCbw+7GfY1GvjQh2Luv8mBjId9mzXYowa2YX+j5FYMX
VpcBa5sn2B4d/veG/HwJ+dXsuseg7Gq5793MxSpCmG0gimj5lY9aDtofB2FctVsx
h3Ka0xxv5pb7CrAuMRG145ZVR9blVxuj30JvSeY3fJDWUoHWdhQDGAYMEwlkWYtK
9+uJdseLnMJAS9Yg0KMHpUsX+p05VrRsnMMrO+/plyjlhjNL1lT58sQxziArn/Fz
9CPGcUxDjQXv47idkg/8n85WU3JzaPSfwFC/HDtgPqYy5Virlz08gI6UZ0mpcyi6
QcZ1OjTeY/q/ZefekPyhvNQmeqdM32c8riKecT7PmE0x08JtPWYmT8TNP3/b59eV
8rZsFV1An8wrj4a9/QqKfhDxJGXVyvMyjkp/zLflhfBvSd427RAqopGb87P86VgS
WWqFEHdGIWTqKysh/LYkfxADn0LqyRigrwEcqOF/1QsXpffjp9dIYXRk6euzuLBG
pSDUv3V4QDuwmBrhE2qwtVzZutSzFHDZLAFIyVPj1lfVEpwzC74HtduIBdnTRZiN
nDmPmmus/zlyYj615JgsqlEc6A3OEyaDfbFLyTtrMfGu2bj9GPXzg4cBNdrw+40z
V66CE8OQe+IF3gSHifZI+CYVVjvtuXQ7WeVWPSnuN9EfQrfWwUE=
=HOAL
-----END PGP SIGNATURE-----

--UEV4Q97GNJ6TexBjPmmjEMBYh9gZy6VZQ--
