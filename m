Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDB1C2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 10:58:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AB062168B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 10:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=venev.name header.i=@venev.name header.b="mRac3WIp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AB062168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=venev.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 263c3156;
	Fri, 14 Feb 2020 10:54:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ca7f6b3
 for <wireguard@lists.zx2c4.com>; Sun, 9 Feb 2020 00:14:18 +0000 (UTC)
Received: from mtel-bg02.venev.name (mtel-bg02.venev.name [77.70.28.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48bd34b4
 for <wireguard@lists.zx2c4.com>; Sun, 9 Feb 2020 00:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=venev.name; 
 s=default;
 h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:
 From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lLUKvjoRsFXK/rqeNGEdGnZBnr+HSB0OpyOYKcMwP0g=; b=mRac3WIp8OR8PYvUlGN4zIuQ4j
 F2xzz0+4bYiXfcAfGb6+vwNLIl/qVMsLLWIiMoHB7LX/fTPX/1Rw1JhsqTE8b7KRnOqs1C7XrdNC5
 igDq7Bhund8GApp4GDQkgLR+t3sT9vgYEt/Gnsss/yRB2+w9tE9f2rPI7wDGe5qFj54LAR4xBoPJW
 qw6UMt4ooOwN11yB2lpuF/8E4FmXhLZuhUoBDipADDgk2PTkQtfgqBamhkdHoA0uMLOKKzswM9FRp
 kp1+T5mxRwurRmlFuIH0lq7FUIAxQDyN6wlMPCrZ9YuXkRY3A9dMeObWQXR1GOpYOPQA3TmBnJDEt
 6Sf2MNeWcUxySFwU8dI7ghfe41+6PA+UPKbBw2B2XyhwkdTfxRaRwtVgPv7usFeLsLgw2QZYE2DqS
 tfKndQA32jEZnmbu2+JjdwmpNdGm1NL6rQ8JaEVSO6Qq8FuHU4c+zo28FBva/TVHSJf/9N7YU6q50
 OYx5tU/QZKuPB+KRLHJLEr5GMfWTzH6f2fTGCipF1vyNft4vCkJr/ao9GEWxhAdCK6kz3z8/PmYJA
 1r03gQouC61+8oV5SJY8xWhECKThjEURIPSaCZmKJFsqTGZmeJuF6ZWor5dnS0sTif5n5P7h/j2cT
 0AQqr12PeCRfPkeeq53M0adebKz2c2MaV3jXsw5pc=;
X-Check-Malware: ok
Received: from mtel-bg02.venev.name by mtel-bg02.venev.name with esmtpsa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (envelope-from <hristo@venev.name>)
 id 1j0aGB-000gX0-9j; Sun, 09 Feb 2020 00:15:39 +0000
Message-ID: <410e641d5f7398078e8b1ea47652f34618ac26ef.camel@venev.name>
Subject: Re: [PATCH] Implement reading keys from stdin.
From: Hristo Venev <hristo@venev.name>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 09 Feb 2020 00:15:33 +0000
In-Reply-To: <CAHmME9owUFjKsW=oGWeziQk8rjPm4cMrArJQ=nDP8+793w5PsA@mail.gmail.com>
References: <20200207200035.69579-1-hristo@venev.name>
 <CAHmME9owUFjKsW=oGWeziQk8rjPm4cMrArJQ=nDP8+793w5PsA@mail.gmail.com>
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Feb 2020 11:54:43 +0100
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
Content-Type: multipart/mixed; boundary="===============4716038193921136090=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============4716038193921136090==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ALKZCQME1rLQX7AKOHtr"


--=-ALKZCQME1rLQX7AKOHtr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-02-08 at 23:20 +0100, Jason A. Donenfeld wrote:
> Trying to get a handle on the use case for this.

I am working on a program [1] that configures a WireGuard interface by
invoking `wg`. Generally there are multiple peers, and some of them may
have preshared keys.

Currently the most reasonable way to pass keys is to write each one to
a temporary file. I think passing all of them over stdin is nicer.

[1] https://git.venev.name/hristo/wgconfd/

--=-ALKZCQME1rLQX7AKOHtr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWGQszEdDPeR3PQQhxqlBR4WW3HoFAl4/TyUACgkQxqlBR4WW
3HohoA//Rrm1xBMnsq1OMpLLrvaZPNQ2aXWdAl2fjG1xCg1ISZldqf0M3Gken5Xq
CcN04UnVBcYQsPwyoX5KF7V6nmS50Eabd+RI9vYYeivp/t9QpyUFXc9m8QGhNJC+
FjcG4sfDGfbZAdAQg7mlmOvUVK9JSZt7HyTgc63Ul2So8gpWOuPKGULEbxWhsLmR
7Tp9osGVeu3c7ExEe8DPfwy+SUa9SrktOmWi1go+omikwaUhpsA10rVsu1h9UzpT
y2UZH14jMkaD0q7xrve4uqMJpKUpIqdhUivnb2LTAWd7MqA55NCBAGCWZiuqClGv
+CnuQuEJ2tw61JO5UFOgja9Kho2mB6rP0hnd5QrT2BwSx72qwDmkyN9r2auylZa9
43ZKYuNqb5Gorj4aFIMUff+yt30wbdo+zUXx8oN3KIEKc29BlllRa2zNFrQtsEDQ
BhzbznNzFG5eRIWp+G//AMACR8/k+RxijcYbtbgSzEOERN9rpqxgPpFfWJYHLKER
s2oEgmjf2/TOk3JPgsfeoCQ7ApuEZ8cEK/YrOEcXZfQhB2VJY0Y6+RXFV6OSCkB1
bTWBiqB9dPgVoSAfOk9IF8nSHOaf0PUA0ewm8R0N46xAGDApV+6mrJFK8hfrC29+
okVDJPBq/mY1W6XZ/aW/kHHcyUKx/HW1jSVfO0O0eOz8bPu4ehk=
=fa3m
-----END PGP SIGNATURE-----

--=-ALKZCQME1rLQX7AKOHtr--


--===============4716038193921136090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4716038193921136090==--

