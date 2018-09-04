Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd924934
 for <wireguard@lists.zx2c4.com>; Tue, 4 Sep 2018 18:29:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2815b317
 for <wireguard@lists.zx2c4.com>; Tue, 4 Sep 2018 18:29:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1dff262
 for <wireguard@lists.zx2c4.com>; Tue, 4 Sep 2018 18:13:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fa463445
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Sep 2018 18:13:48 +0000 (UTC)
Date: Tue, 04 Sep 2018 12:29:32 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180904` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <15488d898a9ff1d4@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180904`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * wg-quick: darwin: prefer system paths for tools
  
  The only things wg-quick(8) needs from Homebrew are bash(1) and wg(8).
  Other than that, it's explicitly coded against the native system
  utilities. Since wg-quick(8) and bash(1) are invoked in auto_su by their
  full absolute path (via $SELF and $BASH, respectively), we can simply
  set the $PATH to be prefixed by the default system binary paths. This
  way, if users install tools that conflict with system tools -- such as
  GNU coreutils -- we won't accidently call those.
  
  * wg-quick: check correct variable for route deduplication
  
  This should avoid adding duplicate routes when adding the allowed IPs as
  interface routes automatically.
  
  * Kconfig: use new-style help marker
  * global: run through clang-format
  * uapi: reformat
  * global: satisfy check_patch.pl errors
  * global: prefer sizeof(*pointer) when possible
  * global: always find OOM unlikely
  
  Tons of style cleanups.
  
  * crypto: use unaligned helpers
  
  We now avoid unaligned accesses for generic users of the crypto API.
  
  * crypto: import zinc
  
  More style cleanups and a rearrangement of the crypto routines to fit how this
  is going to work upstream. This required some fairly big changes to our build
  system, so there may be some build errors we'll have to address in subsequent
  snapshots.
  
  * compat: rng_is_initialized made it into 4.19
  
  We therefore don't need it in the compat layer anymore.
  
  * curve25519-hacl64: use formally verified C for comparisons
  
  The previous code had been proved in Z3, but this new code from upstream
  KreMLin is directly generated from the F*, which is preferable. The
  assembly generated is identical.
  
  * curve25519-x86_64: let the compiler decide when/how to load constants
  
  Small performance boost.
  
  * curve25519-arm: reformat
  * curve25519-arm: cleanups from lkml
  * curve25519-arm: add spaces after commas
  * curve25519-arm: use ordinary prolog and epilogue
  * curve25519-arm: do not waste 32 bytes of stack
  * curve25519-arm: prefix immediates with #
  
  This incorporates ASM nits from upstream review.
  
  * netlink: insert peer version placeholder
  * tools: ipc: do not warn on unrecognized netlink attributes
  
  Adds a placeholder so that we can always bump versions without worrying about
  API guarantees.

This snapshot contains commits from: Jason A. Donenfeld and Samuel Neves.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180904.tar.xz
  SHA2-256: a38ead72994a7db7cda2d0085f410df1111b4728db050a519883eda8f3fe38f1
  BLAKE2b-256: 985e7c33e81c2d298fe60a6f3cd5163d1faf83a858ecd48cdc1cb6e4cc421b53

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180904.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAluOzusQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrpxND/4ouu3iN30Je3I6w1RkjHmlED2i066evl2H
GHE0B2lcnjE9v9IcUWd4rGH8YofBEUXiz8XqJQFf9ZtmO8RTutAUR+dKmYF40nOB
JxcN1YY1j/4D2iNQ7CXZ/kREkh0NBWv18MFYdxzn/T8vPLK+N3WYu5v23oetEgpB
I91NBcBZrJozLXYuZKXa1EKbHVNf3OS9eBp7qt1C7Nw2F56G/vtdgx2ri3wMw69V
W64kkzVZdkcjdpwRyIlFCVdRtOYpA8yxX35HvWn/1U14XHCNITk+qDWXuaZ7hC21
mV4KigHkjB1KXIvPJZsQzu3nmnee6HNhHpfpBRi8cV6weYaXSSzsgY9zVbbRQdA6
tu/lBd4z83amKSiWAos59oebalXRyUgpVIFG4MPWY4LrWD9HnmiABPZXeAe+bHM9
Ba4AbKWMl1GzfpN0ZubeaC+qoeuBVepSjVZ0HJhwTZMDiI9v7eYhSfyzhUEwnJfi
jhD6ylc+PQyo3JIiiZagWWiUw8twUQ/pkkKjgw6lkJ7FJjeknIIS0eu5qqjvkIrr
uZMFWWu5WmTbJZZCZTAPaJhyzKMSpw1lvsH+wwIh3QT8c9nBsnioZ+KCmmW962hT
vV7qAw4d8A1kcgVmu4tXKRvU/MKTBLXUDBhdvZQIBrddfi30NoMdq4AXzaRmS6bM
UItWW4cdMQ==
=7MAG
-----END PGP SIGNATURE-----
