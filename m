Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f280cb7a
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Jul 2018 18:15:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4da3d69d
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Jul 2018 18:15:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1798a362
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Jul 2018 18:14:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b77e979e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Jul 2018 18:14:27 +0000 (UTC)
Date: Tue, 31 Jul 2018 20:25:42 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180731` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <15359b9c1331514d@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180731`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * receive: check against proper return value type
  
  Ensure error counters are correct in the receive path.
  
  * embeddable-wg-library: do not left shift negative numbers
  
  Avoids implementation-defined C behavior and also improves performance.
  
  * wg-quick: android: allow package to be overridden
  * wg-quick: android: remove compat code
  
  Small android fixes.
  
  * qemu: show log if process crashes
  * qemu: update musl and kernel
  
  The usual QEMU suite bump.
  
  * curve25519-x86_64: tighten the x25519 assembly
  
  Small performance optimization from Samuel.
  The wide multiplication by 38 in mul_a24_eltfp25519_1w is redundant:
  (2^256-1) * 121666 / 2^256 is at most 121665, and therefore a 64-bit
  multiplication can never overflow.
  
  * curve25519-x86_64: tighten reductions modulo 2^256-38
  
  Small performance optimization from Samuel.
  At this stage the value if C[4] is at most ((2^256-1) + 38*(2^256-1)) / 2^256 = 38,
  so there is no need to use a wide multiplication.
  
  * curve25519-x86_64: simplify the final reduction by adding 19 beforehand
  
  Small performance optimization from Samuel.
  At this stage the value if C[4] is at most ((2^256-1) + 38*(2^256-1)) / 2^256 = 38,
  Correctness can be quickly verified with the following z3py script:
  
  >>> from z3 import *
  >>> x = BitVec("x", 256) # any 256-bit value
  >>> ref = URem(x, 2**255 - 19) # correct value
  >>> t = Extract(255, 255, x); x &= 2**255 - 1; # btrq $63, %3
  >>> u = If(t != 0, BitVecVal(38, 256), BitVecVal(19, 256)) # cmovncl %k5, %k4
  >>> x += u # addq %4, %0; adcq $0, %1; adcq $0, %2; adcq $0, %3;
  >>> t = Extract(255, 255, x); x &= 2**255 - 1; # btrq $63, %3
  >>> u = If(t != 0, BitVecVal(0, 256), BitVecVal(19, 256)) # cmovncl %k5, %k4
  >>> x -= u # subq %4, %0; sbbq $0, %1; sbbq $0, %2; sbbq $0, %3;
  >>> prove(x == ref)
  proved
  
  * ratelimiter: prevent init/uninit race
  
  Fixes a classic ABA problem that isn't actually reachable because of
  rtnl_lock, but it's good to be correct anyway.
  
  * peer: simplify rcu reference counts
  
  Use RCU reference counts only when we must, and otherwise use a more
  reasonably named function.
  
  * main: add missing chacha20poly1305 header
  * send: address of variable is never null
  * noise: remove outdated comment
  * main: properly name label
  * noise: use hex constant for tai64n offset
  * device: adjust comment
  
  A series of last minute nits before submitting upstream.

This snapshot contains commits from: Jason A. Donenfeld and Samuel Neves.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180731.tar.xz
  SHA2-256: 09212974f2a92b304147151f2ca5cb7230e09e969d9584bdf8338bc82e614b8a
  BLAKE2b-256: c089cdbc6668dd3f7d59e29c6feb168063ec5da35dff77eb57922954018dd7e6

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180731.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAltgqZcQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drvr8D/93ju+T3ZowbsFJF0FWFyhPwzTxqbLLdEeJ
VCh1OwVxKJEt091jxADnsi0zHuuOn14J1ri+t1rSBFI0XG9VYNZMgMreb7IvyQbn
P1+WyP/lj1e72Y+JgLajdklLTUddXtAOaSk7ji7FiUF9MW9l0QuvbsAY3SUE9zcd
01jTxkxqLAQ7nmwUrVi4cEKqEG1GliHKIiJWlKjHmn6doblrJdVDV+k+fUVefzTw
ZHl1xJ9LZkdgBwBtoIKn+lJ3FaGcFBnG4ZVIqdbPMLNym4leSDJGJz7M+tCzQTM1
ILpgDRIjSCmiWbn6zlcfEJHHBKg1/EIQ9rsnqOYBXCioAZPBHC7rVpZv5PmEIe0z
RAYCrJ+jFiGnnJEecGX36OFqEYePkNzEFzKKlyCo/onQ4r88b6cl2l2XTMnHQVSv
I2SeTwE08aj6poQN2Snx5CVfGad9iHb7dYRhy89CrS/XQ802+hLz7LFajIhr3RCR
AO8YHxIUz/cNMhqHVgUipzEp+G12ZVS6O2dbDWPGIIBJUJLKQmjlS1hfrywfmcyQ
yKNVB5DSm3V0Boy5S0Q+Edpd3LjQL3wBv4F0TNqpKSGk1/pv1fLnyh0wTQIGWLxK
wkQBBlU2qFgJjZu2GV08NFFhoGt6y9Yj5WTPv22nJtVTCqHnl1Tphv421ZOSU0nG
2aYVi/k8kw==
=5zjb
-----END PGP SIGNATURE-----
