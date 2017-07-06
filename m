Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8d01a04
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jul 2017 16:05:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46b7aa26
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jul 2017 16:05:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8096b243
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jul 2017 16:18:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a26c1aee
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jul 2017 16:18:35 +0000 (UTC)
Date: Thu, 06 Jul 2017 18:22:40 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170706` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <f64d33b537d9b574@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170706`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * ratelimiter: use kvzalloc for hash table allocation
  * ratelimiter: use IPv6 /64 instead of /96
  * ratelimiter: add self-test
  
  These should make the rate-limiting a bit faster. We also switch to using
  a /64 instead of a /96 for IPv6, which seems to be what various RFCs
  recommend for this sort of thing.
  
  * receive: cleanup error handlers
  * gitignore: ignore split DWARF debug info
  * socket: the checkers distinguish between _bh and non _bh
  * counter: use correct unit for indices
  
  Various cleanups.
  
  * compat: support OpenSUSE's backports
  * compat: workaround Ubuntu 16.10 kernel weirdness
  * compat: priv_destructor got backported
  * device: cleanup register_netdev logic
  
  This is the main reason why this snapshot is being released a bit early.
  Kernel 4.11.9 came out, which backported some changes from 4.12, so
  we had to adjust the compat layer. This snapshot should now work with
  this recently released kernel (and all others >= 3.10) too. We also
  add support to a few more odd distro kernels.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170706.tar.xz
  SHA2-256: 5763b9436265421a67f92cb82142042867fc87c573ecc18033d40c1476146c33
  BLAKE2b-256: 90b1833a94060efd1686d608421eb9e7633e3590870dbd664a42249e495388e9

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlleY54QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrspMD/49maoX768282E+2dkaReI3LJqNfmf7sUpU
Q543iS/WzhxxsQS9m79FCPP/zHwpEqxx6f4oGW9zyYLJlaowx4p0MQRVzS+Po/ng
0IuFpnVFZemS4g0xurhtcWlOCdxYQgLIcSfgClqzDQniUypyvXs9E4yazK3qfRFq
oDB9gAlxfWW0swOtT3nTffHCD5Cq7PC/6s3vCec8vsG7ovRnyVAEnWIjYZoF+vUF
xwXsCc6sspUGYq/HxmitnNCpB2ZifK3J+1UXT2HjQwQlh6H2rkIPDUWSuh1fvxm1
MA+fcMEavlyn6+rUd1trqtcHGnLcQW05iYgwVgPCpWsDRDBOveFjk5K7SEAQJBOO
BtZhgVoxNECyoaypRwFhCqrSckCB5q4CL9sLSASAyX0axX3kvFt2OXFK4WKMZ90K
EWTaEFexYOqWpnkp64HPY6mdaYsrqMaLV8o5emk2M1rCi3/PiCv4b7LC5l6aZQZT
qXXT7ubgBQaa3a5jKho03w/3Soai/BWikS3WoXNJds+mGFFnwHU61NIqJf/U3L/z
zEmlJ1wZTCwDKxGpOVaOfgB7TO5z8Vim9Mogcm7wVUZ2N6zv2xNFkEEsn+PRv/CY
CZyyGOzDj/9UKy3iE90HxtiEq6c1km7PPj3cu2whyKZXHq7VWFkiBqTez8Rb1iE4
PSR2PTf/sw==
=76OE
-----END PGP SIGNATURE-----
