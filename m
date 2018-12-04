Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057B0C04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Dec 2018 03:53:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9197D2084C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Dec 2018 03:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9197D2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cyphar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09a125d0;
	Wed, 5 Dec 2018 03:44:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47e74888
 for <wireguard@lists.zx2c4.com>; Tue, 4 Dec 2018 07:48:05 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e4a60a9
 for <wireguard@lists.zx2c4.com>; Tue, 4 Dec 2018 07:48:05 +0000 (UTC)
Received: from smtp2.mailbox.org (unknown [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256
 bits)) (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 6F3D747E38;
 Tue,  4 Dec 2018 08:55:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id cSjjCyUXDJDs; Tue,  4 Dec 2018 08:55:55 +0100 (CET)
Date: Tue, 4 Dec 2018 18:55:49 +1100
From: Aleksa Sarai <cyphar@cyphar.com>
To: Bruno Wolff III <bruno@wolff.to>
Subject: Re: The Linux Plumbers Conference videos are up
Message-ID: <20181204075549.7rkf2c5ibcezsudf@yavin>
References: <20181203214637.GA17169@wolff.to>
 <CAHmME9ru7_T85oQjaot4e9WzZmo8M361O0hL2XR0_qPEQ92s5w@mail.gmail.com>
 <20181204071535.GA8629@wolff.to>
MIME-Version: 1.0
In-Reply-To: <20181204071535.GA8629@wolff.to>
X-Mailman-Approved-At: Wed, 05 Dec 2018 04:44:39 +0100
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
Content-Type: multipart/mixed; boundary="===============8074143590020192214=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============8074143590020192214==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uzplrymzq2aeq4y2"
Content-Disposition: inline


--uzplrymzq2aeq4y2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2018-12-04, Bruno Wolff III <bruno@wolff.to> wrote:
> > Thanks Bruno. I've updated the webpage with these:
> > https://www.wireguard.com/presentations/
>=20
> I've never been able to find a link to the presentations starting from the
> main wireguard page. There is probably a link to it someplace as searches
> find the presentations, but it would be nice if there was an easy to find
> link from the main page to make it easier to get to (without a separate
> bookmark).

Interworkings > Presentations is a link to this page.

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--uzplrymzq2aeq4y2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb6Gz4/mhjNy+aiz1Snvnv3Dem58FAlwGMwUACgkQSnvnv3De
m58Rhg/+Kt7qlWSgfWq7QkG2AACgJAq6qq002kyV+TcqslPqsB6bMq8tQ943+imL
NaQ1i2l1tAaE0njw+9HVjvicaoR0i6A3SUd4amGMDVcrarLteuQR9TQaYioGynVB
XEt3YXfiEUF+IvA7C4hf3kIfJb4GFjMTaA+i6F+8cPS+9gIjxy8ULk0laB2ZkkmH
A10Htzm4s0Vs3uGAvsX0WSOaFRlI6M+iNSzYtdPxRrdWaSLddsyI0RB0hRTluR5j
in/Yf+tTGL3HH/XTuZBOrSLJKHfFXYY1kMAA+LQ4L6lovm2t29pFLNgTi6MfQ3dA
tXrnPzA4wyVpkpUI5ngAS7KLKAkn/e26apHfU0164VFRRjpif8qmhTHC9ApU2mcF
L4rw8VNo+5pyj8+tU0W7IAGjt/d934oq3CpwmzbFnXQJhLvUSccPwWrCZKvs4atF
QrVqvbEc2fQdG6e9yFAQiJ5UlrxAi+PDq1e1jUxY4dhcyVWxOGUgkEfvvtnssCJ8
e3t4cjeiDiFiLy10S1wZTp2GEj/t3G2jMtIHHI6VhSsh+6h+AIEVxWu9OSnwpL1D
icr/vjhZMTE//mHWYyfYJGLk6G131EFgB/Sxf2OZb3vrJ+QeNMl2/vVJggxs/loH
n0NZ+hsxfJpJX2kfFxNQL5OQ5XtPNwMl7qMLhYVtSpp38KvqsgI=
=FCfb
-----END PGP SIGNATURE-----

--uzplrymzq2aeq4y2--

--===============8074143590020192214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8074143590020192214==--
