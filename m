Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 319a7a30
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Jan 2018 08:56:59 +0000 (UTC)
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
 [209.85.215.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 391f21df
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Jan 2018 08:56:59 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id u2so4481334lff.7
 for <wireguard@lists.zx2c4.com>; Wed, 10 Jan 2018 00:59:25 -0800 (PST)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Received: from [144.32.48.210] (pc210.cs.york.ac.uk. [144.32.48.210])
 by smtp.googlemail.com with ESMTPSA id a15sm3262760ljb.11.2018.01.10.00.59.23
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jan 2018 00:59:24 -0800 (PST)
Subject: Re: WireGuard in systemd-networkd
To: wireguard@lists.zx2c4.com
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
 <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
 <87efmy42c0.fsf@fifthhorseman.net>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Message-ID: <f575ed7d-47a8-d90c-384a-16351a4f84a5@york.ac.uk>
Date: Wed, 10 Jan 2018 08:59:22 +0000
MIME-Version: 1.0
In-Reply-To: <87efmy42c0.fsf@fifthhorseman.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TyiC4bv5nJzyb8beCA8sxa6YT6h5NlHyC"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TyiC4bv5nJzyb8beCA8sxa6YT6h5NlHyC
Content-Type: multipart/mixed; boundary="oZCrTpCBdVqBLfuPYsg57fN3lxca2Hzzs";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <f575ed7d-47a8-d90c-384a-16351a4f84a5@york.ac.uk>
Subject: Re: WireGuard in systemd-networkd
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
 <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
 <87efmy42c0.fsf@fifthhorseman.net>
In-Reply-To: <87efmy42c0.fsf@fifthhorseman.net>

--oZCrTpCBdVqBLfuPYsg57fN3lxca2Hzzs
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 10/01/18 07:09, Daniel Kahn Gillmor wrote:
> systemd-networkd is shipped (but by default disabled) in the systemd
> package itself.
>=20
> At the moment, wireguard-dkms (the kernel module package) Recommends:
> wireguard-tools (which supplies wg(8)), which i'd write as:
>=20
>   0)  Recommends: wireguard-tools
>=20
> So i think we have several other choices:
>=20
>   1)  Recommends: systemd | wireguard-tools
>=20
>   2)  Recommends: wireguard-tools | systemd
>=20
>   3)  Recommends: wireguard-tools, systemd
>=20
>   4)  Recommends: wireguard-tools
>       Suggests: systemd
>=20
>=20
> Of the above, i think i'll probably either stick with 0 or move to 4.

Sticking with 0) makes most sense to me. Just because systemd (>=3D
23something) supports wireguard, if wireguard-dkms can't rely on the
support being there then recommending its "own" tools is more reliable,
and more portable.

Alternatively, perhaps an "Enhances: systemd" ? e.g. wireguard-dkms
doesn't _need_ systemd, doesn't work any _better_ with systemd, but
definitely adds something _to_ systemd.

J

[1]
https://www.debian.org/doc/debian-policy/#binary-dependencies-depends-rec=
ommends-suggests-enhances-pre-depends


--oZCrTpCBdVqBLfuPYsg57fN3lxca2Hzzs--

--TyiC4bv5nJzyb8beCA8sxa6YT6h5NlHyC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJaVdXqAAoJEOAwQ4KMP/S7dZYP/2VTQ9yiR95JCeuQLNesrOii
6eoRHEeFUusK/uOs51cJpQ7764agW9Es+64Mxr5ERalDQoetmMdAST5ofrF24Lt8
DtH7uuknwj3cZIdLlzkJ4cs96rVKdqX3dmBhHLaPNIewjBx6Eo68u4SiwbtCjQU6
3hK/ejtPjGnxbtCQbEQqXT2CtIXExOoPjxXooS2jjN90ZEk3FIWuXPJVIvjs1hbf
cQOurt5hwnZjji9ION21r57RpMnKFWlSDsJu2TKDRuLLZMcBeFc5yxGmLYZp0w3V
AVw1vs9ZYpd3k0DBHdWocPm+MwgEhbkCMQD8s5+ZzGT6TJGUVFupQRloN/8pSXDN
dqU25KhmFLLRPui7tlq3Ui4ITI6UzsNZouWGwtjd8szlmGigRxzdqjgcdTeOZQBf
lQOJfSRQTrbZTnpp/VvB7gLkjP0tcg7NYZovZ37arC6C0q7kZgGb/KzRx2FX4+OF
ZS8fCv/pVTEXHucXBdUM9L5bS2KUAaxWG49D27rzFZA/Jw1Oz93v9mPxKLhiPXl/
pO2BOIfruGtLgUgRoGwEVOGVmOnJ7nxE/nFpamBx3Q+0Y7kzXNuUmsUnqLN01fvl
sZTHoJaRQxZMQT+J+YYqGSH8czaRbHE1NjBcHA8gXjyAvPMJl+gEkX6LDgICxXx6
E800hn70X/fff/2qsPCQ
=oMKT
-----END PGP SIGNATURE-----

--TyiC4bv5nJzyb8beCA8sxa6YT6h5NlHyC--
