Return-Path: n3ph@terminal21.de
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.31.30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0c128c8
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 00:16:14 +0000 (UTC)
Date: Tue, 5 Jul 2016 02:19:08 +0200
From: Michael Gerlach <n3ph@terminal21.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160705001908.GA9395@c3po>
References: <20160704225300.GC9424@c3po>
 <CAHmME9r33BJHwbx2G-ANf02+ED4TJOs_Go+Ad3xoCX9L8DJY0g@mail.gmail.com>
 <829db05d-422d-4573-a7f5-d1beff657160@posteo.de>
 <CAHmME9ruAPJsRjvsm_+iPUBzD+z85N+4pdw25KhM9FpG0ygMCA@mail.gmail.com>
 <20160705000658.GA6619@c3po>
 <CAHmME9r8cNHAnuqMuP93YAhe77VUy=sX5NVS4kB+5U7tpF59Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
In-Reply-To: <CAHmME9r8cNHAnuqMuP93YAhe77VUy=sX5NVS4kB+5U7tpF59Sg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jens Viisauksena <viisauksena@posteo.de>
Subject: Re: [WireGuard] wireguard on gentoo (4.6.3)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Everythings fine - thanks for the hints.. I really do not know what went
wrong but now i have the kernel running without MOD_VERSIONING.
I recompiled the module and its working fine now..

[  277.546618] wireguard: WireGuard loaded. See www.wireguard.io for
information.
[  277.546622] wireguard: (C) Copyright 2015-2016 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.

I will now retry this with MOD_VERSIONING - i guess i just forget to
recompile the module after altering the kernel accordingly for the
dependencies..=20



best regards,

n3ph



On Tue, Jul 05, 2016 at 02:14:18AM +0200, Jason A. Donenfeld wrote:
> Hey Michael,
>=20
> There might be some other weirdness happening, then, with your kernel
> tree. Perhaps the compiler changed in curious ways, or sources got
> mixed around.
>=20
> You might benefit from running something like:
>=20
> # cd /usr/src/linux
> # mount /boot
> # cp .config ../backup-config
> # make mrproper
> # mv ../backup-config .
> # make oldconfig
> # make -j$(nproc)
> # make -j$(nproc) modules
> # make install
> # make modules_install
> # reboot
>=20
> That should give you something perhaps a bit more clean. Then, once
> that's running, try emerging wireguard again.
>=20
> Jason

--=20
Please use PGP - https://en.wikipedia.org/wiki/Pretty_Good_Privacy


--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXevz8AAoJEE1l5S41evqa9YQH+wTcNQgMdjuUQ/QnIYR2F1vn
R2iXpJ036cktQl3uzmhl2VL89v6dtLlV3al52vcXmeSlq6OTswVeljp1AbBD00ZB
YfbLANoB1dWlrPvqds1wmXp4Hx7ZYmujZJTGNULQR/5BEe+WlgVx9IZOV/BGnWys
z/ZGmVqua1l+Z8q2P7UOm8VtXQJgW8Nm+x0bjCbvxhrTrJwbDY6UuEBHBHAPPZG3
oOPt+0pB597ClyxPrzi+SIkbzj229m02vGr4sWA5DpudB6BrPar+uiVJVr4WoFiA
iNEH3jfZQXdBkOjnnlXSCKp9gHdGKUr3cTh+tw6H6RJ+ctbuwM+R58JbvXV37WE=
=7zqp
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
