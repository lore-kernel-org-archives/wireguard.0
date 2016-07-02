Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e4dbb6b
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 18:52:41 +0000 (UTC)
Received: from fifthhorseman.net (c-174-62-194-216.hsd1.ct.comcast.net
 [174.62.194.216])
 by che.mayfirst.org (Postfix) with ESMTPSA id E0230F98B
 for <wireguard@lists.zx2c4.com>; Sat,  2 Jul 2016 14:55:46 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Sat, 02 Jul 2016 14:55:43 -0400
Message-ID: <8737nrzx74.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Subject: [WireGuard] continuous integration/testing across multiple kernels
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

hey all--

debian has a continuous integration testing infrastructure that runs
"autopkgtest" instructions from the unstable distribution on at least
two different architectures (amd64 and arm64 today, maybe more in the
future):

 https://ci.debian.net/

I think it's possible for these tests to make use of full network
access, kernel modifications, and superuser privileges, which means we
should be able to test wireguard against public test servers on
different kernels and from different networks, if that's OK with
whoever's running the test servers.

I'd be happy to write a simple test and include it with the debian
packaging, so that if/when we put the package in unstable it should get
run on ci.debian.net automatically.

Is it ok to create such a test script that invokes, say,
contrib/client-server-example/client.sh from an automated platform?  Are
there other automated tests that would be useful?

      --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJXeA4vXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRFREIyRTc0RjU2RkNGMkI2NzI5N0I3MzUy
NEVDRkY1QUZGNjgzNzBBAAoJECTs/1r/aDcKm6gP/0wH+Kybcwq+VBSOKFsEC+4I
GoU8zX5kIUvUDM715R5sxC7qkgJIFnVIjSkXOUNHp8ic62rVRDy41mjJgz/Kyo49
YOYWCpGAvPGc9w5IP+eSWbYhdGn/iUAvFOW56i3o1kZboiRZ3yKZKmGN+vZ5o7Se
Hp7eUfLaGkmU87W4FE3G+KXZkZnMib+3rJn654NQTNYpGZ5qyeeFveStFlaLb2+n
aCiOlpBjsplaSWBFZgS1n71lwgwWpxCq/t773TsurrpfS1aDOg0H2hXL+XD5ovCJ
RG00syW/tvQ+efZMRVsfccnmoKu7WY8gdgj+dXbzp6QMo9PKgA0nmZUR4BcjJuJA
TXxI0hIpI31HHRva5oSrdJddBN9ep3n2ktc0JD5DIyxFVkCrbK5Yz1nz13az5GlX
tUwCBd1EzLbiaXsbbFZq7dX7jtCRVBBQsyYqnrrYTzGHRV/kGLQdIxxyyZ66e7BV
jelKVdJU8cfyUPZDzubAuoCLbFFI6QrS2/gKVD+zAh1077s/ncoHuvfMIryPp4pa
fd5KlP0ZkDh4lLeXolctFRB1S2uliv7DmSVGD04hBdREkV62t/KPgnVivOiMPSjB
bR6cOPsgQ0owcK7W62zordhG774pqdE4P6JsR4wr6bGhjD9Zh/8QkaZINDkrJmCK
AEvn5is2bDOaZGRfrsJs
=vQZW
-----END PGP SIGNATURE-----
--=-=-=--
