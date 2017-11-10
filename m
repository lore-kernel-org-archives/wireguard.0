Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 876387f5
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 14:49:04 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dfe353c
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 14:49:04 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Fix Debian install guide on wireguard.com/install
In-Reply-To: <CAHmME9qZsKXR--RVJbyA-DPGKeX4GuYEwVp2EP6VhVE59hSOAQ@mail.gmail.com>
References: <CA+Hw3eY4541LNE9TnS5tsU2O+n28BNQ-Spko5dpem8Ej2_ctFA@mail.gmail.com>
 <CAHmME9qZsKXR--RVJbyA-DPGKeX4GuYEwVp2EP6VhVE59hSOAQ@mail.gmail.com>
Date: Fri, 10 Nov 2017 07:48:39 +0000
Message-ID: <87mv3u376w.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jason, Adri=C3=A1n, all--

On Tue 2017-10-31 23:20:02 +0100, Jason A. Donenfeld wrote:

> I have no idea what the right instructions to give for Debian are. Is
> there something I should be doing so I don't have to hard code those
> keys on the install page instructions?

The right instructions for debian users would generally be to pull the
package from unstable.  This should absolutely not require the use of
"apt-key add", which is generally deprecated.

If you want to provide a separate ("third-party") repository, the
current best guidance is:

    https://wiki.debian.org/DebianRepository/UseThirdParty

Regards,

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAloFWdcACgkQFJitxsGS
MjeUPQ//Zoh+YyDtP2ziCADlL5+xzSQxYmnrQftWoB1GCVpQmoRsJP1W/lqoPyeu
hpQaMKyD18xL4MP4ZtPPujFP6JkXJVl7JaEYCS+7xD5x5AfYSgRfPRbbAlQbVZWL
vl817xcxyvj2BJfFbxG2ZF2f8jDFNWFgEpxRmKKq2AjxSKzAO7pFoqAhcO+k8Zj5
BvDKWc9HeNfymFSx5s85g5LIliug3DE/4pd9ppgogF5JgsOD+GG+jZG20DU6gKQO
WT0u90ecUUSfd3IvmPMkTvBvz5vTHMlx94OMfSfLghA0OxI59ZdCno4f2gl1udhC
WOfb5Ww234Q8Epe1UsEwAXM6OL1Sbgkd/Lbs+Af2CkL/0Vz5sFv+VELKMzT7obkK
dim89nykBqx7Ij3S+Bv6mFa121ObOCms4WY4+P8nWGhkvgKzNiH78CuLW0n18TCs
VlBysrvJAdnPt+9yQLbuQELmbDleyz01JR4XanAPVknwM28LfFBCvIAKNjN5zTTp
aLlXiVX9HdRj7z72TMs/hlDX9zYW/DnalvyiEIk0NO6HbF052hSYZSHyR03GC0UI
iLWyoMhNhNKf9O+R9onitZG3AyNXbo5jrrErYyB90U53SKZzRn6Nn32yT11UPirO
H5o2Vmi6qAmY5flndO4kXNcEhgKzFHRff39pOvuJUlOgfDtit/Y=
=/bw7
-----END PGP SIGNATURE-----
--=-=-=--
