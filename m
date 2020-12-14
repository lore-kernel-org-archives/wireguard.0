Return-Path: <SRS0=Eyf3=FS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1958AC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Dec 2020 10:35:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4223822AED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Dec 2020 10:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4223822AED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2355d98d;
	Mon, 14 Dec 2020 10:26:34 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ebceba76
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Dec 2020 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1607942076;
 bh=s8nEGvQr0a1ATDldkuBEofOn9k3WWOUeNZiqsnFvFWo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=OMN5NwUDS0KDuvzhujURTZpdOjDPrWP5xatva+C7S9Xjs89Vob7a55PdUAIdsAx9L
 ZfgjVIGT0GcNk6KwEh+UD61kKfHD5m468JZ4UVidrL7Z7Mfz/u/Retr0TIx67+m8Uy
 GrOc7JI20TRqebdYhA7FAfHZ35gzWASJPhQTXibQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QWG-1kkLKl2dxw-004RMa; Mon, 14
 Dec 2020 11:34:35 +0100
Date: Mon, 14 Dec 2020 11:34:33 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Adam Stiles <ajstiles@gmail.com>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 wireguard@lists.zx2c4.com
Subject: Re: [PATCH wireguard-apple] Update SPDX-License-Identifier tags from
 GPL-2.0 to MIT
Message-ID: <X9c/uYpOSXi5S4Rj@latitude>
References: <20201210235412.85721-1-ajstiles@gmail.com>
 <X9am5M94oX00YKU4@latitude>
 <CAB5G8p8Y7+TcjBQYWQy+kZMjD=-qv0WoY+vn0dp5A_6FkSGDQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hJFPn/cjqMXSyaNE"
Content-Disposition: inline
In-Reply-To: <CAB5G8p8Y7+TcjBQYWQy+kZMjD=-qv0WoY+vn0dp5A_6FkSGDQw@mail.gmail.com>
X-Provags-ID: V03:K1:eHm50XWNc3JuSl+dLy8GSysh6+wLJDVqVZwG6CXVQP34P734T+a
 V/tBhzKAkDBK+/k6MZk7jQAyc4UAOCbHsWXRAjk15Vc2uqxbgB5PgNiqYdgY5pC/9lUoi4p
 YZJqAahd8/pIYjvpntWASXJXQZ88sUg9+mf2g6x7jAGDwdtU8L3ISukqmePrR459yjGJeLQ
 3DzhXEmOt7iKOsBOyU8BA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IrDM70244mM=:+yZ/yvonllcaBr+GlFCD1s
 2p9ZQ6tUzmCwjHn27BWpkLaDo6G8F0pYd9Uo86y/FHAwI3lfkWgHh7Ydi581Pgy9txfLaMK1R
 cjw5lao9ehbJ8tzzj9tpfViD3VGf+uWsDiiOy3fu4CMVl3728dFvaKqpj0Ky2dRdbi62ACtTG
 aBdptwW1sKTCwRTBmhkZUzTMc4rADqnXdiyc5NmLuYeGVq4NT620hIQ1qqfVwsRU/lOMzdCNp
 C2DvrNJSxoYZ6EaEf1FxX9Hb3EdVYsUe9i1HnItqxlqIaMEAu82NhsaZUE0oZhI5OKK/fQb6D
 rGgLRaKcTcqChGhIukxpeDckBAB9rtCyxxGUXGO5lOV6e92YHbn5dgBVokjBAH5sANx+bUyql
 MUW5qr+DheZHIsayfLBUG19I8x0UhnZ2R6f3ByKu2oOmOlyyQOWDyY6fIRvUCYwIEA9q83HlY
 eOGVJJhQ8RpljeZ0xv9Cqib1/w2zoQzGVW6l3iXxBVQaopC16VLctTDqHWOwFfg7YNq39qfHo
 yVjWl1Plj/klOzvy9hH/TNpg2H988pjpQjFlVZ2QeVDiyo1hjilyfMR2pBY1SCB6weHLUKt/l
 rL6INFAQKAKXKnhoY2gwJmHrhac78RctKEEQcTAfm4UH4X+2/L6hVY9OJ7nm0IVm8W/X4vpSI
 FmmsRyMDVPwLufSPzUxhWlE/LWLp29nNPX7hghxkZOkOUJcOa2fAgxpmRhyJsr6QKHrx9qZOc
 gFuFltatxqDJn8taAX+h4/a5MO1whbyhv76ZJvZmfLC0yQEVr5AJy283XMB2tvh3LXMSLYoEI
 jPp6y876OVK5mVCThoX+AKrZuCYoffRTqnt6KVWV1EWn+AQePZAvTN9h0G0Km4HJfXwf45oUu
 LeuW60lp4gJBzmdxcP8Q==
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


--hJFPn/cjqMXSyaNE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 13, 2020 at 07:16:46PM -0800, Adam Stiles wrote:
> Hi Jonathan,
>=20
> Thanks for looking at the patch. In retrospect, I should have asked
> about this before I submitted it. I wasn't intending a re-license.
> Rather, I assumed those SPDX identifiers were missed when repo was
> converted from GPL to MIT a couple of years ago.

I missed that detail. If you send a second version of the patch, please
mention it in the commit message, so that misunderstandings can be
avoided by reading the commit message.

> Apologies,
>=20
> Adam

No problem :)


Best regards,
Jonathan

--hJFPn/cjqMXSyaNE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl/XP6gACgkQCDBEmo7z
X9urKhAAyHSXwKnQ3jDuF1agNLKDy+kJ3og+xs9HW6iJoWVgARwRRQq/D/VFeukO
wxVfDz7oxZJG83G7lIXypJuxk5U2OyubGyYDWWAH+vlWeAXP9Y0Dj1E45vvCmE75
F/XTnK1gh/ZPQyDt7u2n9+ZKXSkTBgaDP0AjRmEmphLq/yvY42VAT4cpdUVXtHND
psqBl47f8h8fTc80L38yeqjzC166pjnH84AOKaiEcIiMqopXPh7ku5v8r8/tafjM
cmjwSbET+X0/GxY/1JyQdup/PiJcrnEnLfT+GMjQBDrQgG2YR1Mj0wVpvnLZ2LZh
a1cUfLWlByRa9zh9AWriVSm142xfZGIUF/I06u4ZJl481yb13IE6D+mfKmKMk3I8
qwybkqEAxzwHoU+RUHYx/bWg06MyJ7kYtvOgTKETwcm4/5Hj3La9rpLvAlOFjYtn
oNtNA6tPO1bWZljkMgTooyemFPzS7eC2OZKUinOslylIY66pKjiydieXIB/gFUWz
1YzkWC6ZUwWPyDszVc+pkLpWLn++Qmhwnv4sTShRzQ4g6qFXpxPZfmE9T2Uro+XL
bT7Cjwt9qk/XJJZfb/4bHMgaTr+hBUm7lKFwf2uoQ/WY3GMgYjnhmCbvH/tZP2nN
SptmfQpGqAgmFlHWTgQFPXeOprlAjwtV1e9rx5V5zO1G1L+4bW8=
=DiLv
-----END PGP SIGNATURE-----

--hJFPn/cjqMXSyaNE--
