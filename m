Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f8733a7
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 23:23:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4eeba601
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 23:23:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id abff8a50
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 23:23:37 +0000 (UTC)
Date: Sat, 01 Oct 2016 01:34:22 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <301b664b59525d15@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20161001`
	Available
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new experimental snapshot, `experimental-0.0.20161001`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * poly1305: optimize unaligned access
  
  This is a very appreciated fix from René van Dorst, adjusting the arithmetic
  in Poly1305 to work fast on platforms with slow unaligned access, such as
  MIPS. According to his calculation, this gives a 50% improvement on small MIPS
  boxes.
  
  * hashtables: use rdrand() instead of counter
  
  Rather than incrementing a counter, we instead use rdrand, which gives us an
  extremely fast source of random numbers. We're still running this through
  siphash with a secret, so a backdoored rdrand implementation won't be a
  problem.
  
  * examples: add nat-hole-punching
  
  https://lists.zx2c4.com/pipermail/wireguard/2016-August/000372.html
  https://git.zx2c4.com/WireGuard/tree/contrib/examples/nat-hole-punching/README
  
  * examples: add key extractor
  
  https://lists.zx2c4.com/pipermail/wireguard/2016-August/000373.html
  https://git.zx2c4.com/WireGuard/tree/contrib/examples/extract-keys/README
  
  * tools: allow multiple AllowedIPs invocations
  
  Multiple AllowedIPs= lines can now be specified, which could improve
  readability of the config files.
  
  * send: properly encapsulate ECN
  
  Thanks to the guidance of Dave Taht, we now support ECN.
  
  * Rework headers and includes
  * compat: Isolate more functions
  
  In anticipation of upstreaming WireGuard, we've now moved most of our
  version-specific #ifdefs to compat.h, where we use horrible macro tricks to
  redefine functions for old versions. This allows us to keep the actual code as
  clean as possible. When we merge to mainline, compat.h will be deleted
  wholesale.
  
  * tests: test jumbo frames with more transfer
  * tests: add crypto-RP filter test
  * qemu: enhancements
  
  With this an numerous other commits, we've further expanded the test suite.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161001.tar.xz
  SHA256: ac3abb7b940716ac12b96a2cb3f7666598cbefd26f19c268f627dc47cd113ac8

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQItBAEBCAAXBQJX7vZhEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA66cABAA
rTrIhKv2jruDdmp9RFrtufZ3eHWu3oB3uGEiPWkiRbfyU9mhRG89LnNjmiH3R5OV
OdtpMo/1fy3gLh4FDbdS1m4NLtQRqUPm25wV3lEpsctcnCDSNdunBXrBoBnf4g5e
FnX2yhn+lz7DCXD9ISBG43AaRgNSzcDHiZPw2KpYfWVs4W/rSacEnuKiOkqifDtb
A8JigI3Qdvi8vfzcAebGAmji/QJpyFDe41q4AHwdGYKSCTc/BzsY4QbtqFSvyJJr
vQEKsiFDaT8zq4gpXtQW6yIxWCcajFhF2DV4cL2MSFIEwCAveY0qPY6bSWs0iWKm
BMol9zRqbdG4hr77rdFwLMJzUac6ogJJ7UUjiUG2nCAtYBsAa4MNSfzpMkwhlTJp
m8YDEn+KuVsH1aBOPEmOgznrKhanyCjd/9AINRof+PDA0UjirdiFvejb/A2vIbf1
ZyqmvYsLu1movavkRV7DHfMaWa7qxbyGPf8eNnhpjEMyzd5qlxKqLBqIugFk6/9T
ykNJhqrI8f716r31v6pI7PW4HW7gIrzy8OK8QEqWyre3enIULYL/KVrEATyWpXYM
ONkFNuRmgRXOnKtITlqSjoWiGwivB46nKlq/kCLjPkgap6cCf+5Wcp7GGhHZWfEP
FRNXcfwHKshQR9aHOYuHbvjGMc3SHyOePzUrZikM+XU=
=2SmU
-----END PGP SIGNATURE-----
