Return-Path: <SRS0=050+=FR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACC7C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 13 Dec 2020 23:43:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D7ED207C9
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 13 Dec 2020 23:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D7ED207C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f3f5e79;
	Sun, 13 Dec 2020 23:34:29 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bacc9546
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Dec 2020 23:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1607902949;
 bh=og3LDIVDksuPJAgDb7h6VXphUAAVCU7BR3jTXajMg9U=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=kGg0oPSg6Gk/TdvZ90zfHfTBc1xqH73n9tapX+7GP++JUL1DveEuOXOetMBKwqNsa
 oylYiFKPgN+irKZQKStX60sc1bX3C2XpmDVPUUGONeXvnwOY8p1p6DKy6O1XMSWphp
 Q1deRKgBhad9EFFNa+Xthp9I7KyZZ/ihah/cV0Kw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6R1-1kEz4h3cfL-00aIMt; Mon, 14
 Dec 2020 00:42:28 +0100
Date: Mon, 14 Dec 2020 00:42:28 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Adam Stiles <ajstiles@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH wireguard-apple] Update SPDX-License-Identifier tags from
 GPL-2.0 to MIT
Message-ID: <X9am5M94oX00YKU4@latitude>
References: <20201210235412.85721-1-ajstiles@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s4jm7tLzLtR7zu7M"
Content-Disposition: inline
In-Reply-To: <20201210235412.85721-1-ajstiles@gmail.com>
X-Provags-ID: V03:K1:tZc+DUGlconcBEbEQv4lsdqZLUrlW3/5lWTxpbN+cdDn2YYMBWK
 EYE525Y/SjQjPP/5h7+V5Q/IQPSjV9uMk/XQ5AiOLjPtbmTQOrjca9RyeO2BRG1QdNcy6bD
 IboxpMkJp4KxTFms4nDKneV+x2Y2K8S/bbUgGJf7Ir0TvefhtKVA/LjKzPKStz18UzDitIO
 pQrVyYgL3nibV9dKCPCrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0Ja8CgMLoV8=:Yl6bWYd63kixoE4d6FHYlN
 MFxwkLE0+sATivMb0q1W/FtDYO450ctm7YXN8713CXvrdDSeUWhooacjejNeN+cmnSsoMuZIb
 8XXqwWjf5i1sfJ25ZdxeHpL98MjX5i2S93sLYQgBqjsayZcGZGgSh2gEgsUpLIIuREFtvBtl9
 pvWKNL+0tLvvJV3dyZKW00gJeOJpNpJcWAjB1Nez2RBUFJWOJRlZdN4P23/MQJsGYO6HJO8/b
 DI9rg3UsgS3TjGKVdPEGVqixzZdGrKfb7yzvjsgyQMGXU3gsTGQIDp+grei2gn6OIfGVKTzS6
 JwxVsA6UG5y8gBiLLibCeDnukyxl05V4uRsxsSSNdYEHTIP8kig98INSzq5JiJrjzyhJTHst+
 tgMmP0NL5bC9/qGQCIOW2WEQr5GgWv4nvFva/nYWRHspYusDO8pdY4xuGGOGwZHz/fwyZLCKd
 LGMzRh30BLgyil3+UbUJnFF4wyk+NQG8B/xwOpMBc88dwRVtJE0m2CTF+xeICopH/iNwQGksf
 No+2Z+Q10+v4mfnOCfVbGH+pC6MPFw2rCusvN6kS482BhioNVOYkB4kGrtS7DcLEIRl3T0cma
 yrl9YskaZ0l6UenJtK0i/xf14fKkYZB5tNoNqYh//uJOOdZjGlONcKViV9qWdQelP6B6zoHfe
 9Lj3IX7QoOC2SIMHb/TvT5r0zgmgk37DJfAvnbWsFdctFzXY1EJB2gw3nzlI6MMA0zJAzzAvU
 uAIqD4+ovM6u+DaZ1iZZ5YwBgzs2bDbnXI7k1o5gMvoppLGRxgDNvGRsxHG2aiTg9LSq8d+n7
 BYXa60ZZmoBJF9x//M7iHuG6T1a9xyeef8F/RxheUZ70QLW8RYLEtiIUQJ1s738KeiaYMEAL5
 tR++UdHBTqg1YN53N+wQ==
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


--s4jm7tLzLtR7zu7M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

a little drive-by review, since I happened to see the patch.
In case I misunderstood something, I apologise in advance.

On Thu, Dec 10, 2020 at 03:54:12PM -0800, Adam Stiles wrote:
> Signed-off-by: Adam Stiles <ajstiles@gmail.com>
> ---
>  Sources/WireGuardApp/UI/macOS/View/highlighter.c | 2 +-
>  Sources/WireGuardApp/UI/macOS/View/highlighter.h | 2 +-
>  Sources/WireGuardKitC/key.c                      | 2 +-
>  Sources/WireGuardKitC/key.h                      | 2 +-
>  Sources/WireGuardKitC/x25519.c                   | 2 +-
>  Sources/WireGuardKitGo/Makefile                  | 2 +-
>  Sources/WireGuardKitGo/wireguard.h               | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/Sources/WireGuardApp/UI/macOS/View/highlighter.c b/Sources/W=
ireGuardApp/UI/macOS/View/highlighter.c
> index e0d4e04..55fabfd 100644
> --- a/Sources/WireGuardApp/UI/macOS/View/highlighter.c
> +++ b/Sources/WireGuardApp/UI/macOS/View/highlighter.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: MIT

AFAIUI, such a change expresses a relicensing of the code, and it should
(IMHO) be made clear in the commit message that this is the case.

All authors of the code must agree to a relicensing. It would be nice
to see the list of authors in the commit message, along with a
confirmation that all agreed to relicense the code to MIT.

> -/* SPDX-License-Identifier: GPL-2.0+
> +/* SPDX-License-Identifier: MIT+

I think MIT+ is an editing error. It's not on the official SPDX license
identifier list, in any case.


Best regards,
Jonathan Neusch=C3=A4fer

--s4jm7tLzLtR7zu7M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl/WptsACgkQCDBEmo7z
X9sISA//duy5DONjRb8Bj0MPNDl2HcukDqCbDb8QnSGW6d4ymQdTJybYsyAlNWZq
uJA48NdCpIj9SiAJw6g0JxokilxDKbXUzne5yYWsorq6+pGs+HF0+LEbfMiMWGrF
CpdGfcPcFq5pFpqbxQgCOrB+3zp0ahZHSQ75xenrghlp4BLeULeVfu6Bl7lPXipr
CEOGT0QGK6sj96L8sLWs2FbyLgepXUnaEHvrwvW7keS5PnhFItZQXXGHl+TOGgAV
jtTpABQBMIDIqkH6Fk0EVpR5+x39MD3mDbFouftUkHrxXrKMkjUWOMYmyfkNTFSs
Elv70EtYWz+gOdTkzcK1dCg0E68RsKJXLjKI2SIYpOhp+q9nsedLcf6KPi2Cetca
cQG0ztczn3rfRNFJmtpL1sm/X3UvSZwgMN92CETf6mJmXSZvZs04SKIWGHwO8kyg
aK0saOwlisvw2gyh/eFv99ocZl8BdcF9gXVgPAmBY3yJvoKMFRZrXdv4V12+5bWx
HRjbwVf1TRqSb+rlJheANeexl98+0d/mgMo8YMYdBaAJkWdE3cVjVa7UZGQWk9+N
7l6X2/EG1lrWmGD9Z1O+wPSRay0RoVvFjKH01mBSxZ/xdc32mK+KX0wiV4R/DLso
Xi2Rwy4OWBoyxANl9yS9zNqsomKMqMG8aOvfxK1QNtx7q5W7gwA=
=Wo+D
-----END PGP SIGNATURE-----

--s4jm7tLzLtR7zu7M--
