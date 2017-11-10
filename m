Return-Path: georg@riseup.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bdd27f5
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 11:35:55 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1f71373
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 11:35:55 +0000 (UTC)
Received: from cotinga.riseup.net (unknown [10.0.1.164])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (verified OK))
 by mx1.riseup.net (Postfix) with ESMTPS id 6C3A31A057E
 for <wireguard@lists.zx2c4.com>; Fri, 10 Nov 2017 03:39:30 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by cotinga.riseup.net with ESMTPSA id 23B774E6CD
 for <wireguard@lists.zx2c4.com>; Fri, 10 Nov 2017 03:39:30 -0800 (PST)
Date: Fri, 10 Nov 2017 12:39:27 +0100
From: Georg Faerber <georg@riseup.net>
To: wireguard@lists.zx2c4.com
Subject: Re: Close the tun fd when closing the device
Message-ID: <20171110113927.GB20381@debian>
References: <20171110110033.24210-1-aurelien@chabot.fr>
 <20171110113841.GA20381@debian>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2bJ57vwr75KGnr5s"
In-Reply-To: <20171110113841.GA20381@debian>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--2bJ57vwr75KGnr5s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17-11-10 12:38:41, Georg Faerber wrote:
> On 17-11-10 22:00:32, Aur=C3=A9lien Chabot wrote:
> > This patch was part of the android development, as this is not
> > specific to android, here is an independent patch.=20
>=20
> You forgot to attach the patch.. :)

Sorry for the noise! :x

--2bJ57vwr75KGnr5s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4p3Q++yWB9ljva4NWtdbQU6kFmcFAloFj+8ACgkQWtdbQU6k
FmecgRAAlNfaDPssuHOqXSXjzwKYhEn+XXrKrm9KHHcmYgyZ/pzpAhk7tv/Kcks1
4G1k1aN7aV/VsTIQhmfHXxWyaPQv/2X4vFg/cDSSWSKuw3bqL6IaHg+hBxI70VW5
WVrmSFtaLNi2xdFBLwaiud1wts5GMe/Z7gOWu5CkuJTG0e9p/C1bIgMOh60xE2Bh
TWsRuVdn5Eow6+sBSNCi8HmsY5OkkmBQwE+FLVpdKcwCBxLku8ztCybrU7+2lDYZ
NQg7oGqCUYUer0iMH3Sg1rmKiJfU0nCWN7VgCQM+Z1y0TBActq8Op7ql19n0/ZzZ
RyknHfbyXquZXtzctYZNx2AGHVci9KGKaVLqTAh3z80WunAt9NKXBXlqNEV+IpaG
68AUSJ2ka+njaKeLeQ7PmzysyI/d9v5Oj3ixw1TUsLIFPODbo2h2bYOmwx4j6w4s
wlEvdd4yRg0tZtqvVzma1kE1MKbBGrBh++C/9KbLIkTQvQZaiCoiACtG+5Eb1xW/
/RwUGX/UUALjgeiMZLiltIwN5/IhcUIWECmJ3FlzWx2PE1IFmJk7BA8V9X4lsK93
CMpU7Aus0pvAsRkIlh5UqXuuYEDWWnv0+2viwaT2qGyo4doHbACwSI8iLR7sB5s6
SNqsKKv9jMvaV1Dzblk9e+sCr15vT/S1PgJQjCNpuqbgZ2KTYpk=
=rLV/
-----END PGP SIGNATURE-----

--2bJ57vwr75KGnr5s--
