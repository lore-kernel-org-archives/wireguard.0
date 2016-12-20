Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2df95bf3
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 01:06:40 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 822893b6
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 01:06:40 +0000 (UTC)
Date: Tue, 20 Dec 2016 02:13:34 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: openwrt route_allowed_ips is inprecise
Message-ID: <20161220011334.GB16814@tuxmachine.polynome.dn42>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
In-Reply-To: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 18, 2016 at 09:14:18PM +0100, Jason A. Donenfeld wrote:
> The way it should be done is described in wg-config:
>=20
> https://git.zx2c4.com/WireGuard/tree/contrib/examples/wg-config/wg-config=
#n130
>=20
>     if [[ $AUTO_ROUTE -eq 1 ]]; then
>         for i in $(wg show "$INTERFACE" allowed-ips | cut -f 2 | tr -d ,)=
; do
>             if ! add_default "$i" && [[ $(ip route get "$i") !=3D *dev\
> $INTERFACE\ * ]]; then
>                 add_route "$i"
>             fi
>         done
>     fi

> the important thing is that I run `ip route get` for each one, and only
> add a route if necessary.

By the way, besides the issue of magic, this approach seems incorrect
depending on the order of the routes.  Consider the case where cmd_add()
handles the following sequence of allowed-ips:

    10.0.0.0/8   dev wg0
    10.4.7.0/24  dev wg0
    10.4.0.0/16  dev wg1

Your method would incorrectly drop the second route, and then the third
route would take over traffic for this /24 through the wrong interface.

I'm sure this approach can be made to actually work in all cases (with
great complexity), but really, who cares about a few redundant routes.

Baptiste

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlhYhb0ACgkQvgHsIqBO
Lkb2lhAArcY2+RWv6HubPvHF+4lTQIh1EmxywP5cvrXshQhPdRy4+orTbQPryFLN
gbFpQkmG38KxF4Hb4UMjKqp4Z1smhLchRKTkWUzUqHchkn/WGo+3t6r6oQ8zYGVx
SWlGEQjQn1CMWX91h1TIm/wZxMdsyLNrQ5FVKNzfCAqXEr9w6et2A/UsMkgNboCo
nqr1w4Lt702vXfIw36CGAXUmSUdt4ER00D969v7GQCkHVeSQRKkhmRZg9SkrTpxh
IMNOIj58R3cqudUGMBXrLbGbWGHAe/rZ+kb0/x0bop9L1bal06/jVgCaSPqEh7T/
yUPNJFTG6qpzDn1msZEgq9phvGDGxov08bAQXD77By+/j9hi3adl5gsCCsd76Uua
ILcyNOz96UVHyDKbiHLv9gHBo4OwunouijvQ8u6FwZ40dveAQjL4Ad/6lxKHaQ0/
cqbqTJJZjwPTq1XW950n7gAbsG0U06mZk+VcHRHztNIjzxlBEhMcWzp7rea65+9v
CYg3hbenQc+MWzrW9dgw1mnsUJV0m91TF37vpP/aVMR8rBcoWQJe+shcAPFyHUTi
Gyv6VMRUAeyhwPNcxdYIDCzkXF6/YCjKQJiH8ofKAr/aSn0EyfLNV7V9J4qbQbhh
9piD/3F095YEjWUvbJjH661VDWteViO2VBKlbXe7MWoPYHjkFns=
=LhnZ
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
