Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16ff09de
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 04:53:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f14bb438
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 04:53:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68fdf9c3
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 04:53:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dbe14bbf
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 04:53:55 +0000 (UTC)
Date: Mon, 27 Nov 2017 05:59:34 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20171127` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <0d6be4a86359a715@frisell.zx2c4.com>
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

A new snapshot, `0.0.20171127`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * compat: support timespec64 on old kernels
  * compat: support AVX512BW+VL by lying
  * compat: fix typo and ranges
  * compat: support 4.15's netlink and barrier changes
  * poly1305-avx512: requires AVX512F+VL+BW
  
  Numerous compat fixes which should keep us supporting 3.10-4.15-rc1.
  
  * blake2s: AVX512F+VL implementation
  * blake2s: tweak avx512 code
  * blake2s: hmac space optimization
  
  Another terrific submission from Samuel Neves: we now have an implementation
  of Blake2s using AVX512, which is extremely fast.
  
  * allowedips: optimize
  * allowedips: simplify
  * chacha20: directly assign constant and initial state
  
  Small performance tweaks.
  
  * tools: fix removing preshared keys
  * qemu: use netfilter.org https site
  * qemu: take shared lock for untarring
  
  Small bug fixes.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20171127.tar.xz
  SHA2-256: 5e0a93cccce70e5758ddebaaa94d3df74cb664f592895efbd43dc6171ee5b25b
  BLAKE2b-256: d544e1bf01f8dc99182a40f900f285248faf21f950c086f4760d6e6c55425355

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlobm3gQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrkWtEACbtr1fhAG7P2r7wAVeICxTTCwdItyPegaa
K5sTYxGUWClHaxHMDpgQmb2pi9cFNZ2LZpm8ONHcit/fhBHIYw9UuRJC5yMrPgbw
6XG+dy7dbBaEsx+XM7dvuN/Au6MavpM8n+cIuIf/MccRg7+XvwdSauKHvy1La03y
HrXmyXle+Bqy2pXiqe0Z9YbwbbEggGvONS3uMgeFM+dWBcdntZo0XyeSo3tSSxPk
zbKt+2DQJbGR0POFI2FwvcmBkhnRzyUNGUXMitpPnIG85NLWymC3udK5AdA4u1ad
vUWn9Rh9IDgPolZ8ckkvw28d45JgJ8n16GUFl2pyvDgmaoOeQIimF9YOoe1viJ6v
OhhUAzCS01jjMHw+EOr7bKkn3Te2m8gjvl7b8P7I9urWqL46QCty7+P09FOuWOd+
PmQMk+pOlQjxUwzq6VxOEqkyCdZEhcC/GerOeUaROexudigz5YNAnkXtjIS3IZDm
zFFFJQXeOc2QIy3ix/XzXGwtDuHutvsqlEbTEcNclOMVVMOFl47n59IGXiQEhsFQ
pi6V6+F8ApBN5ZUoTS2+VH9LxXg+pB3dud5h/LbUg0cG2OBvbT9rRqvQeUroDobE
p1JT6Q+JSGPvMm3urOhELhubiKpSI9lJyzYwmabO69bhTY3Ye9SUZuYFx6Ow6rT5
8ry9uHWaIw==
=HXhA
-----END PGP SIGNATURE-----
