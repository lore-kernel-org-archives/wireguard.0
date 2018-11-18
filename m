Return-Path: <SRS0=U3rm=N5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106FCC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 18 Nov 2018 21:55:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14AF920817
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 18 Nov 2018 21:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=permerror (0-bit key) header.d=eggiecode.org header.i=@eggiecode.org header.b="Y+kBtcIT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14AF920817
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eggiecode.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2afd653d;
	Sun, 18 Nov 2018 21:49:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cba7e28c
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Nov 2018 21:49:20 +0000 (UTC)
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83532968
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Nov 2018 21:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail01.eggieservers.nl (Postfix) with ESMTP id 2141E1C35AA;
 Sun, 18 Nov 2018 23:17:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.vps01.eggieservers.nl
Received: from mail01.eggieservers.nl ([127.0.0.1])
 by localhost (vps01.eggieservers.nl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVPkjjTFhg4e; Sun, 18 Nov 2018 23:16:02 +0100 (CET)
Received: from olifant.lan.eggie.zone (unknown
 [IPv6:2001:470:1f15:66b:58c2:9e99:d6a6:8604])
 (Authenticated sender: egbert@eggiecode.org)
 by mail01.eggieservers.nl (Postfix) with ESMTPSA id 86E251C097C;
 Sun, 18 Nov 2018 23:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=eggiecode.org;
 s=default; t=1542579362;
 bh=VlTmkrfHAQHA3dTd3V+dEOc/mzRnCLFyxDO1InkSuA0=;
 h=Subject:From:To:Cc:Date:From;
 b=Y+kBtcITL8CJVp5YchXAKT0h0dErt52nZO681FwnS0d9FHPXEZ6XwycvHWX8CEisJ
 M9L2qmp1ZIdIxI7dwUHO32CTHpZ4wClLPHl+xwboI/YSqEgEHA+7k3eGkZ71SbpboM
 T9qpxf+1i4iGxq0CdUHsUkS1t2CFiu5nn3+Pt8rE=
Message-ID: <f56048e6ddabf5625e2f04f762e6ea22da6e7a7d.camel@eggiecode.org>
Subject: Problems with kernel 4.15 on Ubuntu Bionic & Xenial
From: Egbert Verhage <egbert@eggiecode.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 18 Nov 2018 22:53:54 +0100
User-Agent: Evolution 3.30.2 
Mime-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============8994201835007724448=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============8994201835007724448==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-L7Jy55k6rWU+z2I52LwD"


--=-L7Jy55k6rWU+z2I52LwD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Jason,

I just got 2 reports with problems on ubuntu with 4.15 kernel.

When their are loading in the kernel module it wil crash on:=20

wireguard: Unknown symbol poly1305_blocks_avx (err 0)
wireguard: Unknown symbol poly1305_emit_avx (err 0)
wireguard: Unknown symbol poly1305_blocks_avx512 (err 0)
wireguard: Unknown symbol chacha20_avx512vl (err 0)
wireguard: Unknown symbol chacha20_avx2 (err 0)

Ref: https://gist.github.com/EggieCode/64d4cd4177abc42f6d347ec7b19f931b

I just install a fresh ubuntu xenial with kernel 4.15 and it works just
fine.

Any clue what problem kan be?

Greetz,
Egbert

--=-L7Jy55k6rWU+z2I52LwD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQKTBAABCgB9FiEEGWAEwCcyhd7yjtxUglMILCBRrAIFAlvx33JfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDE5
NjAwNEMwMjczMjg1REVGMjhFREM1NDgyNTMwODJDMjA1MUFDMDIACgkQglMILCBR
rAJs0w//Up1qYHdN/N1zNBUa5rC/G/Llj6wMKcFy6/rL2OlEIaOEa/7G52k6YauC
lm4uudeqQYVfVDgVrX5WWmECltiiDdYaQJYBdxd79CySZt/Tzx8jCXXF0Kd659I8
xdfQiBBZiEVkUg44bCp0BeVtlPg4LZzTAtE+nKgfIo9n4MpdBfoBiQQzsbmXfqWm
+yhilKq6t0HsRxzW9iyXe+XmyxqLsuRk/ehXSvCRmqWiz5zypEQeWotfK0gPdP1E
HDnsVhdfEhrFaW6sboWghMAc6RENsFwJRWaCpxiV5xbe7tojmuJozDIpwNXU+u1H
PiUsd3PKz7TILtalI9cvlEFIhUDFz9GMn+NEdgqCyXLTQZu6IlMSVpBXS+tMx/ky
3qnXyA40CCHRBt2oxN1T//nsj3mInO0T2HU/EEGqd/8hjJS3Wfj9rX3AhVYZ1gwp
XZ8GQST8QquxSrDC/w6hw089rW08qIJszHfgT4C21slGNYz7Q7tqnwPQBBZ7qjqv
iFmT7QDXpKQp11ylwVrSh2/qaKZhBLYoKAv+1U50rug5I13NPe8vVINn9JTilCjw
pi9JDeNHzPDSdJcrRTa/f3LphT06Q7SfBdzzJ4ZQWXYH6LAP+LjwZOi/mR+120zY
CyatD52lKZvWZDCfHOWd7Egx6Y3Im6L8JTSaAqRBkDYnMpWWDqQ=
=2zIl
-----END PGP SIGNATURE-----

--=-L7Jy55k6rWU+z2I52LwD--


--===============8994201835007724448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8994201835007724448==--

