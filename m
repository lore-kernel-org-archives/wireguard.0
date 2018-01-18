Return-Path: mdt@emdete.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06162767
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 14:08:32 +0000 (UTC)
Received: from emdete.de (total-communication.vfnet.de [80.84.1.14])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b044ec5
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 14:08:31 +0000 (UTC)
Date: Thu, 18 Jan 2018 15:11:57 +0100
From: "M. Dietrich" <mdt@emdete.de>
Subject: Re: Defaultroutepiercing
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <1516279577.16nr5x0y18.astroid@morple.none>
 <CAHmME9oiqr7dN+riRgJ0jXxxwuXB0U9ot94GsoM7KUWGbEE-0Q@mail.gmail.com>
In-Reply-To: <CAHmME9oiqr7dN+riRgJ0jXxxwuXB0U9ot94GsoM7KUWGbEE-0Q@mail.gmail.com>
Message-Id: <1516283661.uwaeedz44a.astroid@morple.none>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256; boundary="=-/pU2kNCnGS95RkgkFjKJ"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-/pU2kNCnGS95RkgkFjKJ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Quotation from Jason A. Donenfeld at Januar 18, 2018 14:02:
>  Take a look at what wg-quick does to solve this:
>=20
> https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick.bash#n162
>=20
> It uses policy routing, which is much nicer than overriding the default r=
oute.
>=20
> If, however, you do with to do it the old 0/1, 128/1 way, here's a
> script to automate that: https://=D7=90.cc/gvFOR5BO/bash But I'd recommen=
d
> doing the trick that wg-quick does.

thank you for directing me there - i did not recognize that
wg-quick adds functionality.

using it gives some troubles here with DNS. i use a home grown
script for resolveconf (i do not change the file
/etc/resolv.conf but use dbus to tell dnsmasq the current
nameserver). wg-quick issues a

	[#] resolvconf -a tun.wg0 -m 0 -x

which seems to be wrong, the manpage resolvconf(8) states that the
this parameter is

	interface[.protocol]

why is "tun." prepended?

the command is issued before the routing is configured.
shouldnt the DNS configuration be applied after routing
changes?

M. Dietrich
=

--=-/pU2kNCnGS95RkgkFjKJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE8ECycNYHT6atlYQywVmjQWUJtykFAlpgqy0ACgkQwVmjQWUJ
tymfnQ//TyhdyDjNN0k8loBjckvKW0wDpDhNmkaf5tQtW2HGk0aseKdNpqC2Odj2
KJwV5Ba1LJwor5BaeWo9Lq9cinrH6Z3F73A6vo61yMZtIJZAWdLkXZVvKzusBDZy
08MQn5YZVu32h1s0i9sFNaTyzGQy3L5dWjGgqpv6i3syC/PlE3u3Y0s2QQvf62Y1
xBqbcDEo/1y2YwHCxRHpAtPAVDmsESmzhIo7hPgV2HB/IN39B4YyN37jH30Sg1Ly
GpRvYZl6P9mXJ3d6EwPfIvXbOZqB5XSCsGlbfKvEv5mGp59ZnezOfQRkAU7Bi+uV
zNy1iQG5BHclrzsQ+x045O9piXfGg/OZwrSdOWe32OE7drVURzKWFFIvKGzhU9xe
t6A8QiJZBzh6jhzGOHW21s1JpDXRiaV078jUJ7cRR7ctTNFrcK7C/GF1gI90SRM/
AqqCTpasNg040azjKPB7xiqhVL1Imw/5TvCeMaYOSVMKvcbvmrrQHwe6pAXd95+e
WEqex8ZoSTNi2+qfsU623TC+WFH+oi4UDghlS0IKA8zQY/aWKtY6sUuT8qelZKBR
LBebAImPGpk0Mj08qzvTME1ruAuW+/f/vjx/77etVzayF5L9YaFynp1Oru5ePnfA
HEVyhLpr1YivBiPdoHes3m2iZp3Rh0/iMrmWsGe8obzfYlOqNAI=
=s1T2
-----END PGP SIGNATURE-----

--=-/pU2kNCnGS95RkgkFjKJ--
