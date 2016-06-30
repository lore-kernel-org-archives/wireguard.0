Return-Path: guus@tinc-vpn.org
Received: from arianus.sliepen.org (arianus.sliepen.org [92.243.30.131])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c7d16b3
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 16:29:39 +0000 (UTC)
Received: from sliepen.org (unknown [IPv6:fec0::1:204:76ff:fe14:6e86])
 by arianus.sliepen.org (Postfix) with ESMTP id 3BC9026504
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 18:32:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sliepen.org (Postfix) with ESMTP id DC2522200E7
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 18:32:26 +0200 (CEST)
Date: Thu, 30 Jun 2016 18:32:26 +0200
From: Guus Sliepen <guus@tinc-vpn.org>
To: wireguard@lists.zx2c4.com
Message-ID: <20160630163226.GJ3952@sliepen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="82evfD9Ogz2JrdWZ"
Subject: [WireGuard] Allowing out-of-band communication with peers
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--82evfD9Ogz2JrdWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Wireguard looks very interesting! I'm the author of tinc, another VPN
project. With wireguard, even if you have a single interface to connect
to multiple peers, you still end up managing which peers to connect to.
If you want to set up a mesh VPN with a large number of nodes, this can
become problematic. With tinc, you normally configure only connections
to a small number of nodes, and let it discover the rest of the VPN
automatically.

I believe it should be possible to have a userspace daemon manage a
wireguard interface. However, for discovering other nodes this daemon
would need to exchange information with peers. It would be very useful
if there was a designated packet type for this (0x5?), and that the
netlink interface could be used to receive and send these packets from
userspace, as well as some way to get notified of peers (dis)connecting.

--=20
Met vriendelijke groet / with kind regards,
     Guus Sliepen <guus@tinc-vpn.org>

--82evfD9Ogz2JrdWZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJXdUmaAAoJED9JDeuHHvn6soAP/0/wjjzVDSqlTnUXZA8qi+r8
zFwLR45AqlVfl4tYIV93W1d4MdFbe9s/tbpFkmFpWSqS36M10UUazjfz1ZeXP3zR
+lKGq3vPV8g3RnPlkzd144ywJtg1r1Rjt7qVzLOEHM3XI3AOtIpFxQYGNZWAy7gr
+Bke8Tk4rhEdIIO9I2DpARhCnNAHcZFF/W9fW77Mi7vW3mG71W/F/nl7JemrVRk4
Tn1sQu2rAtcEC4Vr1BLKzvXgm/H8xIKGFiK8gO2KyDNS9W7NJLVU8+aJKeva8MCs
orutxvtD3kK27MOCpwHrsTF4wn40y9uyCT1ti1mGCJQN68BYIjpMA4VNGJI3EZxa
alK/rOS2NL8rpKi8bcYJOVwJ97n5rKKD8s7eFp8FsufzTZQOKndlVKS9TJTOF96W
/sOu9hKsX31zjjp+tyHhGPP0KOH58uO+0iF+g6Q5/6kqVhiypM2KrgSNQ0sZ+4ml
N+fEv19ey2etJbLQENMYqTrnr6/6mBw95ACPQ7G4cb6sOpP4+HHsoufHUl4iATy0
PgxMCdpuqHSD7Ir1A+Y1/l4VSXR1oXJdD8qF9hs/jINAwbljFOTLGmqY/ysFwAYD
I3KpYxV8KVR2crlNHJ34VBydEl55jaBfjww7MQAPx0QRDFdEuk4Use9sfdr2RxfF
aEc4bmfLlGUXsoMYUTm6
=DAUz
-----END PGP SIGNATURE-----

--82evfD9Ogz2JrdWZ--
