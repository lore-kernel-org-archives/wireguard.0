Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 475ea3e0
 for <wireguard@lists.zx2c4.com>; Sun, 9 Jul 2017 21:12:19 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3592d080
 for <wireguard@lists.zx2c4.com>; Sun, 9 Jul 2017 21:12:19 +0000 (UTC)
Date: Sun, 9 Jul 2017 23:30:20 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Subject: Debian-based configuration for wireguard
Message-ID: <20170709213020.GF22784@tuxmachine.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="juZjCTNxrMaZdGZC"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--juZjCTNxrMaZdGZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I wrote up some configuration I use for Wireguard on Debian:

    https://wiki.debian.org/Wireguard#Configuration_on_Debian

The goal is to reuse functionalities from /etc/network/interfaces, which
is quite natural on Debian.  Simple use-cases like the point-to-point
tunnel don't need wg-quick at all.

Baptiste

--juZjCTNxrMaZdGZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAllioGwACgkQvgHsIqBO
LkZphQ//WOuCJMAi9z0FEBQyC44oOg5LMpMTuKdM/p7vBlMr1C/YiJA4husDAESY
al2gamZ5mlwxSxPWMeDqyZcfKbICgU8yMEfcpfjOwmGotd2nE0sw5iResaQnL/Hx
WlHE3BpFX9SgeaJoYw5umvXAYMXoyadkry+UNFatQJn8KG8HJRyZJhNBaz+aSBpM
qQ0mOC+CDs0doX9iWa2xVNu1usmnlIqnV/xaSFxf/yQWVilGhK42iC5TRKeVuU+H
ZhglZsz/uMbRrKN9ajUm6gkhhfdD7TG/3jgxXsp8l7rGqBMRh2f5DTmJu2+qwN1T
OjTPHH0VYQCIV2KYSHUWBWJKldEQKtNO3D/623LJljc7NhDyaAIhKTmv8o7JP03P
8pzWxaKJ95cjzFF4Xot6vrxs1iztHw9JJnaIjAQBp8xLmG5xaLwbJcBK3LgcOcpw
b+vFt3E4aiyGIgePjPQ0WLiNPXuRJKzpAbWlagZaUnLhpnKpocrFWOmxeL5noah6
gAmgFDfXgxCsfwh1DIxf8q89W3gqJKf0kbqm2JuQhTJ/UyKR+0ocBCPvYEQD/sWu
Tl4TdWJcCwqQAKbAaEE/ep9JlG6nrR6Zj7BkRw6PhcVnQl+35Cb+JLaQ06vPt+b/
aES1XbcXd4mcOn8AZSuzJ0d9RjJqLvs1DgTKM9cqGbkw1JCHmno=
=KanQ
-----END PGP SIGNATURE-----

--juZjCTNxrMaZdGZC--
