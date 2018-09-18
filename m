Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f82a4f42
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Sep 2018 14:54:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7e3c54f
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Sep 2018 14:54:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 609f41c2
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Sep 2018 14:38:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2e7d3804
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Sep 2018 14:38:16 +0000 (UTC)
Date: Tue, 18 Sep 2018 16:55:49 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180918` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <15559d21d0bc8314@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180918`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * blake2s-x86_64: fix whitespace errors
  * crypto: do not use compound literals in selftests
  * crypto: make sure UML is properly disabled
  * kconfig: make NEON depend on CPU_V7
  * poly1305: rename finish to final
  * chacha20: add constant for words in block
  * curve25519-x86_64: remove useless define
  * poly1305: precompute 5*r in init instead of blocks
  * chacha20-arm: swap scalar and neon functions
  * simd: add __must_check annotation
  * poly1305: do not require simd context for arch
  * chacha20-x86_64: cascade down implementations
  * crypto: pass simd by reference
  * chacha20-x86_64: don't activate simd for small blocks
  * poly1305-x86_64: don't activate simd for small blocks
  * crypto: do not use -include trick
  * crypto: turn Zinc into individual modules
  * chacha20poly1305: relax simd between sg chunks
  * chacha20-x86_64: more limited cascade
  * crypto: allow for disabling simd in zinc modules
  * poly1305-x86_64: show full struct for state
  * chacha20-x86_64: use correct cut off for avx512-vl
  * curve25519-arm: only compile if symbols will be used
  * chacha20poly1305: add __init to selftest helper functions
  * chacha20: add independent self test
  
  Tons of improvements all around the board to our cryptography library,
  including some performance boosts with how we handle SIMD for small packets.
  
  * send/receive: reduce number of sg entries
  
  This quells a powerpc stack usage warning.
  
  * global: remove non-essential inline annotations
  
  We now allow the compiler to determine whether or not to inline certain
  functions, while still manually choosing so for a few performance-critical
  sections.

This snapshot contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180918.tar.xz
  SHA2-256: c0d931bdfce139a3678592ada463042c24f12dd01ba75badd3eeb0aee2211302
  BLAKE2b-256: 955a18fe75291b0c8fb12e28e149c39de3ef407e22916cb0955f7b629acab662

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180918.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAluhEekQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrupQEACXPlfeANqS1hg3AAnhNrKxaDSVk3DmFjAx
pXogTAjIqwutEoTqqNQsyRjH1wI0e/Ep6DTcuIe4hTrIKt8cUCojUwBJfDGHXyAl
IJTqovAaIMqpPyIwZ11Uv0SWcmxMS5uy7hufkWhQRU4K5Y7JwWILbxLzzOVbj3vw
WC4JSn/zmL1ov5mpZqQICGobXI3KzgiApX9qWN02ZCRYwaVzmp8St1beCVw7Q7To
PGu3ZYXK6bmZ2LJqr8km7AGYW42javXrly+80c+oNCQ9Vq8jfmSga0MuMky/V7Ng
55OBizXHGguaSinmTGJan+jlViku/7+ZhZZK9t56KQmCRgrIWh0NyuuswLJawYWd
QlIzcnPtYDS62C74uiGzszji9ZOFoB8rwhUMf/kM1je9o2O2dSiDUVLvPX9Fs6eA
4FQDCLi4+pz5TbFli3fHu/mOvO2UM++X1ITiA7Xhf7QaVbfa9E4LkJTLohGyBjEA
PPAHQCAjJXRkFL1b65EQtxWx8DDcgbSn/SwIyQlt0ot1Zth5P9hUxCbvB7Courcf
p8TnzkRCcfQraT1ActJW/2FGKnFTc6tX2xvuwY/2C1bhsnconeGQ8kylcEMgI4Y8
8bpNS0yzngbfMoTfwyquDAGIEMmIjYNzq/xg5UvCgRNz6qrQ89BhzV31OOMcxVz9
GKmTGukxnQ==
=LS9G
-----END PGP SIGNATURE-----
