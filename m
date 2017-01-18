Return-Path: list@eworm.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3a006ae
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Jan 2017 12:21:48 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f93e38a
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Jan 2017 12:21:48 +0000 (UTC)
Date: Wed, 18 Jan 2017 13:32:19 +0100
From: Christian Hesse <list@eworm.de>
To: lennart <lennart@hamburg.freifunk.net>
Subject: Re: Similar Problem with ArchARM
Message-ID: <20170118133219.4e4c4625@leda>
In-Reply-To: <03b53159-927e-fa41-8fcd-544e914c7441@hamburg.freifunk.net>
References: <03b53159-927e-fa41-8fcd-544e914c7441@hamburg.freifunk.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eR85GI1R433hAKaqCYfCsvE"; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/eR85GI1R433hAKaqCYfCsvE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

lennart <lennart@hamburg.freifunk.net> on Tue, 2017/01/17 10:22:
> Hi again,
>=20
> I'm now trying to get wireguard running on my raspberry pi with archARM
> [0]. I installed wireguard-dkms, wireguard-tools and
> linux-raspberrypi-headers and now get:
>=20
> alarm@alarmpi ~/wireguard =E2=9D=AF=E2=9D=AF=E2=9D=AF sudo modprobe wireg=
uard
> modprobe: FATAL: Module wireguard not found in directory
> /lib/modules/4.1.20-1-ARCH
>=20
> Any idea what could solve this problem?
>=20
> [0] https://archlinuxarm.org/

Works out of the box for me:

$ pacman -S wireguard-tools linux-raspberrypi-headers
[...]
(1/3) Install DKMS modules
=3D=3D> dkms install wireguard/0.0.20170115 -k 4.4.43-1-ARCH
[...]

Have you booted the kernel that is actually installed? Version 4.1.20-1 is
pretty old in terms of Arch...
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/eR85GI1R433hAKaqCYfCsvE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAlh/YFMACgkQiUUh18yA
9HbXqwf/R88S/o1MZthRf8jmkObwTdIryZiWlBfNy/gV3lBJq9sQHAf1O06tgWL2
VpXaKWtVG56XA+1XlPZmgmaGx1ihsvMJCow3L3jAJctls6IJFVxS77cHYzWeOKp2
qYnKKQG3AN0QTUTnkme91vMiosv0zHDw5cILdmuLMM2+gq5n2OBcVFyTyudHeKhF
YuB8hLEfnN+sbUGYXx+8qmcYNyaPrn8UtrZXWEj7aKGu53Hmd4VakSNvh52drccy
gMqrCXBrICs76J886pwYB5ErB/1SlngAj973Eol00FlkE9lHg9VqRn7HJjk/DnIc
NWHLTisVooYgLwVk8DM0TmgxWtvLFw==
=1ZZY
-----END PGP SIGNATURE-----

--Sig_/eR85GI1R433hAKaqCYfCsvE--
