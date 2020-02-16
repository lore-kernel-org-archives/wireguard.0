Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4001C35673
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:31:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DCE1214DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="MUaGCggs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DCE1214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 675629dd;
	Sun, 23 Feb 2020 10:27:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e670acc
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 10:23:11 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c029d74d
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 10:23:10 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id D519116005F
 for <wireguard@lists.zx2c4.com>; Sun, 16 Feb 2020 11:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1581848730; bh=IxNFN+X8uoMnnclDA7xy4anUt46pGI4KcfAOmqdnzYY=;
 h=To:Cc:Subject:From:Autocrypt:Date:From;
 b=MUaGCggsvhcnYV8dCoXWNMqT5EOoqZj3nL5N5d4Iz0bN4VxD4JSy12niZYG4BRFwu
 DBa/17LzjuhjJgYEqYB2JJAw4hE8jR/cFQY1tR4ydJpaOcIzAPwV5+9A1ppV9wZfuf
 pAaHuxIvyNJIyJA7UCCG1TuFaOm+O0+yS/tjCm42ZAkm8C2NMlmsKr2nkPMraIGCrg
 PHfnNS0bkMSGnjOBdwDZ/G+CEh5WCttUHBCkCE/KnuHoEzbWlQkvHrcOt6IVU+SyaY
 TFwaNUir7Wnb5mHMUTRsZF8yIoMz3Uff0d9PdTeSn3SSy0q7gu53kwGUD6sn8dvvyE
 MhpprTAeubevQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 48L3Ct1V7Cz6tmM;
 Sun, 16 Feb 2020 11:25:30 +0100 (CET)
To: jason@zx2c4.com
References: <CAHmME9pkfWKaG_OZEPS5hWn=LU4H4zHM3fP3NXkbw5VYdQSbaw@mail.gmail.com>
Subject: Re: Starting tunnels without being admin on Windows
From: Eicke Herbertz <wolletd@posteo.de>
Autocrypt: addr=wolletd@posteo.de; prefer-encrypt=mutual; keydata=
 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
 53DKA8rg
Message-ID: <3bca6bc3-282b-9587-b0fc-9bc425090b83@posteo.de>
Date: Sun, 16 Feb 2020 11:25:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9pkfWKaG_OZEPS5hWn=LU4H4zHM3fP3NXkbw5VYdQSbaw@mail.gmail.com>
X-Mailman-Approved-At: Sun, 23 Feb 2020 11:27:41 +0100
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
Content-Type: multipart/mixed; boundary="===============4548166847619455186=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4548166847619455186==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XsLtzfPK4XXZCghsGqyF45L8k8Zvvnsxw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XsLtzfPK4XXZCghsGqyF45L8k8Zvvnsxw
Content-Type: multipart/mixed; boundary="dgOyDqWIKSx6jEKvw6nmDuQnTLCuUCyj4"

--dgOyDqWIKSx6jEKvw6nmDuQnTLCuUCyj4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

What's stopping the GUI from being accessible via "Run as
administrator", though?


--dgOyDqWIKSx6jEKvw6nmDuQnTLCuUCyj4--

--XsLtzfPK4XXZCghsGqyF45L8k8Zvvnsxw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEysrPy4/39JJpWQvjrB2FpvudpmIFAl5JGJkACgkQrB2Fpvud
pmLP7A//Ye3kyhXxnpCyodUPWJimFM311KI4pS8aQiWHLAS0mHLFGAU+ECnse/2h
3nwcmnUWuEp0bOmQvUmrMdJYmlfEylNNEkiA2IVtCFN2va8Jb0hzSd96/LqZAzYw
q6B6DIcuM+XKBrParmqOHRoHSAwI9g0cn34UhIUMioz010ux1DE6VBHkee3zh2Q3
NWiJIDyto6PhMXtnhjSgDQKvmopkMjUPTYfBqA06k0O26sLgTJiZ1OSosmx7+ie3
sFEa055lmyXoV9kyxeQyBkxOCjhlDYiDRnaDhJYTUO9Y2c1tBPln5ZrKcqVGC0ca
qd+dP5vznZquWl7YxtpCB2D2FGi+RLvjGB+P2zYk2PfSHN+raXKx3lbJ/hZGsB5b
YoMFDUau+5TNyxcc7VtkaXGcg6Ap49A3TUbu2ZsbhgfugNVKJG5R1SmZCM51pbrN
GMaR79uKFZuhKakkHJFqtvlfaYIXpAv8QI5UJOeerjbElwIv5eN6Z+SuZSaRDuIS
2bkDh6XC8bo+GjB5Wjxwg/ZL9mgJjV3H0GCno9hd987sWdp+/rrXkm402wU8WGWM
XMprOyD4bz2X5dLlwS7eKzNhaBUhukjO4ZwsHYeq/WGPV7j0bcmY0kE8WaCmZrQH
fPMUokFLauXBikKPsd1gKuw21cMq+/nSUyurk87zOvBQ+PkHwv0=
=qj9P
-----END PGP SIGNATURE-----

--XsLtzfPK4XXZCghsGqyF45L8k8Zvvnsxw--

--===============4548166847619455186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4548166847619455186==--
