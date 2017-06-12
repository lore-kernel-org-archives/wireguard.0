Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82a7838a
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Jun 2017 03:24:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa48ce84
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Jun 2017 03:24:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6dca8a7
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Jun 2017 03:35:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b3b3933d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Jun 2017 03:35:00 +0000 (UTC)
Date: Mon, 12 Jun 2017 05:36:00 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170612` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <7b119641a185a9f7@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170612`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * timers: queue up killing ephemerals only if not already
  
  We fix up a small detail in the timer logic that changed during the last
  snapshot.
  
  * receive: trim incoming packets to IP header length
  
  Packets are now trimmed to their actual length, not their length+padding,
  before handing to the rest of the network subsystem, so that packets look
  pretty in tcpdump. This doesn't actually affect what userspace sees, since the
  kernel trims it at a later stage, but it does make pcaps a bit nicer to use.
  
  * curve25519: use more standard label convention in asm
  
  This ensures that perf(1) shows the function name instead of the label name.
  
  * compat: remove padata hotplug code
  
  Fixes building on kernels that have HOTPLUG enabled but no PADATA support.
  
  * config: add new line for style
  * device: do-while assignment style
  * peer: explicitly initialize atomic
  
  Style.
  
  * noise: fix race when replacing handshake
  
  Handle a situation in which three peers, all running on the same system, begin
  a handshake with all three of each other, at exactly the same time, on a
  multi-CPU system.
  
  * config: ensure the RNG is initialized before setting
  * compat: use sys_getrandom instead of add_random_ready_callback
  
  We've been working with upstream to add a new API to the kernel for ensuring
  that the RNG actually is seeded. Until they merge it for 4.13, we provide a
  poly-fill to the compat code. This means that WireGuard will block during
  configuration until the RNG has enough entropy, so that it's never in a
  circumstance in which ephemeral keys are generated from bad randomness.
  
  * go test: properly pad message
  * go test: correct tai64n and formatting
  * external-tests: add keepalive packet
  * go test: use x/crypto for blake2s now that we have 128-bit mac
  * external-tests: trim the fat
  
  Improvements for the external tests.
  
  * wg-quick: make sure we have empty table for both v6 and v4
  * wg-quick: match ipv6 default route more broadly
  
  Tiny nits with wg-quick, one of which should now allow multiple v6-only
  wg-quick instances running at the same time.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170612.tar.xz
  SHA2-256: 842f338b0e8c3e79adb7a2b27a2c59fd73875d8bc1d6a9111e09a93538ed6f75
  BLAKE2b-256: f6c5bc846d8adf5f2c589ced4c4079d323b5d710d8137e4904b7b2334a5d95da

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlk+DAoQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drnh+EADHZU9WZEImCuszIsYyKiZxeVUAgxHzfi7D
QaMXeXP8fCxt+irXdVEBWkLJP7UoRQxhA0qAwvsO5rRuUEMYjbfaiRrlgE04rsxF
PPt3HLh9Fd5u9W50Gs8DhZOysMlJvRkKys7KwtHL8fts2Qk0wSz3hnXvQM+aGBMV
AsNhbU1j2Q4lABinLl7KQ482JJTIECNTXuojQlYCPcveDpX8mlBKKUVX/6XdVrA9
W9NJWPtb8XY1Zc5IAc6UKuuDrix24PyCYPCitkpfFxuWG7ij7qXGeMCU6bZfGM3e
IA8l4nCHJTRdUB27p03kvGymHoR+toelJyudYV942rAplFYfcGiECwOc8oy/DH9e
7RtBGEl3Bvgdj3cCT+J73mEFNuNEfCcE5ewrjNMtmyWLYhTyCal0v5e7uzsJGd7k
iw73VaKQkKc61q4Jo5v+EpMVe4hT7/2ha1IOqHfZk3WDCwNuDKFpx9OJ3J0tN+09
E1i0oZJsqipwNmLNELhu17RDwiXU2vPYqmuRjXGeZ8Q8Ab5F6HqRoeFrDLh86hrG
rKBoEwHAPpNGWyGc0eG6CmkNZwC5U08KgE+u0I0I6DOQAs6XbLeNF797Ena/jh/h
5I66wb6/mXY+QzP+5GCJ9Jkh/zOVKczfHK7qaZXyDeVtnghyBXG22buTnvTBjttO
RAd41d6dig==
=Q18J
-----END PGP SIGNATURE-----
