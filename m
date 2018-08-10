Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dde987c
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 02:14:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc65419f
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 02:14:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f3e3f66
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 02:12:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5a586859
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 02:12:57 +0000 (UTC)
Date: Thu, 09 Aug 2018 19:25:28 -0700
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180809` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <1537b7b562a0071c@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180809`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * send: switch handshake stamp to an atomic
  
  Rather than abusing the handshake lock, we're much better off just using
  a boring atomic64 for this. It's simpler and performs better. Also, while
  we're at it, we set the handshake stamp both before and after the
  calculations, in case the calculations block for a really long time waiting
  for the RNG to initialize. 
  
  * compat: better atomic acquire/release backport
  
  This should fix compilation and correctness on several platforms.
  
  * crypto: move simd context to specific type
  
  This was a suggestion from Andy Lutomirski on LKML.
  
  * chacha20poly1305: selftest: use arrays for test vectors
  
  We no longer have lines so long that they're rejected by SMTP servers.
  
  * qemu: add easy git harness
  
  This makes it a bit easier to use our qemu harness for testing our mainline
  integration tree.
  
  * curve25519-x86_64: avoid use of r12
  
  This causes problems with RAP and KERNEXEC for PaX, as r12 is a
  reserved register.
  
  * chacha20: use memmove in case buffers overlap
  
  A small correctness fix that we never actually hit in WireGuard but is
  important especially for moving this into a general purpose library.
  
  * curve25519-hacl64: simplify u64_eq_mask
  * curve25519-hacl64: correct u64_gte_mask
  
  Two bitmath fixes from Samuel, which come complete with a z3 script proving
  their correctness.
  
  * timers: include header in right file
  
  This fixes compilation in some environments.
  
  * netlink: don't start over iteration on multipart non-first allowedips
  
  Matt Layher found a bug where a netlink dump of peers would never terminate in
  some circumstances, causing wg(8) to keep trying forever. We now have a fix as
  well as a unit test to mitigate this, and we'll be looking to create a fuzzer
  out of Matt's nice library.

This snapshot contains commits from: Jason A. Donenfeld and Samuel Neves.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180809.tar.xz
  SHA2-256: 3e351c42d22de427713f1da06d21189c5896a694a66cf19233a7c33295676f19
  BLAKE2b-256: 7a17f67c92c78fbf2fc2ed95721032894983854f4c804862b3bf848f55798468

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180809.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlts94cQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drtm2D/9EqboMHgR7KHufzlU/yiqsmvE8q8/s1Abq
FGBnXMqGMi0nA62I5+XUD2D1Q/LfcISJQ4MJJO+bH3u0PF6tvhQAGYMp90S3/w96
HX8eN1DZBnytkRnRwscK8Dx783BOXsoWveiJO43+P1ChyRWECT16nOQYiedAShFf
KMx/emozRXIhFSTXgOh9jCUE0EyBgFc1fxiRYKzbmEqwHUAm9P6eu+EhtlaKKp4a
ms/WAE3xRgxKgt866k5Uzd+YA84b9dyf3cXWEPRfHwj1oUsgGF34tstMIy0rsQbi
CaduMSssakPokZoEk5L0mw/JyxoPoBuZgOOIallDRQgOI+dPbH3GYuCl4FQs/1r+
zEHzLgXV5FYI/8TxZ1XDaufMdaBJp4WyW8zhLRKTW2+wggjvt6gdxy/2IBJA4TH7
6d9HfXom4w/pcmBgkg48T8l0wZXpvFXBUNXdYVSKnuMgk/KR/7oVzyyP3UC6Xrq6
F1Y3KrXjH9tNuWs0YnoebWYIyroJBemOpU7IztWHTIQ0O9BfZXQfuH3rKS7KO71T
JZc3dRVb5fyms30n4aLf3TfyIrpo1x6teKeXVY5KXNTyPdjHkj3mgwc4ZXJDeSqc
Z7R+kZxMt/ZSaVT5oJwpQfUB1LbYee3ZTvIEbp9cuDlcHn1wbJWy5NU9gTGZe3q+
3wZhduSpcw==
=LwpG
-----END PGP SIGNATURE-----
