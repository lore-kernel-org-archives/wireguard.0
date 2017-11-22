Return-Path: jaron-wg@kent-dobias.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9892b899
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:18:00 +0000 (UTC)
Received: from mail.kent-dobias.com (mail.kent-dobias.com [5.2.75.74])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 060b6cf8
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:18:00 +0000 (UTC)
Received: from WOPR.localdomain (unknown [10.9.0.3])
 by mail.kent-dobias.com (Postfix) with ESMTPSA id 10AD0A5B5A
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2017 18:23:14 -0500 (EST)
Date: Wed, 22 Nov 2017 18:23:04 -0500
From: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
To: wireguard@lists.zx2c4.com
Subject: 0.0.20171122 build error on weird chromebook kernel
Message-ID: <20171122232302.GA19498@WOPR.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--kXdP64Ggrk/fb43R
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hey Jason,

The new snapshot has a build error for me on my weird chromeos kernel [1]
(with some archlinux patches and built with -fno-pic added to the
Kbuild CFLAGs for wireguard). The dkms make.log is below...

Thanks,
Jaron

[1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-3.14


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="make.log"
Content-Transfer-Encoding: quoted-printable

DKMS make.log for wireguard-0.0.20171122 for kernel 3.14.0-26-ARCH (armv7l)
Wed Nov 22 18:13:02 EST 2017
make: Entering directory '/usr/lib/modules/3.14.0-26-ARCH/build'
  LD      /var/lib/dkms/wireguard/0.0.20171122/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171122/build/main.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171122/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171122/build/device.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171122/build/peer.o
/var/lib/dkms/wireguard/0.0.20171122/build/noise.c: In function =E2=80=98ta=
i64n_now=E2=80=99:
/var/lib/dkms/wireguard/0.0.20171122/build/noise.c:352:20: error: storage s=
ize of =E2=80=98now=E2=80=99 isn=E2=80=99t known
  struct timespec64 now;
                    ^~~
/var/lib/dkms/wireguard/0.0.20171122/build/noise.c:354:2: error: implicit d=
eclaration of function =E2=80=98getnstimeofday64=E2=80=99; did you mean =E2=
=80=98getnstimeofday=E2=80=99? [-Werror=3Dimplicit-function-declaration]
  getnstimeofday64(&now);
  ^~~~~~~~~~~~~~~~
  getnstimeofday
/var/lib/dkms/wireguard/0.0.20171122/build/noise.c:352:20: warning: unused =
variable =E2=80=98now=E2=80=99 [-Wunused-variable]
  struct timespec64 now;
                    ^~~
cc1: some warnings being treated as errors
make[1]: *** [scripts/Makefile.build:308: /var/lib/dkms/wireguard/0.0.20171=
122/build/noise.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1298: _module_/var/lib/dkms/wireguard/0.0.20171122/buil=
d] Error 2
make: Leaving directory '/usr/lib/modules/3.14.0-26-ARCH/build'

--u3/rZRmxL6MmkK24--

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSQY6O3/njWTMf2fpw7BtmZlYsD8wUCWhYG0gAKCRA7BtmZlYsD
893VAP9lID8Rchim4r2C8F3R3nbc6qYrn+vuWcuH6N6RePXTSgEAtV7yowVMLZM2
BnJfCO6khmfKki9IlUw4zWe+I3eihwk=
=tecv
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
