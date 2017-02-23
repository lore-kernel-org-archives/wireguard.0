Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66c101bb
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 21:15:54 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff60214d
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 21:15:54 +0000 (UTC)
Date: Thu, 23 Feb 2017 22:16:57 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Subject: Re: [ wireguard-dev ] About configuring allowedip
Message-ID: <20170223211657.GE6317@tuxmachine.polynome.dn42>
References: <CADdae-h1pmyzn5aTsnBG5nBaKCuLk03eu0wtQ0E1V0j+nBZsiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8TaQrIeukR7mmbKf"
In-Reply-To: <CADdae-h1pmyzn5aTsnBG5nBaKCuLk03eu0wtQ0E1V0j+nBZsiA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--8TaQrIeukR7mmbKf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 02:03:37PM +0100, Nicolas Prochazka wrote:
> Hello, i'm trying to do this with wireguard, withtout success :
>=20
> peer1 ---> peer2   : config ok , works
> peer3 ---> peer1  : config ok , works
> peer3 --->peer1 ---> peer2  : not ok .
>=20
> I suspect allowed-ip configuration, but all my tests does not works.
> perhaps I must create two wireguard interface on peer 1 and do
> forwarding/routing ?
> i'm using ipv6 as internal ip.

It should work with a single interface for both peers, but you need to
activate forwarding in the kernel:

    # sysctl net.ipv6.conf.default.forwarding=3D1

> so my question is :
> - two interface ?
> - specifiq magic allowedip ?
> ( allowed ip is confusing for, it is using for routing and for evicting
> paquet ? )
>=20
> Regards,
> Nicolas

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--8TaQrIeukR7mmbKf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlivUUAACgkQvgHsIqBO
LkYXJw/+LzYAJ4UBBHYJVAcLoqKYDQQmm1zPy6LVfvyGCwRRsQfYWmr8J+hpmFlB
7ep/PuXy0hurmn9X3SeMcAfAP0dHr+NGWytgEaP8IMP1W27ll8Vi+YZw+7kxkVrm
2pbmT6opkmp408ivevyzfnNE97f4NpgwKInQiSjiBJhExhrJYicmpIumekV0vCpw
ngNIAEhxZDE1Vyf6gryA1uJJNmC1CLlgPXdP59U1/KQ8TGfDb1n0cRo29dBA5Ina
DsvHgaWuvUGh/6lBB58JBdlp1VvvsyAGdlrAaMY5dK/GsBlz2M7HDMVAY/aNX1LW
bq8gCO8Zb0B1fJtZURYnFYacKsS/pWbBTqHOhhTCMtEX4XTGJ3+0MfrLgG+WwJMg
7xh9xQhILqhhJtU3xmWQJbMi35PBKnHY836fJH0LxD+fHR8PwTGe4jy+H2e8jL4N
9DIyua0ztRhTDjY1EI94a2AmStBmBVUH1rBSLi7Q6sjEyng5RY64aaU8k9xZSvSW
0DGljRlojiNI2S4YOpafetqwvKOyJ7wa7uxIA8eb0E4goWc2P9khquild7k19eg8
ui+gQ73iZP5kG5dYB80yVsWck6Q9c/JZj3Tb1fpBDyrw49Epka+hFh/v3bAQk6Zi
iYPe3O5eNDuoMzWJ1sLjxoPGHhLolpfa13qCXhwH9UwJtBOoM+4=
=FgQP
-----END PGP SIGNATURE-----

--8TaQrIeukR7mmbKf--
