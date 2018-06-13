Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 494f6994
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 14:15:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 240fca6c
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 14:15:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67a488ed
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 14:14:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a660f892
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 14:14:03 +0000 (UTC)
Date: Wed, 13 Jun 2018 16:19:08 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180613` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b9a234e9f09a7dc2@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180613`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * wg-quick: android: change name of intent
  * wg-quick: android: delay setting users until end
  
  `ndc users add` eventually invokes SOCK_DESTROY on user sockets, causing
  them to reconnect. By delaying this until after routes are set, we
  ensure that the sockets reconnect using the tunnel, rather than the old
  route. This fixes push notifications on Android.
  
  * chacha20: add missing include to header
  
  Fixes a compile error on some kernels.
  
  * tools: encoding: add missing static array constraints
  
  Makes static analyzers happier.
  
  * tools: support getentropy(3)
  
  This lets us take advantage of both recent glibc calls as well as the long
  standing getentropy functions on the BSDs.
  
  * chacha20poly1305: use slow crypto on -rt kernels
  
  In rt kernels, spinlocks call schedule(), which means preemption can't
  be disabled. The FPU disables preemption. Hence, we can either
  restructure things to move the calls to kernel_fpu_begin/end to be
  really close to the actual crypto routines, or we can do the slower
  lazier solution of just not using the FPU at all on -rt kernels. This
  patch goes with the latter lazy solution. The reason why we don't
  place the calls to kernel_fpu_begin/end close to the crypto routines
  in the first place is that they're very expensive, as it usually
  involves a call to XSAVE. So on sane kernels, we benefit from only
  having to call it once.

This snapshot contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180613.tar.xz
  SHA2-256: c120cdedc3967dcb4ad5c1c7eadd2a1b04ef5dbf2fe60cc8e7c0db337bcda7dc
  BLAKE2b-256: 184b275cc2e49b741260f955b8258fb9832644d81bb9bd6b5ecf56994911e690

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlshJ9YQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrrVDEACdjd2lDHttE+nZyPvfHqGXNMl5nw3oH5+L
iTEH37maMgBdxRt2OTDND9x1Ka4iCtCdH4DDSA+O8KdO2fdJbr+m0yj2R6sz8ycE
M5QQbhfFlmBfExf0lQb5oxkJc0wXI6eDfOHQiZWjKQegfiFTHwmyv7jA/Ggz6Lq1
yu757/4N1SoU5ZWEpg/zGMzMK9PyUoWH/bgZGOnv0GajVjr+lVq3woD9yYX+oWiC
N78Y2giFZ6h2RTgkRj7QO6ceZxMPcg0GSN5ivBt4O38J07An/2Ozy7eUJStP5xTi
VbkiwDxfnhwfsD4vCDKPL0GMvdc/P34NrFr2yWkC22LXsW6ESia7oNkjo98H5Osi
Mr78zjvsjm8rzouiSC7kbp0/8QsjGQsLdX0osNLmdic7ec4ZgIT161Y073epIhh3
JPO/TWLiA/dqqnmM6989da+xOki2BDcnvUwmn9tDoXVS/IQFj/KWMvfKusu0ljLo
PI0tgR3gfyHXsWs3TcJqPksl42gRD85qcZ8LtPKWwYPGm3Q9zh718rZHG252KkoE
QN6ap/mdXoIxmqkkneaL7ipIRpRJmhoa/ACL+6XxgTmfA54lU/O1oLOHBV8DhEdJ
frMu3NMeL430ZCSDjWDwTdZFPuhdGbcXRK5eXhHYjxLWWW7+bdJfBxTjgh4gIQ+U
n94kOWpPZg==
=oJkt
-----END PGP SIGNATURE-----
