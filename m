Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 989fc12d
 for <wireguard@lists.zx2c4.com>; Sun, 6 Nov 2016 01:56:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 953c98cd
 for <wireguard@lists.zx2c4.com>; Sun, 6 Nov 2016 01:56:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e8d7da8c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Nov 2016 01:56:54 +0000 (UTC)
Date: Sun, 06 Nov 2016 02:58:25 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <cec1bfc60050d97f@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20161105`
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

A new experimental snapshot, `experimental-0.0.20161105`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * socket: use dst_cache instead of handrolled cache
  * compat: stub out dst_cache for old kernels
  * socket: route() returns an error pointer, not NULL on failure
  * socket: big refactoring
  
  Rather than our hand rolled routing cache, we now use the kernel's own
  dst_cache, which was added to the kernel after 4.5 and wasn't available when
  wireguard was first developed. The performance is on par with ours, but this
  way we reduce complexity.
  
  * data: take reference to peer
  * data: use smaller types
  * send: queue bundles on same CPU
  * data: keep FPU on when possible
  * data: use a memory cache for parallel ctx
  * compat: fix variable assumptions
  
  This series of optimizations is huge, resulting in *doubled throughput* on my
  development laptop. This is a major performance win, achieved by batching up
  sequential packets on the same processor core, with the observation that
  waiting for cores to synchronize takes time and defeats multi-core
  improvements. Wireguard should now scale better to systems with tons of cores. 
  
  * compat: some grsec have get_random_long; others do not
  
  Wireguard now builds with the stable release of grsec that used to be testing.
  In otherwords, distro stable grsec packages that are out of date and
  unmaintained can now use wireguard without modification.
  
  * qemu: move build outside of kernel dir to avoid kernel's make clean
  * qemu: work around termio race condition
  * qemu: move marker to top and flush
  * qemu: fail if module selftests fail
  
  The qemu test suite received more stability improvements and a workaround for
  a virtio bug.
  
  * tools: chill modern gcc out
  * c89: the static keyword is okay in c99, but not in c89
  * chacha20poly1305: cleanup magic constants
  
  General code and compiler fixes.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161105.tar.xz
  SHA256: 3e98535184a9e00e739c8f2b6cc9b20aea876157e36d72726ca7662c9b5556b5

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQItBAEBCAAXBQJYHo4wEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA658oQ/7
BchfQ5jwcCwLJwsnrwA91pv9iZN/pbQoBbX1gp5GyvkOl2WwIc0IUxv4R5kwTybn
aMR+j6zUwGihJRehjprgDU33gpG3ipUdSSb8ltcuJ7NmBvpN5HBXSZgk2BOTLUHL
dr0c1CzuKTQ/BJRnRb+v3RSPG9t8t7vjIAh9NWQYg4eaihnaUgQxkLlNYQOpBiBH
Gy+Rggxxb/YUT5gZNCzDvv+nBr9V/TCU3UQqdMlztoNLV5OroFWR5BSYNZPDAWEA
8v3CIkdzs6iuaIGul3ov/wZ8tMPIxi+w+Mk01RbU6MF7dX1mgveRF77s7OyQ6WJt
gyl6uDFNF3UBJhJVeiOL4v/X95J0sE0ZFTLp+MbP+PjcY/KUG1V8XUHCTZwlVZDy
amg+clhHBwypoPTWMYXnGx1HCTwXuw2mFkDHyeQQSt00QSi9Xqw+20GO4M4Vzbgr
vAMzu98VlZEcz5FhKDuz7AsRiPQCplc3v2lyju43oUyM/C+SuPdbu5giEsSSmDxu
lpmDKN8bD8nSiKjtibY0oZVa58hFaXbIb/oAnwok8C4VVTX8jx0C7wL1k9bY+02F
H42aZDRIOhU7CImbsjvICj8Q8xW0VCgAQzhiLahL6WcAPvXeELrGWeDnqIEJag+U
WwdbCU/MepSvYhVT9y2uBg0afnwkG5TPD9/YmQJ3HZ8=
=8AA1
-----END PGP SIGNATURE-----
