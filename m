Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37367b20
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 May 2017 23:20:39 +0000 (UTC)
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
 [209.85.128.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbba74c0
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 May 2017 23:20:39 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id l50so9014560wrc.3
 for <wireguard@lists.zx2c4.com>; Fri, 26 May 2017 16:33:13 -0700 (PDT)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Received: from [10.10.10.230] (uk.webcrumb.net. [176.126.241.16])
 by smtp.gmail.com with ESMTPSA id l18sm3838052wmd.11.2017.05.26.16.33.10
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 May 2017 16:33:11 -0700 (PDT)
Subject: Re: Repo broken?
To: wireguard@lists.zx2c4.com
References: <CAK-i-m_Bv92mtdbPXZrqmC5pqiVkMrP=DsY8Hc69BZ_0McRQZA@mail.gmail.com>
 <1495832060.1086.1.camel@eggiecode.org>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Message-ID: <b632a8f3-987c-3c70-3881-44843f29d5af@york.ac.uk>
Date: Sat, 27 May 2017 00:33:02 +0100
MIME-Version: 1.0
In-Reply-To: <1495832060.1086.1.camel@eggiecode.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Uu5HeRr2AhromBvaDNRIqcko8ug1iADL1"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Uu5HeRr2AhromBvaDNRIqcko8ug1iADL1
Content-Type: multipart/mixed; boundary="Qce7PSPnbggEFVjUOKTq3csg1anrICb89";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <b632a8f3-987c-3c70-3881-44843f29d5af@york.ac.uk>
Subject: Re: Repo broken?
References: <CAK-i-m_Bv92mtdbPXZrqmC5pqiVkMrP=DsY8Hc69BZ_0McRQZA@mail.gmail.com>
 <1495832060.1086.1.camel@eggiecode.org>
In-Reply-To: <1495832060.1086.1.camel@eggiecode.org>

--Qce7PSPnbggEFVjUOKTq3csg1anrICb89
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 26/05/17 21:54, Egbert Verhage wrote:
> Hey Steve,
>=20
> That is because in the beging of the ppa repo we only had support for
> kernel >4.1.
>=20
> On snapshot: 0.0.20170409 we got support for 3.16, 3.14, 3.12, 3.10.
> And precise has kernel 3.2 (OLD!) and since April 28, 2017 precise is
> eol.

Just to add, the Trusty kernel (3.13) is patched and doesn't build the
modules with DKMS; if you want to run it under Trusty it's possible with
the Xenial backport kernel (4.4). I run this in production (cough) with
a custom package (in one of my PPAs if anyone's interested) and it works
well for me.

I don't expect Wireguard to support that configuration though. :)


> Best way to run wireguard on ubuntu is run xenial or a higher release.

Yup. :)


J


--Qce7PSPnbggEFVjUOKTq3csg1anrICb89--

--Uu5HeRr2AhromBvaDNRIqcko8ug1iADL1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUzSNjhumunvu6bYD4DBDgow/9LsFAlkouzQACgkQ4DBDgow/
9Lt5IA//ZqdmmFbgLkB1pLx7n6DTiUnh8W2SQHUsPlPtJVyEMwkwfF1org0lXzfE
N9s+3NcZYp9KT8YnmgkQH+M698QhS7e+9urYqAdklJgh78gutwFC9IJBcTLq8nYm
vqAdDOTDTaAM0gFPE+rgmVxDTRKhuvL2MlF1ArgOjE/2mRGFsmL4OdMUP5HhCtSq
6ih9U0NULArwcEmlmz5zEYBFeyjd6lwUQOWi6byvS3/DGxRx8mllNoZhzQRhLTg8
iX5+jx/U2y/BZQo7ju49DYcpuQXCXY+MLtACfRSsWbJScVrcFbWjW6TytVwvc97f
cOqoRbewGgHL4RbP8iREMqj5tsrFk5k3xHIALNV49DIJnt2QL+XZub2A7ToYuNwC
4JRUzYlLwZsEdE5PemvZhcI65txsH4BWfxRNPkD+bNkC/V+c4vhCJwmx/mpzUGwI
EiqyUDe9v220p2bEzhBNT1M+9pyNw1Ig6ZORIi60dvqdyggV09kJnYk1WEyOOqdd
bgr7Gsqod2l7+JXUNEKLgdETiR1GNsGzc+c8IkKmMeINKV5ykLkKYN6/vcHyI/5L
VnW+lRmxJ61GHbvv/bnZQ+jwNmbNtYgBj1n5RPP6bXAboQZLTLGyiZzBhm8RmDA5
BmOxjNj3smFN32KArx32rvHLsLGZ8cmCqGtqkI1QIUVmyE7zabs=
=P6T1
-----END PGP SIGNATURE-----

--Uu5HeRr2AhromBvaDNRIqcko8ug1iADL1--
