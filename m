Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 575ed598
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:30:55 +0000 (UTC)
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
 [209.85.215.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a7c80c9
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:30:55 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id a132so13663093lfa.7
 for <wireguard@lists.zx2c4.com>; Tue, 07 Nov 2017 01:34:07 -0800 (PST)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Received: from [144.32.48.210] (pc210.cs.york.ac.uk. [144.32.48.210])
 by smtp.googlemail.com with ESMTPSA id s125sm148922lja.46.2017.11.07.01.34.05
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Nov 2017 01:34:05 -0800 (PST)
Subject: Re: Production usage of Wireguard
To: wireguard@lists.zx2c4.com
References: <CAC4KqtwH_XAXeXHSf9Kxs5t80Qag9GrMwp6SaPnO9bj=GVL-7w@mail.gmail.com>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Message-ID: <698e22a4-a358-d3fa-16a3-c576fee8a253@york.ac.uk>
Date: Tue, 7 Nov 2017 09:34:04 +0000
MIME-Version: 1.0
In-Reply-To: <CAC4KqtwH_XAXeXHSf9Kxs5t80Qag9GrMwp6SaPnO9bj=GVL-7w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dAoLwtR0aKrkF18PnLkhegePUf2VDL1er"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dAoLwtR0aKrkF18PnLkhegePUf2VDL1er
Content-Type: multipart/mixed; boundary="EuOKOIx5QRwIpKmKEGnGrVne6tluIxV6q";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <698e22a4-a358-d3fa-16a3-c576fee8a253@york.ac.uk>
Subject: Re: Production usage of Wireguard
References: <CAC4KqtwH_XAXeXHSf9Kxs5t80Qag9GrMwp6SaPnO9bj=GVL-7w@mail.gmail.com>
In-Reply-To: <CAC4KqtwH_XAXeXHSf9Kxs5t80Qag9GrMwp6SaPnO9bj=GVL-7w@mail.gmail.com>

--EuOKOIx5QRwIpKmKEGnGrVne6tluIxV6q
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 06/11/17 21:41, Ferris Ellis wrote:
> I know the project is still young but was
> wondering if anyone on the mailing list had started using WireGuard in
> production? And, if so, if they=E2=80=99d be willing to share some deta=
ils about
> their use case and experience?
>=20

I use on on several high-traffic web servers to secure backend
communication to a separate Redis instance.

It's configured as a mesh to remove any reliance on a single WireGuard
"server" node (that is, each server knows the endpoint and single
allowed IP of each of the others).

It has worked without issue since deployment (March 2017). It's easily
one of the most satisfying layers I've added to any stack.


J


--EuOKOIx5QRwIpKmKEGnGrVne6tluIxV6q--

--dAoLwtR0aKrkF18PnLkhegePUf2VDL1er
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJaAX4MAAoJEOAwQ4KMP/S723YQAMDe4FJr0ZD+U5IjNMqC3otI
tmwttS/ReDg7P6YsYuOfEY+09YAR193lb+GNCVHq1hCoa/TzkaXCjOwQIRk5/snl
ItAfqWxI9v12+HOnfjZQCu+b9RrKlzYdu2+ffcnIgSeH0ZCMtrDmZDeT0Ip4w61U
dY1jc3Y15nN/n00T2dWEZyaQPB7dVycFxj1AezpVSbviDBr8D7dSgEa8HyvaAEX/
bOghE96YEicVujc9js+vOyZd4sy9oDi4njOdlR6wOXr4fA64gZfD0WlW5lk7EVDm
rYfuBkDPandMrLuS4+T9TxG+LQt4FMsSl/vOKCLVK/3kfcZ5QlRh+jqydKEZGZMr
GF7EN9hbAgb5H7vlsXYKZiltU1HOfsfIUb87miTlzUNF+FuHV1kD447Zqne9IkIP
ydxObUi1SZIJdHaaj7jXp77UE5Z+dxaUDJ0xE37NdyRY1gk+/HsJ36O/CF8wNrY3
EhMD/uHQd2hDXGVi0BeK1liWe799GYTxSqczV47Cs8svouSVwU4FBAGsclVlG0ye
ArwUXivUagAyVchxfNmCd3W73+wCcB700/bPWCWSK02ycxrh8enyC6IB9k418m/p
EYjqQGkGFpeeZmGKPHvqXo/wSFuP01LML/Dm0d7dq89LiLxG97YwTphdJz8foJxr
1jndNIy+HkRW30DOInX7
=JLzC
-----END PGP SIGNATURE-----

--dAoLwtR0aKrkF18PnLkhegePUf2VDL1er--
