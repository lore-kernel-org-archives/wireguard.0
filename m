Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5049e8f0
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 21:20:14 +0000 (UTC)
Date: Mon, 11 Jul 2016 23:20:44 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <zx2c4@gentoo.org>
Message-ID: <20160711212044.GA15134@lud.polynome.dn42>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
In-Reply-To: <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
Cc: zorun@bitsofnetworks.org, Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 11, 2016 at 07:51:12PM +0200, Jason A. Donenfeld wrote:
> Quick question -- how often is too often for you guys for publishing
> snapshots? Once a week okay? Twice a week okay? Twice a month okay? It
> doesn't matter because package bumping is all automated anyway?

As I said before, once every ~two weeks is the minimum for me, as I like
to at least compile-test a new release before publishing it...

You can release more often, but then I would probably skip releases
(which is not a big deal).

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXhA2oAAoJEL4B7CKgTi5G9YcP/iYdFZNVQEA5HauL/BXGbabc
PwW9r4v3Weo244tXSjYiYizeLZkYAQjXfDl7jHf7i2nJKSwFjccfjvD9HdZWAvnY
wzHmZDqyJfC7FaWplMi30atRgAFSyvH35Q1Iv5AYL2axcMw7H/N1rJ3EXceOeuk5
mSOyDvRVHB06cvGs7YV2w8VdMTK9AAj7SAN6kvUcnq0jD/Cqkz9El7LW/wr7I0HA
xFIqvbUIqD4YKZs9TBqIKQ72C+erHcJg0EheR/2eoXcZ3atAbwZCuo7J5EskuvIi
MbfnCXHrDmue9k1t9wfrNf06nFmJYI0sPZKQiX4nKItZluVvvSgiy9ijYxka/m1F
4V56S4ms0a4QVoU+WpRIoOKPFZBKIi1jL18PBG4UJ9o1pAj4tEsuVCJh+kYAa5/p
agMiIMx++kuEsKwwja8LIEwDeqJb7pIv6Gb8CvA9FhfuYeKVRqjFBeAXJ1me4hjv
nlHA3FbIDtlKoIiIR0DblurIW7YXBjAkaTKH10qX0w2lL+1ZzIg69ajLDSm31ZOv
xbvCCfyenzjpXwbxzTzr9SUT2T0eMs/PuZNm2+AUL9FpyvNx98ImhsKDrwg21K1S
DWfGDa/8R20gl0kb0E6sLVmQXVZuEolUU0bDJhlv8oG+bmGB+5wqLmcfMTW/N2rm
+6BuuzIlto727rFAIElk
=9VGp
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
