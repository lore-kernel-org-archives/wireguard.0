Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BEDC04FFE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2024 10:59:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ab193b7;
	Tue, 14 May 2024 10:56:34 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch [185.203.114.86])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e77c3170
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2024 10:56:31 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 8AC7B202E4
 for <wireguard@lists.zx2c4.com>; Tue, 14 May 2024 12:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1715684191;
 bh=C8vNyRBBPMPphAsxnvTRNaFlZhL3TK/czRzw3vDkZfw=;
 h=From:To:Subject:Date:From;
 b=IZjXwY7GM08EN1EZ/+GfJ66TL7b4cWgJp2ySmaMAgRdIsboh2qThi/HRXn/hd7wsI
 CVAYCohJRGqAghd8a9oIx1jC8DdiaFrj9Xw+WNR151fohdYuRazDDHbPw4YKVFL8ht
 C0VsYI3DdjspONTxfWkh6yz3J0L74SdMCx64FQ/jK9FWYSafJzlOtE3gWL4WqP6CPI
 bC/9SPDZs2No7JQ2C2kCUUZSaj4ktg2qlAjOGIydsPRklZuK4Gp4G4yf2hFWWXX3o2
 C9ywrbOsouMUfEuzieCuv+KR/77IsAeK/YDUtulEudnhTN+cZ8/YuYI5OH60VIw/fF
 1ulvsTpcWvYVQ==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id AFE021A6597C; Tue, 14 May 2024 12:50:25 +0200 (CEST)
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Wireguard address binding - how to fix?
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Tue, 14 May 2024 12:50:25 +0200
Message-ID: <87le4cfz0u.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
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

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hello,

the problem of wireguard being unable to bind to an IP address are
hunting us over and over again. Isolation via namespace is not always a
solution and I would consider it a hack in the first place.

To the wireguard authors: what needs to be done to add IP address
binding so that packets are always sent from a specific IP address?

Virtually every other network software out there has that option for a
good reason, only wireguard does not support it and thus does not work
properly on devices with multiple IP addresses.

What does it take to add IP address binding in wireguard?

Best regards,

Nico

=2D-=20
Sustainable and modern Infrastructures by ungleich.ch

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJRBAEBCgA7FiEEZZsNkehufiT9FWnQxykhoSk/LSQFAmZDQfEdHG5pY28uc2No
b3R0ZWxpdXNAdW5nbGVpY2guY2gACgkQxykhoSk/LSTakg/9FHMgkR5Dqq2FuXS0
HukkhRbu8B5YK8YIdM3I1KrWtnxg3TA6GI8CwPahsTI63AUGpVWK5MzJl5Vw5tpF
aOCywQZbMJlINn2WJzLcPhIqB1qrLMBGE/w308Zy9eQF6jZ02Bkx8NT/mH3mtQ9l
8nyFeNBcE57aFiD9jf1QH8cIpngndKHkkp1ZzOdk6bR0MJebZdnv8t8diXwBIcP6
6AiWVvbLw9InC3hD240SEYDE1Fo9xpNouRoQG0F9Go00n9/gfmhxUIRz7uDb5NKk
GdATWJ8AkNKOPJJw4zShPZiTT7FyQSeAX7t95FndfD0NGb1kWGzOu7A8kpGaX1bc
WUMI2tUST0yXHoYAfth4+oP0xQIESxR9ysrt8YYtReOC4XyRPljnGh0zExYTXtyb
RyP5oRRDHjMwnIAIgY06xZft9glJHKMvYP2BReOzyfxohGTK8gd3TkuJJdMQkqbH
8k3LQUMnuxJ2BfQOTgrStLyvZK5uxvLAyEIbzwozlzspj2j0KTo9Es8WpH3WLGAK
x3hODqh+2vNhG78gMoETgAP9pgLsFw6iVuBjbxHKTpq5jNiGdqZ6sYwj0Gkf0Jx8
QbGlbrCePzKuAHy/0nwKc4SQnnZoo3Di6fgzmT7rgZOC1qG61RLC6U+DN4brt1gX
beP5CTzDy+FA8OBF/rJIsnJBbuE=
=IYUn
-----END PGP SIGNATURE-----
--=-=-=--
