Return-Path: list@eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cb0df95
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 20:10:35 +0000 (UTC)
Date: Tue, 6 Dec 2016 21:15:47 +0100
From: Christian Hesse <list@eworm.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 1/1] add dkms configuration file dkms.conf
Message-ID: <20161206211547.1e3dd9a5@leda>
In-Reply-To: <CAHmME9rxy-tzWdOYontRYDkxwWAgyx6jPURej1Qh2brMcrDEjw@mail.gmail.com>
References: <20161203123044.25848-1-list@eworm.de>
 <20161203124233.27891-1-list@eworm.de>
 <CAHmME9pAz1e2keE0vH-cWORP7pRmhfoivFt0_=_4xEH9xUjLDA@mail.gmail.com>
 <20161206103551.038a3d3e@leda>
 <CAHmME9rxy-tzWdOYontRYDkxwWAgyx6jPURej1Qh2brMcrDEjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yk+NrdpYMkxknK71K0aNH3E"; protocol="application/pgp-signature"
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

--Sig_/yk+NrdpYMkxknK71K0aNH3E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

"Jason A. Donenfeld" <Jason@zx2c4.com> on Tue, 2016/12/06 19:14:
> On Tue, Dec 6, 2016 at 10:35 AM, Christian Hesse <list@eworm.de> wrote:
> > "Jason A. Donenfeld" <Jason@zx2c4.com> on Sat, 2016/12/03 23:21: =20
> > > I like the general idea here of including dkim in WireGuard now, =20
> >
> > 'dkim' is mail security... We have dkms. ;) =20
>=20
> Lol!
>=20
> > For Arch Linux we install dkms sources to /usr/src/$pkgname-$pkgver, so
> > for wireguard we have: /usr/src/wireguard-0.0.20161129/
> > To have something like this would be great:
> > make DESTDIR=3D"$pkgdir/" DKMSDIR=3D"/usr/src/$pkgname-$pkgver" dkms =20
>=20
> How does this look to you:
> https://git.zx2c4.com/WireGuard/commit/?id=3Db70677fb8af28cbaec8101461448=
58ad07a879ed
>=20
> You can simply run:
>=20
> make DESTDIR=3D"$pkgdir/" DKMSDIR=3D"/usr/src/$pkgname-$pkgver" dkms-inst=
all
>=20
> You can also adjust SRCDIR or PREFIX, but I imagine you'll want to
> keep these as is. All variables are also inherited from the
> environment, so if the package manager sets these globally, things are
> even easier.
>=20
> What do you think of that?

Looks good!

Here are my changes for the git package:

https://aur.archlinux.org/cgit/aur.git/commit/?h=3Dwireguard-git&id=3Ddbb8a=
8cd7a98d3e5d338a4c1103eb7fae1b4c40c

Thanks a lot!
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/yk+NrdpYMkxknK71K0aNH3E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAlhHHHMACgkQiUUh18yA
9HZYwAf+L944KuaIBtd7VVaROvf1JhyMA7VI5JvjWGOuEMEKwVk5xWygXObli+K1
PKO229F5g39JwBlcimHLN/oqGcdoRdyA7xd21pd4047yEm2WjlJR2HxqxVmJDyzD
u19ue59QuvwhttJr9+DkJrOy6vTjfVCRqOqLx7e5QBOLHIM0qvOX8Kz4VUEFLnfk
CFP9A5NJKSlK/JKVf7nWmhxT3vQRjxJ/9mINDFMSnYUFlI6cX4Eoj7DwfUccCmlF
PEZD09qYcIcJgVsgT9WTVdH2Ggh8uoy2mZmkYCu6pDuFfDlqI+HnomdIVFgJDy6Q
Yed//dkXtCEykXdC7PS0x0R6gFTPkg==
=0Qcg
-----END PGP SIGNATURE-----

--Sig_/yk+NrdpYMkxknK71K0aNH3E--
