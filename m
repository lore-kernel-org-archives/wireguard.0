Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6BCC2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab0d616b;
	Tue, 20 May 2025 19:50:17 +0000 (UTC)
Received: from eldiron.immae.eu (eldiron.immae.eu [176.9.151.89])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 20797047
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Feb 2025 23:47:15 +0000 (UTC)
Received: from dilion (unknown [IPv6:2a01:4f8:141:53e7::])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by eldiron.immae.eu (Postfix) with ESMTPSA id 338F3A61BAA
 for <wireguard@lists.zx2c4.com>; Sun,  2 Feb 2025 23:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bouya.org; s=eldiron2;
 t=1738540035; bh=YqK0AQPsJl0SMerSU2oMSi2PmedKPHn+Wq+Ctd7b7sQ=;
 h=Date:From:To:Subject;
 b=thxGU1TuvcvcvVZK660Otri3YfCcIIfWQJvQobf/Q30SwIpVXw/SBd2ygW7BsTIc7
 bTdM0d9HmS/bMXuw9vm0xi9XZPmB1dWdtr53BmgNX52sbutLmIp+snYc+oAJGnKZ5y
 eFOJ2HMW/JoBKuEf+eHq7uXwSTXsnMXng8v89qU20FjTqL+CHaXcBjBt2DcdPBBLip
 hNG+yFyqfEseZStAHAwLmsUqMvgNYe0q8JhzbgV0pttuj9LMCB+wqelVJ9VEuOrSpE
 3G/LurmxbLRkJt4253DhCQbGR0vGvNZlA7nlx+BMUssCIO7qzBkJdj1VhcQKvFbNy0
 hICx1V1ipbnJQ==
Date: Mon, 3 Feb 2025 00:47:15 +0100
From: Ismael Bouya <ismael@bouya.org>
To: wireguard@lists.zx2c4.com
Subject: Incorrect computation of the MTU in wg-quick
Message-ID: <cvlwdlcato6fv5ih7qcib2tyzjltvfnq3l4flfcfrqqltl32j7@2mae3zkuvmuw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cnsr3sgmrd7iwxqf"
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 20 May 2025 19:45:56 +0000
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


--cnsr3sgmrd7iwxqf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Incorrect computation of the MTU in wg-quick
MIME-Version: 1.0

Hi,
I would like to report a behavior that seems to be incorrect in the way
wg-quick computes the MTU to assign to a wireguard interface:
https://git.zx2c4.com/wireguard-tools/tree/src/wg-quick/linux.bash#n125
In this block, wg-quick goes through every endpoint it knows about,
gets the mtu of the route to reach the endpoint, and takes the highest
value among all the computed values.
However it appears to me that the chosen value should instead be the
lowest among all endpoints rather than the highest.

As an example, if I declare myself (localhost) as an endpoint (it may or
may not be supported, but that=E2=80=99s how I found about this issue), the=
n the
mtu will be set to 65456 (65536-80) which is higher than what the other
endpoints are able to manage, and I=E2=80=99ll only be able to contact myse=
lf
properly.

I can provide a (trivial) patch, but I would like confirmation that my
report is correct?

Kind regards,
--=20
Ismael

--cnsr3sgmrd7iwxqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEHbA6XjnBfeR3vtz7/R1O9X+pWQIFAmegBAIACgkQ/R1O9X+p
WQLjfA/9HTsDPlRSJxzNglGvb0c8qrx12OpuvxGfP8m3FvMPqO8nxp+7h7p3AGB5
zSQ0DRpCIHBxmHpgt9aa1kQehNydLxH9DjAinzdLq0uB0t7jcw4CiXLdfuuCSClM
GQrt9xczIf1KkN/AIqSWpcx+q3nZY3vjnb3lGF3BmI/bVxUTcDfCXPdg5xwAf2/o
x2wg55mc69clO5qU/JtSW4aHwd++9JjrO9NWEFWSvirmpIQ4+gHc0s/UheA1Djjp
37iZrNFGdFeDwPGJDa5lk6W1yLqwU3hUYOapBv4NUie5fdu1+V/aZIJFwb/6ouZR
olJ8xh4JGhiIgpmzdnA1yte1SepLxbigimoeOpjAIu6DJqzbWULGajCOYVeqjoXU
uzuRLWm3eBKZunDO0Zh+8wJ4QKQtdOIH+mLPZVDOMVljBnRXSslRZ3gRMrlhSzQN
Ud468nfWZ3XCpxWOo+kAMcJO+luu3Mb3a82w6gI9YJ9wQT0jpwBIK4w8RzMw0hBj
NIpLzOPVBrRG4Qt1U+Qg932godSi/QJ9jkuXo8Or9M070hk9ST3CR2G+sL35a88g
gkNs4Ajzv9mo4XTiLgjoBLAQNo1dKtnbSP3spJmEobuM7s1EZFCQGmeL98pxyETe
LPTryKCCRCpATt4e8Ji9YW456j0TqRan0/qHjjKXa7dP5GkImh4=
=G/uO
-----END PGP SIGNATURE-----

--cnsr3sgmrd7iwxqf--
