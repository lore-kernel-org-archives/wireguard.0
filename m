Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e50c8f89
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jul 2016 10:03:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 513826f5
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jul 2016 10:03:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 70f28a55
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jul 2016 10:03:10 +0000 (UTC)
Date: Thu, 21 Jul 2016 12:05:02 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffffa28803e6@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20160721`
	Available
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new experimental snapshot, `experimental-0.0.20160721`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * tests: improve test suite and add qemu tester
    You can now run `make test` to do some nice functional testing of the
    module. As well, there's now src/tests/qemu.sh which builds and installs a
    mini userspace and kernel, boots it up in qemu, and runs the tests. This
    does not require root access, and provides a good way of testing for
    packagers. Note that I very much would like to see some patches cleaning up
    qemu.sh if anybody is interested.
  
  * Kconfig: select IP6_NF_IPTABLES if using IPV6
  * build system: revamp building and configuration
    This build system is much more robust, and we've gotten all the dependencies
    worked out. Check out wireguard.io/install/ and scroll to the bottom to see
    all the information about kernel dependencies.
  
  * tools: fix numbering in man page
  * tools: first additions of userspace integration
  * tools: support horrible freebsd/osx/unix semantics
  * tools: rename kernel to ipc
    The wg(8) tool now implements the neccessary protocol to work with new
    WireGuard userspace implementations! The extremely simple IPC protocol is
    documented here -- wireguard.io/xplatform/ -- and is essentially the same
    way in which wg(8) communicates with the kernel. This should be exceedingly
    simple to implement, and we fully expect for all userspace implementation
    efforts currently occurring to use this, so that wg(8) can administer any
    kind of implementation with the same interface. It also compiles on OS X now
    and there's a pull request for including this in Homebrew:
    https://github.com/Homebrew/homebrew-core/pull/3183

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20160721.tar.xz
  SHA256: af4fc72a8dab1a5f966cc2a2be1f0d329932b32df64c1a5dc226f5c2e31ffa25

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQItBAEBCAAXBQJXkJ4uEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA66Dvw//
UWxUjUw0qW4i3ysTsiDiqE+81pukTw5ePjnFOrKicrrHDchlyMo7M9ODCRhlLFku
NPjYVarDK+mhIA+wE9opqxn06I11hUlnybk1BuZPdZ9lFPzFQioP8wAEHkxbIAuQ
Oin0iK7cKMi1tDXmf7rmyr0mUMRQaJfS8K5k/HxdtPzhe+md78TfoxP+ZBkvTacU
y1mtVFtVFrbH1eparuHIUxMcty6hC5YECgRYanV5o3WNH3iu33aBGB2xp9S9jhDI
b9lkXwnZ84V1o+IyICPIGYQ5Kz7urMXwjGLuLCxfI1+TEQuvmIxDX87FHyFgQztw
f1018XfTcxaiYoeW8W3bv4tR/siJY/vXWqXBMiK8H1XSGxiejvsonCdX3/TQM8HM
EgyseKidZfPB7tbDJs1swB+g4DX7PX3CNBX1UEejL2rkK9dcKhso+EwOQKpM2/QK
/jGisYfgHr8YjTQ2dwQ1QQ0MLi+7o/KoHE7G4fIJrMnTAmjJcjPcHNrFpZW8tBME
Z5Xqc4I73/2x6qmKXB3Zq1IH5qNqrAcQ/1/gt44bvBswbo3gZQF0fwgsKiVTsLjQ
YWCBuGDZreUMLVRbv02O8tGWG8mjY3bAvdM5paNx4j7bO+Whrzh519+EzMruyAuY
B+onFQMH8AWH897ceoLi6p2fKvNJ3ylL8t2zdnbIHhA=
=y3xV
-----END PGP SIGNATURE-----
