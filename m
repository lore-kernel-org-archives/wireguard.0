Return-Path: n3ph@terminal21.de
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.31.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 506576cf
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 22:50:09 +0000 (UTC)
Received: from [92.74.240.146] (helo=c3po)
 by smtprelay03.ispgateway.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84)
 (envelope-from <n3ph@terminal21.de>) id 1bKCk3-000811-Uv
 for wireguard@lists.zx2c4.com; Tue, 05 Jul 2016 00:53:28 +0200
Date: Tue, 5 Jul 2016 00:53:01 +0200
From: Michael Gerlach <n3ph@terminal21.de>
To: wireguard@lists.zx2c4.com
Message-ID: <20160704225300.GC9424@c3po>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Subject: [WireGuard] wireguard on gentoo (4.6.3)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey guys!

I tried to test wireguard on my gentoo machine running on kernel 4.6.3.
I followed the instructions on https://www.wireguard.io/install/ and
used the ebuild net-misc/wireguard-0.0.20160630.

I am not able to load the module - in dmesg this shows up:

[  126.576087] wireguard: no symbol version for udp_sock_create4
[  126.576092] wireguard: Unknown symbol udp_sock_create4 (err -22)
[  126.576113] wireguard: no symbol version for udp_tunnel6_xmit_skb
[  126.576115] wireguard: Unknown symbol udp_tunnel6_xmit_skb (err -22)
[  126.576170] wireguard: no symbol version for xt_request_find_match
[  126.576172] wireguard: Unknown symbol xt_request_find_match (err -22)
[  126.576282] wireguard: no symbol version for udp_tunnel_sock_release
[  126.576284] wireguard: Unknown symbol udp_tunnel_sock_release (err
-22)
[  126.576302] wireguard: no symbol version for setup_udp_tunnel_sock
[  126.576304] wireguard: Unknown symbol setup_udp_tunnel_sock (err -22)
[  126.576308] wireguard: no symbol version for udp_sock_create6
[  126.576310] wireguard: Unknown symbol udp_sock_create6 (err -22)
[  126.576340] wireguard: no symbol version for udp_tunnel_xmit_skb
[  126.576342] wireguard: Unknown symbol udp_tunnel_xmit_skb (err -22)

Any hints to get further on this?

best regards,


n3ph

--=20
Please use PGP - https://en.wikipedia.org/wiki/Pretty_Good_Privacy


--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXeujMAAoJEE1l5S41evqaZHgH/iqJj4m/94OvtcNwhliCbOQQ
Rh5Mda2suJN8e2FHfFb/52xURIdY1L2f2/V0WtWSGtsaagIU6FYrpeAfqH6I3s9w
qGvLXJomA0joB/nhXzh7MdaA6sOGagAB6/kDkVXNwdN2L/uWDTr9/Y7mB7n0UlO6
YdmDvXmq7IgjlfhJqCYb8B1tHZDVkSloBgWhvw/WhgSVOkndTQKDlUZWycn6p9pa
WM0GS1cL/0Vj8PDlMKVAupR+UAf46niBVJ9jOdrPD5iJbM0B3SzmRbxOrQG8DuNE
dHG6nELNvTNj2+TLVcvei0wcvoy829tpD+4Q8BXzKhaK4bHolwRcEboQG84xRps=
=BDem
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
