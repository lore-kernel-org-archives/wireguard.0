Return-Path: <SRS0=4s/d=OX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B5FC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Dec 2018 19:38:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71446206E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Dec 2018 19:38:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sunfi.sh header.i=@sunfi.sh header.b="mJ/39r4J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71446206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sunfi.sh
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8912f3f6;
	Fri, 14 Dec 2018 19:28:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cd6a4b1
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Dec 2018 19:28:49 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f82860a2
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Dec 2018 19:28:49 +0000 (UTC)
Date: Fri, 14 Dec 2018 19:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sunfi.sh;
 s=protonmail; t=1544816280;
 bh=Cg+a14fr3TlPbXTRz4pZM33U0Ebj+aNTGiiECvxHMDY=;
 h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
 b=mJ/39r4JE3RQRFE5TuZPPFOBs8STTssaTNGOHlxq6lGEeGq38PNg90txsTGjSiZZ6
 yLUT/D18OwbcvoiXmOGLEHjch3gaElcHPbKR9RwNIhQXI3AahV5JfQyR9MvImAdgIJ
 XUdMFbFZ1pPbtnQnnTb1mdDiNY8VRJRlpBrjUumc=
To: "jason@zx2c4.com" <jason@zx2c4.com>
From: Phil Hofer <phil@sunfi.sh>
Subject: last_under_load on 32-bit systems
Message-ID: <0oqG1T7qs16b0xaYr-Ms4h-ruPx_fLfU7or8BZoGmr5BZkbYPpBANDJz_yIr7tfxsxpFPTdDznDdjjLk6FMyoO2LPwhKI-uNZvmFtroeqbY=@sunfi.sh>
Feedback-ID: KQYgXwW95KZKFtdKXbDLp7uXG-WRoO_GBxBXScjXQTnH4hk8IX5tVgVB60E7xVGeWaFgWV0KxGB7LiMdLyDAuw==:Ext:ProtonMail
MIME-Version: 1.0
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Phil Hofer <phil@sunfi.sh>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4295942268548251929=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4295942268548251929==
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="---------------------74c8a95e44a0c21b0d6617b985185250"; charset=UTF-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------74c8a95e44a0c21b0d6617b985185250
Content-Type: multipart/mixed;boundary=---------------------b1d39c33a19d089245a53924c63e3e0b

-----------------------b1d39c33a19d089245a53924c63e3e0b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hey Jason,

First off, thanks for this wonderful project.

I have a question/comment regarding a bit of kernel code.

Background:
src/receive.c has the following code (lightly edited):

---
static u64 last_under_load;
bool under_load;

under_load =3D ...;
if (under_load)
    last_under_load =3D ktime_get_boot_fast_ns();
else
    under_load =3D !wg_birthdate_has_expired(last_under_load, 1);

---

after which the code uses 'under_load' to determine whether
or not to demand that handshake cookies be present.

The comment above 'last_under_load' says we don't care
about races on that unsynchronized global. I assume the rationale
here is that updates to last_under_load are always values from
ktime_get_boot_fast_ns(), and therefore observing a value
produced by a different cpu core won't produce meaningfully
different behavior. I agree that this is true on 64-bit hardware,
but I disagree that the race here is benign on 32-bit systems.
If the compiler decides to access the 8-byte storage with two
32-bit accesses, then it's possible that another thread could
observe the intermediate state in which one of the two words
has been updated. (I think you're most likely to observe this
behavior if wg_receive_handshake_packet is preempted, since
last_under_load shouldn't span cache lines.)
The thread that observes a 'torn' write to last_under_load may
not compute under_load as desired, and consequently drop a
handshake packet that it would have otherwise accepted.

I don't think performance would change meaningfully if
access to last_under_load was mediated with
atomic64_read()/atomic64_set(). On ARM, for example,
those macros will typically expand to a single ldrd/strd instruction, whic=
h is what you would want.

Let me know if I've analyzed this problem incorrectly.

Thanks!
Phil
-----------------------b1d39c33a19d089245a53924c63e3e0b--

-----------------------74c8a95e44a0c21b0d6617b985185250
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail
Comment: https://protonmail.com

wsBcBAEBCAAQBQJcFAaRCRCcWq5QArEh8AAAHkkH/iThirhHzj7DHf+wieWn
MIAJnJ5GPMalU6G5BjVGCtefAUXeqtriL1/UR2pa6D+p73BbXg1cKBkeUOGC
hoePMB/n82PuJzO5eVchh7sgmfO0NUR/FgahW3WvjWSsIB1xaZLwTOpBX2CF
SgK5WxqPy5Ja9Y7GInssWg45IEmDOKMJ0rJOU/ec9HwP20P8ZTS429h3PPtN
0gz2hXRWolsoLpGps2Ifx4NI/gaaSMku5KiU/hCJRXgALhV/PuJ6WLJjgxge
L4YHyhBVuM8K+ncM/bKtmmsAtqPLr7MVbEsFAHcN2qHC0ludyl0dQ99I144g
yAhEHbeFGczYp7LLrhMvWq4=
=zF73
-----END PGP SIGNATURE-----


-----------------------74c8a95e44a0c21b0d6617b985185250--


--===============4295942268548251929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4295942268548251929==--

