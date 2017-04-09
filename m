Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dac254b9
 for <wireguard@lists.zx2c4.com>; Sun, 9 Apr 2017 13:26:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id adf185e7
 for <wireguard@lists.zx2c4.com>; Sun, 9 Apr 2017 13:26:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 652f8ad9
 for <wireguard@lists.zx2c4.com>; Sun, 9 Apr 2017 13:26:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a704d308
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 9 Apr 2017 13:26:42 +0000 (UTC)
Date: Sun, 09 Apr 2017 15:33:20 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170409` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffffa645e925@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170409`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * compat: allow create-patch to work on debian-based builds
  * main: add /sys/module/wireguard/version
  * tools: do not use addrconfig with port in gai
  
  * config: do not allow peers with public keys the same as the interface
  * curve25519: protect against potential invalid point attacks
  * chacha20poly1305: enforce authtag checking with compiler
  
  While Noise is resilliant to invalid point attacks, it's still better to check
  explicitly for NULLs from 25519. While we're at it, we make the compile warn
  if we don't check the return value of sensitive crypto functions.
  
  * locking: always use _bh
  * chacha20poly1305: check return values of sgops
  * data: simplify flow
  * data: cleanup parallel workqueue and use two max_active
  * data: alloca is actually as dangerous as they say
  
  These should improve stability in certain cases, though this involved
  some potentially big rewrites, so I'll keep an eye on incoming bug
  reports.
  
  * compat: support 3.16
  * compat: support 3.14
  * compat: support 3.12
  * compat: support 3.10
  * compat: careful with destructors
  * compat: warn on < 4.1
  
  We now experimentally support kernels going back to 3.10. This means
  that WireGuard should run on nearly all Android devices, the Ubiquiti
  EdgeRouter, and probably most other random Linux devices that you can
  find. I'm looking forward to seeing the community pick up the work
  producing pre-compiled modules for various things.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170409.tar.xz
  SHA2-256: 31473b4d14178f82d6ff46df019d57982c210c03d1a985d54db35bdd76efbb18
  BLAKE2b-256: 29b6f2414c913809c793e9cc4616773dea7b74dc17f622204b9ffc282f5997bd

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAljqN9oQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrjkjD/4u34M5ujEOKutTf30zdsZarOzrCwyICvDl
/kERtPfRCPcvt7AwfnlOIGEiMYBJ8TqxgubR4gVsrb/hYyV/Lh3EtYZLaYWkIzVo
ezULyiwx9knBt1HVDlEgu2BU3+cLYjAOX+SYMjrPRMr0BW/okkYfNrMsY3YTFzz5
wXtgrFbWndLdvJggZt0tZgloXfLuAlG4q3sBWMWMxFErUDusMyZS9l5Dn36sVST3
9W4QcSdQKrAQ3VeNuZgdiTQuZFN+1ROgrcl4Z/uTsrCrh8DA+2LfdOsKTr21UTfK
WLiDKqIjIqX7sKKyK+B12QjkvabFdtwIyAKoUk6n/1Q/6bJ9Kvet3UjA7V0uP495
EiTO1X5dQiTvqUP6RLLHNBvbrYjP11/88EM6YLj3+0G56rthiMMQOLum1mxKa0+v
itYwOm1XqGqWaO8d9bOVyPADDlhmVqffz+XYd9DriUm5VCt8U+5BZmW2/M2J+A/f
2yqTrNlCGk5+SzD8CsYRDC80KIVav1WFK71lPTpp8g3cCJ17rH+y8DaSjdKt25KC
LuIXpOi6YKVeJa7HjiRpLRwGMp+M4xdbjmSTy7b/mnhNhGLnlC3FHZ+k1kc0JQS8
lOLH5i7t/+CkL7gvxvtZ4D8q8F1XomhS2I6zxADXV95x/ZBj5zI6rvyFBvhkTpd8
Q2lpTr72ZQ==
=ofIG
-----END PGP SIGNATURE-----
