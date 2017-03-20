Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 225a5acb
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 14:18:53 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d340c9e
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 14:18:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e88f00a3
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 14:18:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 51ab7b17
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 14:18:52 +0000 (UTC)
Date: Mon, 20 Mar 2017 15:23:01 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170320.1` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffff988752c2@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170320.1`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  This is a critical same-day re-release for a bug affecting Sandy
  Bridge systems. All packagers who updated to 20170320 should update
  to this snapshot.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170320.1.tar.xz
  SHA2-256: 286f44d8b480f265e562759e5b3a66cd44e2d1e9c1cdec322557a6c578d52ca7
  BLAKE2b-256: 79d37fe4d957973a1698bfa46fcd1c7230b82a4745f267cefa2c2307fea525d6

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAljP5b0QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrlrrEAC3qinzNOKkkRpO4Vgrg8RFJwl4yyoyS40K
6QvOrOTKcaxFlt1WWfuc5AKsZ0Qbaks5XfHW/OSpZOdLnzaf/phgjENTnk98wJZB
ah0/ANTxnxPEe7auCWxkbAUZbK48KfdguaDuVK9Dh9HjuMBVl14SyQeoQu6Cg+tM
ZB36URBblE9pVnTX3E4Yrq2v7W2/MqlYoKDMbHOD5cgkwuJJk+U7kws86Q8EcSUW
RIRHK8bLxOPZjHt4bLhftJOmT63fXryzVMmTX8SEBYAfUNLCpnRqJnx4Y/oCVeK5
nOYtRTTXF1qvzQxicmODsXqWvi/GXDNponDTqQaq64oLBwryIL8iLlusXqzXmfLn
0Oa7FXTqV75uovbyChOyLv1k0mCGMEC+N0h8gUJmA/vXJHZQdZU4jydwzkrfa4Qd
vfAR5IEQNNC9f+PCtBr0M33pp9Z7LU9IOu50zMy496cu+GnsxNsKYQrO1OWcj6ML
ayy4+qJR+J5gdxQajcU44cbnz5bGmCld/lKgo6fp8TPr46ox4it99aT+YBHeXRkw
4OAFGkxMtZmCImOMNzkRuoIze/pVNWXEx1XsCnk7jGWR3D+Ph+CvfAomUdhud2Rx
DoFEHDpD7jdy+5UEQhlK8xIRbpE+/PPy14zetQ/AKOkTqypo0f3GxqQ7htS/gUYR
o6LaUj3Pfg==
=haHL
-----END PGP SIGNATURE-----
