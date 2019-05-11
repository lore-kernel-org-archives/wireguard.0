Return-Path: <SRS0=YdU4=TN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F1DC04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 May 2019 00:15:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ED48208C0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 May 2019 00:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ED48208C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cyphar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21408ab5;
	Mon, 13 May 2019 00:15:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9069d99e
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 May 2019 17:11:30 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org
 [IPv6:2001:67c:2050:104:0:1:25:1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ac3d2be
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 May 2019 17:11:29 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id C95184EA15;
 Sat, 11 May 2019 19:11:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id yAiMIA0Bi9eO; Sat, 11 May 2019 19:11:13 +0200 (CEST)
Date: Sun, 12 May 2019 03:11:06 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Henning Reich <henningreich@gmail.com>
Subject: Re: Overlapping AllowedIPs Configuration
Message-ID: <20190511171106.dvlribqe7ogdusrh@yavin>
References: <20190506210827.2h4nzjxjpmwg7kpa@yavin>
 <CAOAVeL3Vqr9GvomZFJafmTky-r_QmcymE0CB_ZpZHOiu=U_1aA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOAVeL3Vqr9GvomZFJafmTky-r_QmcymE0CB_ZpZHOiu=U_1aA@mail.gmail.com>
X-Mailman-Approved-At: Mon, 13 May 2019 02:15:24 +0200
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
Content-Type: multipart/mixed; boundary="===============1188126894027418022=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============1188126894027418022==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v3yzlsqglvzloltm"
Content-Disposition: inline


--v3yzlsqglvzloltm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-05-11, Henning Reich <henningreich@gmail.com> wrote:
> No, I think its correct behaviour.
> If you have overlapping networks  the more specific route is preferred.
> 10.10.10.0/24 overrule 10.10.0.0/16.
> If the subnets are the same, the last one is the more specific (because
> most recent one) and should be used.

But none of the AllowedIPs is "more specific" -- they're all /32.

In addition, the preferred one is the last one in the config file
(presumably because it gets configured last) even if you use more
specific route earlier in the config.

> And in germany, we say (literal translation): You're allowed to shoot
> yourself in the knee. (to be self-defeating) :-)

In English we say "shooting yourself in the foot" (hence a "foot-gun").
But I'd argue that you should avoid designing foot-guns when possible.

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--v3yzlsqglvzloltm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb6Gz4/mhjNy+aiz1Snvnv3Dem58FAlzXAikACgkQSnvnv3De
m59RXhAAyXGiK9sj1i2haFLEcewjSF/Ov+IYG2QGJfsnMMkzVlb2Fqv2fKFtL1js
f+mGDFR5wCOY5Y0acT0BfGLRX+RjTAVV+dr6MqK+cBLGAPeBnFDCKQkUcVFSHPBF
TnBSpirNfHywtu/gsw+A7MKklzvcVYND/g3CnKtxXOrrkLob13UNaHnXS1NMsxr8
1h/QDFa3yp0uc0I40c7Xd2ahBJ0iMQdW1u5wZBL4NLMausyV/jAzvcxfZqQWcN3l
F1Ve6CmzaiQ8WNQTVp5LIM60+JMXTYNAXuJ3nzTo+tqEIhb8kVpZjCi7QEzFu79h
qTXa1GZ3XeevN23TakJegMVdX6nvzHHWUMKMiIDenWaCt7g2+f1jVJBbOd6p/6OF
B3O13vcX6xt8kfdjdYMxpZMKuwnJ3Pz2D1aP5aszwbpkzj+pymZ/5eG7oO8QwY7R
qsU/Rjw45L1Cb5CEuPjOL8J2LZQ95/goaRw4pXcdbFbHP17sNbX9opXFsGEkxImO
8WtQsxQKSGaiSq/TZO2/sVRylDLNV5IJc0wuBc/Ck8WBMwY8gZePBw7dmMdt+3JM
L0Lk5PWMx6CF7fU7L1ygkuZq1Zm+VGB1yK2EIZcCV3Q+6+O89oWU4DX+7l+XIRH3
drUXYlFJ54TINK4uvcdY+mqik1wvLBctBCPR1q/GFr37mZiM1wk=
=sfaA
-----END PGP SIGNATURE-----

--v3yzlsqglvzloltm--

--===============1188126894027418022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1188126894027418022==--
