Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8360ae7c
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:04:25 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11951b28
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:04:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a108-v6so17483061wrc.13
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 07:04:54 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: [PATCH 6/7] tools: allow setting of transit net
To: Julian Orth <ju.orth@gmail.com>
References: <20180908121841.8372-1-ju.orth@gmail.com>
 <20180908121841.8372-7-ju.orth@gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <1550cbf1-b5a4-d245-669d-9400245b1633@gmail.com>
Date: Sat, 8 Sep 2018 14:04:51 +0000
MIME-Version: 1.0
In-Reply-To: <20180908121841.8372-7-ju.orth@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ZYvaselv1EQbmBKpWkucYCiENg8kqQ253"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZYvaselv1EQbmBKpWkucYCiENg8kqQ253
Content-Type: multipart/mixed; boundary="RcnSD3GW3Zv31SrFkfy5nHyzoVCK8oSD8";
 protected-headers="v1"
From: Aaron Jones <aaronmdjones@gmail.com>
To: Julian Orth <ju.orth@gmail.com>
Cc: wireguard@lists.zx2c4.com
Message-ID: <1550cbf1-b5a4-d245-669d-9400245b1633@gmail.com>
Subject: Re: [PATCH 6/7] tools: allow setting of transit net
References: <20180908121841.8372-1-ju.orth@gmail.com>
 <20180908121841.8372-7-ju.orth@gmail.com>
In-Reply-To: <20180908121841.8372-7-ju.orth@gmail.com>

--RcnSD3GW3Zv31SrFkfy5nHyzoVCK8oSD8
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
> +			device->transit_net_pid =3D pid;
> +			device->flags |=3D WGDEVICE_HAS_TRANSIT_NET_PID;
> +			return true;
> +		}
> +	}
> +
> +	/* Otherwise -> file path */
> +	device->transit_net_fd =3D open(arg, O_RDONLY);
> +	if (device->transit_net_fd >=3D 0) {
> +		device->flags |=3D WGDEVICE_HAS_TRANSIT_NET_FD;
> +		return true;
> +	}
> +
> +	perror("fopen");
> +	return false;
> +}

Wrong function name given to perror(3).



--RcnSD3GW3Zv31SrFkfy5nHyzoVCK8oSD8--

--ZYvaselv1EQbmBKpWkucYCiENg8kqQ253
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAluT1wQACgkQivBzdIir
MBKS0Q//aHyIGxzNRuXGRRLziqMPYmqq1NJozNVL7FiMHtvAGXaSzNgPgUiiM3Zw
KdW6yzkQzBrHYMsZnrbcjC2UEY9bjGM4wRtIxv6/uxGw4A/vqOCJJVCSHyWisN+5
N6jEUpJEAhNv+3EurmJxz7RUHxfuxFTtfcb1gkvy0bNP7+dWPw9E5Ws+CEcY/FYZ
vHrGA20JyyXtjsZjhCz25umSf7odJ3Y0fIM033GIctLJNCoQq8yMkmGFNmIxgfvL
J9cKN32PricxvXDdcQPX0OTMXc6AR63Ggitzu/Uxk+je6LHS1mww3AFCnkLL1kyu
0MAgHKxg6QhmCrkqWEYDoXgCyGRuae5rSHLDTXc8/3RYpWIuQ6YffxFyxgthsPcH
+b4kLH6Yag4ubKXPd3kkjUDKEomBbogPcr0sg/vlubAEf7KXrxKI6jOuYoQNBN5G
3KPEx1b9n0jQXMbYk0Kx8D+6TKREzSQ34yiPnPug1MKlVpj6LP+W05eiVQMk7A1m
BR0vN45/uAOx38bohjFQ0romDVTxFOGii8k2RgNZR1mEBvaVM2WFmEgshBUWiiV4
nUiwLqNZhPFEKDUu0mf2yrtUlfaTc6VWpcvX0pOqS78y1wbxIqVi6ZHiphdpuCpN
qs34Cx14n9vW+vM+0f8b7yxLz+dgMAnTRstYD/V3R06UZAjTx6U=
=QP1v
-----END PGP SIGNATURE-----

--ZYvaselv1EQbmBKpWkucYCiENg8kqQ253--
