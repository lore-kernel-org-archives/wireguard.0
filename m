Return-Path: mdt@emdete.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7eb57481
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 19:53:36 +0000 (UTC)
Received: from emdete.de (ip-109-41-67-146.web.vodafone.de [109.41.67.146])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f507fa4
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 19:53:35 +0000 (UTC)
Date: Sat, 08 Sep 2018 21:54:03 +0200
From: "M. Dietrich" <mdt@emdete.de>
Subject: Re: Routing to a network behind a node
To: Steven Honson <steven@honson.id.au>
References: <1536396708.rkbb1jpywa.astroid@morple.none>
 <4608FEAE-C918-4D38-9CE0-3712C91687C7@honson.id.au>
In-Reply-To: <4608FEAE-C918-4D38-9CE0-3712C91687C7@honson.id.au>
Message-Id: <1536434377.yoph6djrtc.astroid@morple.none>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256; boundary="=-yMi9JOa1xqif4qHYPR/d"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-yMi9JOa1xqif4qHYPR/d
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Quotation from Steven Honson at September 8, 2018 12:23:
> Have you added 172.16.0.0/24 to the AllowedIPs entry for the
> 172.16.215.2 Peer on 172.16.215.1?

no - thank you for pointing me there. i now added an
additional AllowedIPs line and it works!

thank's,
M. Dietrich
=

--=-yMi9JOa1xqif4qHYPR/d
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE8ECycNYHT6atlYQywVmjQWUJtykFAluUKNsACgkQwVmjQWUJ
tyl1tg//V9KFV7pU4NIMhrvHiwguA3Uvuu/VOaDlovMcNjRFkm22+myLjXtQ4ZnR
NFWTwBGTp4x+f6YrZlDGRaPWJXPHCA8Mkc3ZwFyhIN1WZcuUliz5nZ9ftsZRpZcU
p4gU2xmcBjdttL7inDhWDqbR3HTDoFcgZEqoTwJ17K3cQNogPKOO+hIsLMkgG4VT
ISTC5wnqcqAbtWct0ryXIWKR/dEKVg5ywDoQloWtedCtb3DIOSzGgRg9ZHSDa6jq
IF0Sqdq1Oo6Lpmwj2Pd29Pmi0ImtPoZ5fRsMTta5DWghjcCHiDl3mTSjs5YcGVnl
DUpUsCdIxH2ZMy76h5TrmQh5bDAIMQs/iEXJVbDcc9vBKL6rn9QftufD3GBgmwVn
WD0Rd2ubvn6rYDWnYjK8Ohu45yzXJ7zRr+xMoo0HkZhpAdKk3mAjlRo2A0dnZFWP
KkO7EMhYYhyiksGa/llZdms17Ydrt1Vlr3KeG7khLqx9f6P0AInVJvXnukuOgl0p
tU2RTJ5NHPuO6qshB7u7nx7MXO2AS/Rl3Wv2V8bNzZvI2F46ndtQ3yrmpxUkZk5U
P4qhUuDTPhuMKUKQkbPN5Yk1AHt/pyIa17zji5qPrsLpy9CsW9T4OO54oWAWdk9d
jHSnBjPxoKLdlkv0rdxjs74ja14MVQnb+CQ+j2vPYd48mpcrYKI=
=gfOF
-----END PGP SIGNATURE-----

--=-yMi9JOa1xqif4qHYPR/d--
