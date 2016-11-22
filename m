Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2591dbbb
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Nov 2016 12:14:17 +0000 (UTC)
Received: from phare.polynome.dn42 ([172.23.184.97]
 helo=tuxmachine.polynome.dn42)
 by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1c9A1F-0002Sl-RF
 for wireguard@lists.zx2c4.com; Tue, 22 Nov 2016 13:17:49 +0100
Date: Tue, 22 Nov 2016 13:17:48 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Message-ID: <20161122121748.GF20343@tuxmachine.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Il7n/DHsA0sMLmDu"
Subject: [WireGuard] Is nf_conntrack really needed?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Il7n/DHsA0sMLmDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I stumbled upon a build error on LEDE, which was caused by a missing
dependency to nf-conntrack (and possibly nf-conntrack6).

I see that NF_CONNTRACK is used only at one place in device.c, and it is
inconditionally required since 3106d632de ("build system: revamp building
and configuration").

Is the inconditional dependency really needed?  nf-conntrack{,6}
introduces another 50 KB of dependencies on LEDE, which means a ~50%
increase in the amount of flash needed.

By the way, nf-conntrack is already required to do NAT, so this discussion
is only relevant for (hypothetical) people building their own LEDE images
without NAT support.

Baptiste

--Il7n/DHsA0sMLmDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNDdkAAoJEL4B7CKgTi5G+SgP/A+YZaPBJdz6ucarb9m+uLA1
wIpV6gd8Di2F+6k7ZIziRZ3/BhY6IQlrYnBZdRCyyeEnr1UUdw1fqKdIq4dyQ4cg
/kbClbG0Iezpz8e3HvvICW3bnefx75iXw6qtI5NWXJsc1dYnBWTayYtJUhkud4As
OtAqF693kYeZp9y3HKnkVI87y/DNJ5pxpM+7febKBR1WcounAKVbQGYArG4ZmViS
orvqZ7pMdst8WR8O/sOnIXcraPa/T2dsbQk9Q9nunklhoyQTkStvTOhmmBTlZMCl
DevLe1oqquQj7XHencSRafvuORAxiDId0k4aSVjcPeE9Yo5WBabhwT/ZKdSmwa1Q
i6NJ9kgNJVkWGJZHq+FUkPrMB/UuRcCoxg77/sUozjRAutgchIHzN+Q3jbxL/CRI
lpS9RX7oDr+l6ytltyp+Af8nV6gy5jJ6AvwDYsRWiV8ibJHf/gqEtV8OI898opQp
jIW3KjMiZt7gdYof3oYxpi29sGPIciq9hThXI5UE/PVzjjKcB7zdKn6j64JA1jwQ
WmqDmpEPKf/2R+WAkvWH0JsfeC3F3wrZcwcv+v6CHHXXFPW7YlrvzEmv4J1ghGF1
xlSYxKHP+T7MqEGU6QrdqIEZ1lRZwbQ4Ac2h/24A6o4bkwaADdrYqD9PT5WQo78N
P6whrk1Yny6/so20VKLt
=ZdIn
-----END PGP SIGNATURE-----

--Il7n/DHsA0sMLmDu--
