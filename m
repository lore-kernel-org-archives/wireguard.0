Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 319ea2b2
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 04:05:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 328bfcdc
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 04:05:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9b770d9
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 03:41:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c0950ca2
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 03:41:28 +0000 (UTC)
Date: Fri, 20 Apr 2018 06:05:17 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180420` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b98a91aa3b7fc912@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180420`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * wg-quick: account for specified fwmark in auto routing mode
  
  If we're doing automatic routing with default routes, but the config has
  also specified an explicit fwmark, then use that explicit fwmark, even
  if it's conflicting, since the administrator has explicitly opted into
  using it. Also, when shutting down the interface, we only now remove the
  fancy rules if we're in automatic routing mode with default routes.
  
  * send: account for route-based MTU
  
  It might be that a particular route has a different MTU than the
  interface, via `ip route add ... dev wg0 mtu 1281`, for example. In this
  case, it's important that we don't accidently pad beyond the end of the
  MTU. We accomplish that in this patch by carrying forward the MTU from
  the dst if it exists. We also add a unit test for this issue.
  
  * send: simplify skb_padding with nice macro
  * blake2s: remove unused helper
  * compat: remove unused dev_recursion_level backport
  
  Cleanups.
  
  * poly1305: do not place constants in different sections
  
  We're referencing these constants as one contiguous blob, so if there's
  any merging that goes on with other constants elsewhere (such as the
  kernel's current poly1305 implementation that we hope to replace), then
  these will be reordered and have the wrong values.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180420.tar.xz
  SHA2-256: b58cd2acf9e8d3fe9044c06c0056bd74da1f5673a456f011d36eee3f6fb1da16
  BLAKE2b-256: 09a5bfce8df74241899c73fff99d993c4dcc06d6ee35394c2076abff2112587e

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlrZZlwQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrvJmD/47dQJOvtys6Hsud8mMG+iO8t3eR/gCgplJ
mBLFR2tw24n4WI1GWH6EdwxFt8mbC9lEcubOz/kA+gQavXRXyMghoG0qjSpIKrT7
xXA2aDgVtUIgE8ZEP4xDwj4hKjBLHByKykb8BeHIWTmwkPqSby751keNEqL/1a/C
Clb6l2PFQeUCDdL5CvPpkpMcN2BE/P4DGJx7yU/vim3X1EJ7ViVbulwnSXuUtY7Y
zb55yKSg83P60wjFUGnKE45/IFg9M23i+VbzcxXCFxG+Fsw0nHcx7JdH6/WGi/ZS
zg7GTl90gcvf2IiYMnU8GMUDFD2Wa6DTltmKEupErP+pMFN4JlpPWNo9M4p3UeRH
nzSdpdD/PiP0cS+dmHfE+37doE1QAdKYp0YjiL1scJfBMNrodKra87zXWTx/XX9s
6A+e+JXz1S+Q4qbeWTY+d8R3aM9zGExZDTG20LlteLRjxU1gRR5QITC1Bbom8QrX
b25m7MA1GgK+DCH8DybEf+fDVcc+sQ7DV9o+MqULWR4gZaf0mV5NHMd3kH67omCr
mNXt4s4FTEUQqd00iLqzkvpJAByOc6z8vyicGbvXuYN5K/00cuu698sCSLlHjJF6
NGUyEKOLrt9WdjkAcSu52cGqbCPqeabTnctiOvXg3Y1eQ8QEJLltXZpSkJJf7y0L
XR/aa4no/w==
=WCvV
-----END PGP SIGNATURE-----
