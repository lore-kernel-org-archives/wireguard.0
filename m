Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdf95eae
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 16:14:12 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b147f9c5
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 16:14:12 +0000 (UTC)
Date: Sat, 11 Feb 2017 17:27:58 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: David Anderson <dave@natulte.net>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
Message-ID: <20170211162758.GA4633@tuxmachine.polynome.dn42>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <CAHmME9q8+D7y0Hz4xOJv1MiVsq0=bUf3TgENseGEWWF2BEpx4Q@mail.gmail.com>
 <CAMx+r7VgJ0xDAy46d28Qv_Vv7vM8JO0yRbYEh6AHVWT55LEVAw@mail.gmail.com>
 <CAHmME9rumLr0V6yD=zoHk-GSN2-bCiGe644WHtt4EJvKrhtLoA@mail.gmail.com>
 <CAMx+r7VkgtkFdqkKVbeX_Pv=T1TO6KaTY-+T1iM2OphS-L8mWA@mail.gmail.com>
 <CAHmME9qkRgySY61Cqm76Lqs_f3U3V3p5YF1G0kE1CCPd9u398Q@mail.gmail.com>
 <CAMx+r7WLJ5S-Op_9dq4AY9BNmk6u7xMOwqwVoAis=_pqJX1_-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
In-Reply-To: <CAMx+r7WLJ5S-Op_9dq4AY9BNmk6u7xMOwqwVoAis=_pqJX1_-g@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2017 at 03:48:59AM -0800, David Anderson wrote:
> Okay, I've set up a Debian stable builder as well... However, Debian stab=
le
> has a 3.16 kernel, and wireguard-dkms requires >=3D3.18, so installation
> fails. Assuming 3.18 is a hard lower-bound on kernel versions, it looks
> like jessie will never run in-kernel wireguard. Fortunately it'll be moot
> in a few months when stretch becomes the new stable.

Jessie-backports has linux 4.9, so it's probably much simpler to require
users to install this.

> On Sat, Feb 11, 2017 at 2:17 AM, Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:
>=20
> > Hi Dave,
> >
> > Ahh right, that old debate.
> >
> > Jason
> >

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlifO4cACgkQvgHsIqBO
LkYfDxAAhfzkY5BuIX+yV5YbDem0brgcDzZQIQdYp+EwCTmmecMiSNCUGyH4Y8VG
JtdNvqHEkqCli0q4nfyO0ZLTgy1qCLS6w7msyUAcsBo8P3pNQvrLID4YeXxHsqhm
ppWtZk3MSIIkryl7JbUu5XGhnCQxSYJ45dEhkHrcAF3+t/GyIXKBmN5Hk90nD9fE
DnxWDlA7psP4na+YL7GGME+GtWBv7+O08+UjW1nUcaaaj919hw+MBBT4p0uCNkgZ
AZ4LmRRVdgEugAxDYRbd0iKVP+V9dULWCzX7xFPPOwHrkyUr+TwoZvede7ez1vQF
lO/hNPJZS4q9VmYuXsni5KRM1w6cmTiYcbVKPaIYogt5AEDOXoueN6yPjpaZo1th
jV2az10Spv2Hrfg+9DCBeF6i//7Mp5COtcFwf+cD1gxqbfZQKR1txktsZtzK3ucE
jjZeR38K3QkxoHiTU1cBoZNMNkAPQMNeZCWdwQKfIg80SL7EdWtHPb11BoPvMu8J
PlqmafTbgf248lLBHNN96Fux1Vrb85DHtrDg9rpmKdFD3r0MwCRvnzQQ/Rxb1LTo
1TDCZ0DQ9FqJhfZAK5oKgUP0Yl6mAnGrjoH8FVTNbWDURJz5P0y77v1Blh67DIFM
XQ9ZTKOmWAcx4ls7fPjXFQVrCoUO/TqoVafKIh5pyHPQWpS9Fvg=
=chEj
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
