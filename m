Return-Path: jaron@kent-dobias.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a72f0f96
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jun 2018 13:03:56 +0000 (UTC)
Received: from mail.kent-dobias.com (mail.kent-dobias.com [5.2.75.74])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 224a8982
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jun 2018 13:03:55 +0000 (UTC)
Received: from [192.168.1.2] (unknown [10.9.0.3])
 by mail.kent-dobias.com (Postfix) with ESMTPA id D8CF6D4CD0
 for <wireguard@lists.zx2c4.com>; Thu,  7 Jun 2018 09:07:01 -0400 (EDT)
From: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
Subject: [Uber low priority] Linux 4.17.0 on aarch64
To: wireguard@lists.zx2c4.com
References: <47fd3645299195a9d127bcf718543389@rcrdbrt.com>
Message-ID: <3abf9415-f8f0-65bc-83cc-bd402a9128a3@kent-dobias.com>
Date: Thu, 7 Jun 2018 09:06:58 -0400
MIME-Version: 1.0
In-Reply-To: <47fd3645299195a9d127bcf718543389@rcrdbrt.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="xsB4pLENRL7tmqaerTaMIm49NwKaBsu3T"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xsB4pLENRL7tmqaerTaMIm49NwKaBsu3T
Content-Type: multipart/mixed; boundary="NY0QOLMT2ISsO2YpSD0IyDWcniMnABFwU";
 protected-headers="v1"
From: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
To: wireguard@lists.zx2c4.com
Message-ID: <3abf9415-f8f0-65bc-83cc-bd402a9128a3@kent-dobias.com>
Subject: [Uber low priority] Linux 4.17.0 on aarch64
References: <47fd3645299195a9d127bcf718543389@rcrdbrt.com>
In-Reply-To: <47fd3645299195a9d127bcf718543389@rcrdbrt.com>

--NY0QOLMT2ISsO2YpSD0IyDWcniMnABFwU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/07/2018 03:40 AM, Riccardo Berto wrote:
> Just want to report that I can't add a wg interface of type wireguard
> with linux 4.17.0 on aarch64 (Raspberry Pi 3).
>
> Error message: `RTNETLINK answers: Operation not supported`.
>
> I'm using ArchLinuxARM. Downgrading to 4.16.x makes the issue
> dissapear. This is not high-priority so please Jason, if you're
> reading this message, move this issue further down in your debugging
> queue as I believe almost nobody is using 4.17.0 on aarch64 right now.
> Maybe they'll fix the error by themselves in the coming 4.17.x releases=
=2E

I had the same problem on a different Archlinux ARM kernel that I fixed
by adding '-fno-pic' to the ccflags-y line in Kbuild before compiling
wireguard. Try that out?

Jaron




--NY0QOLMT2ISsO2YpSD0IyDWcniMnABFwU--

--xsB4pLENRL7tmqaerTaMIm49NwKaBsu3T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEESQHwQKRh1Whpo6HFI20K3+69dxoFAlsZLfIACgkQI20K3+69
dxpumhAAq5c3pxauHXTnB4x/RBcsR4Dcz5ARnZfMARXHXlppLZpaSAYn1XhuX0Kx
TRzBtsCNh9S4DS7bvRvFEZv9BRE7/Ar0NZYx31Qw1Md7cgWMxp8uIljX6wmLGNf3
DiJ3w0Gu9XxN0avAA4Fm9b2urHcK3vpk1VTBQR8IUjQrsOFQRb8mlb9UliaC9oVa
TsRAI7laSNuNdSZ7+lbVbTeWxrgLC3/2QbGRFPdNfJes5IFdR8Z4wXZSGpKPv6Wa
vX7ad+bjAzX5R12YO4QOJwIszHoK3/QbDc69X0WcR5xB/SZYOy7JgxgIJUJU59PO
pg29UwWFkpZ08iTa0pKj5+nNdNDg6RjsCQmGta2R3V50gVAC+YND2T6U1l028yF8
inOxvTd5g44ZKne5JhxzRoB8TaEj2gYocKPROMopbRMuRGUOOvbUGUsTTIWm86du
on+Jk1fPPViqxdXklKiYD1qeV6dTcKNGREX13GcgBTg46mJ7Ko3/DdZ9L7gRmx/q
+d/0rJoq30tNieZWnk9NICknB85rZsgmpar4KVqIMHenywPyv4WiDlTN1y2ctBRA
Dyn+0rCJoTDyITenloaw3+FusCXLkeMZR3wWFPuOsbV7G/qkvihdbusjgJYeWlgD
LRYxmm3aQTcA1puQeeeOtOhPLRuKxyl07WkBgJLsqUDUq3qNxv4=
=HZIk
-----END PGP SIGNATURE-----

--xsB4pLENRL7tmqaerTaMIm49NwKaBsu3T--
