Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 070c77ad
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 03:02:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f298f56
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 03:02:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 691769bc
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 03:02:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 76602fa2
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 03:02:05 +0000 (UTC)
Date: Mon, 20 Mar 2017 04:06:07 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170320` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffffe11601af@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170320`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * device: 4.11 uses cnf for addr_gen_mode
  * receive: last_rx use is discouraged and removed in recent kernels
  * data: transition to skb_reset_tc for 4.11
  
  This snapshot now should work with 4.11.
  
  * create-patch: add context below to work with busybox patch
  
  It turns out that busybox has a patch that doesn't do fuzzy matching.
  
  * device: move sysctl toggling to open time
  * compat: use maybe_unused macro over gcc-specific
  * timers: elide enable check
  * config: satisfy sparse
  
  Cleanups.
  
  * hashtables: get_random_int is now more secure, so expose directly
  * cookie: no need to hash rng
  
  We're trusting the Linux RNG to not be backdoored!
  
  * tools: wg-quick: support old ip(8)
  
  This should allow wg-quick usage with Ubuntu 16.04.
  
  * data: big refactoring
  
  A rather invasive refactoring that may bring bugs with it. Please report
  strange behavior from this release, if any.
  
  * blake2s: add AVX implementation
  * curve25519: add AVX implementation
  
  With the addition of AVX-accelerated implementations of Blake2s and
  Curve25519, we now have accelerated implementations of all crypto
  primitives on modern x86_64. Next up: ARM and MIPS, if somebody would
  like to write these?

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170320.tar.xz
  SHA2-256: 9b9d544c2abae29b342d3befc94efba4ca096bf407aa8347ae89534121dd42cc
  BLAKE2b-256: fac16c6e5b95d7a3ca477abb1d3a305e5fb54bbc43ba8d0281519445c4f78321

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAljPRxYQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrjOEEACM0bxJkm8QwkJ4mPfSue8i/76PikoBJlTy
FDKknMFWniaIigMjxrSX1mNjk9dmKe8eRkJsVuzgST/5j0BI/cuBEIf1EZl2bYfy
+SzjHB/ZBE4Sy9xuqHx7Rl/9Fcjqrt3xfs1+x8WZAYcSDim1qLiJIEgw8FWEBwTN
LqX32YWmCINaCJkqclNZALCnyJMtHUenAllGYLG/k1A3We+jfL/1Dz29RTii+CxZ
iCpq2+btjw7ujAU4z6yGvqk4YxBlyyLzYAfJx3yiV1j7MFhzxoRt5awxhhlTp18U
2kf9a4IX3sJNUpzuBAqny3gjjwbYIkvwWatip31zsP+qwQpBqW6WXjqkcsr4soBL
nlUdMwxqMllbGsERG1L2LaoLJeF3YQ0nZE9PKG2Jk6fd0IlmY5QCzVIZ7+qFGPKs
E2Uh0t94oJQfNLwdUqS9wPpAHFWSslEC0MXjL1MIUxwl/3h0S2z0QmzjHaQnwovI
9GjSZ3Gg1jauz4C9pocz3QNrSmudOw0r/AH6a2rF/M9E0s7U/5W/Xgv7aRo3V/4+
KkBegTtmM8X3G/mEHaB5QyrcKecIOo7gqYh9w1WofIejN1bqrVO7zTaC49Kqqi/I
4lBFNZAlcBC7BB2IeU/t620KmpPOJv5zzUEZRMbbhplrlR711cgvYNH+ZVjKQYTo
OKDMv+Figg==
=ZYoR
-----END PGP SIGNATURE-----
