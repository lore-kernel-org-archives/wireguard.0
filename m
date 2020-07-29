Return-Path: <SRS0=HOwu=BI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEECC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 18:37:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 390A22075F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 18:37:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sunfi.sh header.i=@sunfi.sh header.b="x+dLpodc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 390A22075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sunfi.sh
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6108075a;
	Wed, 29 Jul 2020 18:13:41 +0000 (UTC)
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id acd7f532
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 18:13:37 +0000 (UTC)
Date: Wed, 29 Jul 2020 18:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sunfi.sh;
 s=protonmail2; t=1596047832;
 bh=zlwicUmr1ACGTXwAvRTK5ZLUc37u2w8qQ5D1PSerJG8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=x+dLpodcHwVeMnLPgrwINkfuiEPZzGQlDM7fn9x8KAc9eJTzI5FGcmi7G6Z8lAjAL
 JG+4QxVo2nIz6MoZREzVOw0QnFmYd/LjZNVVzqa+KuLwbWWMTeEFbFkt8uu3rRxLQ9
 icbkic18k+U7CSoTdGzDOaftdWazZHitbQ3Aw05i16s0jQcK/k+R1oEFC2gyo92fGy
 +7sRColuNJTmU4tBi8dBD7lDbV5vruuJ+gNYaw3uqyS+bmeH+IvKVNnd7RFjil62XF
 lvQyrMjOpy6XPn9qxb6G/ipz0lJmkzzk75G/4W76AADJMjYWXYbp7SVoeXN3lINb2a
 R6yqY54t0EfFw==
To: "noloader@gmail.com" <noloader@gmail.com>
From: Phil Hofer <phil@sunfi.sh>
Cc: Marjan Olesch <marjan.olesch@gwdg.de>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Hardware Security Token
Message-ID: <6xvBD8jIUMT-g1Be5rHjqCAFr7CGHDAhPV2Sk493EmaOQviayUQKUEfNgyOlFLRuqcjbYrZukzEiKWQ7KpxqrnPxN2q2wS-p9_qIMKUt6pw=@sunfi.sh>
In-Reply-To: <CAH8yC8=V_69QctjdZMpjgkA=ze7KzW8k+HP4xYN_zz3-xDW6OA@mail.gmail.com>
References: <cd5b0b55-fe63-e4ec-7ee3-b68fc9e95e31@gwdg.de>
 <CAH8yC8=V_69QctjdZMpjgkA=ze7KzW8k+HP4xYN_zz3-xDW6OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256;
 boundary="---------------------f36b52f9ac789f096905ad80426062cc";
 charset=utf-8
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
Reply-To: Phil Hofer <phil@sunfi.sh>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------f36b52f9ac789f096905ad80426062cc
Content-Type: multipart/mixed;boundary=---------------------a9c5cc0f0d538ee9f479ffaf5c365dd4

-----------------------a9c5cc0f0d538ee9f479ffaf5c365dd4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

> I believe Google has a secure time server/protocol for this problem,
> but it is only a partial fix. I don't recall the name of the protocol
> or the server.
> =



"Roughtime" https://roughtime.googlesource.com/roughtime

-----------------------a9c5cc0f0d538ee9f479ffaf5c365dd4--

-----------------------f36b52f9ac789f096905ad80426062cc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsBcBAEBCAAGBQJfIcG2AAoJEJxarlACsSHwERIH/3EFQ46t4Fa7ttM3uv2U
ZoK+GpeTUpVBdkGE8urU5xetbC6wUWuQDxBmO8KK/K0MIll5QowQEmQI7IQw
6sPim1yJMEPA/8wNIksy3SxE5v2NPgtsTsmqDYfh7QXcS/adf98EVSPGbiMU
v4LrXlzz9oDyi6RPNESVjySQCRR+IbjMRfsJrggzLEo5k2Mqm7s6+XnrAVge
yw405aPrcvha1E+Yoa2hZIV7p8ErCw5Y3Vhb/FeQgETbNFgD0l49pGI3bceE
vVd1F05+AD89Wzkg1uIg2ga7P1V4JVAVsFiudYrCn7d9wxZMh3QnuwB76Wg0
KJSzc75VXnoXr/DiaEDeGmo=
=oIyA
-----END PGP SIGNATURE-----


-----------------------f36b52f9ac789f096905ad80426062cc--

