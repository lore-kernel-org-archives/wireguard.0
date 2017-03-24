Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9edcaedc
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2017 03:52:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7e3e487
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2017 03:52:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a25f7bff
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2017 03:52:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a22933af
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2017 03:52:18 +0000 (UTC)
Date: Fri, 24 Mar 2017 04:56:54 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170324` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffffe36f6eaa@frisell.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new snapshot, `0.0.20170324`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * curve25519: 128-bit integer != x86_64
  
  This will fix build problems on AArch64.
  
  * tools: document # comments in wg(8) man page
  
  * socket: avoid deadlock on port retry
  
  Fixes systems under port exhaustion.
  
  * wg-quick: various cleanups
  
  * uapi: add version magic
  
  While the problem will go away entirely when we switch (back) to
  Netlink, for now it's nice to warn users when wg(8) is out of sync
  with the module, so we do this by adding a version field.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170324.tar.xz
  SHA2-256: 2ec08a5d74cb3a63576f06d3cae695b6b8995acd9665e2fa4da91927b467ca51
  BLAKE2b-256: 02760e38851ec46857aa887562495289093f62178deb4bf6c98d2662fee828fa

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAljUmQAQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drm4hD/0ZtFBeGIsvgH0gOsWB1+OKZKz/V5mtt4Nn
a3JYJ/TXxWX23FOVXEBeiWC629Oo550B5BajikXKHpYSJan1BGNGEh7evzuiJIrC
CZWpvcvwYOoASxWSW27R1D9zm2jD+4caF8R0ipN1u/a5YeYNzVt/G5AL+9X31/oZ
MSRvcYSoeUUKKeLahMrAn7y2sypzW+0+sWRheT1GgRT0vb9WCgg0hhJXdBA1ehxO
okdNb7qehnOmjLhhUHCBmZwsd4mGLYWGp4fx6Y+m5mqpXhMshyiXe4+UzdOdVD4g
UoYHC2TQm5qzO7jKa31teGa7Jn7jufIaU5yXMCxJ029QXnWH2pmgEbp8L4wSRRIe
1PJCDfiXB+q7hgNVR2zgXB0Jhm+vaVI2pqHy+8FNvTwl5jeOnFliWzw3Y/bhHuTy
kKfV/uuCm+jPonfZ5Q5SZSl5HjGB7hzeNhPhOBxINhXeBputumi4VE1J+yazkrOO
2JJQD7//nzo/ff6CSeAd2dUWOKG1F2r0pP+oEkGwXT5QpJKYRoMoICNkg44inUnd
uhb1orl+lt1cvCLyhVI4qXQZd3VcqjsDEGtRKan9cdxleq9iOSdKA1wvHEJoN8VT
PeQp2l583sL7nu6c/NEm6hMHR9Ov9epCvHvUhOuvJe2QmidEqpbnpJFwb29NcKgD
LLkFbvY4jw==
=3UyO
-----END PGP SIGNATURE-----
