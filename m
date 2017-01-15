Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2eec407
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 11:59:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5407045b
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 11:59:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15989cf4
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 11:59:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d444f612
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 11:59:24 +0000 (UTC)
Date: Sun, 15 Jan 2017 13:09:45 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170115` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <731e5096207b6f39@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170115`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * tools: wg-quick: enforce good permissions
  * tools: wg-quick: parse IPv6 endpoints correctly
  * tools: wg-quick: better removal of suppress_prefix rule
  
  The former is good practice, in the likes of SSH's warnings. The
  latter two are bug fixes.
  
  * tools: error on short ret reads
  * tools: ipc: read from socket incrementally
  * uapi: add missing userspace headers
  * uapi: use flag instead of C bitfield for portability
  * uapi: use sockaddr union instead of sockaddr_storage
  
  This makes the UAPI a bit more portable across languages, which assists
  with the Go implementation efforts.
  
  * config: useless newline
  * Use __read_mostly attribute when possible
  
  General code quality improvements.
  
  * ratelimiter: 800ms too fast, decrease to 2s sustained rate
  
  There's no need to allow 800ms handshakes, when there's already bursting
  and when more than 1 every 5 seconds is already too much, when under DoS.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170115.tar.xz
  SHA2-256: 7e5f9f4699a2d4ace90d0df5d81bf0f67205ee08c45b95e0acc379bedef5ffe8
  BLAKE2b-256: 4cc76b43a7375f2cc39cb7f256d2f0d53423e5fbc6f6ffe84ad6735889a02dec

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlh7Zn8QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drgb8D/9Ir0/CVs0eEequqPIwyjgmdWJzIfIbvQWy
kn/eUcrap9OGgqfwnTWooKGliEP7FQy+ADMU78Cd8tUsGFRsogNRM6Po0sZSM9aU
SAPicTlTRJhQqJkHv5/uSZlzRUSCNWxpOcMax8N8KCzfnbz1IxHUX7wrr1DrxiNM
gZy8MlFLD9CvwmLQeEqvWqXvB+aRVLJi+H3fwYMBYse+WY0F21g9ht3ToYT9pmxs
nHhM1fwxMdQokrrWz/3L2xjK5Vc7/NGL8tMWxQQmbyF6Kv0pS7Ry+8u/oJNLl8dH
9aPs4oYH/kTgfrTNe5xJ5HIhsbg3XusL7u2c5WtaHdFfZnmT8/SLaYBCxcZZUF0r
2gV57pC2ZfaZdYipw6Yj7onOOY3PZMgdzlsPsCfoIrK8aNy2QQB1e8FAja0LMqYH
9UsyzzfPoNNffXJpYjiNNDQeKIv5Jqu9Htlc6/SCykg6+P8YyuH8ll+2mTWpWqYX
W3Zd1w54f/skh8M7ablalY5JqRzFM2csHPkzz+pW9ei7EteWhUhsWJ2+QyI0pTs/
Lr/x4jNxVB6A/dV9GfrKoVrF6PktwJ6U6j/OCvAQ1zssq7Khc3tOA7YsrC06PVEP
4TKBhS10RMUNt6aMqc7C4ptol++GHYz6/akAXTfUxpxqWcXGI5DzRSvi1dwaCmbc
YyUxVZ3NBQ==
=OV21
-----END PGP SIGNATURE-----
