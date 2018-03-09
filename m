Return-Path: mdt@emdete.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 136a9767
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 13:18:47 +0000 (UTC)
Received: from emdete.de (total-communication.vfnet.de [80.84.1.14])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50693a04
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 13:18:46 +0000 (UTC)
Received: from localhost (emdete.de [local])
 by emdete.de (OpenSMTPD) with ESMTPA id 9bcaf166
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 13:28:29 +0000 (UTC)
Date: Fri, 09 Mar 2018 14:28:28 +0100
From: "M. Dietrich" <mdt@emdete.de>
Subject: UDP Socks5 Proxy
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Message-Id: <1520601759.eqcuj2h0io.astroid@morple.none>
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256; boundary="=-Rk0EZIs4IPOfa3TfqSKu"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-Rk0EZIs4IPOfa3TfqSKu
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

i would like to have one node using wireguard which is behind
a proxy. i thought one could use some iptables magic to catch
the udp packages and redirect those to use a socks5 proxy.

would that be feasable? what piece of software could i use to
turn the udp packages into a sock5 complient communication? i
understood a 'udp associate' request is done and that gives back
connection details and udp packages are then send to that
connection (thats how i understood rfc1928).

i searched the internet but did not find software that does
that or even some kind of client lib that could be used.

btw: i do not search for a high-speed-solution in the first
place. a reliable, working solution will do.

M. Dietrich
=

--=-Rk0EZIs4IPOfa3TfqSKu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE8ECycNYHT6atlYQywVmjQWUJtykFAlqii/wACgkQwVmjQWUJ
tykFlw//f+UT4dBslzVKA7sBkaD6p8yAKX2wPBZCXDETV941kAwj5tc2ZBlFJUNd
GfszU+bqP6xUbrUDDgPsAJ/8JoY/XUBeRNLOp1DRy/yOgNj+67D2xu1f7m5bYgTL
V2mA/mXp3Oa/eqO66aBpJ178sWXL5/7eapJiOYlnIxk1iGq3X44JAnByelvpsPzQ
AOsCyphEB+lYaX4A+UmovKw1QJHTUkOawVh8YCBa2n7B0cKGw8Gtb2i2Ra1pNPa9
myBkuYRDwyXS0njqu8KFk0JTf3PZpImHlRPxF/YfVOK44r2O9Y/EJ+ZM5aiRWmZf
cGFHV5nN9RADOyRc+BWCH+cH7o8MpsUcEgpjqzjDUCdMCCVRpHkXOspJ2Wc6l7s4
/3XBjpSynM2LbW2JsArN0taB11tBUT7WholuHtn5w4v4mm5wWAjz+1keD2mBa6PB
tIajff5oIJfXqlKRn5OjKPyUvn1eZcEzYXLzOd8JGsjnaDT5obWJjybYlR+cTZAl
+zs+Xxjp+qF+JULE10XJKjgO3774nvJUW3X7ooHZdOPQq2xuno0cWttXI2gWR8Zz
G5nBNirEyIgbRdANtLbzGPik+pTXVomfuEePThDbUGKDYY7thBAy6w1kuGZV25HC
JPtTb5wDNWXPEWQyestutFi4aTAwx06P3SAGGmRUQjn84xrrxVw=
=uyUv
-----END PGP SIGNATURE-----

--=-Rk0EZIs4IPOfa3TfqSKu--
