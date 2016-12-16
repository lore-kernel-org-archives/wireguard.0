Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b910b6c
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 16:07:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce696ce2
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 16:07:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e138b57
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 16:07:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 57a86e8e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 16:07:45 +0000 (UTC)
Date: Fri, 16 Dec 2016 17:14:17 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] Snapshot `0.0.20161216` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ced75ffb629b0106@frisell.zx2c4.com>
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

A new snapshot, `0.0.20161216`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * messages: increase header by 3 bytes for alignment
  
  PACKAGERS PLEASE UPDATE, as this is a protocol-breaking change.
  
  * device: disable ipv6 auto address generation
  
  Now finally we have working tcpdump and no useless automatic IPv6 addresses.
  
  * device: rc -> ret
  * device: dellink is already implictly unregister_netdevice_queue
  * device: simplify device_init, since it only returns -EEXIST
  * main: consistent lines
  * device: clean up xmit error path
  * device: allocate tstats in newlink
  * global: move to consistent use of uN instead of uintN_t for kernel code
  * crypto: use kernel's bitops functions
  * messages: remove unused constants
  * blake2s: move self tests to correct directory
  * tools: fix latest-handshake typo in documentation
  * noise: update comments
  * config: cleanups
  * types: enforce consistency
  
  Numerous code quality cleanups.
  
  * device: ensure icmp skb length check is done for v6
  * receive: simplify ip header checking logic
  
  This adds a missing length check and generally simplifies length checks
  throughout.
  
  * peer: don't use sockaddr_storage to reduce memory usage
  
  Now that we have struct endpoint, ditching sockaddr_storage is a no-brainer.
  It has the affect of making parallel decryption faster because it requires
  less of an allocation for the ctx, and thus our kmemcache can be merged.
  
  * tests: avoid non-strict writes via printf
  
  Finally fixing this silly old bug.
  
  * ratelimiter: drop family from action for 4.10
  
  We're getting ready for the first rc of Linux 4.10.
  
  * siphash: update against upstream submission
  
  I've been preparing a big patch for upstream Linux to include SipHash, and in
  the process I improved the implementation considerably.
  
  * hashtables: use counter and int to ensure forward progress
  
  This gives the best of both worlds between the two hashtable rng designs.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20161216.tar.xz
  SHA2-256: 9d3c1f52a9995d2bf1f5cd9d6b1922bd1f78fb3ddbd30bf3587077f79ef0977b
  BLAKE2b-256: e990c133d1ca936d226d05f170f0d46f39f585a648da85249dc98023548890ae

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlhUEkMQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrtE3EACOf/Kp80GREWj5Cn30rtgD4ueeJi9P+Ea2
srSLeqU/yTdQpTdv6KLn9tznuTsS7tBLGs5jn4Vi9l50vwwgB//4qPtN5XlyV6iS
hV6wjEuaXME3Gc+n3uRkY+0N3UIJLgePmPuuwNJnX2su8UzA4/0CaWwBC5pez3z8
M/ho2jfT19ulh+nmS2Fm9gk8uJYjDj44dQpbi0o5Ti6zmf+i1y0QhEJGd4bgiKy1
Vrs34OAq+PhU0aRMO/4meLoLR2dUEKDJv3Vk93oynlKexyEMdNMJlIXlVnQ+3h5c
QcBC0S+4L8qCn6MCDS4/BHZ85MKIc8YA7ZBC1yYB+fdkkhsbdFbp5Pp4GaRkYCs1
WxDI5Wqt2ZeoCiqG2Agwq9T7vN7zLE6wxails9yyqebOIW4pinBhixPp1C0R3+8I
IwtcSBzOvHKwmBtFp+mk/XZ5DI4CojFpzd6x7dStTQEx1QXlKJn2T0u65/ZfayW1
7hPpjB3rGsLH+bEMf1jyQbqwcpJSyMUXWoQs26PDOe2+TD26LRr7b2jTIcwNWdBP
iYTf2pMEfRn91CzqSKL56cpZ6zuMqbggfhRlrvLJ7dzVps4c6vipoBQtWJzEjksr
GiljSiYQtyGiy41zkemaN8KhtU6OiHzxkut3tBW34u6QwrFYmpY3h5aCNlz7IwO0
+4NNO2Z3SQ==
=B1k3
-----END PGP SIGNATURE-----
