Return-Path: n3ph@terminal21.de
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de
 [80.67.18.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2abd05b
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jul 2016 19:14:42 +0000 (UTC)
Date: Thu, 28 Jul 2016 21:16:50 +0200
From: Michael Gerlach <n3ph@terminal21.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160728191650.e2i6onnnji6uis75@c3po>
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
 <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
 <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
 <DEB54C8F-1159-48AD-B2A3-CB2B4E05C896@viisauksena.de>
 <CAHmME9oveH4hLUzEjwWnZ8Nj8U63LEuVezgivsxVxgpZKL_PwQ@mail.gmail.com>
 <20160727150219.fdyg2smhmffmfxxl@c3po>
 <CAHmME9ogcB=7T8-0Qe+FuH11g7nAtA-xo0Q9CXnkB3SjhwNDkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i6gxxbittmeejr7k"
In-Reply-To: <CAHmME9ogcB=7T8-0Qe+FuH11g7nAtA-xo0Q9CXnkB3SjhwNDkw@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
 crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--i6gxxbittmeejr7k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jason!

I didn't run openwrt ar71xx targets in qemu yet.. ATM i am recompiling
my qemu to be able to run mips on it, but i don't know if this will work
anyway..=20

I will have a look at it and come back if i have something to work with.

best regards,


n3ph



On Thu, Jul 28, 2016 at 01:48:39PM +0200, Jason A. Donenfeld wrote:
> Hey,
>=20
> Do you guys have a good way of running your setup inside Qemu? I'd
> like to debug this issue a bit...
>=20
> Jason

--=20
Please use PGP - https://en.wikipedia.org/wiki/Pretty_Good_Privacy


--i6gxxbittmeejr7k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXmloiAAoJEE1l5S41evqaFOsIALIZpaa/Me/lnd65oie2D4+u
RoqEkl2rxDf96TD/Os+hHLVKy7TqhuReCdDp7hdQvxX3Fybl/9+4ZG6u9C1Etley
/CTSUqA0DUqskE2WZyX1iqfg+VPn0RoFgy8Ed/hkvGhpD/3r7p4ALXlVZ4P0SeSF
coYEbBKggf2dlMucJoTxE4f28wbYIgZcRvrxi4ncBV5vfK/OgzxS+tMmPkCzFUJA
QAKEt2Rjs4B3AQYo3ddIF74eDel7Dfk/RKbnQuuNRLPl/qtKrR8qjTUVv07p2/qK
tGF58PQVrvR3OYUjc/bLK70wh44c9BPAjdA5N/UU5JNxh89UDnEGXwbavpU3wc4=
=sLPa
-----END PGP SIGNATURE-----

--i6gxxbittmeejr7k--
