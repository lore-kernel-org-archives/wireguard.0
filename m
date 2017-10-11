Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cee59751
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 13:43:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45623aea
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 13:43:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bba53096
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 14:02:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e66e66a7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 14:02:55 +0000 (UTC)
Date: Wed, 11 Oct 2017 16:13:43 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20171011` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <365680584b9c81f5@frisell.zx2c4.com>
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

A new snapshot, `0.0.20171011`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * receive: do not consider 0 jiffies as being set
  
  This should fix some issues on 32-bit platforms with sending cookie reply
  messages when they're not required.
  
  * socket: compare while unlocked first
  * socket: don't bother recomparing afterwards
  * socket: gcc inlining makes this faster
  
  We no longer take a lock when updating the endpoint, which should yield
  some performance benefits.
  
  * tools: try again if dump is interrupted
  
  The tools will now try again to get information about a device if somebody
  tries to modify the device while a dump is occurring.
  
  * Makefile: quiet recursive make
  
  Our makefile produces slightly slicker output now.
  
  * qemu: bump stable kernel
  
  Usual test suite house maintenance.
  
  * crypto/x86_64: satisfy stack validation 2.0
  
  The kernel's new objtool used to warn on some things in our AVX
  implementations, especially code generated from qhasm which uses its own
  stack layout. This commit works around it to squelch warnings.
  
  * routingtable: only use device's mutex, not a special rt one
  * routingtable: iterate progressively
  * tools: store tail pointer to make coalescing peers fast
  
  We replace the Netlink algorithms for grabbing the allowed IPs, so
  that they're now O(n) instead of O(n^2).
  
  * tools: warn once on unrecognized items
  
  This follows this LKML discussion:
  https://www.spinics.net/lists/netdev/msg457468.html
  
  * compat: move version logic to compat.h and out of main .c
  * contrib: filter compat lines
  
  Should make it easier to produce a compat-free WireGuard tree.
  
  * send: do not requeue if packet is dead
  * socket: set skb->mark in addition to flowi
  
  Mangle tables now work with wg-quick.
  
  * tools: man: include kill-switch documentation using fwmark
  
  Essentially:
  iptables -I OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -j REJECT
  
  * receive: disable bh before using stats seq lock
  
  This avoids a potential deadlock with interrupts and the stats counters.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20171011.tar.xz
  SHA2-256: e2e44ff658743507bca0f6b443c2f85aacc48d507ba2dcd4812717145df10b96
  BLAKE2b-256: 13deec1aecfb8e356eb1afe84c235a93f1d7d9b4808c72b4e739bc3f64b4a784

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlneJf8QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrtsaD/42YzgXdDZWMazcvf9l+fODe0UTQk80jiQl
4bXf0JoWTIQqzoEy3Q5Sf8JrDezi7x4VqIn0hUJoekEr/VgDExz3oUIOHDJeMMLA
1zADakGZkqn8gi1+yFOD9ibCAMhO8o168nkmhlrQZS8pGtKYJSs9Ww6Doo/gYSlO
Kz4dAbHuQLKfe7J2kySGltlRTGeAnbdHV3oxcHdumU9BsmUFxbeIK2LVfaKSaihz
X+mtZSeCfmF/ss/XmKYhTbfmD4GZ9bqDJ914G6/ClNFXRTR3cZIOnjI8lK/pl0hJ
tf6dqsitZArY43hw1jdZMcM/L40PVpkcEFlXcw7VV2jh9JCwBOcaFNr4OimV843m
YFD/Pstn+lzGUWaHVKp1QzDAjVLRCIDCJnyRxKr4l9rqmjOseEKkIMOSXMKxDsFN
twPf1q8tadQMS4C0pUQSBRGBXmXmxhNCwXHzgfu+2xlN4zs0XrmlUGImT9yX/wW2
gInwikpAPjHrnVNzeZ359XRLp3rZHuM+d50+Hahi7UCpHqFOMWN48QTxa2g+8H2Z
0tih964lPdhoJhibFyTJOEqw2gWTVa+zZGpSdC2rw+fhLGgAq6phG08DG5TLeoEo
VhhlN7VaKIa4Ldo3pgqSmwNocjNRDdo4r9cAPUQHY1OXBVvzN2Radbvg0T7X07wp
SvaxdL1YSA==
=18yy
-----END PGP SIGNATURE-----
