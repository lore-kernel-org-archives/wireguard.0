Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5951a8fa
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 00:56:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7acfbfc4
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 00:56:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6f02901
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 00:40:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2211c7ad
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 00:40:28 +0000 (UTC)
Date: Mon, 10 Sep 2018 18:56:59 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180910` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <154ef634456ff903@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180910`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * curve25519: arm: do not modify sp directly
  * compat: support neon.h on old kernels
  * compat: arch-namespace certain includes
  * compat: move simd.h from crypto to compat since it's going upstream
  
  This fixes a decent amount of compat breakage and thumb2-mode breakage
  introduced by our move to Zinc.
  
  * crypto: use CRYPTOGAMS license
  
  Rather than using code from OpenSSL, use code directly from AndyP.
  
  * poly1305: rewrite self tests from scratch
  * poly1305: switch to donna
  
  This makes our C Poly1305 implementation a bit more intensely tested and also
  faster, especially on 64-bit systems. It also sets the stage for moving to a
  HACL* implementation when that's ready.

This snapshot contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180910.tar.xz
  SHA2-256: 43481ac82d4889491e1ae761d4ef10688410975cc861db5d2ac1845ac62eae39
  BLAKE2b-256: 501aba93c8144cd77b0aeac3f6e98aab82200f86e4339ff48a9f3e70d3048063

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180910.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAluXEeEQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrqtJD/4kJoUwH+DDoRCaevjVOCPVLcWQyvLx8Gcf
bmof3fKvtU7aeeaAopE4uo/ZK2iYRnKgsJY6mzH/oRLb1xpqKoYeuhDyUNh7j+Ay
cUYZugYMf+9/YKGr94/4rwYfTzZz+cmtRj9X1Zqc+IV8K4UpZuemllzdvtTybuii
I24MatrLUs8oX5Os20inDvg0uuUxePRyZi4d1rfDv88OhNArw4vYALcgHlv1Ipye
geDijtPRIlxURA3Obo/kalTbfCKJb654GNGIxWCws+xbucclt12FUhjxzWVmuRWP
k86Bl8Uw5E5bNsaBlSQombZWbvkWHtWqNvw5i/QDfEs5uApdn03ElCahnyiFwdTB
I32uxTvYtLiMy+pIj3xQnQDIG5SOoHWhSROhPKfVmW4fxJilQhREZgDe/1lWAE1G
E4A1xKysknnSjAO8l2bvq9p1o81kz6E5la/yYzZDHMkeFJCg1O9OG58BeO/AIxRV
ElkF06SahasleXM893UfPKCwfPXBY8VP/90KJR2OUzoNoLC09Rs/xjvm7psBcDYW
k1o8K5hrsbUZ3PLcfSHiyuxsqN11JWKMZ0b/M2OFZg6pYt8QwKsmrt1BOj0kTRR9
Pfe6u7nh2pW2qhiC4663dYVChe3pztOP5Hk3G+A03WRZDcout13TKJKVji6PmBaO
cOShbVty9A==
=9Js6
-----END PGP SIGNATURE-----
