Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d61c760
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Oct 2017 17:31:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 113a7b60
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Oct 2017 17:31:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e2ae361
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Oct 2017 17:31:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5dadb8f5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Oct 2017 17:31:36 +0000 (UTC)
Date: Tue, 17 Oct 2017 19:32:11 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20171017` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <0d5d1995c60ac3c2@frisell.zx2c4.com>
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

A new snapshot, `0.0.20171017`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * noise: handshake constants can be read-only after init
  * noise: no need to take the RCU lock if we're not dereferencing
  * send: improve dead packet control flow
  * receive: improve control flow
  * socket: eliminate dead code
  * device: our use of queues means this check is worthless
  * device: no need to take lock for integer comparison
  * blake2s: modernize API and have faster _final
  * compat: support READ_ONCE
  * compat: just make ro_after_init read_mostly
  
  Assorted cleanups to the module, including nice things like marking our
  precomputations as const.
  
  * Makefile: even prettier output
  * Makefile: do not clean before cloc
  * selftest: better test index for rate limiter
  * netns: disable accept_dad for all interfaces
  
  Fixes in our testing and build infrastructure. Now works on the 4.14 rc
  series.
  
  * qemu: add build-only target
  * qemu: work on ubuntu toolchain
  * qemu: add more debugging options to main makefile
  * qemu: simplify shutdown
  * qemu: open /dev/console if we're started early
  * qemu: phase out bitbanging
  * qemu: always create directory before untarring
  * qemu: newer packages
  * qemu: put hvc directive into configuration
  
  This is the beginning of working out a cross building test suite, so we do
  several tricks to be less platform independent.
  
  * tools: encoding: be more paranoid
  * tools: retry resolution except when fatal
  * tools: don't insist on having a private key
  * tools: add pass example to wg-quick man page
  * tools: style
  * tools: newline after warning
  * tools: account for padding being in zero attribute
  
  Several important tools fixes, one of which suppresses a needless warning.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20171017.tar.xz
  SHA2-256: 57b79a62874d9b99659a744513d4f6f9d88cb772deaa99e485b6fed3004a35cd
  BLAKE2b-256: 09a219675f7fdff36935547faf8853b8be6f3d27b3926f4a3e65af87628fee8d

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlnmPjoQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrtEbEACyPneVZhJOHhS7rnzqCdj2ZRjoEedWg2rD
GTH4uZy5JtCNRHu2jBR0N/O3U2XbhmCVG4LzrK5kZk6J1TD623sKlwh3Jrv5Sja5
YMAfHmow80p8Ir1SelrQTNMLCY4P17iyaI2K1DuG3AVezSUIXd3PIJa+Hf3c1ydD
N8iy0hgAeAhoc1q677shiR0RM+KERkW/D1A86ykr1gNG8b1LJizjNBwekKqza9oQ
yoo1Lz8hB5eMK8i95dZsUj+PDRpOeSRGKQCuCeW9fM886LIxOSMu14WuCSEMar/R
fZgMLtEWI97CbmGz2IBsGsqQGqAov1/ua6dcRSTyuDk5Q8xEObjs7+UbPoq+Ah2y
cQ9Z8lbysRWMt6PbBQ7uEZxKz+clV0ihC7hh9VO3e5wK1TaWJiMIJBMqRK5i6s5d
+eVrrV0SXvr+FaLMjrWatKwlcehJ1+mDFgjsbi2LYKy8+uIVcfYc3U+9KHlTExGN
g2TQMAUe3adZWGv6HYCiNeqw23vYFS5WCzeogVi8a2mkk0z4CpRO0etLcKl5ApIR
r+vvXIORpMAAkzXHuhmoQtZDTgPyHOVwT73T4iqAl+oCmA463j5DiGMdtm67mIBj
1LNnho3wntcs44ppnQfAaaAzEBNMnI+TLtOc92e8nzuFuvN6iK/s50ts+ylPvKIB
LASaVAal4w==
=eqTW
-----END PGP SIGNATURE-----
