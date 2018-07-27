Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a661bdfb
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Jul 2018 10:20:16 +0000 (UTC)
Received: from mails.bitsofnetworks.org (mails.bitsofnetworks.org
 [IPv6:2001:912:1800:ff::131])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62651836
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Jul 2018 10:20:16 +0000 (UTC)
Received: from [2a00:5881:4008::42] (helo=lud.localdomain)
 by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1fj00F-0004Lk-Li
 for wireguard@lists.zx2c4.com; Fri, 27 Jul 2018 12:29:43 +0200
Date: Fri, 27 Jul 2018 12:29:41 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Subject: NetSpectre / AVX2 timing side-channel attack
Message-ID: <20180727102941.GB25131@lud.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here is an interesting side-channel attack that uses AVX2 timing to
potentially extract private key material (read section 4.2):

  https://news.ycombinator.com/item?id=17621823
  https://misc0110.net/web/files/netspectre.pdf

It is based on a power-saving feature: after being idle for 1 ms,
the AVX2 unit in Intel processors is powered off, which greatly increases
latency for the next AVX2 instruction.

Of course, to be exploited, the code would need to perform AVX2
instructions conditionnally.  I'd be curious to know if it is the case in
Wireguard.

Baptiste

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlta9AgACgkQvgHsIqBO
LkZpgw//YgT6Q1dPCw9TENngVYM0wnkUfurL1HHhVR+WDZWMOQAr1pEAkuui/rCG
F1ZdM3IbhVxCqPzmRokTybb6Fwu33Ga9BT7dtFdFGFKv8u2RUzIZiTH8k7Rzdhqj
Cz3wL2I0EzgMxcKWsgorfJB+8ffdyYo6NwCE5jTZNN7ur/mbT/PKoeLVdkQSswcn
0FPEP8t30WKO5u8wfP/TSeVaf6iOkayM5qqWax+Ry0UdeKpyNd45nQ22AVxEpB62
1Qk/mh6zI/+Hfzs77m7+ynnp8bloq2svN6PYmAYTxT0c9xrLolDkVstKuB0XaSSE
kffDvjF60HKQfs3WipB/VIVGXAm+sxfQGrKQRK0C8hDsEKR80Jub6MNbLC2o8a5h
gTHBzfUp1+M4zunTMd3frK5hSQx7cLzcyDaUJoJAGXXZUxaUMhozZXdOEiN+Sxl9
bm8UigYIPnt+/6YvdwrxyqniSBbgeqk+bGUft36w4NjgdaOSbalUIpmCFMJz/5Ou
0WKyyBXpVxixdrdwG2vlh6qAxPzXxFUp/4mIXeO2H/DGx+wpr0wVlPAQZ5hzQ/fq
+ag4p1R2GnQEJ9BzBNhXs8wjqCqYNo8r/jE2UyJ7caxXDbLKniJyxA3/VGdGqP5X
NVuoo1fLeNgoUhzjmzS+ZCwXXpbVlwy6OPcl8+5c7uew6VRcYAc=
=gD40
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
