Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72065ebb
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 May 2018 16:04:59 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d242a2f
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 May 2018 16:04:59 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fMFDh-000EZe-AT
 for wireguard@lists.zx2c4.com; Fri, 25 May 2018 18:05:33 +0200
Subject: Re: Dead peer detection
To: wireguard@lists.zx2c4.com
References: <CAM3m09TdGPdAa6ksXPsYK48agkjbtaHSnSUPTiJ1-S6LDqwtRw@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <2805c563-cf43-c1a8-665a-6c49033894e4@urlichs.de>
Date: Fri, 25 May 2018 18:05:28 +0200
MIME-Version: 1.0
In-Reply-To: <CAM3m09TdGPdAa6ksXPsYK48agkjbtaHSnSUPTiJ1-S6LDqwtRw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="pZjbKgBvBx8YOH6DXoA2L7nWir1GAnEfl"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pZjbKgBvBx8YOH6DXoA2L7nWir1GAnEfl
Content-Type: multipart/mixed; boundary="RNUObSqXT5gRhTuEJJ7QORtIdMbAXKI6Z";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: wireguard@lists.zx2c4.com
Message-ID: <2805c563-cf43-c1a8-665a-6c49033894e4@urlichs.de>
Subject: Re: Dead peer detection
References: <CAM3m09TdGPdAa6ksXPsYK48agkjbtaHSnSUPTiJ1-S6LDqwtRw@mail.gmail.com>
In-Reply-To: <CAM3m09TdGPdAa6ksXPsYK48agkjbtaHSnSUPTiJ1-S6LDqwtRw@mail.gmail.com>

--RNUObSqXT5gRhTuEJJ7QORtIdMbAXKI6Z
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE

Hi,
> How do you guys detect dead peers?  Actively via a ping or passively vi=
a
> the 'latest handshake' (once it gets past a certain age, you assume the=

> peer is offline).  Are their other options?
You can't passively determine that a peer is offline, only that it isn't.=

It might just not have anything to send at the moment.

So, yes, ping it.

--=20
-- Matthias Urlichs



--RNUObSqXT5gRhTuEJJ7QORtIdMbAXKI6Z--

--pZjbKgBvBx8YOH6DXoA2L7nWir1GAnEfl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEr9eXgvO67AILKKGfcs+OXiW0wpMFAlsINEgACgkQcs+OXiW0
wpOaDBAAmSt0ggjCZokGmL4yv+4nj7R5S2AEUFwh6eAeYsU7yo3VfbJKdQgMgXwj
6RcNn8g5SPA3YjzE4vauFSgHx+G/w/FlKYCwX1ov0SIYtfuJQ4o9sG/iEW9cyX1f
wbDxvWfHJBMVw4lWT3sYeAbcXc1YVQipdcegtU9QDlRH4O/X2RPSpcpkkx6NvI9L
dkrTc8t3mABUxJvFC2zxhoSAAqqrdtJPrbjXbz/T2weOIJ7ziN3wVKoPtzFMLOwK
OlSCASB0xlNtJdNK5Ds0Sfb8BbH7ni1LbfeqQ8hQp7IBfVyPfoBjT5Vf7+cN0AQT
gm02TkI1S/d62h9GS1Ew/V1mF9X/ZVrR66lG4evT1plLByni3w3gzMEHAs/TnUH5
o5cPgUoRl8CNFBYl10+OR7+BvBYmzOTKEMkYrd3J6fg7chC3R/Yc7AGvHWWnYgiC
LK/rTsaDOMMpx/nADFZaXWQaLa1bJ26wAXIHo/febz95ppx3EJGCsJ2qW0FNNO7K
B6A3Gs1xx/zRDohBX4RzK2bkjJf3eOLMsPbYJnSon2plJBEeEqrzslhjrGxfeoyD
SNrzLo2mw60ub9EdpcavHCHfnIjs5Ff13CYudCIgoW8yvsowYVYdv73WnK0/amFH
yWtwJ36rJgjDbqCjqCHvqKPWuJoCLbxlE5gDgMNhfA5FA+60vyA=
=/M4m
-----END PGP SIGNATURE-----

--pZjbKgBvBx8YOH6DXoA2L7nWir1GAnEfl--
