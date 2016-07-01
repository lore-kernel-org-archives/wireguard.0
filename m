Return-Path: mail@eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5ac663c
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 21:42:24 +0000 (UTC)
Date: Fri, 1 Jul 2016 23:45:15 +0200
From: Christian Hesse <mail@eworm.de>
To: "Jason A. Donenfeld" <zx2c4@gentoo.org>
Message-ID: <20160701234515.1db75e7f@leda.localdomain>
In-Reply-To: <CAHmME9o5kcR5wStmB-Ku+2eDrrtbdvNLwG0AvaDdeuKuRtdaAA@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9o5kcR5wStmB-Ku+2eDrrtbdvNLwG0AvaDdeuKuRtdaAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sI5kLkOMRAsIaRM2aK3qfVU"; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 zorun@bitsofnetworks.org
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/sI5kLkOMRAsIaRM2aK3qfVU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

"Jason A. Donenfeld" <zx2c4@gentoo.org> on Fri, 2016/07/01 23:28:
> Are these instructions correct?
>=20
> Arch [AUR]:
>     yaourt -S wireguard-dkms wireguard-tools

Using yaourt is not the only but one of the possible ways to go...

Looks like this is sufficient, though:

yaourt -S wireguard-tools

This will find package base 'wireguard' and install all split packages.
--=20
Schoene Gruesse
Chris

--Sig_/sI5kLkOMRAsIaRM2aK3qfVU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXduRrAAoJEFTtyRYJvJGDbIUP/02/9dRX66zX6XPHnKGECq9U
8ojvSBRgoBcZbALMyYT4uL47MqZ0M2bqk+QSy0LCPTw4Lvjbb6k/HAkRd/xp+XJ9
3LiZEcMQPztNg8kbEsGcIkgNx9fWCPpf0g9pyJQMbJydS1DOKC2jgQFZJvSVMMHm
7HoiGnz0xhFCYxhGfe368k/5qQ5rQP+j5JdBnH0U4oFqtlJMt1WdueiNe7b67GIc
d4YFBRPOWuOdprMVlw1Cl+bCDn6XOazPrPMYpolhLlLxlv863FRDIL+cvPWFK6/p
CQWGPEHZo6uGOkXIalpWyJ7Xk7Ey06P0iC8kdoCORgZrk9SxnB8gs1MGg4w4YXgx
vU1MmUJdkmbG39eXxbobPYlRy6ux7jTiiUipqDX8RzqQw3dbbxNJtKR0iL1zhI/x
akDxOtI68Gai8bH2z21MqejPLp1e8zR9UiJvFLf3nYW9r/QsBOFdInmI8ERNCKTL
cz3isfK/Bg2B/e5fu662K3AkeUTGAIPiYNcYZR1YT7lVywUw+fX8pll7Q1jZTAg9
WsA//JItyqYzLo92IJdFjpmMrrZVYqfdY5kY1Em3bm108HToKYcGI0d+oZ8OHCzs
IKK7qVutz7VPFFnSvSkVwbiD9o7Ns3Fq4J8nILZiH85i4NMmpQw0vFmaxJDVzN5V
cYcokdcQHrPDwSeA3Dfh
=8219
-----END PGP SIGNATURE-----

--Sig_/sI5kLkOMRAsIaRM2aK3qfVU--
