Return-Path: list@eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ea7ffd0
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 19:02:20 +0000 (UTC)
Date: Tue, 5 Jul 2016 21:05:35 +0200
From: Christian Hesse <list@eworm.de>
To: Phillip Smith <fukawi2@gmail.com>
Message-ID: <20160705210535.3e4feca5@leda.localdomain>
In-Reply-To: <CAKAE9iRNJEMO9S3_hNNK5tWYASxKMQA4-0FTJRAFjq6PJ8jKTw@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9oMaHXVZMqjjFbuy9tprCyfWh03dsg1XnEtudD-RuknLA@mail.gmail.com>
 <CAKAE9iTcZepnpH1FnGg2CM-HGerJENw+OC=yk44ZFkBepAtnHw@mail.gmail.com>
 <CAHmME9q83PQc637=xA2mxECGTfOWkh0TzsYkfy5macyF6AkSDA@mail.gmail.com>
 <CAKAE9iRNJEMO9S3_hNNK5tWYASxKMQA4-0FTJRAFjq6PJ8jKTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yI2bQ81krQTF+f+BWz40JPU"; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/yI2bQ81krQTF+f+BWz40JPU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Phillip Smith <fukawi2@gmail.com> on Tue, 2016/07/05 11:15:
> > Have you got a better suggestion for a "command"? What do you prefer
> > to yaourt for installing AUR packages? =20
>=20
> There isn't really a single official command for installing from the
> AUR. It is assumed the user has an understanding of the AUR process,
> and tools like yaourt are unofficial third-party utilities.
> A bare minimum of commands to do it manually would be something like:
>     git clone https://aur.archlinux.org/wireguard-dkms.git && cd
> wireguard-dkms makepkg -is
>     cd ..
>     git clone https://aur.archlinux.org/wireguard-tools.git && cd
> wireguard-dkms makepkg -is

This is a split package, so you should be fine with:

git clone https://aur.archlinux.org/wireguard.git
cd wireguard
makepkg -is

This requires pacman to be granted permissions by su or sudo, though.
How about splitting the install?

git clone https://aur.archlinux.org/wireguard.git
cd wireguard
makepkg

And with root privileges:

pacman -U wireguard-dkms-*.pkg.tar.xz wireguard-tools-*.pkg.tar.xz=20

--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/yI2bQ81krQTF+f+BWz40JPU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXfAT/AAoJEIlFIdfMgPR2928IAIs9Vm8XPsM1E/17ctv4B7+x
WK/i0sIBjvFByyaNPKJOu9DsDf1C+sM0/wzrBX07CazFPU0dR+nvFB/nK7+zq6ey
EwxqWLaQV1+dzQaDwkgctCG/B/6H5x6MEjy2JJTXVXllqXUwl6o+vZeOkoOcc1oG
FDiaBeTaZZtqhxnctEJf6rhJm31Hob/yMUhCZ6StOvwr4PQgfv7FZp9bfNaSmEdK
x6pMf8hmvENEgLsGqscPOtL6O0SAFVM0AplSPwEjb5PyUKo8Zjf+sQHu483QCGzc
bKgEdXOHRYbDl8mPm0QCygmH6fw3vrhV+X23QBjgZZDiIl5rmx7Pq2SM7RyY/tY=
=IrZA
-----END PGP SIGNATURE-----

--Sig_/yI2bQ81krQTF+f+BWz40JPU--
