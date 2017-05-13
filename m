Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b9ac01d
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 07:26:31 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03c8a62e
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 07:26:30 +0000 (UTC)
Received: from [172.23.184.97] (helo=tuxmachine.polynome.dn42)
 by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1d9RcA-0004nB-Ct
 for wireguard@lists.zx2c4.com; Sat, 13 May 2017 09:37:22 +0200
Date: Sat, 13 May 2017 09:37:21 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Subject: Performance of Wireguard on Infiniband 40G
Message-ID: <20170513073721.GD22218@tuxmachine.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Just for information, I did a quick test of Wireguard over a 40G
Infiniband network, between two machines with a Xeon E5520.

Using iperf (TCP mode) over the wireguard interface, performance was
around 1.6 Gbit/s.  In bidirectional mode (iperf -d), performance was
700 Mbit/s + 800 Mbit/s.

Note that infiniband has a MTU of 65520 bytes, but Wireguard still selects
a MTU of 1420 bytes for its interface.
After raising the MTU of the wireguard interface to 65450, performance
went up to 7.6 Gbit/s (unidirectional iperf).

Using the Infiniband network directly, iperf's performance is 21.7 Gbit/s
(iperf maxes out the CPU at the receiver, even when using 8 threads).

Hardware used:

- Xeon E5520 @2.27GHz (2 CPUs, 4 cores each)
- Mellanox ConnectX IB 4X QDR MT26428

Versions used:

- Debian jessie
- Linux 3.16.43-2
- Wireguard 0.0.20170421-2
- iperf 2.0.5
- Mellanox ConnectX InfiniBand driver v2.2-1

Baptiste

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlkWt6gACgkQvgHsIqBO
Lkat9BAAjap//0yi7A/BjfUdAj0n4nZpqelxf1nXdE4ogNseGc/EmDXERdz/PoxB
ZdALNfXqW+0t3plQYfz3YbPhTw4PHJhsx3ZtJc56Qb7AacJsobO+qmXcfB3ueG3V
r+1kC6i4jQYMJJzonkorAixRDTm+cJsmIqSahpx6CA+kZabtpevB3SBfnTezOGRU
6Cg+QV7Y2Q19EK7VNpEbx1Ucj8jQNJwosQzsEcylo6yPVtZ+LMXi0iOnmOSPE3vq
QefssNIn4cUG0vKsH7k5uZ1SGCwJvtdhKDHtGwyzgL7OTvBUNBCzMiA4oEAisznN
Z2S8GrUaqh0vEbqlzvHO+cq7RijkYCzIHrzu9zcYAfvOs6GRZGa4ZJA0ZxQ/Y5b8
Ld3NwuNIfFYVswwwzRwq95k57F9ex0n2p3vWsSbMESaZvWyGawoFUVODhJ+R0rJb
rncNmjhJFrFPpUZ2DmUvzZKqVZ3oZ3qToQNUtdNbzchXZnaWQyC4Bi+BvBwBgpvE
o4H2PCKYC7w5jn6GTG9X5b6uUUPi+P1+Za1DUYK6A/xQJWXab78dNnSDDhecOyzH
/HCYTnJEec2DwiPcu3tm/QO5/Lv0WU/DDkR0NoyeaR21Df0/s73aYmdwfnfnP73K
bfkMUrTwI5cgjFmtiscLlIHRzZKIBwfuqwtfQ+I+YJugkwA3UFQ=
=31zV
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--
