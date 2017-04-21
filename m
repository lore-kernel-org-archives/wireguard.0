Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5769dbc
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Apr 2017 02:33:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a42a5dc2
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Apr 2017 02:33:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 105d6636
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Apr 2017 02:33:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a1e67486
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Apr 2017 02:33:44 +0000 (UTC)
Date: Fri, 21 Apr 2017 04:40:34 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170421` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffffa4d36825@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170421`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * tools: check for malloc failure
  * tools: argc is always 1
  * tools: no hyphen in preshared, to keep uniformity
  * device: use rcu_barrier_bh
  * cookie: move the bangs
  * config: don't allow no-privatekey to mask preshared
  * receive: netif_rx consumes
  
  General bug fixes.
  
  * qemu: work on ARM64
  * netns: cleanup and add diagram
  
  Our QEMU test suite now works on ARM64.
  
  * tools: side channel resistant base64
  
  Our implementation of base64 in wg(8) no longer uses the
  system base64 and instead uses a handrolled constant time
  implementation, in order to avoid timing side-channel attacks
  on private key data.
  
  * compat: work on old 3.10
  
  Supporting ancient 3.10 allows us to run on the Ubiquiti
  EdgeRouter. There's now a package for this:
  https://community.ubnt.com/t5/EdgeMAX/Release-WireGuard-for-EdgeRouter/td-p/1904764
  
  * routingtable: rewrite core functions
  
  The routing table has had some core utilities rewritten, bugs
  fixed, and the test suite greatly expanded, complete with a
  randomized comparison against a slow reference implementation
  and a graphviz output option, which produced these amazing PDFs:
  https://data.zx2c4.com/trie_v4.pdf
  https://data.zx2c4.com/trie_v6.pdf

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170421.tar.xz
  SHA2-256: 03c82af774224cd171d000ee4a519b5e474cc6842ac04967773cf77b26750000
  BLAKE2b-256: 17c1f2b50155b4d6838d9493e4b406484d839a40e77433cf7e0c1aadb2f010a9

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlj5cGUQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drkl2D/4mOXFniczBFfiwpc1J+KZq7xwjLyEH2geq
GVHsx9PpKzC83pqUQSQbUqRnjkJ8G8fr15g/ELmNUsD/tTFWmSUA3QnOs6Q6+EDY
yuR7O6seBGvUZPgPiomXvchcvW/pvBp/lZJYOVULH3YDHb8wNX9z2E1EVSLLh4hj
EvZ8LxO/XzClUJy2IfK9nfO1kI3cqrYJQPSo/NtibntUjg95JZEUu6f/0Hgaxsj7
PP7DffDLNTlfEdmtz8lGT4dV25O9KjEWap8Rk0Hm0C4lpyxNqETV91y0meuxfo3E
LstCKFpY0NsUk7RpxhXFV0zuuLXtMmYk3LOKy+JpbI4oNEncuWnWSElntxesBSQu
gK2voMZnFcYopPeOpmzXxfcQpNbQMkHpWh7iNsGP4Nep0g/mZ8cl/epblkFnaG75
B+6qPwY61UKffrIB3RLYO+4q0qZl3dzPa4YrA5mkPoDQ5M3EruSPooxLgjXOtW40
xFlCSAXpOVL4nWyHd3yEoRFcFdGQSWU866pRoLg+OPKFSS2MnXh2hTjTSobD1i+d
Q3mQKLBxzTDbWoYXI9Fji+DOsoQCGNDeXDo/FRHw6iD8H5+vmz6R3cJrvAYapNqz
z+tdxRW/72dZsAxKkmE+BJPqrXRnZLhA/ftxZUx7ONG6XFkprYW85UXDXvhGht1i
ZqEskicOCg==
=6TuM
-----END PGP SIGNATURE-----
