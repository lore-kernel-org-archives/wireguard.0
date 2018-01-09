Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8aafa4b3
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jan 2018 17:01:05 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 808b5887
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jan 2018 17:01:05 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: WireGuard in systemd-networkd
In-Reply-To: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
Date: Tue, 09 Jan 2018 10:20:08 -0500
Message-ID: <871siz6ouv.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue 2018-01-09 14:49:13 +0100, Jason A. Donenfeld wrote:

> Thanks to the wonderful work of J=C3=B6rg Thalheim, WireGuard is now
> supported inside systemd-netword's .netdev files. The syntax should be
> pretty similar to wg(8). Expect for this to be released as part of the
> next release of systemd, where you'll then be able to read the man
> pages for using it.

very cool!  systemd-networkd end up invoking wg(8)?  or does it interact
with the kernel directly?

if doesn't need wg(8), then once the new release of systemd is made, we
may want to change the dependency recommendations for the wireguard
kernel module packages.

> Next up - anybody interested in providing support for NetworkManager?

iirc, NetworkManager imports a big chunk of systemd in each release
(yuck embedded code copies).  maybe it'll import the relevant wireguard
bits as well?  that would probably make the NM work an easier lift.

     --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEDuW+l5KC2AufdUDxzNLtlNIXOekFAlpU3agACgkQzNLtlNIX
OenZJw/9E6D96CPQf4vnLgCIDqQRsU5XQqTgMhZEfw9LiR44yzcnLLz2iSeHHWLk
qUq6ysX1Hc69v+oS65nzCKt2iHi6WXi/P/mxDkDIuCu40jNeOCxsKoG6Y0jMf6y/
Dg3X52yxIXmooQxjBZudeGZjJ19YM7+bU7x5Y0yz+R4yk8fAO91K1ykWazqrPR5D
jUT6EDYa7SzW8pkzKW5753N0RjVVWZEE6T4i+K6fRbdeSt2/Ihc4ygtAvwHcxXhg
XvBjDSD6Pluqh+ePUySUUFReBg0BPSKcJ01flSNLY2rzs3+847voey+89LlkyYuP
fu7AhJaodHPEinbPssNFiF51ozFmfxrOPysOFWRHUbjl8+Z45KrfxJN+g8VX+cyW
KYFKcsrj2SehrwBqHntpsJq6GzvuMZj/ED02zU8SUk89dBV7vDAJIJjuvGQZko6v
FOAWzQH/MBCJ2pHs6RohWJv9nd1pIQuTniF5hUXnXb4NMnFASQkqUnftp3R+iNM8
CycW6KDpufbCLfQePf0pMM5zzwHllONx7gQ7keGC/TN2wYBDaTIgh3GaJS/QNxd9
CeJTRFxx8XDxdRYE6qB7l+3PPWhjhQkvBXauwcoAGfF3BQMtCUBWHLMUi5rBdpp5
TNjhpuFByd+oguhA6o9HwUTh+2UH+yeYby5cHXP5PfEJv5gxfeQ=
=Lind
-----END PGP SIGNATURE-----
--=-=-=--
