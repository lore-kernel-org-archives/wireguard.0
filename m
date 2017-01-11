Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7467e523
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Jan 2017 09:48:50 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a77a030e
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Jan 2017 09:48:50 +0000 (UTC)
Date: Wed, 11 Jan 2017 10:58:37 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Will van Gulik <mailing-porcus@porcus.ch>
Subject: Re: Maximum number of interfaces + Debug
Message-ID: <20170111095837.GB11399@tuxmachine.polynome.dn42>
References: <698F0489-3376-4D52-A48E-A4C9F344D817@porcus.ch>
 <9F550D1D-A374-48D6-881E-D626BB250E8F@porcus.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
In-Reply-To: <9F550D1D-A374-48D6-881E-D626BB250E8F@porcus.ch>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Thu, Jan 05, 2017 at 11:49:03PM +0100, Will van Gulik wrote:
> Hi Everyone,
>=20
> I went a bit further and did compile the module with debug rather than us=
ing the repo's version, and I get a :
> wireguard: Invalid packet from xxxx:yyy
> in my dmesg. I would have hoped to get something more clear, but would a =
module version mismatch be an issue or does this mostly looks like a key is=
sue ? I would be strange because I reissued them several times.

There have been backwards-incompatible changes recently: can you make sure
that you use the exact same wireguard version on all peers?

> Any clue, ideas, else ?
>=20
> Cheers,
>=20
> Will
>=20
> > On 03 Jan 2017, at 09:52, Will van Gulik <mailing-porcus@porcus.ch> wro=
te:
> >=20
> > Hi,
> >=20
> > I'm trying to use multiple wireguard tunnel in one VM at the same time,=
 but it seems that only the first two I configured are working. I'm current=
ly trying with 5 interfaces, I see the incoming packet in tcpdump but no re=
action of the destination host with all the wg interfaces.
> >=20
> > I'm not sure there is a limitation on that, I could totally have missed=
 that. Should I use 1 interface with multiple peers rather than multiple in=
terface ?
> >=20
> > I'm testing that on a Debian with 4.8.7-1, running on a KVM host.
> >=20
> > Any insight ?
> >=20
> > Kind regards,
> >=20
> > Will
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlh2AckACgkQvgHsIqBO
Lkb7sxAAtFv82ShDyr2R/K8V6GOdFciosH24xuEKOMbZFzFsqTKmtIdnh7/YpFEI
pSoTMG2ZlwUJ2Rz0DyzP6+wiLH+MHjGv11LIN4ge1ORF1EoiPGMWOBNutiu66c6x
+/L06j66cR/m/iaNsCdojov1pGUksH78sH6ncHsJupO4QUK6U9pAxqMYJ6b9Diqq
BgcZEqjB3Hfc1ECvqeFuSB3uC9pa+o7/3M9/GT/W7C6J7llZsnR6/BXPGTh2LwEq
iuHvH0wLPJy9UG6qeKseL4QSKo1a6knRDcGFRVPVm4bocLJXOJqTn8yR0ruyJdjt
e2cLRIVA3ZIKvi8Il3kJiAWORp0r1RaJWo2+4i8SXiw6nNLmYX4faklbI5NsMStY
7yoACNbsJOLSHEEKikk9B5O7r+voYEPFiIiwuqBVd43ye/h6I6Q6tA+Psuvnsukq
Lj4M8+8uvYPH84FPbQAkZn2xh5qRWDBzO77gqLKrASFTR49X3woGLrNWEsDs6UHZ
TlcBbBF8sGxC5ICfyG7DPlojtv7HA5bLp6MiMTVylTCVgWAmvPY1k9qwssnObNHa
OuBzdqcgq1ReE2MKRa8MzBzKGoHcxzR1AHEILgLeyWBn8s0m4fbzPTuBEResXomv
x9SClUdfMcXtlOqNRhUW7v1iImCr0zjrLUYY7FGw+YuRheYb7+g=
=+vJr
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
