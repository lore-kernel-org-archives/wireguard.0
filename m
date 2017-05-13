Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5eac81ba
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 06:57:53 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23c5d16a
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 06:57:53 +0000 (UTC)
Received: from [172.23.184.97] (helo=tuxmachine.polynome.dn42)
 by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1d9RAS-0004mN-Sy
 for wireguard@lists.zx2c4.com; Sat, 13 May 2017 09:08:44 +0200
Date: Sat, 13 May 2017 09:08:43 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Subject: TX counters not updated on wireguard interface
Message-ID: <20170513070843.GB22218@tuxmachine.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

While trying 0.0.20170421-2 on Debian jessie, I noticed that the TX
counters are not updated:

$ ip -s link show
7: wg: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state UNKNOWN mode DEFAULT group default
    link/none
    RX: bytes  packets  errors  dropped overrun mcast
    4384059324 4073303  0       0       0       0
    TX: bytes  packets  errors  dropped carrier collsns
    0          0        0       0       0       0

This is after a bidirectional TCP iperf, so they has been some trafic in
both directions.  Bandwidth monitors like bmon also don't show any
outgoing trafic.

Baptiste

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlkWsPsACgkQvgHsIqBO
LkbgHA//RfB9ff5AsHVPgHBupfGSURHQrt2SnmveTbnuMRg7e6iAIaQqgp2D4/+C
GvD+OcjNOJAfQ7XyJxmzUKcgvY0OZUhHT7TEuiyqY8s+z4yauv3T6IikJmY6HoWk
JYvubiILInT4glOvmH0pJWJ45ncccBQDxBPpnZvC6q7R9FR5Lx8ye2YJHgChUBdU
gfsRBMRr6dUM9iNz14AN+mPhqjCgOGsLsb/zZigy7cOHWIvqS2m1TtHeGih2oOT7
Po6XfzY81NXe4IsbPsa+co17bKyBog9p8nk1MS8ISZ7+v1etJ/BybPTKoljFkUDu
DWgXEeXYfNUruNnG7zDsb0N3XOTcWo9lsAekVugQWVtb/jT3t8wqqjivgb4pNNb5
S4WY9N8vwbOM2YgNt9X/RE1omQQDS/LAhiqWJirtqA8tgVmf6UZX0JjXCJeauL1O
LSAAhBMJeIbQSP7B1n+lF2ZSxUIbEsehmhtRKLmjlNnJIsuHkOmphWL91Wsacgc+
HHlymoB1fmbZV5UTVHtsrUmm8mbjoL249rmp1CcMN2FA3oK/C+Kv22nBIf5s2X8Y
Oyf8NF2p4b0Tf39ZL4ecZMl1LyT/trkF4qtk1/xY1eZPymAjQIkuURQWDg0Q/1bW
lbjgoDA+n7HJhYdZSUVrMSiaHzGerd3OaEDYY2gJdWIIIeBib6o=
=UTz0
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
