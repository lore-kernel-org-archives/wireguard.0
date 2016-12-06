Return-Path: list@eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6277c312
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 09:30:47 +0000 (UTC)
Date: Tue, 6 Dec 2016 10:35:51 +0100
From: Christian Hesse <list@eworm.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 1/1] add dkms configuration file dkms.conf
Message-ID: <20161206103551.038a3d3e@leda>
In-Reply-To: <CAHmME9pAz1e2keE0vH-cWORP7pRmhfoivFt0_=_4xEH9xUjLDA@mail.gmail.com>
References: <20161203123044.25848-1-list@eworm.de>
 <20161203124233.27891-1-list@eworm.de>
 <CAHmME9pAz1e2keE0vH-cWORP7pRmhfoivFt0_=_4xEH9xUjLDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/U6SFfE3TDwMLvgUfbAcsyQ8"; protocol="application/pgp-signature"
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/U6SFfE3TDwMLvgUfbAcsyQ8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

"Jason A. Donenfeld" <Jason@zx2c4.com> on Sat, 2016/12/03 23:21:
> I like the general idea here of including dkim in WireGuard now,=20

'dkim' is mail security... We have dkms. ;)

> since
> basically all distros use it and ship the exact same logic. By putting
> it in WireGuard itself, I can provide maintenance over the
> interworkings, which will be helpful for downstream.
>=20
> Another thing I can do is handle the installation myself. `make dkim`
> will then copy all the paths and create the dkim.conf file, etc. First
> question: is there a standard destination path to which files should
> be copied.

For Arch Linux we install dkms sources to /usr/src/$pkgname-$pkgver, so for
wireguard we have: /usr/src/wireguard-0.0.20161129/

So directory content looks something like this:

/usr/src/wireguard-0.0.20161129/
/usr/src/wireguard-0.0.20161129/Kbuild
/usr/src/wireguard-0.0.20161129/Kconfig
/usr/src/wireguard-0.0.20161129/Makefile
/usr/src/wireguard-0.0.20161129/dkms.conf
/usr/src/wireguard-0.0.20161129/*.c
/usr/src/wireguard-0.0.20161129/*.h
/usr/src/wireguard-0.0.20161129/crypto/
/usr/src/wireguard-0.0.20161129/crypto/*.S
/usr/src/wireguard-0.0.20161129/crypto/*.c
/usr/src/wireguard-0.0.20161129/crypto/*.h
/usr/src/wireguard-0.0.20161129/selftest/
/usr/src/wireguard-0.0.20161129/selftest/*.h

> Second question: what environment variable name do you
> think would be appropriate for representing the destination address
> (override)?

To have something like this would be great:

make DESTDIR=3D"$pkgdir/" DKMSDIR=3D"/usr/src/$pkgname-$pkgver" dkms
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/U6SFfE3TDwMLvgUfbAcsyQ8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAlhGhncACgkQiUUh18yA
9HagmAgAy2i9FuoTGNGhHliylyZ6fqP8EMDyx1jGlNhl5tG+E1m0fQWoyA5KLtP5
q5Z9ztG7+8ITQxciB51as/Z401rT4gcF2DtBCXM7Sv04ZLjRs1Ib3c5FN9lhy2k+
3nUiFVf61oPfZ/Srh9IFknjUgiQnR5gAJ6ySQcQJbSrQuqEWkDPKWXy2PSyqaMXn
dvVAQoePXTrggug6JatEEOs5+P0sNBgpdlbqoPAHCJvwk2n/Tku4Wn2hygT8CrsR
XAbYSbL+Hkx2OXq4724qXloe8fcc1NDcuZ3RC+oXX/VgqVHak38/Tf9gMMV0JDSE
LNTLGYrRiObndZgeKNwmD2vVnK0jfA==
=bauZ
-----END PGP SIGNATURE-----

--Sig_/U6SFfE3TDwMLvgUfbAcsyQ8--
