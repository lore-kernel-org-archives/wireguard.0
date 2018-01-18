Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1341280c
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 15:40:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dcfdb77
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 15:40:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4df83363
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 15:31:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 512e4e86
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 15:31:27 +0000 (UTC)
Date: Thu, 18 Jan 2018 16:43:46 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180118` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b96c067bafcb48c3@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180118`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * receive: treat packet checking as irrelevant for timers
  
  Small simplification to the state machine, as discussed with Mathias
  Hall-Andersen.
  
  * socket: check for null socket before fishing out sport
  * wg-quick: ifnames have max len of 15
  * tools: plug memleak in config error path
  
  Important bug fixes.
  
  * external-tests: add python implementation
  
  Piotr Lizonczyk has contributed a test vector written in Python.
  
  * poly1305: remove indirect calls
  
  From Samuel Neves, we now are in a better position to mitigate speculative
  execution attacks.
  
  * curve25519: modularize implementation
  * curve25519: import 32-bit fiat-crypto implementation
  * curve25519: import 64-bit hacl-star implementation
  * curve25519: resolve symbol clash between fe types
  * curve25519: wire up new impls and remove donna
  * tools: import new curve25519 implementations
  * contrib: keygen-html: update curve25519 implementation
  
  Two of our Curve25519 implementations now use formally verified C. Read this
  mailing list post for more information:
    https://lists.zx2c4.com/pipermail/wireguard/2018-January/002304.html

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180118.tar.xz
  SHA2-256: 463f3b402deb66b7ceac8df2d50944f32683933356455d6c1c7453926db3a8a3
  BLAKE2b-256: fe7e3f12c084e50bf2794abafbe8aee48d58f318d508a59c0a4d2b27505b9d01

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlpgwKsQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drpz+D/9HDOJct7M9kqeHl/jZO3q/ozla1XNYj7cm
6lGdRNWbaX9MM+Gcuq/5X/CX4J0UKP68DQIQB1B5u6uFe0PeGvwz7Pgd16vxMIPU
vk7PKVeiQ4dHX81lBG201k9uI+ZmYaJexsiL0lFIQ62WFEGH3ckMgOg3ZeXHs5hx
FaEqymV/Sn6RguWD+VKPcdK3WVBYorRUUzBXg+FQocR6UB0dgNqcLazPScVpn4W9
Kurfvru2UoWBXDPicMY+yqJEq52ArS5corHeu06Cu1E8W2gWce+EScJudMOeJzcF
60imzKDJojfazvXR2WAkkVdQxZ8owi79EO716j70R/TZhHO4oUnCOqwDn/s2zpBy
goqRuIqBr5Y8wFNwA10RUfo4rfWP2ltBvmRqwKKNGVo4VKuyVS7FMXEikxZedkKq
e8r+rThW3e7P8dlVq0VhskcrMIYeXvgHVgXdyclie4WRIMyGIfH08pCwuVHnMpta
Mld/Pfj41Aus3AwqC2iiFmtPulWSrUJXm4eQk+qI41XvXLC36Z82b/SPoFb53uIX
VVFljuIXHpQseImGvNynqCFqHVypXPqVUz8jbGINvZnocZPAz2fI7bLPXigTV5PR
3bGRRu8TNi7afmZsMW2jzT2EzXO1mFKEY1NVSoxk41/b3ZOZX6Y+a9SuVhAfQdk0
QX8FwAfsYQ==
=1i3k
-----END PGP SIGNATURE-----
