Return-Path: nwf@cs.jhu.edu
Received: from blaze.cs.jhu.edu (blaze.cs.jhu.edu [128.220.13.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a388c2eb
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 23:13:48 +0000 (UTC)
Received: from gradx.cs.jhu.edu (gradx.cs.jhu.edu [128.220.35.100])
 by blaze.cs.jhu.edu (8.14.4/8.14.4) with ESMTP id u6CNEcXT042136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jul 2016 19:14:38 -0400
Received: from gradx.cs.jhu.edu (localhost [127.0.0.1])
 by gradx.cs.jhu.edu (8.15.2/8.14.5) with ESMTP id u6CNEcPA032057
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jul 2016 19:14:38 -0400
Received: (from nwf@localhost)
 by gradx.cs.jhu.edu (8.15.2/8.15.2/Submit) id u6CNEcmg032056
 for wireguard@lists.zx2c4.com; Tue, 12 Jul 2016 19:14:38 -0400
Date: Tue, 12 Jul 2016 19:14:38 -0400
From: Nathaniel W Filardo <nwf@cs.jhu.edu>
To: wireguard@lists.zx2c4.com
Message-ID: <20160712231438.GF5136@gradx.cs.jhu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="VuQYccsttdhdIfIP"
Subject: [WireGuard] WireGuard key lifetime / keys in smartcard?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--VuQYccsttdhdIfIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I am sure this is a completely ignorant question, but: I'd love to have a
wireguard host without direct access to its long-term identity keys to raise
the difficulty of silently spoofing/cloning a tunnel endpoint after host
compromise.  I can see two possible ways forward, though I'm sure there are
others!

1. Long-lived identity keys giving rise to shorter-lived keys.  Wireguard
   would, as part of the handshake, include the signature that attested the
   short-term key as a legitimate product of the long-term key.

2. Long-lived keys not in host memory (e.g. in a smartcard).  I don't know
   if the kernel has an existing mechanism for upcalling to userland to
   request a cryptographic transform, but it seems like a plausible thing to
   want.  (I'm aware of the request-key mechanism, but that doesn't seem
   like what'd be wanted here.)  Handshakes would be slow (limited by crypto
   processor and upcall overhead) but otherwise the WireGuard protocol would
   not change.

Thanks for a lovely piece of technology!
--nwf;

--VuQYccsttdhdIfIP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAleFed4ACgkQTeQabvr9Tc/CvACdFmF3Sbq7Kj3c5YU91Dtnzp5V
/2YAn0q3nNDsyA2HSp8bJWqELQNDxtIB
=Hbwp
-----END PGP SIGNATURE-----

--VuQYccsttdhdIfIP--
