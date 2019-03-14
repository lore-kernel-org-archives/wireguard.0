Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D25C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:19:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F272175B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30F272175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cyphar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d71455da;
	Wed, 20 Mar 2019 22:18:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18e5be5a
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 06:59:23 +0000 (UTC)
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44545dc1
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 06:59:23 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 6F524A10A5;
 Thu, 14 Mar 2019 08:10:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id 2wOz7FNFj2Us; Thu, 14 Mar 2019 08:10:47 +0100 (CET)
Date: Thu, 14 Mar 2019 18:10:24 +1100
From: Aleksa Sarai <cyphar@cyphar.com>
To: Bruno Wolff III <bruno@wolff.to>
Subject: Re: [PATCH] net/netfilter/nf_nat_core.h was removed by
 d2c5c103b1337f590b7edf1509a6e294bdf22402
Message-ID: <20190314071024.i2iz6l4rc3jnlzaq@yavin>
References: <20190314052150.9968-1-bruno@wolff.to>
 <20190314053402.GA10226@wolff.to>
MIME-Version: 1.0
In-Reply-To: <20190314053402.GA10226@wolff.to>
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:18:30 +0100
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============6612209657578091206=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============6612209657578091206==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ie73hjqssfmqrnwn"
Content-Disposition: inline


--ie73hjqssfmqrnwn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-03-14, Bruno Wolff III <bruno@wolff.to> wrote:
> Sorry about the duplicates. I git confused trying to use git email-send.

For future reference, you want to send a patch series. The way I do it
is I first generate all of the patches:

  % git format-patch <base-commit>

Which will then generate NNNN-patch_description.patch files. Modify
these to your heart's content (you can also generate a cover page with
--cover-letter to git format-patch, or a version number with -v).

Then, you can send them all *as one series* by doing:

  % git send-email --no-chain-reply-to --no-format-patch \
                   --to=3D<to-list> --cc=3D<cc-list> \
                   *.patch

(This makes them all one thread so it's far more obvious which patches
go together -- since it looks like you were sending multiple patches
separately, which causes confusion for folks reading them.)

You're also missing a Signed-off-by:, but I'm not sure if WireGuard
contributions require those (you can add them with `git commit -s`).

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--ie73hjqssfmqrnwn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb6Gz4/mhjNy+aiz1Snvnv3Dem58FAlyJ/mAACgkQSnvnv3De
m5987A/+OkdgawdUaf1u1UzaKpa29ItZLv47ypyQcINGgYRDXny5RyV/b13pC8G0
n20GrGF6dMnPJ/YvliX3hz90YMF/bFbqGXpsUYx6Wh2Rjhgouf1dKCsZ7nrKvN7B
d6K3OlZSWX3A7MWRGdBFJZu1iJU+7a0qdh/wS1wOp4WVTzE0e3rrVXdZv0zi7WV1
eCwCJVw5JiRuRmoK0IeFK84odW0+Augk2+oRsjVLYwmtcltMAj1VdNi+sRWz9Dww
YsEiCxTcSuF/43WsmKdcr6UolUOE331Dn+jaUaOxFX4TEAIyZNPt61YE7SALEpmQ
/AHNqQ+ra0qe9m4McLdJBmEjUmGdMv1cC1u1IkCDjfb468C0FLq4xoxFk8G6H9uS
2450EpJJrWTXgv6D5XNxtvjYHr7+RLsMdAP2aEedPPPY2v32/L+XngYGN2MtWfEv
YPOVi/yPvmAIRv6zLK8X3Y3FIJgptUeUKKKMS4yxZZqqZzrX//l+OVrkKEE1puJx
XTxJ2J6/U7/O4UC2KiKqsu7fh5LtoZLGr4rxjjSXvm+gh7Csr8/Wt3dLrTqiP+x0
fav72WZkaGWtWPggB2z4mTCMK+mFTXhtQraTp28FDXKDwhGaWfjA3rYMsfBJ9h7U
vntdQg3ez4VVcXuMoXjYDfzeC8EwR5UG9osW13ULrIgZIbD9Qks=
=ocqy
-----END PGP SIGNATURE-----

--ie73hjqssfmqrnwn--

--===============6612209657578091206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6612209657578091206==--
