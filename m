Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4016842b
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Apr 2017 11:32:31 +0000 (UTC)
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af1d25b7
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Apr 2017 11:32:31 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id u2so58743397wmu.0
 for <wireguard@lists.zx2c4.com>; Tue, 11 Apr 2017 04:39:26 -0700 (PDT)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Subject: Re: DKMS build failure on kernel 3.13 (Ubuntu 14.04)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <bb963757-98ea-a107-b402-a4c659d9e0b0@york.ac.uk>
 <CAHmME9rSPYXUGzqhBiwg_cc-uj=Q0fwdtJkbw+PsNPT00MJavg@mail.gmail.com>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Message-ID: <6b69d92a-a65d-1d92-fd60-0e1c5270d3ac@york.ac.uk>
Date: Tue, 11 Apr 2017 12:39:19 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9rSPYXUGzqhBiwg_cc-uj=Q0fwdtJkbw+PsNPT00MJavg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tTrac3cpSIr4Ha8IUp2vISw8sEDspnxiT"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tTrac3cpSIr4Ha8IUp2vISw8sEDspnxiT
Content-Type: multipart/mixed; boundary="MmVM3cuTdHfFOsjl4PN2KGRxGVPqPog8R";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <6b69d92a-a65d-1d92-fd60-0e1c5270d3ac@york.ac.uk>
Subject: Re: DKMS build failure on kernel 3.13 (Ubuntu 14.04)
References: <bb963757-98ea-a107-b402-a4c659d9e0b0@york.ac.uk>
 <CAHmME9rSPYXUGzqhBiwg_cc-uj=Q0fwdtJkbw+PsNPT00MJavg@mail.gmail.com>
In-Reply-To: <CAHmME9rSPYXUGzqhBiwg_cc-uj=Q0fwdtJkbw+PsNPT00MJavg@mail.gmail.com>

--MmVM3cuTdHfFOsjl4PN2KGRxGVPqPog8R
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/04/17 12:26, Jason A. Donenfeld wrote:
> Hey Jonathon,
>=20
> 3.13, as released from kernel.org, does not have this function, which
> is why it's "defined" in the compat.h. It appears you're using
> somebody's insane backport. It wouldn't surprise me if Canonical
> decided to try and maintain 3.13 past kernel.org's maintenance. Is
> this the latest kernel in 14.04?
>=20
> Regards,
> Jason
>=20

3.13 is 14.04's 'official' kernel. They do have the 16.04 kernel
available (4.4) for 14.04 which I've been using successfully with wiregua=
rd.

They do indeed maintain these kernels beyond mainline's EOL (instead of
sticking with one of the LTS versions for their... LTS release).
Thankfully 4.4 is an LTS version so 16.04 is in a better default position=
=2E

It's easy enough to work around if this is out-of-scope for wireguard,
which it sounds like it is.


J


--MmVM3cuTdHfFOsjl4PN2KGRxGVPqPog8R--

--tTrac3cpSIr4Ha8IUp2vISw8sEDspnxiT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUzSNjhumunvu6bYD4DBDgow/9LsFAljswGcACgkQ4DBDgow/
9LtcsA//X0T8N4JbNStZvzJHVz54HVwagglKLdfjhQIgbmz7FQpsz7GbJnyMgF4q
XMv1+xgc3vxH6EvyGN73q33IkIvCLuHccTImO511I8oP7MBA4/WDxLpfJGALfX5v
XrgDvXo7cy7f8hmd3AvP5+mlYlHStKTsL+3ZKUHBIwj14z8DSpEgLS4oaPGTOj/r
5dnNEPfnXE5CqewaYOoRMoeMwAfzp13n6JjPhuWfJ6mGMA3PwjVm+dXWUPc/WP8d
xyncq7+V+DXl7a4TkZEx1WKV8YMp7wPh22LAHbA82Rg61lwlpb43qF+Q6GcZYJO5
uL+HkWss1hYwUCmd9nyzLO0MfOymNZzk79+I5TnfWuRztRjMjBD6Kns3YYN6ejzv
LGKp25Q3p+++nlC0iGpKvwC/ra3MW8HXbvvZX0lSAqQNJ4LuJx0ABdNdsglNT/h3
kwwgI0+1T1UAsGzoYzPJEeFjR3J0cAOKaGCvbuAD+rKdOIUauJcNFrXungALOr9n
+yRkMto532ensJFZGHh3kv4U+kWUg9IlkaxcWQORuJouIfgkNFR/dyZ4P65VAnGj
jhUT5qPgS32wz/x0iXi6ssxFbY0Gbh1SSLdCzGK9boA8R4B5YAZP9mkKX6yy8RRE
6KvtNAdQ7q7CwIX4ZxAL4NqQIAlXzY4RN3KwnF4gwtARMaaqrEk=
=WahK
-----END PGP SIGNATURE-----

--tTrac3cpSIr4Ha8IUp2vISw8sEDspnxiT--
