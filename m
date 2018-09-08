Return-Path: mdt@emdete.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7567d7be
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 09:06:09 +0000 (UTC)
Received: from emdete.de (total-communication.vfnet.de [80.84.1.14])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d10385a1
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 09:06:08 +0000 (UTC)
Received: from localhost (emdete.de [local])
 by emdete.de (OpenSMTPD) with ESMTPA id 663fc40a
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 09:06:33 +0000 (UTC)
Date: Sat, 08 Sep 2018 11:06:33 +0200
From: "M. Dietrich" <mdt@emdete.de>
Subject: Routing to a network behind a node
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-Id: <1536396708.rkbb1jpywa.astroid@morple.none>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256; boundary="=-N4EuS2+rSWrzsrEQUvzk"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-N4EuS2+rSWrzsrEQUvzk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

i have setup a wg vpn with several nodes, lets say in a
network 172.16.215.0/24. one of the boxes (ip 172.16.215.2) in
that network has an interface to a different network with
additional boxes, lets say 172.16.0.0/24. i would like to
reach the boxes in that network directly so i established a
route on another node in the wg network (172.16.215.1) like
this:

	ip route add 172.16.0.0/24 via 172.16.215.2

but once i ping 172.16.0.1 i get the error

	From 172.16.215.1 icmp_seq=3D1 Destination Host Unreachable
	ping: sendmsg: Required key not available

it seems the package reaches wireguard but wireguard doesnt
know the "via" and tells it has no key to route to 172.16.0.1
which is fine. but why doesn wg honour the via and send it to
the router 172.16.215.2?

i think its more or less whats done if you route all your
traffic through wg so i assume i do a terrible stupid mistake
(i am no network or kernel routing expert which may be an
excuse), can someone help?

best regards,
M. Dietrich
=

--=-N4EuS2+rSWrzsrEQUvzk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE8ECycNYHT6atlYQywVmjQWUJtykFAluTkRkACgkQwVmjQWUJ
tyk7Pw/8DMKSTZjSrvUZoPjoXtDI4SrfwmM2ji0LD/6KDNpJTmHKDE6gV3+JE7cZ
49Qbk7BD+r05/2HscMo0LgB9IVlTqgDX492it3sEkEkd7NEe1J9hinOWtSfbtfgE
XpH7aNREZCNNZs8tJLm2A7vY2qeY+zpl/CFcTJWZwmN0Pi915QyetYEAamdwYS1N
K9ikTor6pwFmI0XkGRLtpeJZ0cBcHC5yHw+aMVVnsmRQvhtCt3cbWq+k66rbWj3O
lF37EtqMmNd9V36C2+5RFxpe+00RGaYee8MHjNTfcYb/KEkzKY3Pj1jB2BPzF5U/
z6j8JreSGzvaYxD/M+15bUfLrTfbid0KHhLbUNre6Su3dxaiL9sk6UoHvDphp/AI
1HFBXd3za/QtHpNwbAaH4fvcjQA8x1MIS2JG0xME98+qymcoMgTjbzCCMozexGAw
x71bQ9LkERGyk9NPp4M3h8QwhFBRRk5PTUoSvbt70eHBIfNU4r09n+vBC0fNb/Uj
PSIUp45IpdFBjO21WEhUPgVIArSK62baycqZ/RV6bMdFXuyObo/V54LHvQlKUQk0
GJC7L74siuOZJ4bMTyPq9RO/NCAdFQWv5gX02n4Pb7i9nvOAtsCLC0uBEHz6crRL
XZQY8LLxIL8ilA0djbOcT6Hvcz5FX6FcIesGavAXbqoV17rHlQc=
=pbN7
-----END PGP SIGNATURE-----

--=-N4EuS2+rSWrzsrEQUvzk--
