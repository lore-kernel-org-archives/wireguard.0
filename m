Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e646be0
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 00:25:35 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c78c465d
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 00:25:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9ce6705
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 00:25:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 763e9035
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 00:25:34 +0000 (UTC)
Date: Mon, 11 Dec 2017 01:32:53 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20171211` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b95c15baca1d3929@frisell.zx2c4.com>
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

A new snapshot, `0.0.20171211`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * curve25519: explictly depend on AS_AVX
  * curve25519: modularize dispatch
  
  It's now much cleaner to see which implementation we're calling, and it will
  be simpler to add more implementations in the future.
  
  * compat: support RAP in assembly
  
  This should fix PaX/Grsecurity support.
  
  * device: do not clear keys during sleep on Android
  
  While we want to clear keys when going to sleep on ordinary Linux, this
  doesn't make sense in the Android world, where phones often sleep but are
  woken up every few milliseconds by the radios to process packets.
  
  * compat: fix 3.10 backport
  
  Important compat fixes for non-x86.
  
  * device: clear last handshake timer on ifdown
  
  When bringing up an interface, we don't want the rate limiting to handshakes
  to apply.
  
  * netlink: rename symbol to avoid clashes
  
  Allows coexistance with horrible Android drivers.
  
  * kernel-tree: jury rig is the more common spelling
  * tools: no need to put this on the stack
  * blake2s-x86_64: fix spacing
  
  Small fixes.
  
  * contrib: keygen-html for generating keys in the browser
  
  This was covered here:
  https://lists.zx2c4.com/pipermail/wireguard/2017-December/002127.html
  
  * tools: remove undocumented unused syntax
  
  Not only did nobody know about this or use it, but the implementation actually
  exposed compiler bugs in Qualcomm's "Snapdragon Clang".
  
  * poly1305: update x86-64 kernel to AVX512F only
  
  From Samuel Neves, this pulls in Andy Polyakov's changes to only require F and
  not VL for the Poly implementation.
  
  * chacha20-arm: fix with clang -fno-integrated-as.
  
  This pulls in David Benjamin's clang fix.
  
  * global: add SPDX tags to all files
  
  From Greg KH, we now have SPDX annotations on all files, matching upstream
  kernel's new approach to file licenses.
  
  * chacha20poly1305: cleaner generic code
  
  This entirely removes the last remains of Martin Willi's ChaCha
  implementation, and now the generic C implementation is extremely small and
  clearly written, while delivering a small performance boost too.
  
  * poly1305: fix avx512f alignment bug
  
  Unlucky people may have had their linkers misalign a constant. This fixes that
  potential.
  
  * chacha20: avx512vl implementation
  
  From Samuel Neves, this imports Andy Polyakov's AVX512VL implementation of
  ChaCha which should have a ~50% performance improvement over AVX2, though it
  is still much slower than our AVX512F implementation.
  
  * chacha20poly1305: wire up avx512vl for skylake-x
  
  Some Skylake machines do not have two FMA units (though others do), so we
  prefer the AVX512VL implementation over the should-be-faster AVX512F
  implementation on those machines. What's needed now is to read the PIROM in
  order to determine at runtime whether the particular Skylake-X machine
  actually has the second FMA unit or not, but until that happens, we just fall
  back to the VL implementation for all Skylake-X.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20171211.tar.xz
  SHA2-256: 57d799d35e92c905e548d00adeb7ed1ead4d6560f084c99e5aae0a87b4eb09e4
  BLAKE2b-256: 7cdaae2f6a6886b8cb86d0cdb2170c22447dda8fa247f10924f920e14d8f51e9

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlot0g8QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drln9D/4nO1CBPdaM9VajE8w/sczfKtYlHh0tF++X
zr3QKCNmH7zqK0C2B5pdLr8ZF7fIwnT7R4DfR9KDiCCt963AmGueJGs3OYgB6QvP
JdCYpnhExJOK6PtDpZ04GrXnCioXMLZn23nY6o4rp52p3CND4nNYPLGyU67wYS1R
ZuJom5bvianleu+rPOEQKdYIy2Ey3UYOgrkR0D1e6htM7EfQcqUIVP3JhjOorVtD
nRBWJrdE74ffEvCfivzvroqZKfXmJI7WvRGbGwgVyHJj8a9c8Y7y8n1U//PiYran
jd9IOFaAtc9KF44lKa6jjz9Jai6RB/J/imU06cInCgKoIYMA1HyxmYUPzcBHwPPx
6Ac4jOpFTcLUUs3CfAdTFpp8T5CrrP2uCbUDtjxYNiqhMYECLv2ZBSrr81JLczzc
iL3pGWtc6zQH1fsAT4zSarui6SbRsJS+i7I3AsDjX0jO4FCdqCWTvvsKJmRdTMlX
ZPWxb9YILxJZpMhy4RmaNWjyTzRXYhA4vSF6RVPMlc6IU+2Cv9RtJm5H3T/pMX+C
K4kWj4O6dCHZajRoVB0rJYYxkXKN/5UPTqgghtyGAoD1hwWPCncq8Y7KrqYUgjV+
AUvs8V0jJrgy1zzqb1u9WmzvqT9RgZB8QWOwqvSstxFcvOTI2DGz4sT4Pr1bqpSZ
SxzBLStgcA==
=N5k8
-----END PGP SIGNATURE-----
