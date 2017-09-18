Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61e13a22
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Sep 2017 15:25:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7b5393d
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Sep 2017 15:25:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9736ac02
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Sep 2017 15:44:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c0d62ed4
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Sep 2017 15:44:33 +0000 (UTC)
Date: Mon, 18 Sep 2017 17:52:29 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170918` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <364762ca05cce093@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170918`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * queue: entirely rework parallel system
  
  This is one of the most significant changes in WireGuard's codebase
  in a long time, so I'd appreciate some thorough testing of this
  snapshot. Work here began as part of Samuel Holland (smaeul)'s project
  for Google Summer of Code, and then I gradually morphed it into its
  present design.
  
  It's a rewrite of the entire multicore processing algorithm of WireGuard.
  No longer are we relying on padata, an inefficient kernel library that
  weighs a whopping 1000 lines of code alone. Instead, we've implemented
  parallel processing using algorithms specifically tailored for WireGuard's
  structures and ordering concerns. In spite of having to provide ourselves
  what this library priorly provided, this snapshot actually weighs in
  _shorter_ than the previous one, which goes to show how cumbersome even
  using padata's APIs were and how much leaner we can make things.
  
  The result is a big improvement in performance on most systems. On my laptop,
  I'm seeing about 1.4x performance as before, which is quite nice. We're
  still working on the best way to scale this to systems with absurd quantities
  of cores, but overall it's working quite well. Future work also involves
  using the DQL and qdisc systems.
  
  In the process, the entire project's code was significantly cleaned up and
  revised.
  
  Samuel was extremely instrumental in kickstarting these efforts, and his
  GSoC was most certainly valuable for getting this project started. He knows
  large parts of the WireGuard codebase well, and I expect for him to be
  a valuable colleague moving forward.
  
  * device: IFF_NO_QUEUE is a private flag, not a public one
  
  This will prevent the weird "20000" flag from showing up in
  ip-link when the device is down.
  
  * socket: satisfy sparse
  * routingtable: satisfy sparse
  * timers: style
  * compat: ensure we can build without compat.h
  * send: no need to check for NULL since ref is valid
  
  Style and correctness fixes.
  
  * qemu: enable debug info for debug qemu
  
  A welcome improvement for all those trying to debug things.
  
  * compat: support RHEL 7.4
  
  This snapshot drops support for RHEL 7.3, moving on instead
  to RHEL 7.4.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170918.tar.xz
  SHA2-256: e083f18596574fb7050167090bfb4db4df09a1a99f3c1adc77f820c166368881
  BLAKE2b-256: 9035708a21cb7df8cfc11bdde26bcb2fbc0b3165b6ec913ebb92f336a7d69b76

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlm/62cQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrpktD/99gSN36Z/im831DIN8ZW9QDiMu2lMw2ewP
SyndvQH2yWTuaKd1Dxj9PLo1/JoCej1/VAzQvy0ndT3MA2vC9z1GIsoIv+AHgPVf
d7w9ZcPreYviemkeHPmKwRuj6rskte4QCeQdRYgMe+W8RrlDSwbnhLoc7rgA07Kk
lb8Dgz0e0cogXHLijHmAvxL0cFFrnqptCifjnwXKWO5oWt0j7kndCuDfGxScRxJA
HG0rv2fZiDkiRZjm6mgGkST1/4OJ/MOY+CSPN+YGqbdwyG5wfSQ04A/RdZ2ph3mn
hikZ5iT1I424ZxTgVC1WDwa9HREg1fGiWuEdx2TQgUce3GuyM+3X8rb/m7OdRPsn
2ZeLJYLUVRP7PNDf/Wl0ok8S8c+w4h3blT74wCYGFHiuNJOVCTeWOh8QgbPQgTnS
5kygJWbPVv90MEj6yEQ2nsZg/dhdZ//9okSE0QmT6xl8fC61VkdgvygpugX8n+bf
3JgHqMFLzF1cNop9GPGOTJGDjt+DS4yNoW44oK/oKZJLwRUY9HjUDFh7C134UH75
I4RRgWR7PxJj0ilkbBmWz+xa0ywnIErwN+v6uLfPZ7ljo86kG0IAdHC7YRH/gsOK
XLVNXIexmc5JmO0Ol4wSvs6VPnZvc7cEp+RfvPBJDIeUV0TERucJRx0r6t83OawN
6cdkBxkkpA==
=jQYG
-----END PGP SIGNATURE-----
