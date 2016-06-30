Return-Path: mail@eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7f4f3b3
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 19:24:46 +0000 (UTC)
Date: Thu, 30 Jun 2016 21:27:27 +0200
From: Christian Hesse <mail@eworm.de>
To: "Jason A. Donenfeld" <zx2c4@gentoo.org>
Message-ID: <20160630212727.6c1c9f16@leda.localdomain>
In-Reply-To: <CAHmME9roK0U62hwXq2rHOtGEkoxKx92Xg9Ay2HOnKuL4CtoQgA@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9roK0U62hwXq2rHOtGEkoxKx92Xg9Ay2HOnKuL4CtoQgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/de..WujKMKmI.Ol7IOf/RiE"; protocol="application/pgp-signature"
Cc: wireguard@lists.zx2c4.com, zorun@bitsofnetworks.org
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/de..WujKMKmI.Ol7IOf/RiE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

"Jason A. Donenfeld" <zx2c4@gentoo.org> on Thu, 2016/06/30 20:32:
> Hi folks,
>=20
> Thanks for the super helpful responses.
>=20
> For versioning of tags, I'll go with "experimental/0.0.$(date
> +%Y%d%m)". You can then do whatever you'd like with regard to version
> numbers, so long as it contains the 0.0.YYYYMMDD somewhere. I've
> already tagged the first one for testing:
>=20
> https://git.zx2c4.com/WireGuard/snapshot/experimental/0.0.20160630.tar.xz

https://aur.archlinux.org/pkgbase/wireguard/

Resulting packages are:

wireguard-dkms 0.0.20160630-1
wireguard-tools 0.0.20160630-1
--=20
Schoene Gruesse
Chris

--Sig_/de..WujKMKmI.Ol7IOf/RiE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdXKfAAoJEFTtyRYJvJGDwJMP/iPgC5VFucIlSXTjSDVDF6JA
UW0T84ZPRrLw8jBWZow1cHmurpgWlFn0BMEtLhdfCtEqL82+h2FftvAZVW7uqYGg
joUzEmOOqRsa5UN8b4jSguBxwg6tgGAk5zf/b/vYMSi+1Np9KtkhtCsAOkSSwxXJ
t+KlvnxcQmBwzpNon8jcIJw53T4fE/xIzqWEIIoM6/wVUupn3TYVCHhWECtrSAuC
3uf8caZP/fCi/cEIPB/5zC/MFAWX8PBaIt+31UMawFutNNekiqGghpDsV+8sviPx
kUG/EwquP71uYWIO2nZvc/m9daTekF2N3AY8AwebmADFY8B18ggjIxU9mQAyT0rN
YwAt/Eq4HRvAPfyA2JQyQ6nreufTRrOrWGZFT/Ajpujc5ymDUO7Z0tPpYc1HQi09
mMQovRmuk13FENEC/oksMDGiPqYSpWnan7k8gnnfajbLqPMO2F+yORswFCeFwUYZ
alNlKZ5PdI6zjnMNLIC/GQfNib+m+HUUm/DNEswwkTpWYmAIXuFHnJlcaZWELjSJ
NjGlWUyBM1XxOvP9k8Si9fCE9SRo5bznUFhaFyTkTlGybsk6sCF9GCOe3nv1pTw6
s5qsM+eg9dW4T/SAvd2UHztU3BL0oxmQvoadesZNHFexyhzXFuPO5duqfkaC1qu9
yBYzlGpUfN35AlATLD01
=C9mB
-----END PGP SIGNATURE-----

--Sig_/de..WujKMKmI.Ol7IOf/RiE--
