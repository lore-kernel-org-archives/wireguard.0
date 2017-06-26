Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75cea6c3
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 16:44:06 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d69cb75
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 16:44:05 +0000 (UTC)
Date: Mon, 26 Jun 2017 19:00:19 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: =?utf-8?B?0KjQstCw0YDRhiDQodC10YDQs9C10Lkg0JLQu9Cw0LTQuNC80LjRgNC+0LI=?=
 =?utf-8?B?0LjRhw==?= <svschwartz@gmail.com>
Subject: Re: debian 8 setup
Message-ID: <20170626170018.GA21917@lud>
References: <CAEpXMn2G5W8ta39WXReXOZe_G9+gGVTZ+31u4sJ8s54DMgSzmA@mail.gmail.com>
 <CACTq0bR=+0wB1u6JJk=LuVxxKnPSGWp49bDtOb8oS666zkE8-Q@mail.gmail.com>
 <CAEpXMn32ZqHF309UBr2b2+zA=zyScd1k9j7GBAaTD=6qD2Viyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
In-Reply-To: <CAEpXMn32ZqHF309UBr2b2+zA=zyScd1k9j7GBAaTD=6qD2Viyg@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Actually, on jessie, you can just install wireguard from unstable:

  https://www.wireguard.io/install/


On Mon, Jun 26, 2017 at 06:40:59PM +0300, =D0=A8=D0=B2=D0=B0=D1=80=D1=86 =
=D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 =D0=92=D0=BB=D0=B0=D0=B4=D0=B8=D0=BC=
=D0=B8=D1=80=D0=BE=D0=B2=D0=B8=D1=87 wrote:
> Ibrahim,
>=20
> I've rebooted the server and now it's ok.
>=20
> Cheers,
> Sergey
>=20
>=20
> 2017-06-26 14:55 GMT+03:00 Ibrahim Tachijian <barhom@netsat.se>:
>=20
> > Hello Sergey,
> >
> > You have probably recently done an apt-get update upgrade that installe=
d a
> > newer kernel-image.
> > I believe if you run,
> >
> >
> >    - apt-get update and upgrade
> >    - reboot
> >    - rebuild wireguard from source (make, make install)
> >
> > Then wireguard should work for you.
> >
> > On Mon, Jun 26, 2017 at 1:35 PM =D0=A8=D0=B2=D0=B0=D1=80=D1=86 =D0=A1=
=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 =D0=92=D0=BB=D0=B0=D0=B4=D0=B8=D0=BC=D0=B8=
=D1=80=D0=BE=D0=B2=D0=B8=D1=87 <
> > svschwartz@gmail.com> wrote:
> >
> >> Hi guys!
> >>
> >> I've build debs for jessie from unstable dsc, but wireguard module fai=
led
> >> to load
> >>
> >> [34282909.202963] wireguard: Unknown symbol __sk_mem_reclaim_amount (e=
rr
> >> 0)
> >>
> >> am I doing something wrong or is it jessie simply not supported ?
> >>
> >> Regards,
> >> Sergey
> >> _______________________________________________
> >> WireGuard mailing list
> >> WireGuard@lists.zx2c4.com
> >> https://lists.zx2c4.com/mailman/listinfo/wireguard
> >>
> > --
> > *Ibrahim Tachijian*
> >
> > CEO Net Sat AB
> > Mobile: +46723321377
> > barhom@netsat.se
> >
> > _________________________
> >
> >
> > *Net Sat ABC/O Jayway AB*Klara =C3=96stra Kyrkogata 2B, 1TR, 111 52 Sto=
ckholm,
> > Sweden
> > Office: +46 (0)8 408 394 53
> >

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAllRPaIACgkQvgHsIqBO
LkYFfQ/9G6Hxw7u2xJggaXeg5C54ou9jJPI3EUWWFtToAvxW0S834ZxiJVKMzD0B
+Nlbyf5yUtovrlaCWMt9pd06wiaZ8qRMf02ObPwvbe7QN9XZNMF4pnxrVjft9ZTv
1wCHnhzBNn0eaQ6cNjINpwCUHGEVYHONCFJHg/VPu4QLMIh3Aj7LrQHPwDExoStP
dvy70WHxKG0pti9mvjYCOBrtzeemGJj0TsqhfuIMWzMf+X3/2oVtH/wzuWkeYHtH
R6nIGpyTy/4Ok72VUYtbyv5BdKPhhkUNc4+Jb75MVuIVnnzPnrImveiHPsAHBSUa
MQebmd8dalkxGF4u76oAdN0nm0YPMjrmRntGw8zgOrroQTos2G/AK/UXBqhIfHXQ
dVQTYqUAFqwWa76+xKHsY94SzFwl+mJyZdamvrMn5aShqOXu16YMI/c7xLS83BVG
nS3UfGfAGNXUELc5d9N/j1jn/S7t8y6/HVTtita4K9TsS+2112nHmvxVIaZQ0Z1R
4zDNP+9z806ktR3vyMLWf8wq2Udi11bbatwsOJnqKuZTWlhaQ8STUsHEJs/cAsIP
bzOcHej6dD5Z+NAk7ASuO1p52xhIcXsZ/NrN1RW7xYvfLXIMbGja+nKf3ASvIS5d
qmPuAmS2e2uQocrj8Wkc6nODEZJDFo31hgj+G6Te/piOOQJ5Ls8=
=i5Ar
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
