Return-Path: n3ph@terminal21.de
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de
 [80.67.31.31])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4db22fd
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jul 2016 11:06:07 +0000 (UTC)
Date: Fri, 29 Jul 2016 13:08:21 +0200
From: Michael Gerlach <n3ph@terminal21.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160729110821.khbc7w6z4rv4nphg@c3po>
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
 protocol="application/pgp-signature"; boundary="arwz5jerahuhcbae"
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


--arwz5jerahuhcbae
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Jason!

I figured out how to run openwrt on qemu.. It seems it is just possible
to run the malta target on mipsel - discribed here:
http://aleph0.info/software/lisp-forth-openwrt/openwrt-on-qemu.html

I tried ar71xx but had no luck to get things work..=20

So i just got the images from
https://downloads.lede-project.org/snapshots/targets/malta/le/

and execute qemu by

qemu-system-mipsel -kernel lede-malta-le-vmlinux-initramfs.elf
-nographic -m 256 -append "console=3DttyS0"

Hope thats helps..=20



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


--arwz5jerahuhcbae
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXmzklAAoJEE1l5S41evqakqIIANvltNOnlbKZ/ntfi80lFo1k
na4DhguIjq5UNKiPRLacXmUnkhjSA891GNcSjX4n7jpgLaCfHZwUlsWvCPu9i4vC
2QuToAJ0rgnlzDTXbgoAmQrqjQ+PvDY+xwNgstWGI1RQTA9ZVVmUDV1u1PhCzSiF
YMbhkWDi6y75Y2Zr19rssCHP6cKDjGNmRctSmJEfkC0qWO3j1vz0FHp1XlKXvXGO
fTe6mN7snu8YC0VneEsGI2wdcdqX1plTjcttkTjvK7UVprdQvjqOGxXZLGro4xrJ
aiVL7+snmAV+ubZHXmpUOy4p2HGQVxZMOvTiaQV+x3cQ8v35cADUntr8NfYh/1c=
=fnwB
-----END PGP SIGNATURE-----

--arwz5jerahuhcbae--
