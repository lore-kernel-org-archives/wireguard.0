Return-Path: andrej@kacian.sk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a13c65f5
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 05:18:59 +0000 (UTC)
Received: from vie01a-dmta-pe05-1.mx.upcmail.net
 (vie01a-dmta-pe08-1.mx.upcmail.net [84.116.36.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0a8132c
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 05:18:59 +0000 (UTC)
Received: from [172.31.216.44] (helo=vie01a-pemc-psmtp-pe02)
 by vie01a-dmta-pe08.mx.upcmail.net with esmtp (Exim 4.88)
 (envelope-from <andrej@kacian.sk>) id 1dPj9q-0004GZ-OS
 for wireguard@lists.zx2c4.com; Tue, 27 Jun 2017 07:35:26 +0200
Received: from penny (unknown [192.168.113.5])
 by vala.local (Postfix) with ESMTPA id 2A06C1C813D
 for <wireguard@lists.zx2c4.com>; Tue, 27 Jun 2017 07:35:25 +0200 (CEST)
Date: Tue, 27 Jun 2017 07:35:21 +0200
From: Andrej Kacian <andrej@kacian.sk>
To: wireguard@lists.zx2c4.com
Subject: Re: making wireguard work on RHEL7/etc.
Message-ID: <20170627073521.22a725fc@penny>
In-Reply-To: <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
 <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
 <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/K/6Jda1Fwn=BuvUohO=_OS3"; protocol="application/pgp-signature"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/K/6Jda1Fwn=BuvUohO=_OS3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jun 2017 11:57:56 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Excellent!
>=20
> Indeed let's roll with that. Perhaps something quite specific, though, li=
ke:
>=20
> #if RHEL_RELEASE_CODE <=3D RHEL_RELEASE_VERSION(7,3)
>=20
> If you want to reroll your patches around this, in a really clean way,
> and submit them using git-send-email to the list, I can do a proper
> review and we can get this merged.

I wonder - is it a good idea to depend on
nonstandard, distribution-specific defines like this? This kind of
modification IMHO belongs in a local patch applied during a rpmbuild
for a RHEL/Centos package.

I know it might sound like crying wolf now, but this is exactly how
embrace-extend-extinguish happens.

Regards,
--=20
Andrej

--Sig_/K/6Jda1Fwn=BuvUohO=_OS3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature
Content-Disposition: inline; filename=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEFVSoKyBvX2kLXU44D1o1dR9r9g8FAllR7pkACgkQD1o1dR9r
9g9SRA/+PZEwf8wPmZvY4hPgWueAUhD7YdSK2eGb/2luTEGvWd264JECvCqANBth
QiD4hLeIi69ma3wR0z9onuv9GLk9Dr3CzgYiBdYVHaqJf9RbALKjnPGxRCPgsrTd
RsiRId3lUsIl0arZ923CrIM2g4Rbf5PCRjyYsKNSjbVrzRW1ZtbXVNvtbwJRrCmW
OXp00qxRs8HhTE826vWlxTN8NLOJ50QvynxoesIfU0zfgH7cUFauQpXSWrGFYd4z
THuScy/h/i5wQhezPUROozY6JQ2clBGojQtyutlraGFyFXqDtpnJU0j7L2kz9n4J
uFPKLN1T/qPeqop88iFiy79E0krn+4AdWw2qHY33uZGbabsALntFn5Xwsf2I116K
VEFZt36OrUJd57C+2TSk6xSZLkbCEOw6s/O6grKr1FcSes/NIoSuzWVLWfByOJvh
QaccHycmWJ0KHgCFlFf0cYaA4HuOv1IIw4CS50qw4chhErNmcDQJW2OPgtsnw68s
+07UttofyUSZbbayJa0Nk4mWmNuLxfx49+34oxw29Ej7BXXaKtCWWzA1+saKbbZ0
dOraou7GjweP1exBVmTyvAJaK6a2czk+2x6/o4PvqSSP3bNILd60Qs1IWN9eD5Eo
oBG6D3de5UfB05EJAGLyxsBXfZOD89qvjbM6tcrYa8mvDRsxbKg=
=r6LV
-----END PGP SIGNATURE-----

--Sig_/K/6Jda1Fwn=BuvUohO=_OS3--
