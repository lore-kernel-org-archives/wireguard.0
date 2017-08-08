Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81901e2d
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 23:05:24 +0000 (UTC)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
 [209.85.128.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0ba338f
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 23:05:24 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id y43so18021755wrd.3
 for <wireguard@lists.zx2c4.com>; Tue, 08 Aug 2017 16:27:17 -0700 (PDT)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Received: from [10.10.10.52] (uk.webcrumb.net. [176.126.241.16])
 by smtp.googlemail.com with ESMTPSA id e27sm3008883wra.25.2017.08.08.16.27.14
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Aug 2017 16:27:14 -0700 (PDT)
Subject: Re: Advising in packages to load new module or reboot
To: wireguard@lists.zx2c4.com
References: <20170808231612.GA24254@zx2c4.com>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Message-ID: <daea6ec7-4f6e-b23d-6ae7-3cc5ae49e90c@york.ac.uk>
Date: Wed, 9 Aug 2017 00:27:08 +0100
MIME-Version: 1.0
In-Reply-To: <20170808231612.GA24254@zx2c4.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uSOCelReLqIX3b8dWOR6Un4NUpkpG85OM"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uSOCelReLqIX3b8dWOR6Un4NUpkpG85OM
Content-Type: multipart/mixed; boundary="Nl1SWd3aKePvdT9PTJqhqDbRhVsCLod2B";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <daea6ec7-4f6e-b23d-6ae7-3cc5ae49e90c@york.ac.uk>
Subject: Re: Advising in packages to load new module or reboot
References: <20170808231612.GA24254@zx2c4.com>
In-Reply-To: <20170808231612.GA24254@zx2c4.com>

--Nl1SWd3aKePvdT9PTJqhqDbRhVsCLod2B
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 09/08/17 00:16, Jason A. Donenfeld wrote:
> 3) not having any headers installed
>=20
=2E..
>=20
> Any thoughts on this pattern?
>=20

I suspect this would be a packaging issue - packages that build modules
should depend on whatever headers (etc.) that are necessary for building
the module. I can't think of any distro where that isn't the norm, and
it's not normally up to the upstream developers to check those things
(they provide the software source, packagers provide something that
works specifically with the distro).

OTOH, if people are installing from source and expecting to be able to
build a kernel module without kernel headers... that's a user-education
issue.

J


--Nl1SWd3aKePvdT9PTJqhqDbRhVsCLod2B--

--uSOCelReLqIX3b8dWOR6Un4NUpkpG85OM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUzSNjhumunvu6bYD4DBDgow/9LsFAlmKSNAACgkQ4DBDgow/
9LsdYhAAnwi/De/V3x2oPHNAdi6TxkjuTtDm5iEQVGIqmMOMy+jZLvo+ze6gNt9D
DCeS6VJjn9NEDNo3IDexZHhb0L0HHkrX4bDIW3paj0tlFJeGSRSJlU95yMMIi8JM
qruSgiiwFin2QhgCpqoMSlbGhr77t042QOF2zYI63KW0UlIpWYgbMqnwmqOcxCkN
LAn4p4bnp88fuA5k1wpnu9Qyhtnfzou7l+SC1tFlotiTk+An9jdcNJLOllETkKbn
AvdaYGPAa071Kg8VMD8KU0eIvviflQJWoO9inOlrd4j4UHOBuGZ3cIMrYwuLWSHI
qQEgPwFLiKX2Mn0hWLQGGdTgiTXQiymbMO19/o+/B99bdji2G1lbkiu6njOJO0+l
ES0D16tEck6vU0jVgqd0DXX6n7grvlA8ZDtZhsERqzCuL8V7KZ601UDfCjO/ENG7
7/+PUEvqTbJquqh5PrIl02r6eld24tO4oTXkozEA10ZyofEsHDIudwjU4Tda+bsm
YsLKupa4vGpYWrpRHJfPM78hzvJxfsBsskN8h1yrZmSd13lDk0rMB2Q0uLeFgkuk
3+2UNI4QW7rGZbcM/9XErk6e5Q2YI0KK8M2kmJl7Qve0gP5mr9FK05ZDFzdF5s8e
z2TY4bykxpb6BiixIdPPKLz6IdLBNVY+y2wQSHOITxqG0YZ9jIc=
=4cFJ
-----END PGP SIGNATURE-----

--uSOCelReLqIX3b8dWOR6Un4NUpkpG85OM--
