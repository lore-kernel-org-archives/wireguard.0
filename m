Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c18c11e9
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 15:31:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdae3e56
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 15:31:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2681d35
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 15:33:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e67200b9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 15:33:54 +0000 (UTC)
Date: Sun, 13 May 2018 17:35:03 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180513` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b9930cca8bf4ec77@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180513`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * keygen-html: add zip file example
  
  The alpha Android app now supports importing from .zip files, so the example
  contrib code has been updated to show people how to trivially generate .zip
  files from ... javascript. That's right, the WireGuard repo now contains some
  more demo javascript.
  
  * qemu: retry on 404 in wget for kernel.org race
  
  Simple fix for build.wireguard.com's handling of new kernels.
  
  * embeddable-wg-library: zero attribute padding
  
  This imports 37c876b55a2c00424ccda5a300ab5fdec1d88b22 from upstream libmnl.
  
  * allowedips: add selftest for allowedips_walk_by_peer
  * allowedips: use native endian on lookup
  * allowedips: produce better assembly with unsigned arithmetic
  * allowedips: simplify arithmetic
  
  A series of bitmath improvements make allowedips lookups sleeker and faster.
  
  * socket: use skb_put_data
  
  This follows 59ae1d127ac0ae404baf414c434ba2651b793f46 in the kernel.
  
  * chacha20poly1305: make gcc 8.1 happy
  
  GCC 8.1 does not know about the invariant `0 <= ctx->num < POLY1305_BLOCK_SIZE`.
  This results in a warning that `memcpy(ctx->data + num, inp, len);` may
  overflow the `data` field, which is correct for arbitrary values of `num`.
  
  To make the invariant explicit we ensure that `num` is in the required range.
  An alternative would be to change `ctx->num` to a 4-bit bitfield at the point
  of declaration.
  
  This changes the code from `test ebp, ebp; jz end` to `and ebp, 15; jz
  end`, which have identical performance characteristics.
  
  * queueing: preserve pfmemalloc header bit
  
  Precautionary measure. Further work on this function goes on in the netdev
  thread: https://marc.info/?l=linux-netdev&m=152607982125178&w=2
  
  * compat: handle RHEL 7.5's recent backports
  * compat: don't clear header bits on RHEL
  
  WireGuard now supports RHEL's latest kernel, which involved fixing some pretty
  major crashes and clashes with RHEL's backports.

This snapshot contains commits from: Jason A. Donenfeld and Samuel Neves.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180513.tar.xz
  SHA2-256: 28a15c59f6710851587ebca76a335f1aaaa077aad052732e0959f2bae9ba8d5c
  BLAKE2b-256: 24bbe3e6d382682138ccf0987f134b5786dc2c12e1a6aefc4a49dfd4aae6d48b

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlr4Wp0QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrqOfEACbxvlKr0f7xrGpk0Jr8Z+OYCQokC8hxETF
a8fQ1A3k3ptEDx67mBJGs76GgBghdI4OraZARSunT5z3e0BvqYneuLRDIJ4sw9mO
gzEbTZCeSBikaDFsELhYpzKTfJfR3dgdT2dJY+KhkxsKePypiY9GY9lqoVz4mQi4
+tvhiXomOfG6+XHTTUY//ES7t4ifpD6deB+LMqORFlhWrD6iRUUVl77k8R7dlvNk
qMfF+M7ee/Brjk3nRP6Ginq2I6OhkP8GBvf4bMH48oS0/0LFXhTl4YSYfIxj8oAQ
zX7513By8vEaH9PlAqBgQrJLw3KALz0zi0TlKMbV0Kb+ORJLdyIlENBee2LVRdjR
ppkXnHWd+A8hdacgc0jt9ei96bFr5YwJuJLqfXK19O/rW/R+3WmLewFKaHdRd+EZ
VnhZjk8qs7yCtSLg47BSvEgmIa665ghelrKBRKIH3AYPmHGZGAXDwVX5QMD8LBHP
WhVuhlOGR/Da2Ekygr0m5Oj0vopl6eW2VW4tTq1FSjrAIqlloUbILcKtyNdZ/65Q
oIfqsynkcgj+K7dyIIZJXefdsE0UtE6gQAI+63Ajbg9GUk5zzZfPH5gysFqU5mmr
8+UwLoGOD3MuzV+m0qWdCqUMI3Gc324j9D2cMg+dPyVToKRt4wPJE67yyH/qtHQR
xDebWbUWbQ==
=2oOa
-----END PGP SIGNATURE-----
