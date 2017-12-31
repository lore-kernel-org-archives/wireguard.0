Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b48f7b68
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 00:28:43 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ccae4f3
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 00:28:43 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Outback Dingo <outbackdingo@gmail.com>, wireguard@lists.zx2c4.com
Subject: Re: wg on arm 32-bit
In-Reply-To: <CAKYr3zwZC7QMyLZJT55MquxSOuJsvBO3JrNntFEp23egqJAeKw@mail.gmail.com>
References: <CAKYr3zwZC7QMyLZJT55MquxSOuJsvBO3JrNntFEp23egqJAeKw@mail.gmail.com>
Date: Sat, 30 Dec 2017 19:29:45 -0500
Message-ID: <87incnhh8m.fsf@fifthhorseman.net>
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
Content-Type: text/plain

On Wed 2017-12-27 12:57:47 -0500, Outback Dingo wrote:
> seems that wireguard is not capabl;e of building for 32bit arm?

here's a list of successful 32-bit little-endian arm builds for debian:

   https://buildd.debian.org/status/logs.php?pkg=wireguard&arch=armel&suite=sid

if you click on the "Maybe-Successful" links, you can see logs of each
build.

So there's something else weird about your build environment that's the
issue here, not the fact that it's 32-bit arm.

Regards,

     --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEDuW+l5KC2AufdUDxzNLtlNIXOekFAlpIL3kACgkQzNLtlNIX
OennCRAAg+mcfIym/K9wcnrHZUqslBaK8X5N8n0bEoszwEkvPuJIQJ01QZiuaHkS
InLd7UY07J1rweFWtSwL/WHNBd49yYzKItbyUeAQbfeP7ao7sl0kqirgBCePFyi8
L1UMYD4mt8qz3ycj+ZRVBiO8iLCgiH01LBonbASVPQ1Wj0yEKlesgyrfXYUuetCP
t6+rF/XSnoC4YbOMDeI2szR9NULCY8nbDYMnqILZLEtF04enjXdEX55BJxhF54c3
u31IpXVwlSvZS6geyn2MouTo+menJOrfsmSH+6vik55xKCmGiqpDsk9Kq9PijhOa
uW0R7B5T5RHktS1xqZn/ewekQ7AJM9O8FFdvB4nMJ4Z41Qn+fvzAefIqITkS/av1
6HznRSxms779vi0y8Z4VERS1nGhHa7TRKfxxyOQIOdhG7HP/M7+HMXrWHA/RyAl+
lVIkTuq7zJwaGSPN/ETAzdyyx5a/zcYlLF/3Tgs5oowUCUSngwgnFr1FWQOfVpGr
Jv1BbwrjXlPgVn7DqoUX4da+4KXo01hWNLHXtiCa598SsDPL7BOWeSBlvN9Kohc1
aGG+AJCIfL+s70B2Oja5c0aIAhAsCX9VW8v1yg5qZ1VNlvK+OZnvkwo6vV1qLmjF
sxLSpIveb/2fFUJm1pZzRscWieuZY+vkBYgPSHvpJArSn7cz/5E=
=VjCp
-----END PGP SIGNATURE-----
--=-=-=--
