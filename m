Return-Path: list@eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 949e91a0
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 13:25:45 +0000 (UTC)
Date: Thu, 30 Jun 2016 15:28:25 +0200
From: Christian Hesse <list@eworm.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160630152825.695863a4@leda.localdomain>
In-Reply-To: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kzF4u/+azdBXD6nA1aHF2GR"; protocol="application/pgp-signature"
Cc: wireguard@lists.zx2c4.com, zx2c4@gentoo.org, zorun@bitsofnetworks.org
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/kzF4u/+azdBXD6nA1aHF2GR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

"Jason A. Donenfeld" <Jason@zx2c4.com> on Thu, 2016/06/30 14:52:
> Christian is doing something a bit confusing and calling it
> "wireguard-dkms" (for the module) and "wireguard" (for the tools),
> when I think I'd rather prefer the latter be wireguard-tools if it's
> always split.

The package base name is "wireguard", not sure what happens when no split
package name matches the package base name. I will give it a try...

> Option b) split:
>     Tools package name: wireguard-tools
>     Module package name: wireguard _or_ wireguard-${SUFFIX},
>        where SUFFIX is modules, or dkms, or whatever the convention in
> your OS is

For AUR I will prepare dkms package only, that is named wireguard-dkms.
If this ever goes to an official repository we will have wireguard-arch (for
linux), wireguard-zen (for linux-zen), ...

> =3D=3D=3D 3. Versioning =3D=3D=3D

I uploaded a git package to AUR, that will build from git HEAD and set the
version string accordingly. Currently we have "0.r9.g0624787-1" (no tag, 9
commits, most recent commit 0624787).

If you tag "0.0.20160701_experimental" the string changes to
"0.0.20160701_experimental.r0.g0624787-1" or similar. I can define what
happens in pkgver function.

I can upload a non-cvs version when first tag appears.
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/kzF4u/+azdBXD6nA1aHF2GR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXdR55AAoJEIlFIdfMgPR2mC0IAOxlDSoNhB5hH6v8IKRihsxe
Fp8+E+tCRinQGfo3PGVKjZgTc1dN6WOiVKAPUvqx1mUC+mrzjNzq8BWg5yTrNDP6
4p7e/ZtxfkOVZOeAwlM4AH/SXvnMrYzdvoVRh4NSy+0JSpnsA6pLFcDlkc+tbNCb
MFfn8WYz5r1rw/FJHHchL4sgCCYUyYGrwIict0DOe2YibTY4A7ZIFKMGCHU73UMt
NyJUEMXxqRV5l2xn91xgQbGIxJFn1nbdRCiO0d4Yl7/QzUjEJ0dgToXg/DE3Q5mR
raXLXJbLZql/iWpuo1r7qzh32AUVRkhI5KCJhDg4gVCF9QuKzcaisdXTQy7tWIM=
=1kSF
-----END PGP SIGNATURE-----

--Sig_/kzF4u/+azdBXD6nA1aHF2GR--
