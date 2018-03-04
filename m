Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1fa1652
 for <wireguard@lists.zx2c4.com>; Sun, 4 Mar 2018 17:45:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1156ea15
 for <wireguard@lists.zx2c4.com>; Sun, 4 Mar 2018 17:45:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed576295
 for <wireguard@lists.zx2c4.com>; Sun, 4 Mar 2018 17:36:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id faa7aaeb
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Mar 2018 17:36:25 +0000 (UTC)
Date: Sun, 04 Mar 2018 18:54:23 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180304` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b97b4ced2749b831@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180304`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * NOTICE: off the grid
  
  Do note that I'll be going off the grid from the end of this coming week until
  April 1. This snapshot is expected to be fairly stable in the interim.
  
  * queueing: skb_reset: mark as xnet
  
  This allows cgroups to classify packets.
  
  * contrib: embedded-wg-library: add ability to add and del interfaces
  * contrib: embedded-wg-library: add key generation functions
  
  The embeddable library gains a few extra tricks, for people implementing
  plugins for various network managers.
  
  * crypto: read only after init
  * allowedips: fix comment style
  * messages: MESSAGE_TOTAL is unused
  * global: in gnu code, use un-underscored asm
  * noise: fix function prototype
  
  Small cleanups.
  
  * compat: workaround netlink refcount bug
  
  An upstream refcounting bug meant that in certain situations it became
  impossible to unload the module. So, we work around it in the compat code. The
  problem has been fixed in 4.16.
  
  * contrib: keygen-html: rewrite in pure javascript
  * Revert "contrib: keygen-html: rewrite in pure javascript"
  
  We nearly moved away from emscripten'ing the fiat32 code, but the resultant
  floating point javascript was just too terrifying.
  
  * Kconfig: require DST_CACHE explicitly
  
  Required for certain frankenkernels.
  
  * compat: use correct -include path
  
  Fixes certain out-of-tree build systems.
  
  * noise: align static_identity keys
  
  Gives us better alignment of private keys.
  
  * wg-quick: if resolvconf/interface-order exists, use it
  * wg-quick: if resolvconf/run/iface exists, use it
  
  Better compatibility with Debian's resolvconf.
  
  * contrib: add extract-handshakes kprobe example
  
  Small utility for extracting ephemeral key data from the kernel's memory. More
  information can be found here:
  https://lists.zx2c4.com/pipermail/wireguard/2018-February/002439.html

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180304.tar.xz
  SHA2-256: efb1652f0da67fb2731040439b6abb820a5e2f1bc177aa15c5dce68ea3327787
  BLAKE2b-256: 9b49122b546d334a431b12e5b62582a094db737f2497652e55b4155709107c40

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlqcMrsQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrndND/0ZkzKOnLdYS6NNX+qvdKhwQ4XeOznqAOEo
22z9T/4NalrDe5X8I7LWIwN65KVpcGvoghi5AHI0k4QMGLwdtth+W5beLVhY/U6P
iS2TtdC/5Tp4ovP2ohRn+Ckz6fAP3d+TrV8YWnXi17zrGYjFXXGXSHI98C589Syz
FHyYB1Q1YiGB96wilYCdV+uc23esTTenUQudq/KwJV71I7XpuFVKAZ9uWli/1Jv1
HOk0TTglxDA3orqtPNP1WHxVuKasktvBy4MPNg3B2Ilbdvsmf3cuta1Pyr5ulX47
QwIlr+D+xBFeIbQVYQZsY5eqv6dvAbRcgvZnsxjTohO3X+9s3JTIoPkB+qssiSkT
yP9zhe7JRbLGd6Y+Ys68tKEJQAEtLnGqduj4Lwe0vfcMZ9ItlcsCG4ICxhSrbyIR
F3zKrVlVypWgwjzHOoa8jg7+XEzRfnTAoYHZLxRdV5oB3yQFXn+a41HNZF9BQl00
65g9A5pBDxkcbiwkT884GtAt+bekbFSvb8+bYr0LgbgIt7DAW5z+fe09mlATv3W/
uJpateTM7irm8O3BDvxUh+GGIIqKMNbteUX8nRcPLwMqtJpgC5GCvocjbfJRXIt2
IwnYYPzvQfyDZz5HPQaaXmIInF+EZFBC310tCkwKk5T72+/+zJuGmMjF4EayplrG
SGQYvER10Q==
=LTAE
-----END PGP SIGNATURE-----
