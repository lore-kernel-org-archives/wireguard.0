Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e363f17a
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 13:13:01 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46bd32dd
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 13:13:01 +0000 (UTC)
Date: Mon, 19 Dec 2016 14:19:54 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: openwrt route_allowed_ips is inprecise
Message-ID: <20161219131953.GB12378@tuxmachine.polynome.dn42>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <232dbabb-d3f0-6f84-bd21-a6c6abab2441@higgsboson.tk>
 <CAHmME9rqtmYntL046vCOTVHwcdk2ThTwqMFqFj4kBKtKxixo4A@mail.gmail.com>
 <20161219130602.GA12378@tuxmachine.polynome.dn42>
 <CAHmME9qEg6iBwWpwgT_oPPGymfccuOdAyHv1e4+n5c-O8n9=4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
In-Reply-To: <CAHmME9qEg6iBwWpwgT_oPPGymfccuOdAyHv1e4+n5c-O8n9=4g@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 02:09:33PM +0100, Jason A. Donenfeld wrote:
> On Mon, Dec 19, 2016 at 2:06 PM, Baptiste Jonglez
> <baptiste@bitsofnetworks.org> wrote:
> > Please provide numbers.  I would be very surprised if a few redundant
> > routes have any performance impact, given that the kernel can handle 60=
0k
> > routes without major issues.
>=20
> I'm thinking about the case in which a server has a 10/8 of clients,
> each of which gets a /32. In this case quite a few routes wind up in
> the table...

How many?  What is the performance impact?

> Fortunately the change is pretty easy. Instead of running
> `proto_add_ipv4_route ...` you run:
>=20
> [[ $(ip route get "$i") !=3D *dev\ $INTERFACE\ * ]] && proto_add_ipv4_rou=
te ...

I really don't like this kind of magic: if there are 42 allowed_ips
entries in the config, then I would expect 42 routes to be created.  If
you don't want them, then just disable route_allowed_ips and add static or
interface routes yourself.

Also, are you sure that this works with busybox's version of "ip"?  What
if "ip" is not enabled in the image?

All in all, since this change is not functionally needed, I don't see the
point of adding the extra complexity and spending the time to test and
maintain this.

Baptiste

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlhX3nUACgkQvgHsIqBO
LkYnZxAAkvytM+saJeHRo9F7X+QdMy0KLr+sJGuJpyZzJraqhW46Gk4UzmBvixtt
ymI8wCW5rAZW5A38cb6E/PW2kncicLgyjy7qfMOPL5ErPEDauig6CYhGhXL4G9id
v19uI4pYgXiViETw5a65rD1N9Vi4MNr3Dh21AUz8IQso9NIqVssHA6ScyD3uysml
FHwi0CF8n1vADc9aEbiglg3ieEgLzw28M8dFN8pVhgmGeTV+1dEUECooHNH1cHsm
gkplhLeWNX8+LfQMny1//Od9TZhRXHxj5mPtmEwBxpVh7SOhi+0V+X5vX8qwh+eb
b3HKcCrANFyKrJW0tM2+5taOphApWaTVvHmbHq9nExRJA14Mm/qzSWH8lZz4NNhw
dg9Vtug9Ykv+EO8g+nSo5+o8DjQTMGymcnJNlWF2nh/cgrq0Vha5ScXQFYDcZmDW
/OtgHBF4Fyb96RyUK30wqxi1B7GsUx0PQhgCx+ba+NXaDVMNKLhbMWbfpKpviOMX
liOCoOagrA82JJxqXrUJtlcfE1LuA3whsoBMMh/un11Wr68mqIiet9mM1kOAa5tM
aTEwb1cs/1B7CXbk6PKzjzMaVorEhC2CMymjX4fU65xKbwiJoaxhNjnRJ4hppyKR
9tdlq4+VOZnB1HgJ4/gNDbb+MXeRhPYhXaT/4w7qwi0tiVinitg=
=zwE4
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
