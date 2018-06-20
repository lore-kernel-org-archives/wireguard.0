Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c12b5266
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 19:15:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afb3b961
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 19:15:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2322e74a
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 19:13:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a10ff326
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 19:13:57 +0000 (UTC)
Date: Wed, 20 Jun 2018 21:19:56 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180620` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b9a4b41fbe912803@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180620`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * chacha20poly1305: use slow crypto on -rt kernels on arm too
  
  Leftover from the last commit of the previous snapshot that we forgot to
  handle.
  
  * tools: getentropy requires macOS 10.12
  
  Small build time fixup for old versions of macOS.
  
  * queueing: remove useless spinlocks on sc
  * queueing: re-enable preemption periodically to lower latency
  * simd: encapsulate fpu amortization into nice functions
  * simd: no need to restore fpu state when no preemption
  
  This will improve general system latency on preempt-enabled systems, like
  desktops.
  
  * dns-hatchet: apply resolv.conf's selinux context to new resolv.conf
  
  Fixes wg-quick's dns hatchet on CentOS.
  
  * qemu: bump default kernel
  
  By bumping to 4.17.2, we actually uncovered a bug in the SLUB allocator, which
  upstream is now fixing: https://lkml.org/lkml/2018/6/18/1407
  
  * noise: take locks for ss precomputation
  * netlink: maintain static_identity lock over entire private key update
  
  Minor locking correctness fixes and optimizations.
  
  * noise: wait for crng before taking locks
  
  We now make sure that an outgoing packet which needs a potentially unseeded
  rng won't block a call to wg(8), which takes similar locks for retrieving
  data.
  
  * receive: drop handshake packets if rng is not initialized
  
  If the rng is unseeded, we drop incoming handshake packets, so that it's not
  possible for an attacker to fill the handshake queue thereby provoking
  cookies.
  
  * ratelimiter: mitigate reference underflow
  * ratelimiter: do not allow concurrent init and uninit
  
  Minor correctness and hardening fixes, which don't fix anything particular in
  WireGuard, but might be useful if our ratelimiter is ever used elsewhere.
  
  * compat: use stabler lkml links
  * poly1305: add missing string.h header
  
  Minor fixups.

This snapshot contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180620.tar.xz
  SHA2-256: b4db98ea751c8e667454f98ea1c15d704a784fe1bc093b03bd64575418a7c242
  BLAKE2b-256: f4e5a65f384a04cb1202e2866afc52469f121acb092a06be270d13ed211efdec

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlsqqI0QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrmPrEADFN1u60NGocdWyFtXnv16wrvM93ZKbOteX
Wa3wkh/pagPktCHyi4qNAU1C3VGyzAF5V/9vBVd9D+nzhZcDd2Zyj7u+5dDRlPun
N5zaxj5wq84peSxjHKXZht/11P5g6e2/9hDFNsM8PAE7qfrmSrhoxGdymSFT9kHA
iyCp89uXfyWcqtKffw3kfzrjgZLi3cwi793GydWGoURPFdy3xpy8NCvakpsakmG0
JYFRTq8YKceAPSBN8uFEC/BlermAWssd78OiQjCzIpkxZc64MEidoCvZPSynVWqD
wSOxfsH8aHd/GYq74+IQ/uLaFlt3W0ive/IZ7ESF+Q3c5FdkguVMIN4lo9XxBPKa
a3MDREdxToLZMxbh3ublDrjxDHNx6rARHsaIlkmcxynnMPz+j/5J5yi8z8R/p6bY
K8hF6KJqW18h90EuKfVdAkKUnaKfS7k82VKXBz2M6d1bFnz4psE5eD2uLzCXkIFl
Sj/+QlqanU/P4r8ZASOWRNXzrLtpFxR7fAzlgE/hTTY6heA/txxeTQK79iswniya
4fsZ0pVApnH7oLWpAsntByuiSAPnQB+R+4eLKgU5KUngRTtx8ITSazo3Z5/ZWCnI
sMTJT1L2+yRh6kLI5IVjHaQ0w0cn7Ymd/rlmW23Yyi3QEZUeFV1DKClSOy93Rs58
v7U2S/briA==
=Mdq3
-----END PGP SIGNATURE-----
