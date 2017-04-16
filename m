Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e99618a
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Apr 2017 11:16:54 +0000 (UTC)
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
 [209.85.128.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5169461
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Apr 2017 11:16:54 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id o21so70720250wrb.2
 for <wireguard@lists.zx2c4.com>; Sun, 16 Apr 2017 04:24:26 -0700 (PDT)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Received: from [10.10.10.230] (uk.webcrumb.net. [176.126.241.16])
 by smtp.gmail.com with ESMTPSA id 23sm9980211wrx.26.2017.04.16.04.24.24
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Apr 2017 04:24:25 -0700 (PDT)
Subject: Re: wireguard-tools Ubuntu package missing the binaries
To: wireguard@lists.zx2c4.com
References: <b36d8e7f-e2a4-379b-1c02-6269766288d4@gmail.com>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Message-ID: <b58aaa20-6b03-5501-3cad-f791cfd2319a@york.ac.uk>
Date: Sun, 16 Apr 2017 12:24:17 +0100
MIME-Version: 1.0
In-Reply-To: <b36d8e7f-e2a4-379b-1c02-6269766288d4@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="g5C3IagJoAU3369o3MogeWpp2qfSWmDRl"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g5C3IagJoAU3369o3MogeWpp2qfSWmDRl
Content-Type: multipart/mixed; boundary="3vmPVU22a46vqupPntVlqWJvQMwpJpWK0";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <b58aaa20-6b03-5501-3cad-f791cfd2319a@york.ac.uk>
Subject: Re: wireguard-tools Ubuntu package missing the binaries
References: <b36d8e7f-e2a4-379b-1c02-6269766288d4@gmail.com>
In-Reply-To: <b36d8e7f-e2a4-379b-1c02-6269766288d4@gmail.com>

--3vmPVU22a46vqupPntVlqWJvQMwpJpWK0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 16/04/17 12:06, Ryan Riley wrote:
> The i386 wireguard-tools package on the PPA for Ubuntu Xenial doesn't
> actually contain any of the binaries, just documentation.

It's not just i386 - each of the arm and ppc64 packages are also missing
binaries.

Debian's packages (and my testing backports based on those) don't have
that issue - might be time to check a diff or do a merge. :)

Looks like it's down to `make install`ing the tools during install-indep
rather than install-arch.


Working (Debian use a different flags setup, that's not the important bit=
):

> override_dh_auto_install-indep:
> 	$(MAKE) -C src DESTDIR=3D../debian/wireguard-dkms DKMSDIR=3D/usr/src/w=
ireguard-$(DEB_VERSION)/ dkms-install
>=20
> override_dh_auto_build-arch:
> 	$(MAKE) -C src/tools $(WIREGUARD_ARGS)
>=20
> override_dh_auto_install-arch:
> 	$(MAKE) -C src/tools DESTDIR=3D../../debian/wireguard-tools $(WIREGUAR=
D_ARGS) install


Non-working:

> override_dh_auto_install-indep:
> 	$(MAKE) -C wireguard-src/src DESTDIR=3D$(CURDIR)/debian/wireguard-dkms=
 DKMSDIR=3D/usr/src/wireguard-$(DEB_VERSION_UPSTREAM)/ dkms-install
> 	$(MAKE) -C wireguard-src/src/tools DESTDIR=3D$(CURDIR)/debian/wireguar=
d-tools WITH_SYSTEMDUNITS=3Dyes WITH_WGQUICK=3Dyes WITH_BASHCOMPLETION=3D=
yes install
>=20
> override_dh_auto_build-arch:
>  	$(MAKE) -C wireguard-src/src/tools



J


--3vmPVU22a46vqupPntVlqWJvQMwpJpWK0--

--g5C3IagJoAU3369o3MogeWpp2qfSWmDRl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUzSNjhumunvu6bYD4DBDgow/9LsFAljzVGYACgkQ4DBDgow/
9Lvx+A/+J6pW1Lf286BrAdimqsjcNxySbTOpkL7KzKJH1lmmMAeHech8xNX8GCh8
uGhwJsH6VHZtr1JCqjyFtTo8+mJE8NzavYN9nF5hyv+opSRLu7B+GjPgIpSZRFGU
6BbBTtaFsCKKYsc1/I8pUfStwUfuAxog3xvHnb5zmS8e4qbKpspg/K/qQ9Rx1TOV
EkmZTKn8orsXwEmTFkxfbXaqbhptYIDhpBhtMn28DSb8wi5O0mTK/DormJEt/QKZ
osbwLIJFWyfnoWx1GOBr0TbvJR2XG80/BZCAoaI3tAppb8nK97Y7K2WxwpCMjc+S
rCFL4oQJ6fbIDPjkbLTrnb5iWwEnhyEXsrmaEHoADQ8NvGM2UOy1r76XmKcn/6NP
CCVXAawq6DE056aPqa5kCldZD3BTTnmfLy1HXHllLbYq2b8Sp5yG3PJiRmMGU9bp
mJzwSr8PbxB4zBRR1ILuVnBo2bvvEIJzIaPiBdBL1HE+ipGDnJZrPL+rHD6YoMOP
rKsKnzfvyAcKk5Au4VrgucsWIxby82mmK3vCbHPlVQpAN1bytEYPMXWDqxkwVPj0
oJ3MJJ7fxuVmDLIvbzdFapl7oSSreKTH3hcYSWRov1Bj3ItYskUVuWTw4RJg2cOo
2daP/luANMXwRmeqWzgBAe/mniGXJ8G9c0+ffQgl22sb6PKdkfc=
=z52a
-----END PGP SIGNATURE-----

--g5C3IagJoAU3369o3MogeWpp2qfSWmDRl--
