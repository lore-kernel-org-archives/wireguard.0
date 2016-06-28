Return-Path: list@eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c36dde2e
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2016 20:48:03 +0000 (UTC)
Date: Tue, 28 Jun 2016 22:50:30 +0200
From: Christian Hesse <list@eworm.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160628225030.31cc7e2a@leda.localdomain>
In-Reply-To: <CAHmME9okkkwQD_zd90UBJ31ughmTSAbmhfVnr_5abtfA6+qyvw@mail.gmail.com>
References: <20160628200215.14423-1-list@eworm.de>
 <CAHmME9okkkwQD_zd90UBJ31ughmTSAbmhfVnr_5abtfA6+qyvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XFD/n9YQZsWflZWh=ICcVhh"; protocol="application/pgp-signature"
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] [PATCH 1/1] add DKMS configuration file
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/XFD/n9YQZsWflZWh=ICcVhh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

"Jason A. Donenfeld" <Jason@zx2c4.com> on Tue, 2016/06/28 22:16:
> Hey Christian,
>=20
> Good to see you in this neck of the lists.zx2c4.com woods! :P

:-P

> I see you saw my call for DKMS in the roadmap page?

No, I did not... DKMS is my preferred way of packaging external kernel
modules. I cloned, ran make and created dkms.conf for packaging. ;)

BTW, and Arch people here? Give it at try:
https://aur.archlinux.org/packages/wireguard-git/

> I haven't looked into the innerworkings of DKMS yet, but is this
> essentially how it works? We put this file in src/, and then
> everything is taken care of? Are their other flags and switches and
> variables to take into account? Or is this pretty much it?

Basically that's all we need. Put everything (dkms.conf, Makefile, *.c,
*.h, crypto/) into /usr/src/wireguard-$version, run

$ dkms install -m wireguard -v $version -k $kernelversion

and load the module.

We could add version handling and install target to the Makefile, but that's
optional. I will look into that the next days.
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/XFD/n9YQZsWflZWh=ICcVhh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXcuMWAAoJEIlFIdfMgPR28kAH/28G9FewthICLCJgoHdk5uc0
QYhbwW5aWBx7AaRvWUY78ir7ma729cr8NoN6PJieLd0xy1Q9zKXDgI5FqIKXlbyj
AVeDiz+AGZtPadm0bnV40rMcDpxHJver6DZuMIAi+J63x2CbMYi19x3eHdpa6w55
sN6ggU2Fg4KrmrIKq91vmdvuMu2a/tVvMcx0L6YjnKYYGBWaKEK5n2OQj5jdvhRd
PopMvIpiHPi0nb3Sl7Bo+gK2tY2lxlhjO3Tu5hEHHqLwotC8pKGPooSkvuEBMAwj
nNaALttwQhOY4q2yvavAoZgmmjyg+yPFfyH6yJRqLm3Ix25T/1cqZEQmzWn3mg8=
=TXdI
-----END PGP SIGNATURE-----

--Sig_/XFD/n9YQZsWflZWh=ICcVhh--
