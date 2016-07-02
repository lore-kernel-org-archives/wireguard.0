Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c7c9229
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 15:52:10 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <zx2c4@gentoo.org>, zorun@bitsofnetworks.org,
 Christian Hesse <mail@eworm.de>, Christophe Fergeau <cfergeau@gmail.com>,
 zx2c4@gentoo.org
In-Reply-To: <87eg7cz01b.fsf@alice.fifthhorseman.net>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9o5kcR5wStmB-Ku+2eDrrtbdvNLwG0AvaDdeuKuRtdaAA@mail.gmail.com>
 <87eg7cz01b.fsf@alice.fifthhorseman.net>
Date: Sat, 02 Jul 2016 11:55:10 -0400
Message-ID: <878txkyqzl.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
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

On Sat 2016-07-02 08:39:44 -0400, Daniel Kahn Gillmor wrote:
> On Fri 2016-07-01 17:28:28 -0400, Jason A. Donenfeld wrote:
>> Are these instructions correct?
>  [...]
>> Debian [experimental]:
>>      apt-get install wireguard-dkms wireguard-tools
>
> I'd just use:
>
>       apt install wireguard-dkms wireguard-tools

on second thought, it's possible that people running with

   APT::Install-Recommends "0";

Or who are running a kernel which doesn't match the locally-installed
headers won't end up with the kernel module installed, because they
might not have the headers available for their running kernel.  On a
normal system where the admin hasn't done anything unusual, the headers
would be automatically installed because of the chain of
Depends/Recommends:

  wireguard-dkms Depends: dkms
  dkms Recommends: linux-headers-686-pae | linux-headers-amd64 | linux-headers-generic | linux-headers

If you want to be certain that they end up with a functional
wireguard.ko for their current kernel, it should be:

  apt install linux-headers-$(uname -r) wireguard-dkms wireguard-tools

I've updated /usr/share/doc/wireguard-tools/README.Debian to suggest
pulling in the headers as well.

hope this is useful,

     --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJXd+PeXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRFREIyRTc0RjU2RkNGMkI2NzI5N0I3MzUy
NEVDRkY1QUZGNjgzNzBBAAoJECTs/1r/aDcKVlgQAJssT6g97I9BtpYRRV9JjqG3
M+ZMI7YTIShkq/I8UG4KIgfYRKRcKfwn8J9+h5usxlzlHKR3cfiFN9b5zy5unfWH
dYBAmbfrQH5d460SNniF/gJWOasLDsu9uakgk/03BZnKynt9C5nYs+HmMusz+94b
4t3D5vC2HUrJmc9rCRB/opvmvBZT9243djyiZXI5SQSd66Ko8xLArrxib9cVd8dn
LyOJPgj1EyMj8OLMAWEPFdrDV0bZLHB596NluI8fflu0lIY1HAI9uS5aUgxHCjm2
xHBI3GJWrFuuhtD4lrL3kn0JO4sReVTCYYjC6B83Sns8EFUJq33kR2U5Rar59xX6
9TkQWEtkKXr4UFnplBq3yaAF5Ld1klogqR3Qyub0jIeJ+Zlh+dekLVwaJMyCFNse
CXf6IQbmPu8YIuJcd+crWON5QyPhW1nbGJDAST4yVFy0qNcEtq4pG5dakpKnqn4n
pr7hQxz55R2cOCmgFUU+jvaV47HC9rRyl4MLRIRJe4WXh/lOfc0jsSF0G9EmrjRc
b8ITUEbNkZeFZQVT8mQm5pBKRNcePaEvpbAbnexoP7SmdN5Ax/frLMx85JkDF5yC
ti8jGj9o/OPe4VSzBfGmjqVJv3V7jezmd9fS4rfGJSEYi9aMd8vw1wXeBkBdGZM0
bsiqaGt5ORXz/YKSPlcS
=vQBl
-----END PGP SIGNATURE-----
--=-=-=--
