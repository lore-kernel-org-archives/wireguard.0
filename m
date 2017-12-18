Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c63b0ee4
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Dec 2017 14:34:48 +0000 (UTC)
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
 [209.85.215.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af143120
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Dec 2017 14:34:48 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id a12so18050583lfe.4
 for <wireguard@lists.zx2c4.com>; Mon, 18 Dec 2017 06:43:13 -0800 (PST)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Received: from [144.32.48.210] (pc210.cs.york.ac.uk. [144.32.48.210])
 by smtp.googlemail.com with ESMTPSA id i130sm299482lfg.44.2017.12.18.06.43.11
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Dec 2017 06:43:11 -0800 (PST)
Subject: Re: Bug report: WG won't reinstall after some OS recover procedures
To: wireguard@lists.zx2c4.com
References: <2d4283b6-e379-cbbe-d084-91de4e023eca@posteo.net>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Message-ID: <9218a9a3-1821-f0ed-7c7a-42c123695a60@york.ac.uk>
Date: Mon, 18 Dec 2017 14:43:10 +0000
MIME-Version: 1.0
In-Reply-To: <2d4283b6-e379-cbbe-d084-91de4e023eca@posteo.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AdkarkfNqPXX2WNEXdoakfQ51oOvJU8wO"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AdkarkfNqPXX2WNEXdoakfQ51oOvJU8wO
Content-Type: multipart/mixed; boundary="vIV5MBH2sRXTQUvOOiVeGbC6XSEVLHU6K";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <9218a9a3-1821-f0ed-7c7a-42c123695a60@york.ac.uk>
Subject: Re: Bug report: WG won't reinstall after some OS recover procedures
References: <2d4283b6-e379-cbbe-d084-91de4e023eca@posteo.net>
In-Reply-To: <2d4283b6-e379-cbbe-d084-91de4e023eca@posteo.net>

--vIV5MBH2sRXTQUvOOiVeGbC6XSEVLHU6K
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 18/12/17 14:29, Nicholas Joll wrote:
> To Whom It May Concern
>=20
> What happened. (1) On a system on which Wireguard was working, I used
> the 'TimeShift' program to restore Linux Mint from backup - twice, on
> one occasion including within the restore a reinstall of Grub and
> rebuild of initramfs. (Points 2-3 that follow apply to both versions of=

> the restore.) (2) After the restore, WG still worked. (3) I updated the=

> kernel (on one occasion before rebooting, or another after rebooting).
> (4) WG no longer worked. When I tried to reinstall it, it gave
> 'post-install' messages about how the dkms module was installed already=
=2E
> All manner of package removal and purging and file deletion failed to
> achieve anything - until I discovered that deleting a file in
> /var/lib/dkms/wireguard/ (together with 'sudo dkms --reconfigure -a'?)
> fixed things.
>=20
> What should have happened. WG should be able to cope with such a
> restore. At worst, it should give the user messages about how to fix th=
e
> problem.
>=20
> System Concerned: Linux Mint 18.3 Cinnamon; WG 0.0.20171211.
>=20

This sounds like an issue centred on DKMS rather than WireGuard itself.

Do you have any other DKMS-managed kernel modules? If so, how did they
cope with the restore process?

Which WireGuard packages are you using?


J


--vIV5MBH2sRXTQUvOOiVeGbC6XSEVLHU6K--

--AdkarkfNqPXX2WNEXdoakfQ51oOvJU8wO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJaN9P+AAoJEOAwQ4KMP/S7LZYQAKx/HDNzisSAw8y/p0R0gfsy
lBsD0cRuwshSN90sSfIh68EeDIWU40XApMUMdzarBsAvzAHuaZu9T2agNAncXkiD
qNPfuzMMWRau3hSxd444edragd0eVQcVSaP49dlYNxElQ3jRp7byEtQj52DebyhX
/6DnGYVS5swFqwGTvl8MFduhPBvfY4A8l5ace03OaNGWsLpJS0L+VHp7dcbNFHT/
kKwpUZ07UAwu8gxCuwMkMIhxAH4r2lgCLnzJfhIT2x8Jk5eSP+Tjoh4UeVL+GIUC
kHNRLFvoQXUank8U86fJZi6cd98nNvbdk81NxmgIPc+owBHVcYNCLerrze9qc4ET
cVWVJZk9rgbwMIHwloa4LD/iVofb3zlgpjktYjPJSmQOjHCEUaN40vr8yDx3fkcr
D4qx/iJlbIlpBooiJE9M62sJSGZRmya7OQjuEMoCqMwMgRR7Kh32wgng2v+ODSYZ
BSLEREGXOn+AMuyqGNmCv9hVm//A0MnGMS1LpLSYqH4UkF7YuL4oouoahBbnZEOz
+iDsbx+Sn2Xn5skPlxaQIypv6g5gW/bnfpFAOLhcOXguMor3pxuillF/i7xu5W9S
t+aaXaC7ZnvmlRJzsfAZhn0URlMcUzFhhZHv6LcNZ401AoWAT5LAU0qKkvel3ItH
PGMMJbqsU3vVT+HYM4D8
=BafG
-----END PGP SIGNATURE-----

--AdkarkfNqPXX2WNEXdoakfQ51oOvJU8wO--
