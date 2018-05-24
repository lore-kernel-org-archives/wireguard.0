Return-Path: tomli@tomli.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8292b0d
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 01:18:59 +0000 (UTC)
Received: from tomli.me (tomli.me [IPv6:2a00:1a28:1157:199::5a76])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1471558d
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 01:18:59 +0000 (UTC)
Date: Thu, 24 May 2018 09:20:04 +0800
From: tomli@tomli.me
To: Luca Beltrame <lbeltrame@kde.org>
Subject: Beware of udp2raw-tunnel (was: [HACK] UDP tunneling over TCP for
 WireGuard)
Message-ID: <20180524012004.GA2588@x220>
References: <24602785.LeAoNilrza@aoi.marionegri.it>
 <f47035e6-8940-7f24-6d13-f645a76bc3a7@juniorjpdj.pl>
 <2691203.H8StyC36JO@leon.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
In-Reply-To: <2691203.H8StyC36JO@leon.lan>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>> You can use this:
>> https://github.com/wangyu-/udp2raw-tunnel
>> instead of socat to avoid TCP over TCP effect.
> This is interesting . I'll give it a shot in the next few days and see ho=
w it=20
> fares (and report back).

This is a great project, but the last time I've looked into the code, showe=
d some
serious problems, including hardcoding "iptables" commands and execute them=
 as
root[0]. It also comes with an "encryption" scheme "authenticated" by plain=
 MD5
in a MAC-then-encrypt basis, and never used HMAC[1], but still claims the e=
ncryption
provided a certain level of security... If the only purpose is traffic obfu=
scation,
why bother to have AES in the first place? But at least random number gener=
ation
has been done correctly, but instead of calling getrandom() or getentropy()=
, it
opens /dev/urandom with O_RDONLY, and read() some bytes[2]...

So, better compile the whole program with CFLAGS=3D"-D_FORTIFY_SOURCE=3D2 -=
fstack-protector-all
--param ssp-buffer-size=3D1 -fPIE" to get some protections. At least don't =
run the
program at root, it may break your system, set CAP_NET_RAW instead.

This much being said, I'm not blaming the developers, considering the fact =
that
the program probably involved from a weekend project and they did understan=
d the
existence of problems[3].

If anyone is interested in this project, a refactoring or a re-implementati=
on
is appreciated.

[0] https://github.com/wangyu-/udp2raw-tunnel/blob/master/misc.cpp#L1104
[1] https://github.com/wangyu-/udp2raw-tunnel/blob/master/encrypt.cpp#L278
[2] https://github.com/wangyu-/udp2raw-tunnel/blob/master/common.cpp#L48
[3] https://github.com/wangyu-/udp2raw-tunnel/blob/master/encrypt.cpp#L23

Tom Li

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIzBAEBCgAdFiEEJVIRsjlaWj4OSKDx+tPrBeiOjW0FAlsGEz0ACgkQ+tPrBeiO
jW1vbg//ch7Ta4JoZ4bNfaHAs7ngRahTuLhWGlCVQoXq+SZ/cxVfvn+CnaCYlxRW
gyFvZpz2fuMwvrM3qrEJV6uY/AcwYrjTHrUdlSYHI4TmV/Cqsd+aedDJuxhEBH5/
ogB0v8B+ZT5Z3CFDR/akRLVs6YQGHC53TO/p+3mmYDBD8gpzg8/ceJwP2q3XUiS/
aN6RODCj50JHO8WaowWyeImMqxuKtDZJBXOsIOGowjvCL2N20QdtFZcNxAwvQWY3
k1Qv1iUJIg8eWUy9iB3czUm0E0RvA3DC0Z8qVEUwiDUJlro48cByuCckxQqFh7jJ
zX6RbkaLapCMYqE/hjJP5fL86ZF9eb7cAA2jqe4vilRn2tZDbl2d1R8fvch/VKu+
wLn6/6aWKYHP5+qRpYGn/eB9pbnURcsa2hVkUN3EG7GByXV6eSyv238bgq1GjSmw
f6srVx0xZ+1L+7rLEOtcTAokHyVF21j9HU4X0EbRGapS1zdc/YBcND4jm4g2Ra8C
b1z841JJnkGMlFtJBvIi6XxpfTO85dwuCNyDl9hnSkaaEBCupkHdowTVFq3OHMwv
yl8+vtg0msw0GkqRcwMbfyIh3/xhyaWKBT9i5xShLk2U+cEPs6fySfv4pcjdZ3g3
0pRkYW7qTRpW3U+66J92M8t9s0vLvLOKmGM05tXFQ2rbiG2HadQ=
=UjEw
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
