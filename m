Return-Path: andrej@kacian.sk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c12f1f7
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 09:22:54 +0000 (UTC)
Received: from vie01a-dmta-pe04-3.mx.upcmail.net
 (vie01a-dmta-pe04-3.mx.upcmail.net [62.179.121.165])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d1e0575
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 09:22:54 +0000 (UTC)
Received: from [172.31.216.44] (helo=vie01a-pemc-psmtp-pe02)
 by vie01a-dmta-pe04.mx.upcmail.net with esmtp (Exim 4.88)
 (envelope-from <andrej@kacian.sk>) id 1dPmxu-0004hs-IS
 for wireguard@lists.zx2c4.com; Tue, 27 Jun 2017 11:39:22 +0200
Received: from hiker (unknown [192.168.111.2])
 by vala.local (Postfix) with ESMTPSA id 6F2871C813D
 for <wireguard@lists.zx2c4.com>; Tue, 27 Jun 2017 11:39:12 +0200 (CEST)
Date: Tue, 27 Jun 2017 11:39:06 +0200
From: Andrej Kacian <andrej@kacian.sk>
To: wireguard@lists.zx2c4.com
Subject: Re: making wireguard work on RHEL7/etc.
Message-ID: <20170627113906.391bb9a6.andrej@kacian.sk>
In-Reply-To: <alpine.LRH.2.20.1706270821440.17486@bcny.fcbq.bet>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
 <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
 <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
 <20170627073521.22a725fc@penny>
 <alpine.LRH.2.20.1706270821440.17486@bcny.fcbq.bet>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DOd3J__gx+1uiO9wxWNTakX"; protocol="application/pgp-signature"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/DOd3J__gx+1uiO9wxWNTakX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Jun 2017 08:25:31 +0100 (BST)
wireguard@wut.to wrote:

> > I wonder - is it a good idea to depend on
> > nonstandard, distribution-specific defines like this? This kind of
> > modification IMHO belongs in a local patch applied during a rpmbuild
> > for a RHEL/Centos package. =20
>=20
> I think that depends entirely on if you want it to be easy for users
> to obtain and use your software. If it requires constant patching and
> updates, most people won't bother and will use something else.

Absolutely. I'm not saying these fixes are not needed, I merely
expressed an opinion that their place is not in the main source code,
but rather in a custom patch applied when creating packages for the
affected distribution(s).

Note that I am not in any way speaking for the project or its
developers, I'm just an interested outsider.

Regards,
--=20
Andrej

--Sig_/DOd3J__gx+1uiO9wxWNTakX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJZUie9AAoJEA9aNXUfa/YPdxkP/jjoB5TSKsCJqi/Ti8I5t4K8
H6RDHRS0J5mrjs2mi6BoOHpJ8IxztKKDAmrS2qg9uZI78d9rJQM3huhi2mdHRm2c
orRP+E4NrMox+UaGAepc1eE+//UnxZTMxhNGuMHjS3Yj2DYuSqFZX2mSTPY312Rc
XBIY7VNEK4jR+DjFxIqrVuuLKE1sYdqS2tAAnN9oNYa6PJgW97bJElQKH5Qb9vCV
O/MrjEdExR0CNQwAzPWLAuSM8gN21tsKmLW0L+BKHIGXF2g/2yGxl3JaKCF7jWlt
xbJSx8gJ8W2CrASK4nKQpOU4PFsq6wZwidghJKTg3rQ4REbyyLTcqddPVTK9xguC
Q1SpiEdOgf23BGrpHHA3zSidwaiqE7TCb495soZFiVZ+WwDAb3FX4gg+sjWohz6T
2Ja3irOX++5w3c2sBvAsfUFbOSkCX/ghxL/a7iw7mnyq2nlJfQmLdbiA9mJji0Kj
2pFgwR5s9dMaYjuIlY09Ilov52QN9XJnSvvg0UwLMb8d/BwRrY6lV8FHRDoJACzr
u/W1v7nLND/O3cwF3Gpe7GQEV1k0KooHBZXQ/tQFOEzc4/rqb527fJ4rutyYv6/U
h/RGigW6kXSnqDjOYxJyqytFRxIxqOK2Z/g/jMTzAQj+iK9rSpRZU98MTwSBcSzk
rtt5S5bcjadMWS9MdHsS
=hSRa
-----END PGP SIGNATURE-----

--Sig_/DOd3J__gx+1uiO9wxWNTakX--
