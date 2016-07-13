Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ace6cec
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 16:48:57 +0000 (UTC)
Date: Wed, 13 Jul 2016 18:49:46 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160713164946.GA25457@lud.polynome.dn42>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
 <871t2zt93w.fsf@alice.fifthhorseman.net>
 <CAHmME9qVThvKJpCiDjYZJTWAU+xiVSXXRpWvxY0Vy+-+_X3hzQ@mail.gmail.com>
 <CAHmME9q2Mv7D-wRLGih0r4JHp+ePLQPpgGV-WEcn6sFu9Ewu0Q@mail.gmail.com>
 <CAHmME9pkr5T3fhrEo6kdLvjU9OmPr8qFLvbxrjmwZgFmvjH00A@mail.gmail.com>
 <CAHmME9qQ=46ZyPLPAw8sDb1bhwWGdEcxoFpof3meV+WUKHrMfg@mail.gmail.com>
 <CAHmME9rF+cYmwEMcrW9DitPSBtQ=NSVbMWvhiBajwV4FtCwRpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
In-Reply-To: <CAHmME9rF+cYmwEMcrW9DitPSBtQ=NSVbMWvhiBajwV4FtCwRpQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Christian Hesse <mail@eworm.de>, zorun@bitsofnetworks.org
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 13, 2016 at 06:42:57PM +0200, Jason A. Donenfeld wrote:
> On Jul 13, 2016 6:35 PM, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> > I did it!
> >
> > $ make test
> >
> > Will now execute src/test.sh.

Nice!

> If it turns out the test phase of the debian package build process isn't
> permitted to do these things, we can always experiment with running this in
> qemu or UML... the tests are entirely self-contained.

Good point: since the test must be run as root, I anticipate this will be
annoying for packagers: builds are performed as simple user, with no sudo
access (and obviously no *passwordless* sudo access).  At least that's how
it works for Arch and OpenWRT.

Anyway, it's probably a bad idea to muck with the kernel of the building
host, and it's not even possible when cross-compiling.

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXhnEmAAoJEL4B7CKgTi5GIBwQAKtAh0kU40BnNPh11tMcji8b
AIeph8SztL9yXIZU8MSA2Gj0PeTu0ynE7eyST4Ld1UD5hyDSxCwP6jJVCqfJYDlS
QQQOzk1vXGiJjJzs1hOFE988nJ6Y1tMNCJDTA1Bl/pZMG8/9sDfKTOFRqjRVOCsq
JSd5UfCo82kXA6GddHWC9m9ai8Lb9wRwxRft9YDzpXgENAmk8xycbxI6ysAm6Gas
SdLtKEpPGyU/onxRd9SROfni2eXppRmeswYU+NHbxpBcQnTX6wVkFCwq/M3h1Q62
LbRSfGj6Dpa5wyHOVYuww+GGnXgLU5seVj3/h10TcZVfwibGnHb086jRaR8OJLJ8
/amBFCLByZJGa/3TNaq7+dpvw0mqCXul1IzyFMno86h17FMgIKTnrxg5S9bd1YwK
SIqiatRUsC5l9AJxzxksmDRF/GllIwPWoBxosg8efwuV2a1PfJ4UgiQ6vJg+eoS3
ABGaXkzgvXNXk26qp28hU+XwEGQDQwAd+QWD0C2ovBUwTkT/WnAtqW3TZ2he7s1v
OZ8cVqgRU7Zmr0g1vkmx3wskU/xHbqeqNVCuZJSASFJWlm+3tk1OxSRC2GEDzIWC
AEc9udYokl5l2BTJNAed2ksvUM84ePXHYnzNCfJFTNJg1Sf2XuOnaN4Z2bFZGdKi
UV7Za4uWBeh1l6RS7ux/
=RQMQ
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
