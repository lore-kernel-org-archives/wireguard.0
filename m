Return-Path: j.neuschaefer@gmx.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b42cf01f
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jul 2018 22:09:21 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 926f4f93
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jul 2018 22:09:21 +0000 (UTC)
Date: Sun, 22 Jul 2018 00:18:05 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Lee Yates <rainmakerraw@icloud.com>
Subject: Re: Very low throughput in *BSDs (but only as a router)
Message-ID: <20180721221805.GD10598@latitude>
References: <emf8caba7e-aff8-451d-9ead-efc6ca4ae091@lee-pc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
In-Reply-To: <emf8caba7e-aff8-451d-9ead-efc6ca4ae091@lee-pc>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 20, 2018 at 08:54:48PM +0000, Lee Yates wrote:
[...]
> To present it visually, in case it makes more sense for the visual
> learners among us:
>=20
> # Full speed
> Virtual client OS [wg] > virtual router > real home router > WAN > [wg]
> VPN server
>=20
> # Crippled speed
> Virtual client OS > virtual router [wg] > real router > WAN > [wg] VPN
> server

As far as I understand it, the virtual router OS is based on BSD, right?
Are the virtual client OSes that you tested based on Linux?

If that's the case, then the result is quite expected: There is a fast,
in-kernel implementation for Linux[1], but no fast implementation for BSD.
The implementation for BSD is wireguard-go[2], which hasn't really been
optimized.


Jonathan Neusch=C3=A4fer

[1]: https://git.zx2c4.com/WireGuard/tree/src
[2]: https://git.zx2c4.com/wireguard-go/about/

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAltTsPoACgkQCDBEmo7z
X9v2hw/+I17f1Z5e627OBwTgetBIwmf4GQoCJ1Tzq4Z5A0q1ur6qymNHT5er1yGT
2WdHeSqhcKBY7x0qtqtieIEItaNH5cFCsLwx51cuKhfqLcpnTq2XfJJXxYD6V3y7
MiPrRA+AWKFVrRLq7+nQPUssITdDP3nSGILbFFAvoeBMa0ZMawYVasUc7OnupaW7
MGJYG7XjfXZdOaflUfdJZWD66f9qDy3TZWG+TJ1RoD+YJl18sf0R2RdNQuCd5SsM
5KnwZZeaaKbkD+iMbfVIPeGQ0GpUKtkEMuX5Tjnxwd6OZEsgB2HJ89+Xkz/zOwO2
L8oa3HLLWNBXKFAVRuKuapu0MWplasGiWlYqdFgmnNm1O03FeAlFjnB6sAyX9ulK
KuUEJ6avjLfNrLjoDuPUOzar8qwv/EJeCKxhcMrnJo1hW+mcALAABXxfaKA1te2r
/avs4cHnj1iGmOGAEcUH0XdM6Gj758wxjaZf3AxQOoGYj3QHT3bvnibW+WAgMC4G
0g36ZkxGBdPRsOVMXWgeOv5s80C1SGsLOr4M2P7K0Jh5+XdAo6qZPiDYqZ6BEmJv
R+fxC2CK16a3XK2UkYGXkNsr3ipZhQhGF7AW+MQTlxa3VnwF500dunsMJy0FiP9P
NOOJxx/wbx8fKhvv/GYxJA4sPkgkjn7zgtyegwZtYK1hQ2AVhIM=
=nJq5
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
