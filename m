Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08c206d7
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 16:37:08 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, zorun@bitsofnetworks.org,
 Christian Hesse <mail@eworm.de>, Christophe Fergeau <cfergeau@gmail.com>,
 zx2c4@gentoo.org
In-Reply-To: <87furu3ej3.fsf@alice.fifthhorseman.net>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <87furu3ej3.fsf@alice.fifthhorseman.net>
Date: Fri, 01 Jul 2016 12:40:00 -0400
Message-ID: <87shvtz50f.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: wireguard@lists.zx2c4.com
Subject: [WireGuard] debian packaging [was: Re: The Distro Package
	Maintainers Thread]
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Thu 2016-06-30 11:03:12 -0400, Daniel Kahn Gillmor wrote:
> I'm going to be publishing debian packaging at:
>
>   https://anonscm.debian.org/git/collab-maint/wireguard.git

OK, the master branch on the above repo contains debian packaging,
including a dkms configuration:

   https://anonscm.debian.org/git/collab-maint/wireguard.git/tree/debian/wireguard-dkms.dkms

Of which the following two lines at least might be useful if you want to
include dkms config upstream:

-----
# requires kernel 4.1 or greater:
BUILD_EXCLUSIVE_KERNEL="^(4\.[^0]|[5-9])"
-----

I've tested the package and it works.  The package should make its way
to the debian NEW queue shortly:

  https://ftp-master.debian.org/new.html

and after it is vetted by debian's ftp-masters, it should propagate to
experimental.

The debian bug report tracking this package is:

   https://bugs.debian.org/829107

Regards,

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJXdpzgXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRFREIyRTc0RjU2RkNGMkI2NzI5N0I3MzUy
NEVDRkY1QUZGNjgzNzBBAAoJECTs/1r/aDcK3/QQAKQlL28dR4uG82caxicILqKN
dulKLVfoCb2E9IN1n38SAZjczlvnhS6sJrzxlqH+mB6dRWH7GqRWTNam/4Gi9p5c
HV55X5O0OtoR/SVN6XtqF3Uro2Is0P3PmsuvkSN13slRYeNYKxrnONRxyFS21GV8
aWPTY5PJA6YRvHJ3AjpJyk/+HFOuJ2QZBelMfHS3Y9ruZIDeYQeEocTsMC2+rsVN
VYzoV3YhoclU2dfAMF7i6N9XLrMGgw2GC5MdwWGVvlYTVVQbWJ9V5x7CePInw2no
i8EW+DYoJPjMI/NkRsMaQ9PfRpUFkOZG7yL0MgSDKzE0oZI6kcO0tKsXsWkW5ytV
FmILfP5wS1t+weRe4AEsiGimH0VO1gDPv5Yf0T3aIX7Wad6YkyDu3zHesQc7bIWp
bfB0n4pVIUaDUxRCqOPino2Z4xl4m6ezRMIo8AaAo5AKpfdDTYhYlxjh0v4eQsNx
IGOvizli1DTMoyeEx6B2CKwc3cnhNXac27RNTwa22ppVGODsET+5LStFBuFrqGCJ
yueCgZmUN4ezsT7SBWRYrJCaywPj6VFamkmraqbbq2Z+F37r9RQSk9gXs88vN0WL
rXE7uvuujIphHw2bBZt+sDM04sM05wiLtVFF+ShY/k420xcZpASLycFOjxNPl6Ft
EuGmEX6/k/Aqjq8rHKUr
=z+lh
-----END PGP SIGNATURE-----
--=-=-=--
