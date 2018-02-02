Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f928611a
 for <wireguard@lists.zx2c4.com>; Fri, 2 Feb 2018 18:03:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd0d2c53
 for <wireguard@lists.zx2c4.com>; Fri, 2 Feb 2018 18:03:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ab5ba73
 for <wireguard@lists.zx2c4.com>; Fri, 2 Feb 2018 17:54:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3812bcf7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 2 Feb 2018 17:54:09 +0000 (UTC)
Date: Fri, 02 Feb 2018 19:08:17 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180202` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b97175b73367dbb3@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180202`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * curve25519-fiat32: uninline certain functions
  
  This results in much smaller code size and significanat speed gains on smaller
  hardware.
  
  * poly1305: add poly-specific self-tests
  
  Poly is easy to get wrong, so we've added quite a few tests that examine
  certain edge cases and places where other implementations of historically
  failed.
  
  * tools: dedup secret normalization
  * tools: share curve25519 implementations with kernel
  * contrib: keygen-html: share curve25519 implementation with kernel
  
  There is now only one place where we ship 25519 code.
  
  * qemu: disable PIE for compilation
  * qemu: disable AVX-512 in userland
  * qemu: update base versions
  
  Test suite enhancements.
  
  * device: let udev know what kind of device we are
  
  This enables folks to query the device type via udev, which is what systemd's
  networkctl uses.
  
  * tools: fread doesn't change errno
  
  This fixes clearing pre-shared keys on old glibc.
  
  * chacha20poly1305: use existing rol32 function
  * chacha20poly1305: better buffer alignment
  
  Small enhancements.
  
  * curve25519: verify that specialized basepoint implementations are correct
  
  Since some implementations have a specialized function for computing
  basepoints, it's important to do some basic sanity checking with them.
  
  * curve25519: replace hacl64 with fiat64
  
  For about 24 hours, fiat64 was faster.
  
  * curve25519: replace fiat64 with faster hacl64
  
  Then hacl64 caught up, so we moved back to it.
  
  * curve25519: break more things with more test cases
  
  These extra test cases help break the current "rfc7748_precomputed"
  implementation, which we're not using here at the moment, but it is still
  useful to ensure that we don't fall victim to the same bugs.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180202.tar.xz
  SHA2-256: ee3415b482265ad9e8721aa746aaffdf311058a2d1a4d80e7b6d11bbbf71c722
  BLAKE2b-256: 3a5629c52ae319072fcbe02fc555f559fcc36d8d3c7b770ccc03cf96272137d8

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlp0qLQQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrrWaD/4y2hqcHci3kRxHRq81H1govSp9bAJ9IPBL
AF6Jc4S0MO1T6PSqr0mDeioDUJt3T3HIsLKjFscRgDfqmtLojaTDsdjfNHczVwSk
3KkIe46ZNmlsyZI/G7MgkicRUhXKRpVsm0JahjybRyP91JGcCe2nvf9PezUEIY+v
QRZkKGucwufD3MsfRyqm6tZC2UZoPjQzODa6MeEumlBhcdGPdN7eYCVf9j0GbzM0
Fr5jUdoJaFxgkWrA6hoYiSeuw8XJxNrOVFmaIp9Tk2e1AWQe+nmh+yaQrYJbO+dH
Vn4tL8To6s9OXAy6DTNEk8AetulL5ZlsQxVtV1pxNHUK4+RWsMHUpGgRSiXaaRKV
EaPIgFUuoKSwt8oE24mN+uUYCO4VbY2338CMgMP8BYOtAmE1Q3YJFuFQ/P7gNZm6
G4oPrE+reCkXrNb6KBw3LQeP/Qkr/v78keCpwnp0qeCcFqqCeoKjypTN7L40fnuz
2MWw2Aek1Xl8juKfRJq+JMdg6NKB5hcbTOfYhuOEzbD9fmn0rxUQ72K3caKgM6eV
4bw1bstd5Zj1BHYVIhWAdtFckN1gWAqTI1Rdhfu6QDyG2upHQVn1eO7vshdz7S6n
WsSMsPM9v2p2eKnP9RukTLrn6n0U0SycfBdNMgFyXbsMwNM0uv0r/F0yAVdufMKV
DDFHB7nkRQ==
=OYS4
-----END PGP SIGNATURE-----
