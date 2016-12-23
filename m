Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b635607d
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Dec 2016 20:08:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8057dfe6
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Dec 2016 20:08:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fea3a3cf
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Dec 2016 20:08:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fd190677
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Dec 2016 20:08:01 +0000 (UTC)
Date: Fri, 23 Dec 2016 21:15:28 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] Snapshot `0.0.20161223` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffffac503169@frisell.zx2c4.com>
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

A new snapshot, `0.0.20161223`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * config: allow removing multiple peers at once
  
  Before, specifying several peers to remove on the command line at the same
  time would not work. This is now fixed.
  
  * routing-table: simplify and mask reparented root
  
  Now reparented entries in the routing table are properly masked, so that you
  don't wind up with strange entries like "192.0.0.0/0".
  
  * tools: allowed-ips is easier to parse with spaces instead of ", "
  
  This is a slight change in the tools CLI that should make it easier to parse
  with scripts.
  
  * tools: do not use AI_ADDRCONFIG
  
  It is now possible to configure IPv6 endpoints before IPv6 interfaces have
  successfully gotten their IPs.
  
  * wg-config: cleanup ip parsing
  * wg-config: cleanups
  
  General cleanups.
  
  * cookies: use xchacha20poly1305 instead of chacha20poly1305
  
  This is a big change. To simplify the security analysis, improve speed, and
  simplify the code, we now use XChaChaPoly1305 with a random 24-byte nonce,
  instead of using a random 32-byte salt.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20161223.tar.xz
  SHA2-256: bbd98ff6667e76ac283685db9ee7a6777529f5d311a0bf1fe9a15932aed2b972
  BLAKE2b-256: 19f4754d95971842f868ea95fffe7b590b40dfab7e728c7d747da822a6c73dc7

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlhdhcoQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrpzWD/9H0tB42ZHzgf071FhFiG5lHmEIU3UYyJoZ
l95ynx1utOVQXM6CUXUBUtMyAz9eiFnrWZ59k35ItmJR1WFL8YiuZ1A3sR9GJ2iY
ZeS5SbdCQbxfu+K07Rz64bFkpuJ2gCt3UoHhWXQsBbLuMlQSY1arSW2ttv0gtrNS
rsljpkFncNBxbbE9Jkt7SPbHWHrIveL8BzcIv5DPUd2QoHGsl1KDijneRWpZd6zW
9EhWlNGWarK35IbdWrMSQAcYbzgCgWk0ulJ8RXNQ2CjHD4h0sx12nM8NTYPTx0Hk
B8WLY1BSoxZ2+atTShotBFUvRKVlLylTr9WFxCvChVCNazBVZJkefYiSonDm6h7e
phwA44pJOfOZ3tE/10CHeQ0bNE2IUp+z+sXQO/gR6v6B7DaPQvq4X/my33OihGIZ
/lwNjWDrl9N8MJlFF+l48B00O0P1QBJP6J8E+vQpxahQshaEaBT9ZK/weNM1Ks0N
JmqRWPzukH+AiuoYhpmN1LZw/XnU+ZPMZ0Ngm9oSvNtYNX99YaG/Iq6mOceEcQsG
P2VRGw9GITx1QzPxbOxYRWOz5C4B4Dj7ZbsJwM54bhr4pSEfTXQumBAE0XQQIdMI
QP5Jx7EMntBKF9ZFTUbtMUxCLyjMmvDGqfTJW/yr9IVK3HYqaYpvhdI3odXgzRRt
RHE5Ybfe3g==
=ULSh
-----END PGP SIGNATURE-----
