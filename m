Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99e86df2
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 10:51:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 722e1f1b
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 10:51:46 +0000 (UTC)
Date: Tue, 27 Jun 2017 13:08:14 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Andrej Kacian <andrej@kacian.sk>
Subject: Re: making wireguard work on RHEL7/etc.
Message-ID: <20170627110812.GD3026@zx2c4.com>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
 <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
 <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
 <20170627073521.22a725fc@penny>
 <alpine.LRH.2.20.1706270821440.17486@bcny.fcbq.bet>
 <20170627113906.391bb9a6.andrej@kacian.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
In-Reply-To: <20170627113906.391bb9a6.andrej@kacian.sk>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2017 at 11:39:06AM +0200, Andrej Kacian wrote:
> On Tue, 27 Jun 2017 08:25:31 +0100 (BST)
> wireguard@wut.to wrote:
>=20
> > > I wonder - is it a good idea to depend on
> > > nonstandard, distribution-specific defines like this? This kind of
> > > modification IMHO belongs in a local patch applied during a rpmbuild
> > > for a RHEL/Centos package. =20
> >=20
> > I think that depends entirely on if you want it to be easy for users
> > to obtain and use your software. If it requires constant patching and
> > updates, most people won't bother and will use something else.
>=20
> Absolutely. I'm not saying these fixes are not needed, I merely
> expressed an opinion that their place is not in the main source code,
> but rather in a custom patch applied when creating packages for the
> affected distribution(s).

compat.h is a dumpster fire already. Tons of people use the RHEL kernel.
I think supporting it won't make an already gross cess pool any more
disgusting. It's a file of hacks; I might as well add another.

(I probably won't add hacks, though, for the heaps of random custom
Android vendor kernels.)

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAllSPJEACgkQSfxwEqXe
A66FZxAAgUm2vBcTZXexetw2nyaIFftg4oXRVhR5GKxui8VDvHo6vWhKNJEwLH1x
NjYUInHyklZZGnWcvHbbzjNYfg6ad7l643bY1fYUoK2N1Tea4Ocq7kr1fnYyrFEa
oWPs57mXsyYU7SwhsKBnUqMpJQXXli1g8cpQ6AtjazuxNAW4y4TO42jxYNJmdVXf
LBMoeGpdaZvxAOe8fg52jRIGFLy4AvOFtnMDDvxedp1CS3c7k+UVI27yZirzTulM
9BAvMdwM/RD1VveRjQg0PxY6YJyOxOPPfTpQClP1fGqrdxc2Hgs3W5mWTHnPoyCI
OiYNMyODde1foSyT9W3oJIRpIh2bOblh8tHLCCST2At6TmYIPSsvj1EElQbbB24a
LQYkkgD7jjlc7dPDgeBvlZzYOY2saEW76GPBF5sgXnARMQhamu/qOW4kSiluPj2O
cQhJvINQDBcUuLGPR9PulJEY+pTEnD7bCLyhZcspKwsP2eUtJTOib+JQmjbPxzJQ
8PHNNnSotlqoSb1pNSoduicwQpiDMJGEWn9mVSwwJwbm5mBdnRdHyfINVeDV2qC0
UMSXnyh4WkoUIuy2R4wOKRTy/pVqvNTHvvTG+fKre20GRmw5m/eBhB0i0p80807Y
0wvrvqYXU4u8LS6C1PmPYXMnDmDeeupiZNJsrQGS3e0iXEIqvCQ=
=ct4v
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
