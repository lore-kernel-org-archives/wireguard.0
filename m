Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f61ee62
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:25:36 +0000 (UTC)
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 312bdbe2
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:25:36 +0000 (UTC)
Received: by mail-wm0-x244.google.com with SMTP id j192-v6so17243594wmj.1
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 07:26:05 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: [PATCH 6/7] tools: allow setting of transit net
To: Julian Orth <ju.orth@gmail.com>
References: <20180908121841.8372-1-ju.orth@gmail.com>
 <20180908121841.8372-7-ju.orth@gmail.com>
 <58f22c10-24ba-91a7-2d7e-2d9fc3b50565@gmail.com>
 <ae953bd6-eb42-647b-1b1a-8de8e0e0bb15@gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <e8ffc494-a0f4-a9e2-0e8f-9d3ac6b0e616@gmail.com>
Date: Sat, 8 Sep 2018 14:25:58 +0000
MIME-Version: 1.0
In-Reply-To: <ae953bd6-eb42-647b-1b1a-8de8e0e0bb15@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="oF1VekAll9q3cbG1mdnW3jqC5Ig8Ek1Nd"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oF1VekAll9q3cbG1mdnW3jqC5Ig8Ek1Nd
Content-Type: multipart/mixed; boundary="JDkpg0xIZaIKOUX69e2n8Iry7Ybeo8xuZ";
 protected-headers="v1"
From: Aaron Jones <aaronmdjones@gmail.com>
To: Julian Orth <ju.orth@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <e8ffc494-a0f4-a9e2-0e8f-9d3ac6b0e616@gmail.com>
Subject: Re: [PATCH 6/7] tools: allow setting of transit net
References: <20180908121841.8372-1-ju.orth@gmail.com>
 <20180908121841.8372-7-ju.orth@gmail.com>
 <58f22c10-24ba-91a7-2d7e-2d9fc3b50565@gmail.com>
 <ae953bd6-eb42-647b-1b1a-8de8e0e0bb15@gmail.com>
In-Reply-To: <ae953bd6-eb42-647b-1b1a-8de8e0e0bb15@gmail.com>

--JDkpg0xIZaIKOUX69e2n8Iry7Ybeo8xuZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 08/09/18 14:18, Julian Orth wrote:
> Even with clang's -Weverything I don't get a warning when I compile the=

> following:
>=20
> #include <stdint.h>
>=20
> int f(unsigned int i);
>=20
> int f(unsigned int i)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0return i <=3D UINT32_MAX;
> }

Interesting... I don't either (gcc 8, clang 8). Perhaps I've been
spending too much time reading PVS-Studio reports.

Still, the condition will always be true; sizeof(unsigned long) is
sizeof(uint32_t) in this case.



--JDkpg0xIZaIKOUX69e2n8Iry7Ybeo8xuZ--

--oF1VekAll9q3cbG1mdnW3jqC5Ig8Ek1Nd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAluT2/YACgkQivBzdIir
MBLgDw//RRpwYvnO7XDdk39WBXZGqyt9JQgzBe7phys74F7mcwYv2gWjgsLiPSae
Fhgy1TbwazlQ4Wla76yYIE1w1S/cVvBOVjkY1v9eeodGvEvsXwwyXpoAAUeCWx1y
SfwLH4TzlZGIPHPgvfYSxi91e+E5A4leWhh2FLUyl60ZbMPYUpFOH/Ht5Ylrgd6s
DhC/F0Wa8LjTfDTpGoZMBLqoiRgWd6Ud8hhmNF6OdFbS7KERVSLkDPWnzBN4kcTd
QlGczC+6dChcb0YJJ7DIleXNS4fx2xm5vCLNR58BvTbWDF2I3r/G4O1hOHQZ8XMz
2RaLejZiaYNMGkmPlnSrrPc5uV2yjNjmHTphIYowUkFc/KBrDXF9QxkLGz+6IyAQ
Gy3QZ4KNOqHU+Mvd1t9T+2Fvvw5BGWAxe23xeGuFL9CPSkWjohAYUndz7WaZlzYq
/fXpYEUMvZhHOqLV+TBuRBzEsLRgKQtoXt15FmtiXkxVI7UT4cl4tcxivhFUV+Qe
Sv55OK1eOmRcdTNxL6f9rg/7mN0l5TeDy7pdGVK/6wQ8DKP9obEcG+obHd0yJ/6L
mYzewvvLkgqtislgH+SaFWK5++YORpbYbGnVdSmdL4/aPV8goVozlMLoPEh5tf0i
tqUGeetXcsxOse3f3hX5f2iFo371o+5b1ZeQRdXsR+UXAiyrOKc=
=n4pq
-----END PGP SIGNATURE-----

--oF1VekAll9q3cbG1mdnW3jqC5Ig8Ek1Nd--
