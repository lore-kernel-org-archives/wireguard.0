Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd2c1243
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:09:23 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52e24619
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:09:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u12-v6so17490939wrr.4
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 07:09:51 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: [PATCH 6/7] tools: allow setting of transit net
References: <20180908121841.8372-1-ju.orth@gmail.com>
 <20180908121841.8372-7-ju.orth@gmail.com>
To: Julian Orth <ju.orth@gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <58f22c10-24ba-91a7-2d7e-2d9fc3b50565@gmail.com>
Date: Sat, 8 Sep 2018 14:09:49 +0000
MIME-Version: 1.0
In-Reply-To: <20180908121841.8372-7-ju.orth@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="p6f2C32gXdmZD4YTsuD79Z1BFl1VYxmZM"
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
--p6f2C32gXdmZD4YTsuD79Z1BFl1VYxmZM
Content-Type: multipart/mixed; boundary="ga7lgDb5ftznE3dQlGnkYvEGHomXTM84g";
 protected-headers="v1"
From: Aaron Jones <aaronmdjones@gmail.com>
To: Julian Orth <ju.orth@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <58f22c10-24ba-91a7-2d7e-2d9fc3b50565@gmail.com>
Subject: Re: [PATCH 6/7] tools: allow setting of transit net
References: <20180908121841.8372-1-ju.orth@gmail.com>
 <20180908121841.8372-7-ju.orth@gmail.com>
In-Reply-To: <20180908121841.8372-7-ju.orth@gmail.com>

--ga7lgDb5ftznE3dQlGnkYvEGHomXTM84g
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 08/09/18 12:18, Julian Orth wrote:
> +static bool parse_transit_net(struct wgdevice *device, const char *arg=
)
> +{
> +	/* U32 arg -> PID */
> +	if (isdigit(*arg)) {
> +		char *end;
> +		unsigned long pid =3D strtoul(arg, &end, 10);
> +		if (!*end && pid <=3D UINT32_MAX) {

This condition will always be true on a 32-bit system (for a valid
integer). I'd prefer strtoull() and `unsigned long long' but given
that a valid file descriptor won't ever go that high... eh. shrug. But
you'll still get a compiler diagnostic for it.



--ga7lgDb5ftznE3dQlGnkYvEGHomXTM84g--

--p6f2C32gXdmZD4YTsuD79Z1BFl1VYxmZM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAluT2C0ACgkQivBzdIir
MBIQWxAAnkfmLwEe3FB718oGzwH6qca3oYhmi4w6ANce3CHYaqNdqP4Hdab5NeAK
wVuN+alq1CCM2MGURYdzPTtCoNIimZYv4NmMInHqswIaTXxoSZJaTRbXZqgrJ2CW
xvTbmt2rskGLXP1LmmLe1RGPMkl4RMUe9Oxdl/34GbaTswOceLCJZUAe83v4Z5Do
LFkZlCSY20klGV41a+pc0/lhfoHpuyEv9tAYhKgmXFKGxbpvLxq0VlvzwCoWpVvV
Tqovi2og4IGFvY0Hfh7YGZsA+WjmBIrSMobxbPODopqtz/di8Ats7l6e53C4uuVm
B3I/eveCCwFq1eqbhKaagjSuaCpbW36cFWS90YNTbG7R5mnABywrL7Bb82QtqEQY
7Uyy6WJtLi/d4KR1JziXwXUR0b8unxHB1XRKRURs6ejDmZ7Ml7Plu60RAuOCtg+J
nokTFpOgHLjCqfh301o7SdzX5QSrIUBSBf/6CKYEkuBbyD2y+n/K7NInTK3F75tm
H+TGztt0GRjTF3zKeEaqaFCqERhVcNytrjWRHsJv1JGoJL4YkzprWSEsgx5Ubqe/
dfF3LsPgynPXz5d2/nYHyTbwK2uzJZNe07VqV2+PNBUtJDO6xIHhEhUYf/79cYNU
OtyU74NIjN8ndwpe08/kAoaaUMGG8wSXYZRO9NVQcc//D/ylWOI=
=p3BR
-----END PGP SIGNATURE-----

--p6f2C32gXdmZD4YTsuD79Z1BFl1VYxmZM--
