Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8181134
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 May 2018 00:30:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3d6634d
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 May 2018 00:30:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9528cc7
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 May 2018 00:29:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f1c717f5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 May 2018 00:29:29 +0000 (UTC)
Date: Sat, 19 May 2018 02:31:19 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180519` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b995742b9fe2915d@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180519`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * chacha20poly1305: add mips32 implementation
  
  "The OpenWRT Commit" - this significantly speeds up performance on cheap
  plastic MIPS routers, and presumably the remaining MIPS32r2 super computers
  out there.
  
  * timers: reinitialize state on init
  * timers: round up instead of down in slack_time
  * timers: remove slack_time
  * timers: clear send_keepalive timer on sending handshake response
  * timers: no need to clear keepalive in persistent keepalive
  
  Andrew He and I have helped simplify the timers and remove some old warts,
  making the whole system a bit easier to analyze.
  
  * tools: fix errno propagation and messages
  
  Error messages are now more coherent.
  
  * wg-quick: use invoking shell in auto rooting
  
  Rather than letting sudo use bash from PATH, we now have it use whatever bash
  is currently executing the script.
  
  * device: remove allowedips before individual peers
  
  This avoids an O(n^2) traversal in favor of an O(n) one. Before systems with
  many peers would grind when deleting the interface.
  
  * dns-hatchet: update paths
  
  Our reorganizing of the wg-quick bash paths was not sync'd with this patch,
  resulting in some trivial problems for Fedora and OpenSUSE.
  
  * compat: backport for OpenSUSE 15
  
  Usual compat fixes.
  
  * wg-quick: add darwin implementation
  
  We released a Darwin implementation of wg-quick(8), to be used with the new
  wireguard-go snapshot.
  
  * wg-quick: darwin: ensure socket directory exists
  * wg-quick: darwin: remove v6 routes after shutdown
  * wg-quick: darwin: bash correctness
  * wg-quick: darwin: restore DNS on down
  * wg-quick: darwin: use bash from environment and require bash 4+
  * wg-quick: darwin: sometimes there are no network services
  * wg-quick: darwin: avoid routing loop if no default
  * wg-quick: darwin: networksetup does not like missing stdio
  * wg-quick: darwin: reorder functions
  * wg-quick: darwin: simpler inclusion check
  
  After a pretty intense first few days of the new macOS port, we've fixed a few
  bugs and improved functionality of wg-quick(8).
  
  * ncat-client-server: add wg-quick variant
  
  We now have client-quick.sh that does the same as client.sh except it builds a
  file for wg-quick(8), which can then be used in `wg-quick up demo`.

This snapshot contains commits from: Jason A. Donenfeld and René van Dorst.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180519.tar.xz
  SHA2-256: 8846b3006c3f7e079bb38a4c985ccc2981e259f56c927b4cf47cbc1420e1c462
  BLAKE2b-256: fc2089b0e941398423bc312d16664fa5af9eb00ca3a99eb5a4624443fc4d9f13

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlr/cD0QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrsA7D/9QR8EulAmL1pqA8EogZ+latTOQv0HubzqQ
yeKextYH9+gG3RhHd3ojncraW8wc1alJruC4zWbc4Ozdk7fEvE8uwTbqb6pjRPV2
A9QXPe+0BlAOluAY22oZP44zaFVeec7YHM7HtnWVgmdxQaNNwXNkkK0imuh4vL6H
hL5sd0yZS1oZv4lNxbW2WvXgelrnHTA3amebM9dHAbVT/fiWRf1ZB2HssK2HpzLd
e2qHvgNusvMeB/RIfviEyWSQuu6RwrmnJAdEU/7iB4YD1+WPZ4ksNuPWRN3jesD7
mXIsHGhyEbkRIst5odvZ2Ojx7Ia//ARcAOG/Kf4Pmdoe/lPe81KMxY1OL7cNFN+Q
pBwT2iZpeky3u3dxl+4Ekxes7ZAsjuDghXs4Yl5x5gckrTUviQI1qhd6lu6dpmgb
dFX5mbkxToLPvF0Pg0coew6HmPf26XnGtEuxZT2wATlzSy9lB7sTjHKJsKCMm/Ex
3ShjvGjh6GDpr/3H9xu2XWazxKcu51FBchAkOh15MvgTF2YkIVZ1NgjRoNNl3iok
CMPg7C/52kOMvAWsuRf7Bj/2w/8U3TvDEI2rkL0kju2dNhLR+s1g+QfUgZwH55ie
ZW7nM1qMis02HfpxSX0utPmFs8/PfRe5Z0N1qdRaY9JWabFOB7a6UqQHUXNMCSRu
29okCyku8g==
=kOMx
-----END PGP SIGNATURE-----
