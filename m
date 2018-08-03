Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67d19aec
 for <wireguard@lists.zx2c4.com>; Fri, 3 Aug 2018 03:18:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 459f5ada
 for <wireguard@lists.zx2c4.com>; Fri, 3 Aug 2018 03:18:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32f0558b
 for <wireguard@lists.zx2c4.com>; Fri, 3 Aug 2018 03:16:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d43ccf0e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Aug 2018 03:16:57 +0000 (UTC)
Date: Fri, 03 Aug 2018 05:28:31 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180802` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <15364b88a3473a28@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180802`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * chacha20poly1305: selftest: split up test vector constants
  
  The test vectors are encoded as long strings -- really long strings -- and
  apparently RFC821 doesn't like lines longer than 998.
  https://cr.yp.to/smtp/message.html
  
  * queueing: keep reference to peer after setting atomic state bit
  
  This fixes a regression introduced when preparing the LKML submission.
  
  * allowedips: prevent double read in kref
  * allowedips: avoid window of disappeared peer
  * hashtables: document immediate zeroing semantics
  * peer: ensure resources are freed when creation fails
  * queueing: document double-adding and reference conditions
  * queueing: ensure strictly ordered loads and stores
  * cookie: returned keypair might disappear if rcu lock not held
  * noise: free peer references on failure
  * peer: ensure destruction doesn't race
  
  Various fixes, as well as lots of code comment documentation, for a
  small variety of the less obvious aspects of object lifecycles,
  focused on correctness.
  
  * allowedips: free root inside of RCU callback
  * allowedips: use different macro names so as to avoid confusion
  
  These incorporate two suggestions from LKML.

This snapshot contains commits from: Jason A. Donenfeld and Jann Horn.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180802.tar.xz
  SHA2-256: cd1da34b377d58df760aadf69ced045081517570586fc2d4eed7f09f5d5a47c6
  BLAKE2b-256: ff233c4193d28793b3352813b667b5173d25fbf08a2fa1836b1556628fe46749

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180802.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAltjy8MQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrmPrEACNP6Ix59W+BrzSlhk9F6QAnd/QeADdYsOy
7SCFSjUzN5WEj1QcFHeDWlphm3A+yw4HoLxXtb3v887ZJKhlb94RDtTg3Vmq8Lu0
nJxMF/2og/eEo1uAuDx+YA1I7yvmpB3++uwKGdIoiVtnqQ90to4AcYjHFF4gsdvW
JvaAeD9VXAq21eSnQQOlhqlMzBid1lsyTNh8jPIIMdBKQUu6I0lFA2y9H/K3i5xS
5voza6AmZcd0UL4/Q7lX7FEkxs8ga29lJWdDov0yYhvkJcNGvzmj66rISz1OU3BL
uGdJbpKAHBtYSNIg/DgN7QIwlDSt23A+15IX8ceux5q0vqeVAZkxJ72L+jvtctIm
F3crvtkqnQ8RpsNwTcHy9CjYVvNu3f90XPWC3IjG15xL8WNljJR5Ib4gVS4ddFMR
W9VNB8pC8EcIIKKxc/eipR9rSuyfuI1fRypJpUeOFeT1bAMhPHY6Z9gLeU9ZrNrl
Ioo8KZ8D1pVdmEkcE3Fie2skYlYshRtbJih0GbwDiKJuLi3Xkq5VzmrPZhpSZyQP
Ei6Z8fJORPF/EtKuBr1yjyZyhL0h8Uvt7G5wqG5dkWE026S0gi9q+OOdV/T6YdQo
2+b+eTRgDDHY3q83HrvA87hOYI/vccATOtKClOKVvj4Xz9mfya7vKrLs/jzuO0vI
D/fWcH7mmA==
=AvEO
-----END PGP SIGNATURE-----
