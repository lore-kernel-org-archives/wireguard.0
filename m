Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 579c9c26
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 01:08:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3d9dfbc
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 01:08:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26c8109d
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 01:27:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 81b67d89
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 01:27:36 +0000 (UTC)
Date: Fri, 06 Oct 2017 03:37:43 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20171005` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <36524184bce66499@frisell.zx2c4.com>
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

A new snapshot, `0.0.20171005`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * community: code welcomed
  
  There's a small disorganized list of things to do, some of which are large
  projects, and others are just little cleanups:
  
  https://www.wireguard.com/todo/
  
  If anybody is interested in working on something, please don't hesitate to
  send an email to this list, team@wireguard.com, or me directly.
  
  * tools: simmer down silly compilers
  * tools: compile on non-Linux
  * contrib: remove worthless build artifact
  * kernel-tree: remember UAPI in patch creation
  * curve25519-neon-arm: force ARM encoding, since this is unrepresentable in Thumb
  * compat: support ptr_ring for old kernels
  * compat: conditionally redefine GENL_UNS_ADMIN_PERM
  * compat: RHEL backported netlink changes
  
  These here are all compatibility-related fixes mostly left over from churn of
  the previous snapshots, where we lost some compatibility with old kernels and
  weird toolchains. The above series of fixes brings us back up to par, and
  should make life slightly easier for a few packagers who had to work-around
  things in the last snapshot.
  
  * compat: macro rewrite netlink instead of cluttering
  * global: satisfy bitshift pedantry
  * global: use _WG prefix for include guards
  * global: add space around variable declarations
  * queueing: cleanup skb_padding
  
  Style, mostly.
  
  * Makefile: add non-verbose mode to tools
  * Makefile: clang now builds the kernel, so use scan-build
  
  One touch static analysis: `make check`.
  
  * receive: simplify message type validation
  * receive: use local keypair, not ctx keypair in error path
  * send: put keypair reference
  * receive: we're not planning on turning that into a while loop now
  * queueing: use ptr_ring instead of linked lists
  * receive: do not store endpoint in ctx
  * queueing: move from ctx to cb
  
  This is another huge change, and the main motivation for releasing this
  snapshot. We move from using a linked list-based queue to a ring buffer-based
  queue, which yields considerable performance increases. It also allows us to
  entirely rid ourselves of a memory cache object, which further increases
  performance and decreases latency. The move to a ring buffer will also make
  writing lock-less algorithms easier, which will eventually increase our
  performance on systems with extremely high core counts.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20171005.tar.xz
  SHA2-256: 832a3b7cbb510f6986fd0c3a6b2d86bc75fc9f23b6754d8f46bc58ea8e02d608
  BLAKE2b-256: 1ca53bfe8e3a268cdbdda0ca26537b81350ec24aa708c5d1d66c459bed005156

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlnW3eMQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrvE4EACO9hAJN3w8O/DxJ4tyXzlZv9Y9O/YvhCei
gukviYnsop9VImpX8/pUBdzseP9N9D9ESIjPveEZZt8sbJCdaOUozRzP6NZraq+w
jHAd716xPv7GNKOr/pAFJnZJQOeJ8Fs6fwxSQ8S6HBYR6px233l8gRfmZLKphCaB
OEPf/7POGFoIfKTjGYPv5+GMpdaJU1RTVSBlWXU5a31bLDdEShyKuw1Z/eyNVAhk
QYnrBFsPa4Dy9uS3uXdBBRsrYyQcJkcC1d9+5RFv8gyUB36KnVGIGkLdLgdZfLDT
qzzf+EkJl0xIeDmYvHEx+XekBtW23AzIo7oq9r97u6UEh91OSEUyrVjXlbyVSxE4
gfZSSBByZ0KnyBKWcrDDdYDsrpUN00VOJ7GOmzZkZ06KfOfyVYP9j0cL/cxiOIqp
oNGod1kIk+i+nfrvDYohQpIyjH90I0gOz3AfpxQRqCNHVwzxZD0wudE360Ish7A3
Px1akrptkp3kMmY88vZabVi3rWEZISd1Or2wgotDP/+GBpjmE0A5j1JznjHuZHEd
UXv4IaEl9vFlfPuuClRy3ioFL9XORq8h/6xVl5hKrBrRf1jyGeoFQ0AqF18fjMgg
iKSLZHeqFSf8oPgaXKyf7fJV0LFZbxQoCFBMd4B7VLUxuNFaV36Q6Ni+wjLp6SYx
qsMbKxykDw==
=DJ2X
-----END PGP SIGNATURE-----
