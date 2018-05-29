Return-Path: geno+dev@fireorbit.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e754beb2
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 18:03:00 +0000 (UTC)
Received: from cetus.h.sum7.eu (cetus.h.sum7.eu [5.9.250.38])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8700b091
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 18:02:59 +0000 (UTC)
Received: from localhost (localhost-ipv6 [127.0.0.1])
 by cetus.h.sum7.eu (Postfix) with ESMTP id 134D462227
 for <wireguard@lists.zx2c4.com>; Tue, 29 May 2018 20:04:59 +0200 (CEST)
Received: from cetus.h.sum7.eu ([127.0.0.1])
 by localhost (cetus.h.sum7.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QZxUlmrcG_cT for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 20:04:55 +0200 (CEST)
Received: from [IPv6:2a01:4f8:160:44d0:1337:e7db:f329:bb5e] (unknown
 [IPv6:2a01:4f8:160:44d0:1337:e7db:f329:bb5e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by cetus.h.sum7.eu (Postfix) with ESMTPSA
 for <wireguard@lists.zx2c4.com>; Tue, 29 May 2018 20:04:55 +0200 (CEST)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Martin/Geno <geno+dev@fireorbit.de>
Subject: own interface address and peer address in same Subnet
Message-ID: <d0fe533f-de71-9446-ec2b-0da8cd0548f9@fireorbit.de>
Date: Tue, 29 May 2018 20:04:52 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="esw2b5nQdfwbBBl9ySCySXFVsqNzxib8R"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--esw2b5nQdfwbBBl9ySCySXFVsqNzxib8R
Content-Type: multipart/mixed; boundary="OeEs1FG8lsAv2tWtwMtPkbSeqASigBik4";
 protected-headers="v1"
From: Martin/Geno <geno+dev@fireorbit.de>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <d0fe533f-de71-9446-ec2b-0da8cd0548f9@fireorbit.de>
Subject: own interface address and peer address in same Subnet

--OeEs1FG8lsAv2tWtwMtPkbSeqASigBik4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,
i use at my wireguard 'server' ndp_proxy to announce - thats the reason
why i could use the same interface address subnet, then the endpoint is i=
n.

Example client configuration:

[Interface]
Address =3D 2a01:1337::3/64

[Peer]
AllowedIPs =3D 0.0.0.0/0,::/0
PersistentKeepalive =3D 25
Endpoint =3D [2a01:1337::2]:48574


Is there a solution for this 'bug' - there should be a validation and
exclude of endpoint addresses on the routing table fwmark

A nice day
 Geno


--OeEs1FG8lsAv2tWtwMtPkbSeqASigBik4--

--esw2b5nQdfwbBBl9ySCySXFVsqNzxib8R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExU2ivF9mZhtsbkpbnX08a/9gDGoFAlsNlkUACgkQnX08a/9g
DGoaLhAAsw7105UEvq/H6+TH9tf8Bvj8MEHUW/JRhlUAGt5UIVfTvCvJsN8JkWAx
gixtSoPuVaFM1K9jz+D8mlgmt0xSt/ZDn74O2HBJfelOyABdX0rp9p160Cscf0J4
0y249326FFotq8ks9/eSAerLRcHbnTp2hr1M0dZtCApBqdtDOKJhCWmMLZgwEfg4
uZfNM55XcHkSPjG4RQX+I0k4k8zzuvWsV+BphU72xFZIvs23wOelrOrp2jISjjkk
d+piYFBuRf76sdEmHr7hH8+zdHg/3xMwN4EhIL2Mh/ah4OhU2EDY+UK+MtTjL0m7
2GkCMQK3DZlfFBrYdQxZHGxBG/7q6RbilZ35rcCR3BBysr7Lq0L171pMuHmQMgwh
dUK3v5/Du5QBmHlQ8cW5sH79Ulxb7GKbDJuoILVNozhfqf6Pvckt8Sz/JmaUcJ19
DSyRJuqMjlFY8ZBIniJ8d92ggLAYKk9OuzPE2sXC2N9RJMsKBkRoSUf24RabIiqL
NBfbyysmtZWp3QfSviM56SjpYRsvKtonL1HVFUGrxIyfrWIEnVgzRbToh7lANkV/
FdfYqSxI1N830dN23qTZ1bzRnpZ0W1PsDrvqjtkajr3fI5JntzZvcfm6rjiM5sFg
LJmGije71+3YsZo9oP96QZ1wI1E1I2GkS6rlihcGnovmBF1X81E=
=9JwA
-----END PGP SIGNATURE-----

--esw2b5nQdfwbBBl9ySCySXFVsqNzxib8R--
