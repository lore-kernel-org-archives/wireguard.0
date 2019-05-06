Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4747EC04AAB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E380C206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E380C206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cyphar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6375e631;
	Mon, 6 May 2019 20:28:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eed51a0f
 for <wireguard@lists.zx2c4.com>; Mon, 6 May 2019 09:33:17 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org
 [IPv6:2001:67c:2050:104:0:1:25:1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af201c84
 for <wireguard@lists.zx2c4.com>; Mon, 6 May 2019 09:33:17 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 8E0DB4DDF2
 for <wireguard@lists.zx2c4.com>; Mon,  6 May 2019 11:33:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id 1BV0rEfyEobW for <wireguard@lists.zx2c4.com>;
 Mon,  6 May 2019 11:32:52 +0200 (CEST)
Date: Mon, 6 May 2019 19:32:45 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: wireguard@lists.zx2c4.com
Subject: New Verified ChaCha20-Poly1305 Paper
Message-ID: <20190506093245.w4mlnvggtuei5pia@yavin>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 22:28:35 +0200
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
Content-Type: multipart/mixed; boundary="===============2973757670682627825=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============2973757670682627825==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ykog4guz5ist5x7q"
Content-Disposition: inline


--ykog4guz5ist5x7q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I just saw this paper[1] which claims to have an implementation of
ChaCha20-Poly1305 in vectorised assembly using a method which
"deliver[s] formally verified vectorized implementations which
outperform the fastest non-verified code"

Is there any interest in using this for Zinc (it's my understanding[2]
that the ChaCha20 and Poly1305 code in Zinc is *not* formally verified)?
The repo is [3]. It looks like they don't have verified generic C
implementations unfortunately, but aren't there verified C versions in
HACL*?

[1]: https://arxiv.org/abs/1904.04606
[2]: https://marc.info/?l=3Dlinux-kernel&m=3D155405777331772&w=3D2
[3]: https://github.com/tfaoliveira/libjc

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--ykog4guz5ist5x7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb6Gz4/mhjNy+aiz1Snvnv3Dem58FAlzP/zoACgkQSnvnv3De
m5+vwBAAjkCT9b86JLkzIopb72OLa7F2dGthNuDlQt1fANQQo4GTthAd2rjJymeN
xpxbkxYFA+qGXBqFZkkUDnGTge1uA4BBdz7ypBwkthNQR1XdSwT5OQFX29ADO1cj
+GrgYJwbwZGTaKQOcXmkQRov4D4StkAIG6TbKwLAfPRWBnw+LVkN2qdjM2ikxddh
WGk9MulVWHEY9PsYZnvIm883qREKQJx93f5UgPcJPnl7cTnd2SQY3S5Px7ZkuNcj
wQQVHIFVdwpZTmwfTh0Cc3M28MUdq3X4Ff9v9dHYHsdCFOXxldZ+YKatflLLEf/g
S2H2TZYzmeQ0NdCgiOkE5KcgDxqXWHZbTEknNFw2vihYcVxAoTADwb7W4ICmnWkI
RIvPAWb/oI+fn+mwjGm3wQI3fPJ/eJeFh6RW+IYHjtwE3QLwKr5i77L7C86N0LN3
VMR5sc7Y4b5loT/b5gzV9d0odmzHcBGBkAgCGnpcDqpJ7DzCsXJ3qEsMiSRmPaqx
WoxQsiXjk/Bj8wx2b+gDr+6MOlX8rYUyOPa8zIbQkopzo9PNpPSv+V8KJp9Wo6XD
C1S9iFStDMBpgMa+9+Ktmwkf36i5IAXHt+8Mzx3jwzavWsRS+4ix1lhiao5RcT+X
kcRx3ElnHuPtwKLVyDsOwCdGMItam0tORyDz0Bh5xlos988q+1g=
=4l3q
-----END PGP SIGNATURE-----

--ykog4guz5ist5x7q--

--===============2973757670682627825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2973757670682627825==--
