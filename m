Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 824772c2
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 21:57:20 +0000 (UTC)
Received: from fifthhorseman.net (unknown [108.58.6.98])
 by che.mayfirst.org (Postfix) with ESMTPSA id BE151F99C
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jul 2016 17:59:25 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Fri, 22 Jul 2016 17:51:45 -0400
Message-ID: <87bn1pmjda.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Subject: [WireGuard] new build process doesn't work with debian's dkms
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
Content-Transfer-Encoding: quoted-printable

hi there--

i'm trying to package wireguard experimental-0.0.20160722 for debian, and i=
t looks
like the new Kconfig/Kbuild/Makefile revamp from
3106d632de4235f8c6d63d602fe2fa9e0175d690 causes the version of dkms to
not be able to build it automagically.

In particular:

=2D---------
0 root@sid:~# dkms build wireguard/0.0.20160722

Kernel preparation unnecessary for this kernel.  Skipping...

Building module:
cleaning build area....
make -j1 KERNELRELEASE=3D4.6.0-1-amd64 -C /lib/modules/4.6.0-1-amd64/build =
M=3D/var/lib/dkms/wireguard/0.0.20160722/build....
Error!  Build of wireguard.ko failed for: 4.6.0-1-amd64 (x86_64)
Consult the make.log in the build directory
/var/lib/dkms/wireguard/0.0.20160722/build/ for more information.
7 root@sid:~# cat /var/lib/dkms/wireguard/0.0.20160722/build/make.log=20
DKMS make.log for wireguard-0.0.20160722 for kernel 4.6.0-1-amd64 (x86_64)
Fri Jul 22 17:49:41 EDT 2016
make: Entering directory '/usr/src/linux-headers-4.6.0-1-amd64'
  Building modules, stage 2.
  MODPOST 0 modules
make: Leaving directory '/usr/src/linux-headers-4.6.0-1-amd64'
0 root@sid:~#=20
=2D---------

I probably need to grok the new build system a bit more when i have some
time, but if anyone has any pointers for integrating it with dkms, i'd
be happy to hear what you thought was necessary.

just wanted to report why this isn't already uploaded to debian yet.

     --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJXkpVxXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRFREIyRTc0RjU2RkNGMkI2NzI5N0I3MzUy
NEVDRkY1QUZGNjgzNzBBAAoJECTs/1r/aDcKbkwQAJntHmoRTN6MIQnJzouI3QKT
rMlzg6iGsxvlZaBKJQQIuw5tq+r6Qq458iRtABY7yXcdESd8CFMHX5+4y5otn/yJ
M2+0OCe5Cc/YrH22sdUOVDNwSDLRPt5VLju2pgkaeKPyYQrJmL82Rz9/1nu+3y28
4LughrsPS01aFkX1LY/Ubxuw83t81nG/g8e8ach1IZbeUfUUQrOEfBG6AGmJIAZc
I1TswvJuqNv2vgLYt/RDvF1NwT2BOO0W+8ISzlbUfbIych4I1J1mzt201EZfHH26
y0FxEgPsvXX3ts7/rIjkXflxk8sAoqZGhTd10jLFK+bEyamF+1KWC7B7oMjpkT4V
7d9gPwmTIuYB8jEEBt0WzDpemzPr6dhs0cCrEbwvcKTNlaUK6l6bgYidBXVXsbDQ
bwIqEjQLTk8xvrDc+/VJtPePm5Nooe2y52WPOJFkliAyHNBi2oTzLdce/rCZDnic
6ynwNYxc05LgwcDak3BqzSwzIEU6U7w9IYs8aWx6zfRnA/ffGAfyFzT7+S/gB4+9
maSmVbaqvqIxjmVD8NPqDEwDneQuYD5CxijZ8QXlfGWEJk/NcTO1VscxbHRy8WSI
TnevxuVcCYluFjGN42b25cOOaR+ulXvZGUajgabIISPi0XtwAP4fbHykvEw/aV1C
ZuZQPS74/z7ff6dWpt6R
=x9EO
-----END PGP SIGNATURE-----
--=-=-=--
