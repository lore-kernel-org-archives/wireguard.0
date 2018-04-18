Return-Path: lbeltrame@kde.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f635d06
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 21:12:33 +0000 (UTC)
Received: from tsugumi.dennogumi.org (tsugumi.dennogumi.org [5.9.18.77])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3908a1bd
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 21:12:32 +0000 (UTC)
Sender: luca.beltrame@dennogumi.org
From: Luca Beltrame <lbeltrame@kde.org>
To: JuniorJPDJ <juniorjpdj@juniorjpdj.pl>
Subject: Re: [HACK] UDP tunneling over TCP for WireGuard
Date: Wed, 18 Apr 2018 23:12:30 +0200
Message-ID: <2691203.H8StyC36JO@leon.lan>
In-Reply-To: <f47035e6-8940-7f24-6d13-f645a76bc3a7@juniorjpdj.pl>
References: <24602785.LeAoNilrza@aoi.marionegri.it>
 <f47035e6-8940-7f24-6d13-f645a76bc3a7@juniorjpdj.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2789484.IBvMgNIKhy";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--nextPart2789484.IBvMgNIKhy
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

In data mercoled=EC 18 aprile 2018 21:29:11 CEST, hai scritto:

> You can use this:
> https://github.com/wangyu-/udp2raw-tunnel
> instead of socat to avoid TCP over TCP effect.

This is interesting . I'll give it a shot in the next few days and see how =
it=20
fares (and report back).

=2D-=20
Luca Beltrame - KDE Forums team
GPG key ID: A29D259B
--nextPart2789484.IBvMgNIKhy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEkxcLGs5Ymg3lt6kxjfYx/QIdsMUFAlrXtL4ACgkQjfYx/QId
sMUpzQf9H3crzeauVrHvJjdYwnudXaZpEQwygvHRcDHu/0gCg9MTj+Bj8tozy2tR
ZmzcD+aH2gha2nYt/zxqDkEEc0JF5Ov58CO8uk7N/m386NMg4qfS9g19TM4StdiD
RmOMVUrSKLBj19ieMcULAfI9WKHDYU/fnY86PxVJoZXHAc4HFmNCG/tBY8tq/wQu
OWq+2qAC08t8L2ge19v0SAkNRctW+/I80ifB0R7N7nJP2AWMcYU83lpx15ZVEj6p
BB4Ewz4e/ZEZrdU9mpHyyImENzAZAuftkLfgV8RyHdmgJWe2spsOrTuZaNVipK+N
dFb0RcF8o4n2o8odo/O/wteiECWifA==
=NAue
-----END PGP SIGNATURE-----

--nextPart2789484.IBvMgNIKhy--
