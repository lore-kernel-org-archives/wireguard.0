Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0f37923
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 11:04:39 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6961b83b
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 11:04:39 +0000 (UTC)
Date: Wed, 15 Nov 2017 12:08:49 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: =?iso-8859-1?Q?Adri=E1n_Mih=E1lko?= <adriankoooo@gmail.com>
Subject: Re: Fix Debian install guide on wireguard.com/install
Message-ID: <20171115110849.GA27782@lud.polynome.dn42>
References: <CA+Hw3eY4541LNE9TnS5tsU2O+n28BNQ-Spko5dpem8Ej2_ctFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
In-Reply-To: <CA+Hw3eY4541LNE9TnS5tsU2O+n28BNQ-Spko5dpem8Ej2_ctFA@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Adri=E1n,

On 31-10-17, Adri=E1n Mih=E1lko wrote:
> There is a missing step in the Debian installation guide, you must import
> GPG keys before you can add the new repo:

Which version of Debian are you using?

The installation instructions on https://www.wireguard.com/install/ are
tested on Jessie and Stretch, anything older (wheezy) will not work
because the kernel is too old.

Jason, can you add a note on the installation page that says "Jessie or
later" somewhere?

Baptiste

> gpg --keyserver pgpkeys.mit.edu --recv-key  8B48AD6246925553
> gpg -a --export 8B48AD6246925553 | sudo apt-key add -
>=20
> and also the key 7638D0442B90D010
>=20
> gpg --keyserver pgpkeys.mit.edu --recv-key 7638D0442B90D010
> gpg -a --export 7638D0442B90D010 | sudo apt-key add -
>=20
> More about PGP and APT:
>=20
> http://ccm.net/faq/809-debian-apt-get-no-pubkey-gpg-error
>=20
> Regards,
> Adrian Mihalko

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAloMIDgACgkQvgHsIqBO
LkbVfw/9GfsSrG5H407fqU3tothjGkA55iQTqxqdyeCSS50N5GQeTpYQUCRd9nH6
Y5rrOpSGQBYqAiDdlkrUoK3gBvusn+m5egKTa1RjPdYE6iRtvngjBNWNnOCU4qTi
PJxCFzeDrlHLmzuhKV8ZEBN5bgS9dKCxM6ixdynJrEeK5p0SwUc4g4PdPRYruTgw
U5Ln/FaLSYwClLK5MubIBqOdfIKY9vyrq9kezRxfbDcNr6C05YX5jIw9UHHWsTjj
2H4QSOKFSgR3YNiUVobd5wxl+TZltH/rtcfDHbD7kf5OImuh74Livds4p2SIwP1l
mJhKWW4lhWvOzZPLbQudFT4QIpwSktiaJRkCEjf3uJlEMP4sNIwuAe8fG4oHd4Tt
RkcfAXEZWMbZf6aIvFFjPAl9XZEuCnOuvFUO6AD7hGQLJUhG+Pa8fKsY34uGQgSB
beYf3A20sR47VK9zHbPuGJ7sSme4Q3A6hLAVgD1t9iFiPgTm8YU4kN80HBpVTdEc
ICxFrUh4vHJRu5Z7ytpUtPiw2bMAb97GhSfPPAsjd4lE/M6fpakjOYO0t82hNk/a
coCP0PIvNs6A2emnFaGZpeK6Kygbg4lHHCj54oipZxDK5q16K30YioJwAXKpWpiV
Cq8yxlxPpn2GDiIYvxj11LtDoOSIW1/Haas1GedhAKbMXSuRG34=
=6rhf
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
