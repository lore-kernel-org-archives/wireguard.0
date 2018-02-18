Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36788cb9
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Feb 2018 20:30:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68c25d8e
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Feb 2018 20:30:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6cb9044
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Feb 2018 20:21:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e06b467f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Feb 2018 20:21:40 +0000 (UTC)
Date: Sun, 18 Feb 2018 21:37:54 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180218` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b9765e4a8bf3b639@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180218`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * keygen-html: fix up copyright
  
  Copy and paste errors.
  
  * tools: do not collide types with libc clashes
  * tools: FreeBSD doesn't have EAI_NODATA
  * tools: fixup errno handling
  * tools: endian.h is not portable
  
  Fixes compilation and correctness several places.
  
  * tools: allow in-line comments
  
  You can now put a # comment anywhere in a line, in which case, it extends
  until the end of the line.
  
  * wg-quick: match from beginning rather than shift right
  
  This raises the proper error when providing interface names that are too long.
  
  * qemu: add support for powerpc
  
  Now that we have known PPC users, it's probably a good thing to ensure we
  don't introduce bugs, so PPC has been added to our CI on build.wireguard.com.
  
  * poly1305: fix up selftest counter
  
  Make sure we're using the right array length in the debug-mode-only
  self-tests.
  
  * netns: replace n0 ip with ip0, per custom
  
  Fixes up console output consistency.
  
  * qemu: more granular memleak detection
  
  This avoids us getting memory leak errors due to upstream's power management
  drivers leaking, or the like, when we're only interested in WireGuard memory
  leaks.
  
  * socket: free skb if there isn't an endpoint
  
  Fixes a memory leak.
  
  * allowedips: indicate to clang-analyzer that trie is non-null
  
  Hopefully future versions are slightly smarter...
  
  * blake2s: use union instead of casting
  
  Similarly fixes a clang-analyzer issue, as well as ensuring alignment.
  
  * tools: normalize strncpy/snprintf usage
  
  Correctness.
  
  * contrib: add embeddable wireguard library
  
  See: https://lists.zx2c4.com/pipermail/wireguard/2018-February/002387.html
  And: https://git.zx2c4.com/WireGuard/tree/contrib/examples/embeddable-wg-library/README
  

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180218.tar.xz
  SHA2-256: 4ac4c4e4ad4dc2cf9dcb831b0cf347567ccea675ca524528cf5a4d9dccb2fe52
  BLAKE2b-256: 5dd1bcd28982ef93d5bfb3ad0a6766f834a997f40a4237e75016b9dc5a8cce06

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlqJ5AwQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrnnmD/0dVcKHdRu+pWEgR1ZLCpTT6d6xccH6Xqs/
SSxdvQuGWb0IcStnyh1hMrWJQhy3iGW03UgHgWXOl8IWz8xs9a6zDEPNhRezeBTc
gXGGYVO6YCjdLrhFUxCK9C/3iYVvjnr2jKWke1xQbhh4TDFtHjxjT9UMmP5C2ja+
mBjcA4E8Z9iscxZnDWjBYPxCnkHyS042rhlXZxg0xw1UDAyMnrA8Tb3eLRWj6HkX
OLbwzmfuCqPwseWA+Ih+MBsi90v/59+yyD5FcuXeezdPh/fB3QN8PzsGZb1aSlTw
tk/6LQQckHCAojwDevqBGFWUjqZ8CNcVAIt8/U0+EFAnin+ivhfvTg1tGREsXiHv
RZ6+o7BRrLn3TZ1OuVTsbMtIB0fe5MJbgvq7dy3TgBlJmUrmNSPeyGdE7hJk8ljr
NvHJvcMClNc8MVSxtoe842H99oyf4Eox4cR8cTsaG93eSurAPwMHYf/NGVihJbcE
NMJ80EP1wfCbOIGtkWPdYk/SveAZvgQjQpBwsjBlTzR9/K3crPnyAtBS4n+WZuvF
maJ69Sd1y3LmOqjfoFREtArAYV3UDtItFH+5Y9UXzhIooJenxcM8uSApP+aVrGeA
AhsF6HqZGjNzrBjaUE4Ti0wHPpSdepDMvobWC8PRsV4iFco6wXSZehsTcwBF7IM5
fT1rNrlvDQ==
=ZzYo
-----END PGP SIGNATURE-----
