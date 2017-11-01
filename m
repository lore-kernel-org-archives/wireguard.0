Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7c0797a
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 23:58:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb7de2f8
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 23:58:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73451de1
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 23:58:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cfeda678
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 23:58:20 +0000 (UTC)
Date: Wed, 01 Nov 2017 01:00:42 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20171101` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <0d628a4c5847e716@frisell.zx2c4.com>
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

A new snapshot, `0.0.20171101`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  Sorry guys. 20171031, the Halloween edition, had a show stopper bug. Luckily
  few folks have packaged it yet, so we're releasing this small bugfix
  immediately.
  
  * wg-quick: save all hooks on save
  
  Tiny bug fix for 'wg-quick save'.
  
  * timers: switch to kees' new timer_list functions
  
  Shiny new things for Linux 4.14.
  
  * compat: unbreak unloading on kernels 4.6 through 4.9
  
  The real motivation for this extra snapshot bump. Before we would run into
  some issues when unloading the module, which was not good.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20171101.tar.xz
  SHA2-256: 096b6482a65e566c7bf8c059f5ee6aadb2de565b04b6d810c685f1c377540325
  BLAKE2b-256: e125a6b121432800586069fd010e3decbe65964cbf1dcd65ebfbd60508c52642

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAln5DpsQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drr6nD/9owVQI61/bvO2FYA4SciIH0O5x5LOR1q7G
HWBUJXLkwhecDq1bcFlh1VFg0HhBSS98YPL4dujAkTNgiryuLohmISrG8dB+tdhm
oHWLSY2qjwUN+tEYvoEd5AMf4NlwM50hIHUuKWxZXe0+xh/rj779KeoZVCM6Q3Af
RSIF5+3AroY5/I9+Trrxz7KoccNDuygYle/xKeqXLCqC7rBs54m1PB4yeTd3cBDl
kC8aENQ4eh+k6YqUPtspaapn+08wqlPr/nNK1QLCF6c2CPnMOSGK+WPGiBfbf8My
TYmGuieZNH3p2b6UNRYMWZ+3flv4N5wDGGOhu/KDEZFTQ9HRWgQIsgkpd6PvG0c4
D+67hC7c6Ek2ICd81RbPqdJlNnyiojV1Jo5SK4r8bSBwQEExJN3DWlM+Yp7jI+bc
v3P9jUZUojqHrN87h0L3Z3ADs5NbXV7FR8yi3NkshfFVGmT59zkse5KKYoBLN19s
Mz+gcePSvJhVnHkQC5BGYYQs4M9m2Kbmd6fQoA23RdxOnFsxatvTa9YyOwnUQlCa
SmdgS4ZbIQdjWePsl1vW+EVEa+sn+rxmAgFq3FMvLhK0o2lwgEPfmSwLQmxOMbkC
n38KSKl6vAiAVHUxM1CU6XADDxL2ejemw0NJYpY+4B4RUnVHc8xL1PRl3y0k/D6I
iJundOK/Rw==
=KdW8
-----END PGP SIGNATURE-----
