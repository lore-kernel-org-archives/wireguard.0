Return-Path: <SRS0=38ps=PI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815A4C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Oct 2021 09:00:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 657AC6128B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Oct 2021 09:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 657AC6128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fala.red
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdfa5420;
	Wed, 20 Oct 2021 09:00:51 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3cb54a3b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Oct 2021 09:00:49 +0000 (UTC)
Received: (Authenticated sender: faustin@fala.red)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 58F61240016
 for <wireguard@lists.zx2c4.com>; Wed, 20 Oct 2021 09:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fala.red; s=gm1;
 t=1634720449; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+RCFIwLD0Cv1m8O4pCY4EMohbtFj4VxT4MNDfl1HsAs=;
 b=V4Qwwo3AXbN8YYYBlzOPZBglAeQW5Vhli7FEU8toY9+MrtUvVvMDCUsPWgENVrjh08XCOb
 vKmXZj8mz4oyXODtFoBKylbUCTqvStQHECk2oQna2CxtUyfOmz9DPyjrcRyi1DrJjm1DPl
 c3aEIW3AUof4nI06HT8q9z3FVSvjb0VlWf8qkN5UoZi+DUhG7GiL6UWRLEiiRfhomKUM6B
 28nL58Y5S+BBvQ8Pj7WcEjt7/DCA613d8D4sxiL/QenjPSok10p+feoLB+Wf/89kXjA7Vd
 /EfHTrVa1sPXM58wCu9g1ajkz6K7jPsj2mgitfENbaBUT2/fusv7ByoKU+dVIg==
Date: Wed, 20 Oct 2021 11:00:48 +0200
From: Faustin Lammler <faustin@fala.red>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Build wireguard-linux-compat on SLES15 (s390x)
Message-ID: <YW/awIN8jqUF0DPk@falared>
References: <YWFuczOf1dM3B4Pt@falared> <YW6ljZ3yvGsv9Njq@falared>
 <CAHmME9off=sXrL0hjkGvOgJUtJx6oCvhdAycHT=bTQfUtQjO=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mRXnlNJO+xACZkT3"
Content-Disposition: inline
In-Reply-To: <CAHmME9off=sXrL0hjkGvOgJUtJx6oCvhdAycHT=bTQfUtQjO=w@mail.gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Reply-To: faustin@fala.red
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--mRXnlNJO+xACZkT3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason!

"Jason A. Donenfeld" <Jason@zx2c4.com>,
19/10/2021 =E2=80=93 17:51:01 (-0600):

> Isn't WireGuard already in the SLES kernel?

My understanding is that it should, that's why I was surprised to have
to build it. But apparently not.

This may be related to a specific kernel from IBM LinuxONE cloud
infrastructure?

| $ uname -r
| 5.3.18-24.86-default

But again, my knowledge of SLES is very limited (and s390x architecture
even more) so I don't have any idea why this was needed.

I'll be happy to help you if you need me to do some tests on the
machine.

Cheers!

--=20
Faustin

--mRXnlNJO+xACZkT3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE9lK80RqoiXXwEEilOQovJ4MqXHkFAmFv2sAACgkQOQovJ4Mq
XHlp0A//VVTtXyU6MP1ALCDu4Ttn9yaKlRs03USNmV/UgAjDxsEP8oqIYcfoa9Nw
TixNswKBsmQ0HSkaMS7MIkHjHsCmlOfortN1U5wpc09LtGNCp60cC0laIVMHt6ls
tAwX+uua1Pk0/rJpm17I05/OyGaIY73D8XSSO4NpidsyC3zB9KZokxtokRLKlpRV
oSIWCtVgl4EyebjjaPtGmk8VhQC4LiEo/LgiLj2l81dbyuFLr15qMWU2ZfPhA3Vn
R4UyDhJ4eCZS1sG32DwpA5taWo5vd9YHHIs28CzDE4Yifx7hsUh0aaSg2YZNGPQE
nd70n3XfIZxorrG/b6Lvvz3cRbYrmbd4Rvw49PgAPIH2k2S+Rye+Dy5iDFr8PrEr
K39Izaz3YlMR3AA23CZPZhGQtnCtvtKqLjcCxbS3YbegRM169lOK1yg+WkJ1wkip
Ow8vIIPohvnM0ZLjN70c709rrHbQ+a+mygxfLyb9bCDv8cazgctA3K/C4N1YbWCw
rO6ADaUdxTuOxe9m4sLrpkKR5n4dddL/iOM3BVe+qpAXSAhjugDpwnYT9D6cSgfA
7+xmzUQOflanAygIe7mXXTn0sW510EEVlw+3IrYj078WRCDPqAPOz6Bn13nobK1b
Z+ESFzfrw/8jWE/yjN4Xvqp7cvr7PdrdDAMcsfWrjjMeLmbWgyQ=
=3ine
-----END PGP SIGNATURE-----

--mRXnlNJO+xACZkT3--
