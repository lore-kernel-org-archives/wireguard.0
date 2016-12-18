Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b248b54
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 17:28:50 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af708535
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 17:28:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3a37e43
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 17:28:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1f2c25e1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 17:28:50 +0000 (UTC)
Date: Sun, 18 Dec 2016 18:35:32 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] Snapshot `0.0.20161218` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ced87b072b0ab199@frisell.zx2c4.com>
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

A new snapshot, `0.0.20161218`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  This is a quick snapshot to fix an error with the last one on big endian
  systems. Probably only OpenWRT cares about this, and everybody else can
  happily wait for the next more substantial snapshot.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20161218.tar.xz
  SHA2-256: d805035d3e99768e69d8cdeb8fb5250a59b994ce127fceb71a078582c30f5597
  BLAKE2b-256: 6623c8a26d378d4107e7302a52a96ee8aa27f83a01f29e9d0ee913516b2941d6

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlhWyN4QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drlc+D/4jRG+Xw23W2mNfRIrwa7GQzxeYKImTcJv7
Shk6S3meBlPHhU6PV40JDkIKAF2InStnuQ+LNxHey8Hd5NCDCeH73Jg9V+TdxOFn
dHRPOR4/dkGA2wocv0dLfeOw79Tv24xmmXko2mhLtwKbpaVc4EU/lmbpHfY/IJIK
abQLxpkd0LNLT1cMjzam7PiHvIsgTn1kXdKaZxNZc/pCVw8FOPIt5fZFF0lZp4YD
eH7wt7TVN+AXVYBaYU0zKUGTbaOV5LI6XD04IeRADbd7ilXuiWMirQRMvqT9RRvH
+Y2EyZzN0IA+uvXbXzcZOZ7lui4Z4lFevy9MlaEk1+mA3ueEfoxh9QvaCycV7JSI
D44BFMKdx+9TuOHeaocvdmUqwqVfYNMVyC106JzUJFV8c2t40Sc9khkPZzWfuOqu
4vSaCXFd0e6KssSIJ3Zh15L85GjwiwN189IYe0MSO9Ku3BpfpR2A3hV9ppwiGzhd
elt95uygINHiTrEjYofBg4UUWLrkXhDb2kQ+jZIkOpNQ+UdANNsDUvuxhwgAqeIv
4Du8z00RYfBpNBEaT4pR+4VpdB0zxkccpasvr9mEpiUN1ke/eCMVNf0XDYHWdQoi
8R9rGjL44FcVzbMIznxMiY7yfv1iL2IzXXcrYWb0Wnhg/BEvfr5K4s3+fI5WP4zg
HrvuDaqjDw==
=TR5b
-----END PGP SIGNATURE-----
