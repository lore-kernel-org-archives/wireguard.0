Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE24C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:15:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8639E20989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8639E20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Linux.IT
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 079aede3;
	Thu, 6 Dec 2018 23:06:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 371ca7c6
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Nov 2018 20:43:45 +0000 (UTC)
Received: from attila.bofh.it (attila.bofh.it [85.94.204.146])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1eaea25e
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Nov 2018 20:43:45 +0000 (UTC)
Received: by attila.bofh.it (Postfix, from userid 10)
 id B9EA1126EDF; Sun, 18 Nov 2018 21:49:36 +0100 (CET)
Received: by bongo.bofh.it (Postfix, from userid 1000)
 id 60C218402B3; Sun, 18 Nov 2018 21:49:30 +0100 (CET)
Date: Sun, 18 Nov 2018 21:49:30 +0100
To: wireguard@lists.zx2c4.com
Subject: simple UDP in TCP tunneling
Message-ID: <20181118204930.GA29592@bongo.bofh.it>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
From: Marco d'Itri <md@Linux.IT>
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:06:41 +0100
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
Content-Type: multipart/mixed; boundary="===============7356096509408198821=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============7356096509408198821==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have just released https://github.com/rfc1036/udptunnel .

It is a pair of daemons which will properly encapsulate UDP traffic in=20
a TCP connection, designed for when Wireguard over UDP is not viable.

(Please note: you should not use Wireguard over TCP unless strictly=20
necessary.)

--=20
ciao,
Marco

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGBsIcS5ipP0URKfyK/WlwSLE96QFAlvx0FoACgkQK/WlwSLE
96SPrwwAg8kjNXWu537eVYcJe5tAeBV6X+syvBbUxxcXWy4DvrHw1+/YJUkxI+zr
fin6+x0XaMWUe9DADSvQls9X+sLuSVz/gHhh3fGL6pTn6vn97AWrIImWLjL/Vxm5
K+AVya1Ygw+DBoC70ewUuajDLW3osVi93TCTNxHOfz73f17X4cP9VAamnufxuUbS
EB0Xh7l4s2YrqKlO2IVrL7TaOGoKkGs6/pIpJ/FMxNOV+p9NDCoP6WK7/ndR4OFE
8CNTMXYi8hc9QgFTpgecRWlnaPfmHVEYra6ECgxrkH51hQ20AHhch2iPpQnfxtWW
DHqp+g0IlqjSc/8uX7mCcDm3Xu0P9uEN5NRWO64xHIx6+G75m7XJ1sumW6Dvh7pQ
J8RExgVoK3KKrnP/TdGns79nozXthJQ7MIa44JDvzcfDoUvDgSzBvUbZNVykq6Po
Zr3UstG21vIuaSYIG2psfX3Q1Y99/SQJhD+KJBkaMxJ77c8VzmLpBdWQYPYTG5Hd
CPavMZLG
=+uyV
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--

--===============7356096509408198821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7356096509408198821==--
