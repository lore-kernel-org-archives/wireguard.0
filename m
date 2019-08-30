Return-Path: <SRS0=b7im=W2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFE0C3A59B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Aug 2019 18:01:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C09C323407
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Aug 2019 18:01:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sunfi.sh header.i=@sunfi.sh header.b="gCT8fvgq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C09C323407
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sunfi.sh
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1019a9ce;
	Fri, 30 Aug 2019 18:01:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1799b77f
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Aug 2019 18:01:02 +0000 (UTC)
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec00e2f6
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Aug 2019 18:01:02 +0000 (UTC)
Date: Fri, 30 Aug 2019 18:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sunfi.sh;
 s=protonmail; t=1567188061;
 bh=BUQ6FOLF7Y0uYLmdBcPjS3cZyZcGgVns4j/KA2FDZyk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=gCT8fvgqBM73o+W/zaGr5TCXWXXkhOLqPLzjnlRkTLIfmm1awPP0BeUFN9r8Ia6z2
 A0lgkUNljidtmE8yk95JPVE8m/5iSqKRI2zNAXVLmUcIJz9K2tf0nXyl/VTAHUIalZ
 KwpsOY8j+uQaMk4Anlvi7upu4m1UaHWhPkqeC8Bk=
To: Nicolas Stalder <n+wireguard@stalder.io>
From: Phil Hofer <phil@sunfi.sh>
Subject: Re: Support FIDO2/CTAP2 security tokens as keystore
Message-ID: <IbEVN_YV6xE7Vh_wFFWoxkYMb8EjgKtSRUXP3Zs0IWDS51pGuSCjwLxAyuBZR8sweVVHN-V2gctoBYEgxUr_v15pHnRjpMELrzGo1XG3wN0=@sunfi.sh>
In-Reply-To: <CACzkAFoO3==OiS0jgu1rHuHBo5_F-6XkcDW=gBN8p81F70bmKg@mail.gmail.com>
References: <CACzkAFoO3==OiS0jgu1rHuHBo5_F-6XkcDW=gBN8p81F70bmKg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6567745173686241740=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6567745173686241740==
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="---------------------0861779e6da405a16f1b9c9d6d455c2f"; charset=UTF-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------0861779e6da405a16f1b9c9d6d455c2f
Content-Type: multipart/mixed;boundary=---------------------41d696fe381160bfcb00e29dd08dc25e

-----------------------41d696fe381160bfcb00e29dd08dc25e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

>     If my understanding is correct, the bare minimum functionality is:
>     =


> -   store key non-extractably on device (unless you're Colin O'Flynn...)
>     (if there is an issue, just rotate the key)
>     =


> -   periodically do Curve25519 Diffie-Hellman to generate sessions keys
>     (that are revealed to the client, possibly with some sort of
>     transport layer security)

Are there HSMs out there that performs ECDHE fast enough
to make this reasonably DoS-proof?

The last HSM I worked with was a ("cheap," $650) YubiHSM that still
took a pretty long time (~250ms) to do ECDHE. Fine for cert
management, but no good for pointing at the internet.

An alternative that would tolerate slow HSMs would be to
periodically rotate the Wireguard host key with an attestation
from the HSM, but then you'd need an out-of-band key distribution
solution.

- Phil
-----------------------41d696fe381160bfcb00e29dd08dc25e--

-----------------------0861779e6da405a16f1b9c9d6d455c2f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsBcBAEBCAAGBQJdaWRYAAoJEJxarlACsSHwFGsH/iScn6nGzVHOlMlPaXgX
ZGTyq3zVyFODlgCI56Q+p7ld6qqxdBzVBYpbnn4TfNO6irBdA702g6+3DaYl
Ar6FQnGexZynswlYktp6DcYlaBFNxBMzKrq2l4bRxm5ePISUOQui1bh+V5ml
cwLoD5MXzWOyXLmuZikJNyRB0Y51rdvEAglHe2dGrY5PC7/Nhfh8Ho9RSuOO
Mlt4u+eWTaox8hhuzirybTuqDeSRNP6JfaS3rkXPXuBFRfuiN+rls1Eu9JKp
abnJlOOq3io10dGu5Lnc2N1J+mPqpnsX+7ybM1BM1QP03wD5N3NS346E8VsY
VzPYbJCjOCV+SUm3OpnNI6c=
=fEzC
-----END PGP SIGNATURE-----


-----------------------0861779e6da405a16f1b9c9d6d455c2f--


--===============6567745173686241740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6567745173686241740==--

