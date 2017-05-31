Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6b9e73b
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 May 2017 14:22:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 086054b1
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 May 2017 14:22:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdf76661
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 May 2017 14:33:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 63aed403
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 May 2017 14:33:53 +0000 (UTC)
Date: Wed, 31 May 2017 16:35:36 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170531` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <c04b7a897d9fce0a@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170531`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  This rather large snapshot touches quite a few sensitive areas, so I'm
  releasing it now rather than later to receive feedback on any possible issues.
  It also contains fixes, so everybody should upgrade.
  
  * man: fix psk mention in wg-quick man page
  * man: update wg-quick(8) to show Debian resolvconf braindamage
  
  Documentation cleanups.
  
  * wg-quick: use src routing for default routes in v6
  
  ip-rule(8) doesn't do the right thing with source addresses, unless we
  explicitly set it inside the route. This fixes wg-quick on IPv6 systems.
  
  * curve25519: actually, do some things on heap sometimes
  * curve25519: align the basepoint to 32 bytes
  * curve25519: add NEON versions for ARM
  * data: enable BH during parallel crypto on ARM/NEON
  * chacha20poly1305: move constants to rodata
  * chacha20poly1305: add NEON versions for ARM and ARM64
  
  We now have faster primitives on ARM and ARM64 processors, which should
  improve performance.
  
  * handshake: process in parallel
  
  Handshakes are now processed in parallel using all cores, which should improve
  throughput during a storm.
  
  * noise: no need to store ephemeral public key
  * noise: precompute static-static ECDH operation
  
  We can precompute the ECDH(s, s) calculation, which improves handshake
  initiation message performance by double.
  
  * style: spaces after for loops
  * peer: use iterator macro instead of callback
  
  The most unreadable C ever produced. It might be wise to find a sexier-looking
  alternative at some point.
  
  * compat: remove warning for < 4.1
  * compat: ship padata if kernel doesn't have it
  
  The usual array of annoying compat things.
  
  * rust test: convert screech test to snow
  * rust test: add icmp ping
  
  We now use Jake's snow library for Noise in the test, which we've expanded to
  complete a ping.
  
  * config: do not error out when getting if no peers
  * tools: allow creating device with no peers
  
  Fixing some small things in the tool/config interaction.
  
  * device: keep going when share_check fails
  * routingtable: remove unnecessary check in node_placement()
  * config: it's faster to memcpy than strncpy
  * timers: fix typo in comment
  
  Nits.
  
  * debug: print interface name in dmesg
  
  For those who compile with `make debug`, you'll be happy to see a bit better
  information in dmesg.
  
  * timers: rework handshake reply control flow
  * timers: the completion of a handshake also is on key confirmation
  * timers: reset retry-attempt counter when not retrying
  
  Tightening up our timer implementation, which is quite important.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170531.tar.xz
  SHA2-256: 2eb7d9aaf11dcb35e5066837bb1c768398ad3655744fdeb656bd7e7c7ad7cacc
  BLAKE2b-256: 64e5d061e0d03133b781b902d3b5b61658b6d9f664b304325476d5add3a701ca

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlku1IoQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drh/KD/4iyKcLlhBivsvC9pGbIcAL9nvsnFq7dkOz
MILh3048lMRGCts7RsgH7+Q6Yzzn0HwbwPfAugsjcXrGJGhVwSx5WP5H9oD1ev+1
A9H+zVU4srLBJa/khC3ccjYNmOHEiC2ugv6DSy8cNn4cnH/2YPbhocqhnrvVnEKU
4ESXcF35/iuc6c3XJCd9EK1bF7263zIodDS3HkBh31muV4x8POr7m897v78AIUJb
GR7w5P6y27kH2VU0onobLXQ0vfy2Nr3SHSZwu7HBFdXAX//okB+sdmMloBUmqgx3
wNT0rjcd6KB4W8w44Cj2i61p2d8o+Up50r7EA0E+rU8oIVrQXkmpkeLBWkmzHD6H
ZlZVMxSfosW+2yIslWzjJ7EOHn72FI5ANXoP0IQymON2NVhbegevI3+HbxrR+tvQ
sAQHvIwsfJ116ACrISYt1xo7b2mMmGjS8/XNcpqGaIkqLGwxHJ7kJiOlzl0lBtaP
cSHzjeVMD4BKo63UQioLGUkIL7lj36L9VK46gBZ3C0HvllgOfHv6MOUD+Ev1vw7N
4z4UjmhuiHDq7xQ1Bq5haH8d6Pager5ece4DMKN5YUrYmQIikLTEGFcktGsow9ym
mUoeYskrkhw2uJN32Dr6nDHdxG+WQaGIMk+CpIoCh7e6dRa7eYJ9MeNaF2/Pl5TL
F7yVoGQFgQ==
=llZj
-----END PGP SIGNATURE-----
