Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2d31a68
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 12:59:11 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed5270b8
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 12:59:11 +0000 (UTC)
Date: Mon, 19 Dec 2016 14:06:02 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: openwrt route_allowed_ips is inprecise
Message-ID: <20161219130602.GA12378@tuxmachine.polynome.dn42>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <232dbabb-d3f0-6f84-bd21-a6c6abab2441@higgsboson.tk>
 <CAHmME9rqtmYntL046vCOTVHwcdk2ThTwqMFqFj4kBKtKxixo4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
In-Reply-To: <CAHmME9rqtmYntL046vCOTVHwcdk2ThTwqMFqFj4kBKtKxixo4A@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 01:32:31PM +0100, Jason A. Donenfeld wrote:
> On Mon, Dec 19, 2016 at 9:00 AM, J=F6rg Thalheim <joerg@higgsboson.tk> wr=
ote:
> > What do you mean be precise? Is there a bug in the other logic apart fr=
om
> > probably unnecessary routes?
>=20
> Performance will suffer unnecessarily.

Please provide numbers.  I would be very surprised if a few redundant
routes have any performance impact, given that the kernel can handle 600k
routes without major issues.

As far as I can see, your argument is more about "(pure) technical
correctness" than about performance.  For the OpenWRT proto, I believe
that simplicity of the code is a more important factor, even if it means a
few redundant routes in some corner cases.  These routes do not hurt
functionality.

Baptiste

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlhX2zAACgkQvgHsIqBO
LkZMoRAAsAgDGig7lYkkL8mMkYu0mzghFDF7vAvz3hpFQ7a0tExBRTkf6ARcYi6d
Ua8LZKgoMtz5egdL4KCk3bmrQ0KVb5WVzqOdsrpJx7/6Azk2D27TExi6ss03Sh/H
paZbhHkX594XfZlElZ9OrNMjCTXgvj5DQk+A5RXpbCo3JuM10SdZsj0RK+3vdK4p
AfbP4/4q+OPRyFX4IwrZiQq8LReKZMdeozq3oqts2r8YKlBh78gSUi7gL2Quww8/
6PdcJ7c6cdy/igJV9p9qVlfCgG5uWv7gdAlVaxac4dnY2f9fWP/1VnJVZVMfeySA
J9bbIZ1srszC4lZbIybokMmHFmIwrWQ/l+7i1PJ68s1yrxxk0Lzv1Q2JbEJODrYG
Q2TpyGX3LCo0++h8HINQlfCPhS0hx0t4Cgmd9Ubrm+WPZuN2FZSNUUnzfswgKm/q
cp7Vu9Tu/1s5UD1hhNqGaDt39Tak0YpXrvsdWDnALy14lRm8zgNnzhWYJhVy6cju
0VkYFMYjBxlkjzk9PUCiz27tqdbPkHwC+nfkStmZ7ansMbwXlF39kxXWohvF4eyU
iBCP/T/erJC2pXOf+nX7z2+BjX0SrC5EzKyLHnIKg2W/ubEozF07ZuW2J0vD4DYK
3kOuWVI+55VfdQ0nvwOHIwtTb/4JiB8V/bTt6M8fU6MFKg6cLZs=
=SAtH
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
