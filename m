Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e1393a9
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Jul 2017 01:33:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32c89927
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Jul 2017 01:33:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6ed9093
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Jul 2017 01:52:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f4036a9a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Jul 2017 01:52:05 +0000 (UTC)
Date: Wed, 26 Jul 2017 03:53:08 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170726` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <36dc8408e552f62f@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170726`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * global: wireguard.io --> wireguard.com
  
  We have a new domain name -- WireGuard.com -- moving away from the .io, due to
  security concerns. Along with the new domain, we also have a commonly
  requested page for donations: https://www.wireguard.com/donations/ in addition
  to a Patreon page for those who are into that: https://www.patreon.com/zx2c4 .
  
  * ratelimiter: consistently use non-bh rcu
  * socket: style
  * wg-quick: usage typos
  * qemu: update default testing kernel
  * qemu: warn on all unseeded random usage when in debug mode
  * compat: work around odd kernels that backport kvfree
  * selftests: ensure that there isnt CPU lag when testing rate limiter
  
  The usual set of small fixes.
  
  * send: orphan skbs when buffering longterm
  
  This works around situations where some apps use the same socket for multiple
  interfaces. It's important in this case that indefinately queued packets don't
  eat away at the socket's send buffer; otherwise sending to other interfaces
  will be blocked.
  
  * device: support 4.13's extact newlink param
  
  We continue to support the newest kernels, in this case adjusting to recent
  changes in the upcoming 4.13 release.
  
  * global: use pointer to net_device
  
  This follows an upstream recommendation.
  
  * ratelimiter: use KMEM_CACHE macro
  * data: use KMEM_CACHE macro
  * data: simplify no-keypair failure case
  * send: use skb_queue_empty where appropriate
  
  Some nice cleanups from Samuel Holland, one of this summer's GSoC students.
  
  * blake2s: move compression loop to assembly
  * blake2s: fix up alignment issues
  
  Our BLAKE2s implementation now runs a bit faster, thanks to a commit and some
  additional suggestions from Samuel Neves, one of the BLAKE2 authors.
  
  * wg-quick: do not set explicit src route for v6 default route
  
  Clueless network operators were trying to use fec0::/10 as a global address,
  except that range doesn't have the scope. Previously I worked around this by
  adding an explicit `src ...` to the routing table for all v6, but this is
  actually undesirable in some caes, so it's better that network operators give
  out the correct IPs (likely in fc00::/7).
  
  * wg-quick: do not use grep
  
  This reduces the set of dependencies for wg-quick.
  
  * wg-quick: add explicit support for common DNS usage
  
  wg-quick supports a DNS = field for common usages of DNS. Folks doing
  complicated things or who don't want to use resolvconf can continue to use
  PostUp for this.
  
  * android: add port of wg-quick
  
  wg-quick now runs on Android using the ndc command to interact with Android's
  built-in network management daemons.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170726.tar.xz
  SHA2-256: db91452b6b5ec28049721a520fe4fd0683825bad45b7383d12d7b819668201db
  BLAKE2b-256: 4afc73c422fcb6e31e0a5d9b121c5809b48e4af49ecd4c6d0c3ed69cab88818c

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAll39VIQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrgaEEACzkCAXcXTcppbD0+RhSSnCGJ7uFt4DD2WK
9xSa9QLZd7peEIF1GIv70u0B2hHkuyJpaBfk9+BOhbXLL72S2Ol5Db6U8eLHCdXw
ZT2WPq7fFMKzNFlUqvQKdl0BY+rnfdL/mFBw/LNtxgZCg9I/P8bGywhagsAZ41D2
w4JCW+LiaSmV3XRf1w4FI4x/cx5fc6ZzQSEGBRrikELA7Zrmbd5dgega4U4juAHl
CVqRUxzjOWz9KtU29uMy1uiq4ylWGz0sBqE0YZTw/2aHQKRdVkjmkrwdljcYgQ9S
W4wKdUln+mzYy6edYiXGoRanDcJdQ3vCS4K7xiYiwcb5rCelq4XBWpZ3lHDrkuW1
bIZmec3LL4cmZFAIpAfAvHQaW4zWoVAHEtHS/BjgnXk6WMVfp32FXihtZ1Azx45J
SQPRVYMRQlNF4bKFdWPUxsgNT/KsHXAKGfe5qh6uHvfzuwnFHEU5k4f8pQQGDB9A
pytUw+JJxS9DKnW5hOgdW/SLgFE6spPLWESJW/dqQbZmzDNxWYrgSdJaOdknxH50
6Cu6oj4Bzcifcoc7seY/Xlk8HqBQ9bY5X1aIoF6h9EXyz5r1kyzDh+3EaYxZd10V
QZLGEPKBXSRYz0v30sbwHtvpLJNdHmqQBzjwcUuCPe6rPHnhA9OmfwvrJ1fzOUsK
Jn2js2cNtQ==
=brYK
-----END PGP SIGNATURE-----
