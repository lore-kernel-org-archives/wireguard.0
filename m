Return-Path: georg@riseup.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1cfd016
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 11:35:09 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d34d37aa
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 11:35:09 +0000 (UTC)
Received: from cotinga.riseup.net (unknown [10.0.1.164])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (verified OK))
 by mx1.riseup.net (Postfix) with ESMTPS id BAC021A0579
 for <wireguard@lists.zx2c4.com>; Fri, 10 Nov 2017 03:38:44 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by cotinga.riseup.net with ESMTPSA id 732644E6D2
 for <wireguard@lists.zx2c4.com>; Fri, 10 Nov 2017 03:38:44 -0800 (PST)
Date: Fri, 10 Nov 2017 12:38:41 +0100
From: Georg Faerber <georg@riseup.net>
To: wireguard@lists.zx2c4.com
Subject: Re: Close the tun fd when closing the device
Message-ID: <20171110113841.GA20381@debian>
References: <20171110110033.24210-1-aurelien@chabot.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Re7H+V5lQR2Zv/pu"
In-Reply-To: <20171110110033.24210-1-aurelien@chabot.fr>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Re7H+V5lQR2Zv/pu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17-11-10 22:00:32, Aur=C3=A9lien Chabot wrote:
> This patch was part of the android development, as this is not
> specific to android, here is an independent patch.=20

You forgot to attach the patch.. :)

Cheers,
Georg

--Re7H+V5lQR2Zv/pu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4p3Q++yWB9ljva4NWtdbQU6kFmcFAloFj8EACgkQWtdbQU6k
Fmca2Q//QrsvTfRckw7f8bAjJhbSrk++NMUWuCjpShy1Iakm59CTCm4Zu5YvUPp0
KkHZ6sBhCfmbKabnLIfDmcMsgcEhu+2EgEiScSiyxMeZSs0amxwX6++9Y95U1k2D
yVEnfeJURDFMNNcM086fqz3mEvOSE9oEePupZlcDdmOHp1ss36gcHWq+CXqm8GnC
ImuLp1pfqvAnQAwwZc2R6YRxhpozgLeug0BqJByWWffnqf0onNpf4ZAGo+K5UJw/
A53TmWO85+DA3BgbYmOzum9o57VBF4LCaAVAFjQOTycvtDKP0dfRYRFE0HBlKvD5
x0ug2oHcOPlOV/UONg8b3SnUyMTDI2BJullPRih2Hv6rHLOk9HmpvY2+VsIWN96e
qHeCsK2yS42EYaBmT9eAO7LPOpsC6MA4lFFmb/R8KR3MxwTyxHvvdi12oUHmvCXp
pyJd4Gcjr71ctU75ATsDUw7hWK0MIEAIkDiIwZ6fizo3NcN+8TJWTIePROIT6w6G
Ypg3pTB/8KOaydYsaYLRQtZoRCR/jhgiycx+ddQhn44NfyUViL6m4taeAZEEo47l
Pnw2dTTeU3d/hQ/7IFwZ2TBY7j8ljVSmn/FL2QDxlYUtkcdjpbPpjaKLFzYCxJEF
CZBUZjIGmbTtXsR9tMFftiX91/hYospgEhK0UyjsL0NZZCANZYo=
=jk2h
-----END PGP SIGNATURE-----

--Re7H+V5lQR2Zv/pu--
