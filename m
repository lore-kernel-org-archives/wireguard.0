Return-Path: list@eworm.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb0a6296
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jan 2017 13:23:32 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1daea336
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jan 2017 13:23:32 +0000 (UTC)
Date: Mon, 16 Jan 2017 14:33:56 +0100
From: Christian Hesse <list@eworm.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: FAQ and quickstart
Message-ID: <20170116143356.561bf7cb@leda>
In-Reply-To: <CAHmME9rS7+kRyWtOwZMtxzmfrk_vqx2+iGFsNTuO8usrpBfOHA@mail.gmail.com>
References: <af514aab-0c3a-1a10-17a8-4a538464651f@hamburg.freifunk.net>
 <a24740cf-1d98-8e63-1b20-1424fcb45724@higgsboson.tk>
 <7db96582-c381-9149-8e27-967618a40c92@hamburg.freifunk.net>
 <CAHmME9rS7+kRyWtOwZMtxzmfrk_vqx2+iGFsNTuO8usrpBfOHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9JY_hGZq/=aMXepo9bkIUCB"; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/9JY_hGZq/=aMXepo9bkIUCB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

"Jason A. Donenfeld" <Jason@zx2c4.com> on Mon, 2017/01/16 14:26:
> Hi Christian,
>=20
> Should the wireguard Arch package depend on linux-headers? Or the dkms
> package on linux-headers? Or is it just the Arch-way that dkms merely
> prints a warning but doesn't actually have real package deps?

We have several linux packages in our repositories. Users may use linux-lts,
linux-zen, linux-grsec or anything from AUR with the corresponding headers
package. Depending on 'linux-headers' would force the users to install linux
and linux-headers packages.

Even the tools' dependency on the module is something people complain about=
...

So I think I will keep things as-is. Users are advised to read install
messages. :-P
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/9JY_hGZq/=aMXepo9bkIUCB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAlh8y8QACgkQiUUh18yA
9HYhwAgA5zyX0ELWMsuK2cd4cr5Meh6zMEOg2JbAOCgXe6k71gcStodagKJ62Qi9
kbt/SWOtfOjLCt7AHoLWnan+fHxGQBRoSEH8GvvmlFAvuxhoQDbMdAQujLGL/g23
r/AsQnsB2i1ccYhGN+xpeLbs/VqF6fSriKSbuv72fw6VhfqCKM59T1FdvqYBLhhc
+AxU0QAxHxnnPNwW2lhQz7EH+CjjLk/dEhrmCqFuP60om8cVnccZ/r80dCJlsaG6
zflQ7d2mXZEPy+XUCp4fhKVkXGBDFRhCChspcKdK8KhaKLipO3XKj5hUVjLSLGAu
iqJSiYqVaRpYxNrsof/t9X8cSaX3OQ==
=aB2U
-----END PGP SIGNATURE-----

--Sig_/9JY_hGZq/=aMXepo9bkIUCB--
