Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac9b51ea
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 May 2018 19:38:53 +0000 (UTC)
Received: from mail-wr0-x22d.google.com (mail-wr0-x22d.google.com
 [IPv6:2a00:1450:400c:c0c::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c38bbe7
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 May 2018 19:38:52 +0000 (UTC)
Received: by mail-wr0-x22d.google.com with SMTP id h5-v6so8398361wrm.4
 for <wireguard@lists.zx2c4.com>; Sat, 12 May 2018 12:41:53 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Need for HW-clock independent timestamps
To: neumann@cgws.de
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
Date: Sat, 12 May 2018 19:41:47 +0000
MIME-Version: 1.0
In-Reply-To: <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YGPhLpxRJF9AosHoOGFZO4KzvY1pzFPC1"
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
--YGPhLpxRJF9AosHoOGFZO4KzvY1pzFPC1
Content-Type: multipart/mixed; boundary="6AvMJhW9IB42rp8KmF8LiUkgBjKq6Ews6";
 protected-headers="v1"
From: Aaron Jones <aaronmdjones@gmail.com>
To: neumann@cgws.de
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
Subject: Re: Need for HW-clock independent timestamps
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
In-Reply-To: <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>

--6AvMJhW9IB42rp8KmF8LiUkgBjKq6Ews6
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 12/05/18 19:29, Axel Neumann wrote:
> You want WG to secure your network. So the suggestion can not be to ope=
n
> your network for a pretty insecure deamon in order to get WG working.
> This would essentially allow attackers to a fake the ntp server and the=
n
> block WG forever.

Someone in a position to fake NTP (which needs bidirectional
communication) is already in a position to block WG forever (by simply
refusing to forward its packets).

Additionally, there are a few very well-designed and secure NTP daemons
out there (such as OpenNTPd).

--=20
Aaron Jones




--6AvMJhW9IB42rp8KmF8LiUkgBjKq6Ews6--

--YGPhLpxRJF9AosHoOGFZO4KzvY1pzFPC1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJa90N+AAoJEIrwc3SIqzASZSoP/18k6mypu2aiJp40bipo7nfH
TNtM7SZqt2zMDnXn6+5gfJMbIerD6aS3huFZjkiGfRtBVp5tu5TGjq8apB8U7GI8
5c74hmnbliukcwrHV3oO/W/MZnuimv8mXmfuS/pJQiBHOTQUj8LZaItq7A8ZHWqc
bDW1vOFokOZjo6sweqmx6xFWErUlPWfL1jDaIMTFJb2Nw4tjL14DcklQvfmxQ/Pq
ensKwKwtXYuZHDpuOpIondSaJxc7az0HGlZ0N78yJI8kvLgt5/zh3OzKtIrv89qx
KMxTPiFn0QecDKElm29rHp3C44twRY5W/g/gJDPsb2J+aNTSU9+HlNkmLkDPdEfD
62OL7wKXRh1zdE4s3RV0T7cbaIQdRjiVzkX0fIwH1QyWHM32UZDx97+IpCSXxHsl
vougNPfMn2Bnr2li9JFsryUnA7OybcCM+JgFcRTqF/iYmjAvxNccSdmHb0oiAQ9B
IQtmOI7bupotog8ddIYMZ0pp4UuT1XcI/ENmO1nuXsuShAuyQ/UBNdFNL98IEW28
spywPw3kvN6NQNMnwcnNciKDkE9w7A0aE1itlurm5v2mJEu2CsLxXBb5tQSjI+/z
Zd1RRqFaPwJLm37o0HpCAXbAQIt3Sp4nzraZ3hGXFMNE/1XJw0qJ6/ANPDOhfyU1
vq3KDdM6zQxB9IRzFfbM
=TIp5
-----END PGP SIGNATURE-----

--YGPhLpxRJF9AosHoOGFZO4KzvY1pzFPC1--
