Return-Path: list@eworm.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6269388
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 11:28:18 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d896b0c9
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 11:28:17 +0000 (UTC)
Date: Thu, 8 Dec 2016 12:33:43 +0100
From: Christian Hesse <list@eworm.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 1/1] make the systemd unit example more general
Message-ID: <20161208123343.54f162d7@leda>
In-Reply-To: <CAHmME9qc02xGhyiXp3J3ugFyCKkWbYY0Fj_q9C1euv1gAYa9qg@mail.gmail.com>
References: <20161208091214.15449-1-list@eworm.de>
 <CAHmME9qc02xGhyiXp3J3ugFyCKkWbYY0Fj_q9C1euv1gAYa9qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/w_aTyC42GpaP7qI5IXTG8e5"; protocol="application/pgp-signature"
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/w_aTyC42GpaP7qI5IXTG8e5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

"Jason A. Donenfeld" <Jason@zx2c4.com> on Thu, 2016/12/08 12:18:
> I like this, but two questions.
>=20
> 1. Why did you get rid of the ExecStop config saving line?

I do not like units altering configuration. If you want to save configurati=
on
on stop create a second unit with correct dependencies an ordering that
writes the configuration.

> 2. You're not planning to actually package this unit file, are you?

Not sure about that. :-p At least I left it in examples directory. ;)

In first place this is a RFC. Nevertheless we should polish things a bit and
provide a usable systemd unit.

I still do not like to have two files that hold the settings... But no idea
how to get rid of that in a clean way. Having shell code in a systemd unit =
is
even worse...
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/w_aTyC42GpaP7qI5IXTG8e5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAlhJRRcACgkQiUUh18yA
9HayTQgA5swyGpYd+MJ/L08h2o6Xlwht7KpQRAy9/wZFLZynRA+pad3rVvSzInGP
QgYmENxDCrB+CXF7bEFcosuXW1DE7jvL4RDnI3azTGaBrCnDOGcmNE2jRr060xHU
5W1oh6j7UDXovoUs5opGZzQ7QfBWBRAvDMkozAV9kEYcNbZsh/rl7dMc1vDWrzAU
DxKivb0BP5jymlvAfjyAE+lIKXINgfb9IgFWVFiJO8LIl4qnFXon7YHyv5t2vPMs
js1BVemn5vd/IC1h3k+N3xA/LI3Z4CUjTupJuEmgjiMTBRLM13fPMOIRqUU2nT0z
wHI85lot6x1JcfYMdalFWNZmqw4x3w==
=DKGR
-----END PGP SIGNATURE-----

--Sig_/w_aTyC42GpaP7qI5IXTG8e5--
