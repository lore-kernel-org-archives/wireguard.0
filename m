Return-Path: mdt@emdete.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29abdf18
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 12:56:47 +0000 (UTC)
Received: from emdete.de (total-communication.vfnet.de [80.84.1.14])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd190571
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 12:56:47 +0000 (UTC)
Received: from localhost (emdete.de [local])
 by emdete.de (OpenSMTPD) with ESMTPA id 21fcc285
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 13:00:12 +0000 (UTC)
Date: Thu, 18 Jan 2018 14:00:11 +0100
From: "M. Dietrich" <mdt@emdete.de>
Subject: Defaultroutepiercing
To: wireguard@lists.zx2c4.com
Message-Id: <1516279577.16nr5x0y18.astroid@morple.none>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256; boundary="=-kwilt9Hnc0Wz1IpYKLQX"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-kwilt9Hnc0Wz1IpYKLQX
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

in case i want to use a vpn to route all my traffic through
the tunnel i have a kind of hen&egg problem: how does my
client contact the other side if i switch the default route?=20

the demo script adds a route to the other side in the
moment of establishing the connection like this:

	163.172.161.0 via 192.168.0.1 dev wlan0

(assuming 192.168.0.1 is my router). this goes well as long as
the router (or the interface) doesnt change. this is fine for
most VPNs as they fail when the connection is lost.

wireguard is ment for the modern world and survives connection
drops. but the route must be reestablished afterwords in case
router or interface changed.

is there a solution to automate that already? i know this is
not really a wireguard topic as it has to be done near dhcp.

this should have been solved for android already or am i
wrong?

M. Dietrich
=

--=-kwilt9Hnc0Wz1IpYKLQX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE8ECycNYHT6atlYQywVmjQWUJtykFAlpgmlwACgkQwVmjQWUJ
tym8tBAApcbFWr7o85yDCox5P4ubwdlOuJmiJoOeAVY74iACk/tJfuEqTusNCZII
pcWzF6lrvtxKTjuSiqyPAppfag0HPoazBTfy3gxLgU+MASnDhGVFq8DSAYt+j2d/
dwf3kGZmsMIwJjSfcmOvlHlMWSSnDBBo34MHA6IRoP1RR4W7NJNpnSgzKqO4cSeL
WFMYwz8tZCdWzmh84N8cEkjSI19eQFSnwcrJTJZAbYszTysTaVg0weW0GOt6Piae
rMyXGI14ATJYVKxHgxhKY0DefkUPzK/hiSyVhwkrWqSfwQcehBhsjF8L0BSVbqkt
VzZ2/iHvmOdVsf2FCWbdR5I9JJdTNBf2vS5MM5n+V+CuwAer++C3laLrmej4TF0q
8C/hISMQBnYRsIrCSx5xYuL0Mz6E/A4IZl8dE/HedkYGShGp2X/+k1qw/OvCKNIQ
WJ+VuquWuDHvY11Qp1sDJtrvK5GwJaK7i7BRggmJZfGqRvLx1SeryuYWwXTQiVjh
Ba+VmHmAQ6m6MZ/gbwjBB/5MU9nW/wncQfaBUPIidcjULSxBY029BVDFgO9AhIeL
aUyJ3783gmII2N/hqnFKT7stnGtXZKLSsiLbjrblxC3hYqE6Zu6rfSRjKrFzDxyc
QVTdUlSamdztkW8JexB95AgEeilqPPg0WNaq+lngfJOAE8jSunQ=
=dte5
-----END PGP SIGNATURE-----

--=-kwilt9Hnc0Wz1IpYKLQX--
