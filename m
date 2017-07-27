Return-Path: pants@kent-dobias.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8abf76c8
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 19:40:18 +0000 (UTC)
Received: from mail.kent-dobias.com (mail.kent-dobias.com [5.2.75.74])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8da4b17c
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 19:40:18 +0000 (UTC)
Date: Thu, 27 Jul 2017 16:00:52 -0400
From: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
To: wireguard@lists.zx2c4.com
Subject: Re: errors building 0.0.20170706 and later with Linux 3.14.0
Message-ID: <20170727200052.GA30298@lore.localdomain>
References: <20170727171923.GA28775@lore.localdomain>
 <CAHmME9oQe1iRQk8rdetXWioMKwUA27W1vNUdq7KTmgzjg5KE4g@mail.gmail.com>
 <20170727195734.GC28775@lore.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
In-Reply-To: <20170727195734.GC28775@lore.localdomain>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Oh boy, looking at my own link it seems this isn't even the linux kernel
with patches, as I had assumed, but the chromeos kernel.

I'll write my own patch to fix this, just need to remove the
already-present declarations. Sorry for the noise!

Jaron


--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEESQHwQKRh1Whpo6HFI20K3+69dxoFAll6RnQACgkQI20K3+69
dxrpBA/7B4uzDKN6MsJpMTAzN3pvrlEavZxBiwdd8iamsykCV5qNrIsaYy9ZE9LR
Esgn1fErXv1b4EoNHxiMH7PzbLe719jGMlgSo1Q3IDVtSobomjAYIjN9S9keHAVK
nV6iavI+QoUEUIDy77lVAK+m7dkRKm1986HE5gK1rp7bpsNuL4TwrNqf4nPyi8LH
57RUfZeIXVDjz/PUKY1p3c5ddLK65mhB0bNgQEO5Z0ZrnNKzC7TXKh6HcoWqhySf
RxHG6gj0DWQq13J5kmiSVGvUXHtU/ahc+o+N9/ZLw63DH+GCAwuITqCNlz1co7o+
Abw7p3Gr8adHG7cZ8OnlmIZIoJiIaCStiG+ZsR6evlsvdQsmi/Y4/uiSYdEsm3XI
9CPXjmPKbpBSI98f7hxYxWOemwIdDRZ4r2ayK/jh1dh5N05Or6u0GJUVlspGBIUX
9rsBP8iKVEBO/vX2dZ2KMJCoO3EVpQTUiOh1LWHm19eNfcjCIk6oVt6/lwyoPyHT
oojaAW7+smR/NpGLJRK7jQ+QhWx/zNzpi8xmMRiKwXzSp8/OX/LzxAEg6qXZz5MU
6BJyksICAUUX4/a/CRTHxIFWotVzNX07SzVl1nyFwXvm9WYjL8KKyFy0OA3UkB/P
5ik8iP2NwACBKLc+m9MZhkvG98W23myRHPQpHqMTGW0YqlNU2aY=
=ipIY
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
