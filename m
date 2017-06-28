Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afe4e341
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Jun 2017 12:20:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fe98b8c
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Jun 2017 12:20:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31ef8eec
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Jun 2017 12:33:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9a7ee8b8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Jun 2017 12:33:47 +0000 (UTC)
Date: Wed, 28 Jun 2017 14:36:49 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170628` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <f649eda6e3161d09@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170628`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * main: annotate init/exit functions to save memory
  * selftest: remove antique siphash self test
  * haskell: re-add updated haskell example
  * socket: use ip_rt_put instead of dst_release
  * device: avoid double icmp send on routing loop
  * compat: clean up cruft
  * global: cleanup IP header checking
  * compat: do not export symbols unnecessarily
  
  Various cleanups and updates.
  
  * device: netdevice destruction logic change for 4.12
  
  When Linux 4.12 is released next week, we're good to go.
  
  * device: only use one sleep notifier
  
  Rather than have a separate sleep notification for every interface, we now
  have a single notifier for every interface. This improves performance,
  especially when creating many interfaces at once.
  
  * device: remove icmp conntrack hacks
  
  We're moving hacks upstream the proper way, and then backporting them to
  compat.
  
  * receive: extend rate limiting to 1 second after under load detection
  
  After we determine that we're under load, we now wait 1 second before not
  being under load again, a timer which is global across all interfaces on a
  given system.
  
  * curve25519: satisfy sparse and use short types
  * curve25519: keep certain sandy2x functions in C
  
  Certain functions have been made into C, which should improve stack frames and
  reliability.
  
  * ratelimiter: rewrite from scratch
  
  This is a big change. We no longer rely on x_tables or xt_hashlimit, instead
  using a super minimal and sleek token bucket ratelimiter. This works much
  better than the old cruft and should allow us to run more places. It also has
  the benefit of being global, so that it's possible to have thousands of
  interfaces without killing the system with separate GCs and vmallocs, which is
  what happened prior.
  
  * socket: verify saddr belongs to interface
  
  We now more quickly react to changes of the v4 routing table, by ensuring that
  the sticky source address is actually still valid.
  
  * wg-quick: properly match IPv6 endpoint
  
  wg-quick now works better with IPv6.
  
  * wg-quick: use printf -v instead of namerefs for bash 4.2
  
  This adds support for old bash, which means wg-quick should be generically
  "bash 4 and up". I'm not happy about this but EL7 uses old bash, so we're
  stuck with it.
  
  * compat: support EL7.3
  
  Support for RHEL, CentOS, ScientificLinux, and so forth.
  
  * compat: support Ubuntu 14.04
  
  An old crufty Ubuntu is now supported, since it's LTS.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170628.tar.xz
  SHA2-256: c2cb9c05daba79389f920e57e9cdb2cf706c0b3929cb6ede89afef2684f62f2e
  BLAKE2b-256: 4d4bb45743f618437fdf3dcc1fc505479bb8f3291ffc716ca4e295926de31c64

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAllTotUQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrrIoEACJ0COk3ve2Flj2bVu5+uOnpGy5OBF6cnh6
N1milfLBhelf0zrytMQhogCffoBm8QMgPT99amZtEaPguQM1VFlhviROe3X6sU20
rcY8+M/4h9M9xJLHgx3Eesx6lFuvrm2vak8/fkhVtoPnt/7MCYA+Q3XczwVIm6NY
dLRxtXxYreVqTLzeTQ7MjpHP/DINMwL0YlIfTAybOAi9g1wHUwabqcFrgDvZVn+7
AJr6V+GakWYrdtbxFfqjcnqgyAEIxZiUIBvLAfA5X8r4Y6KXUUG/QZDhpp1N1M4M
yavXaExcBFeWySmkGBBqDEs5gPUAuykLdfQ7L/1P0tYBzZrwqJGhKBlJ67bPdVHe
GywDgUDstrI2WSMWAiy+xVhXqYd3I5iFY9m8DTD4ZbWHeWWP5fAQ3LEPsaLqr9/A
iR0Q6x0RNFThtmZxWlpzIZra8r9Q+yVt5gqv/KE7+7NpXd3x01+X5+iVcm0qxowG
idLFM3MtVviCivvWDwbbrgOuuS7laGtNnz7O6TPb3A1nEjpDKsn/Lh46hEQiN0oI
xuAEJgWSqRomoriN5AR6iHQzpslvGR0C063gZiaCeS7qFBvZh0lQhbI2jarTtu5g
6Eqr4iSx/73417AVJynGwqflxtbRnpP31Q/oKNhImjpgSQez4DDDMcgFDJzMnpcO
eXyYOzs0vg==
=CFF0
-----END PGP SIGNATURE-----
