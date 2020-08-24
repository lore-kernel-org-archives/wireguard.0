Return-Path: <SRS0=mjoF=CC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AEEC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Aug 2020 18:20:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C09A20738
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Aug 2020 18:19:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="BbOVD3fm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C09A20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27c60c6e;
	Mon, 24 Aug 2020 17:52:48 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f1ae4a42
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Aug 2020 17:52:44 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id C8A8416005C
 for <wireguard@lists.zx2c4.com>; Mon, 24 Aug 2020 20:19:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1598293181; bh=DqsMRd9qE59O1l2E4smzXPm48ot0jm5nUnG/twPA59U=;
 h=To:Cc:Subject:From:Autocrypt:Date:From;
 b=BbOVD3fmvPkt7sBqmFW9gh3zC7z9gBbXy2DiR/4Y5jNODp0eXQ6fG+IpL2HttuOiS
 mP4Y4QdLxxDPrjZ5zd8D1t/w9CRcFtKZlF59d8nqYr4APCgQ0w1M18c/fu0L9M3jqU
 edHu4v8+H0lCrzQTSIObflyhZ2XvKNKX4ClNiP5FEA/LWr3L6yXE+dIOtRa1HJMWJc
 QyCWkdhYxXSD1eRjpuHqVpYKm1tFieUXqCfO34kkReBMRriibetXRUJsvYZyclAseQ
 t1l23tU1EP9GiNxL4YnWwRDOHmbeQXzu6WwZ7DTxeJSfLkxU3fLdbIYUMeEdS7r5dN
 LFDCoudRQ93eA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Bb0lJ6rNCz9rxL;
 Mon, 24 Aug 2020 20:19:40 +0200 (CEST)
To: jason@zx2c4.com
Cc: wireguard@lists.zx2c4.com, wolletd@posteo.de
References: <CAHmME9pC+M1Wh-NCa5XAUAVFhT5hnJA2Rdnfj+DWdmxk5S5rLA@mail.gmail.com>
Subject: Re: Invalid handshake initiation after peer reboot: bug?
From: Eicke Herbertz <wolletd@posteo.de>
Autocrypt: addr=wolletd@posteo.de; prefer-encrypt=mutual; keydata=
 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
 53DKA8rg
Message-ID: <7aa9fe5e-2ae2-cf8b-ae6d-d98de2031b44@posteo.de>
Date: Mon, 24 Aug 2020 20:19:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9pC+M1Wh-NCa5XAUAVFhT5hnJA2Rdnfj+DWdmxk5S5rLA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cZ1jsTrX4XkaaL7m3xD7iE2xfYf6tzlgn"
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
--cZ1jsTrX4XkaaL7m3xD7iE2xfYf6tzlgn
Content-Type: multipart/mixed; boundary="3uovtEXvIDQEYQQkL6kEHPUeHKa6PFvDr"

--3uovtEXvIDQEYQQkL6kEHPUeHKa6PFvDr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Jason,

thanks for your help, you were correct!
It dawned on me the moment I read "real time clock": While OpenWRT
enables network time synchronization by default, our customer blocks all
internet access other than to our VPN server for the devices. That's why
it wasn't reproducible in the office.
After pointing NTP to our server as well, WireGuard is back to it's
instantaneous beauty.

Would it be feasible to distinguish some cases of "Invalid handshake" in
the debug log? Simply reading "replay" somewhere would've helped
probably. I'm using WireGuard for about two years now and this was the
first time I actually had to enable debug logging to understand my
issue, but the debug logging didn't help much.

Eicke


--3uovtEXvIDQEYQQkL6kEHPUeHKa6PFvDr--

--cZ1jsTrX4XkaaL7m3xD7iE2xfYf6tzlgn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEysrPy4/39JJpWQvjrB2FpvudpmIFAl9EBLkACgkQrB2Fpvud
pmKmjg/+O4z+r/M7TdlIo2+LbcsNA4O0B0fLwGWvs/eChmBkZVu7vPiZarsu7hRI
jP8e/zOHy+WchvSjG1XiqyQ9jIsOa8kwxFdP+BA6/uxDP3ma3o15lWgiozpOT/lm
6CUQgLcTbaKohxNTQXENVf9TFMnsDEboQlt6BZw1PWHNtS4/Qj7YWeUXDP1cHzgZ
fM9OIlPVqFpne4FV/ojwPOk1cBau2eO8BfPvIPweOMAf90RlddyhYrpcDN6IP0dA
YEBG/7ZNVejbNbgnCGDTY+0gi3QolFhMf09UgsUnyGRuDKUZ99ysyWZHV3kKUnby
ewalSrdxcIw6++KhbGqE4z3B1M5vbHmtz2d13xXzc46zxqi3E7RgsEHDIGXQ6MoE
+L2f+dEXBBUySjZs8KwdNJyIC84WAGqaM9FKYLDPKKzLExAS3DUO0d0hwjSNaMaO
1nBQJ92Fv1UhgmugBg9l9C0FyTp7Oggt263WZVev4MnuAtZzh+nluYXZX6lxv48R
VipMTNbbg5p5bu46mH7GXgtw1cJ6Oze3gd1EjPo5Q9xikCFrF2M7TZQeetgmk3rx
yG2HcbTh/MGlqgy2yTKwmcNln0DpCDFCzFj4zikOY9+X9GWtNVDYt0RK/GDxEdYb
f/vpiOQp050PcVsnu4exWPypO7sV2ndLvcF2xVRz3dFpqlCuDEc=
=HR8b
-----END PGP SIGNATURE-----

--cZ1jsTrX4XkaaL7m3xD7iE2xfYf6tzlgn--
