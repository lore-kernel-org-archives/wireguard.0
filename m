Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 522b76fc
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 13:26:49 +0000 (UTC)
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
 [209.85.215.48])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48af32ff
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 13:26:49 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id o89so2092420lfg.10
 for <wireguard@lists.zx2c4.com>; Fri, 19 Jan 2018 05:30:24 -0800 (PST)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Received: from [144.32.48.210] (pc210.cs.york.ac.uk. [144.32.48.210])
 by smtp.googlemail.com with ESMTPSA id 36sm379024lfx.13.2018.01.19.05.30.22
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jan 2018 05:30:22 -0800 (PST)
Subject: Re: decoupling version dependencies from metapackage in debian/ubuntu?
To: wireguard@lists.zx2c4.com
References: <CAHmME9rU+n6bMB+eYKu74yVn2bNkMJLX=FP-XbfKt+qjsoTVYQ@mail.gmail.com>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Message-ID: <0e44b316-28b8-ec1f-6507-7701668b79c7@york.ac.uk>
Date: Fri, 19 Jan 2018 13:30:21 +0000
MIME-Version: 1.0
In-Reply-To: <CAHmME9rU+n6bMB+eYKu74yVn2bNkMJLX=FP-XbfKt+qjsoTVYQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BNZuHz8lBQ6tpRcNiUEFUbEHUkX5iPNYl"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BNZuHz8lBQ6tpRcNiUEFUbEHUkX5iPNYl
Content-Type: multipart/mixed; boundary="xVCTt39h6NqqmXTBXplyD0qg7LyZfjejz";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <0e44b316-28b8-ec1f-6507-7701668b79c7@york.ac.uk>
Subject: Re: decoupling version dependencies from metapackage in
 debian/ubuntu?
References: <CAHmME9rU+n6bMB+eYKu74yVn2bNkMJLX=FP-XbfKt+qjsoTVYQ@mail.gmail.com>
In-Reply-To: <CAHmME9rU+n6bMB+eYKu74yVn2bNkMJLX=FP-XbfKt+qjsoTVYQ@mail.gmail.com>

--xVCTt39h6NqqmXTBXplyD0qg7LyZfjejz
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 19/01/18 13:21, Jason A. Donenfeld wrote:
> The users' issue seems mostly like an Ubuntu problem: they build _all,
> _amd64, and _x86 immediately, but delay the other architectures until
> later.

Just for pedantic correctness, packages are built as and when builders
[1] become available (+/- some "special sauce" [2]); there are fewer
non-x86 builders so packages take longer to work through the queue.


J

[1] https://launchpad.net/builders
[2] https://help.launchpad.net/Packaging/BuildScores


--xVCTt39h6NqqmXTBXplyD0qg7LyZfjejz--

--BNZuHz8lBQ6tpRcNiUEFUbEHUkX5iPNYl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJaYfLtAAoJEOAwQ4KMP/S7Eg0QAMqSmD90g763I0oqnWL6mEgq
ErWLCH/L9rT6Dq5FJ7h91t2c2MCBFL09aOzRyGRY84sj4+jPBncr3wTg/tLJSnBx
9RgWzqTz9gW2qL7lCaILeh9yeOaDqGe9bPdbsJ1uvbMldr6bRG1FZrqf2ebToLi2
YcmTJlALVgVqPTpKD7Qh1rtWrBsu3uJ1KDZN5kYOu+agSuQ4KNJQ3VfequBOSN3p
f9vdKtg+KBfDEOsm6nvudS710uFe42Q52MlJjpI813fn0rwbuoS704DOLYTWOrJm
bnErGHFP5tw4qvWDUvW3ma5vDQqGV5eT407R0k03Qxk+m2/qftinau9U6zpNwg+s
8sORTsWeca53vhLBMGF7lrjgIKI1laiDzSPXxIlvMi78lyErI2IsutxFSFEt67Na
EEINNhKb6xDuedZ3brsaKfiTyRh70V0IzHC1+sAn+BtW1G8C/RnZpzcSaMT2c48v
xrloAt5W0XsDm0e2qJFS/ZOPpHSRep3KuJX1gWQ2YjC3NAs1y8RUtmrEfUFNiytF
BJMPaOshmsYY2mKoJxuPwJLB+1369VvV/KK3R0YNs3CxDuDgU5U5ZQXpTJWtvtQM
26PeoCflq2vX68Y2iOlMGhOg9U9bhGC8XSZtDDOLTaHtK9doeBkEl9V6G4XxqfPA
2iGTXp1XTvDjDF9jjrKw
=wl7e
-----END PGP SIGNATURE-----

--BNZuHz8lBQ6tpRcNiUEFUbEHUkX5iPNYl--
