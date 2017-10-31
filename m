Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d30cee92
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 17:32:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da81f1d3
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 17:32:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 102b287e
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 17:32:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9cfd62ab
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 17:32:09 +0000 (UTC)
Date: Tue, 31 Oct 2017 18:34:29 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20171031` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <0d626a1d69e42944@frisell.zx2c4.com>
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

A new snapshot, `0.0.20171031`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * netns: use read built-in instead of ncat hack for dmesg
  * netns: use time-based test instead of quantity-based
  * qemu: allow for cross compilation
  * qemu: work around ccache bugs
  * qemu: test using four cores
  * selftest: initialize mutex in routingtable selftest
  
  We now cross compile and run in QEMU for x86_64, i686,
  ARMv7, Aarch64, and MIPS. You can see the current build
  status on: https://www.wireguard.com/build-status/
  
  * stats: more robust accounting
  * compat: fix up stat calculation for udp tunnel
  
  The statistics from `ip link -stats` or from `wg show` are
  now much more accurate.
  
  * global: accept decent check_patch.pl suggestions
  * global: infuriating kernel iterator style
  * global: style nits
  * global: use fewer BUG_ONs
  * global: get rid of useless forward declarations
  * blake2: include headers for macros
  * tools: correct type for CTRL_ATTR_FAMILY_ID
  
  Lots of style cleanups.
  
  * crypto/avx: make sure we can actually use ymm registers
  
  This fixes an issue on some Xen platforms that expose
  conflicting CPU features.
  
  * peer: get rid of peer_for_each magic
  * peer: store total number of peers instead of iterating
  
  A major cleanup of our peer iteration logic, getting rid
  of a big ugly macro and clarifying our locking semantics.
  
  * compat: be sure to include header before testing
  
  * wg-quick: allow specifiying multiple hooks
  
  You can now specify {Post,Pre}{Down,Up} multiple times, and
  the commands will then run in succession.
  
  * wg-quick: remember to rewind DNS settings on failure
  
  Small consistency fix.
  
  * wg-quick: allow for saving existing interface
  
  There is now a 'save' option for saving an existing
  configuration without having to bring down the device.
  
  * wg-quick: fsync the temporary file before renaming
  
  In case the system looses power, you are now left with
  either the old file or the new file but not an empty file.
  
  * wg-quick: allow for the hatchet, but not by default
  
  In order to account for distributions that do not have an
  implementation of resolvconf(8), the contrib directory ships
  with an alternative implementation that may be patched in.
  This was extensively discussed and debated on the mailing
  list.
  
  * device: only take reference if netns is different
  
  Solves an important memory leak when tearing down network
  namespaces that haven't moved the wireguard device.
  
  * device: expand scope of destruct lock
  * timers: guard entire setting in block
  
  Just to be certain.
  
  * curve25519: only enable int128 if compiler support is sound
  
  Allows building for Aarch64 with old gcc (such as that used
  by Android) where we don't want to branch to a __multi3.
  
  * contrib: add reresolve-dns
  
  A small script that's been passed around for a while now for
  reresolving DNS entries from a cronjob.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20171031.tar.xz
  SHA2-256: 69b9787b7ae2c681532a7a346e170471f1a651359ed53ff9e6fb8b2c60b9f96a
  BLAKE2b-256: 031791dec058bcc7bbf7affe0c8b496567c9785b57e9b1524437c2d9181f9750

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAln4tBMQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drr3NEACq8cq759mssQJPtbh2fVIhUqWOP0/+6Fwb
3tUdfVgxteTufzcbdErUB6GRWEcY8ZewcCM0qOoCR3dQ63znlFvTpFenq9+/dg66
lbsyAxdWlFq1Fcp66mfSMMTJ2lYwh/PvMFi5Z6IJ0Dyjm6s3cU3/SA/YkVK5FZFC
C+8JFN79atjIYVoY1ji7zkvVhZUZG/S3PzOCHE5HoPAxm4sM+5unsqEYGHLDDmuM
2f13J6CvycSRkvAeaubWQlk76rlWJQxU9WoAC45631qpZHLzMc2YCtsrqNmDuS0N
jueSNIMt+uI+04Aq8zex6S08TyEdVRxLgjs7EWfx1Qb72IisZzxDvIcmQk34nyEN
Kyrq5LMVZvy/mnrbnheEre6gzezAv5XnQLEk5tpkPl7nW4VrT51j1Wi6WNqiIMpS
NEknNswGq6gW6O63xQE5A07aeADUcK6wcVS/MSH8I0DG1Y7zTDaYFFR9Eo1KKJaQ
7hoG9PZ5W5RY1uXRS3MSAQDZhnc9r6+yLMD4y7XuBaJIss+8TT+sxtTvhAUEdYqq
sr7InJWLNYCVERiTe2hL9dIAXk4ekJYDwYBV85Ij+hMHhZjoYhaub2QXS0wCOICW
5oYp0EPfaS4wtV92b75TeDXL72ESsE1KqIS9XDsEIPNQsRdYHCEUwMjuHMxck9FC
CGDv20unLg==
=cD4R
-----END PGP SIGNATURE-----
