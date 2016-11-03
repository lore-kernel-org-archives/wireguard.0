Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 862475f0
 for <wireguard@lists.zx2c4.com>; Thu, 3 Nov 2016 20:38:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc070338
 for <wireguard@lists.zx2c4.com>; Thu, 3 Nov 2016 20:38:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d9fee18f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 Nov 2016 20:38:55 +0000 (UTC)
Date: Thu, 03 Nov 2016 21:40:07 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <cec0846106212af3@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20161103`
	Available
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new experimental snapshot, `experimental-0.0.20161103`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * timers: take reference like a lookup table
  * qemu: newer default kernel
  
  Small improvements as usual.
  
  * device: use ARPHDR_VOID instead of ARPHDR_NONE
  
  We now avoid auto-assigning randomly generated IPv6 addresses to interfaces,
  since this doesn't make sense in the context of cryptokey routing. This should
  prevent those pesky log messages about trying to send to unrouted RA IPs.
  
  * chacha20poly1305: src is different from dst on last piece
  
  This is a critical patch and the reason why this snapshot is being cut so soon
  after the previous. PACKAGERS: bump your packages.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161103.tar.xz
  SHA256: e9d6a97002e0b63bb9572bf42037a7f5b67ccad421fec3afac684e4fc5e931ac

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQItBAEBCAAXBQJYG6CZEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA65KjxAA
vgbpjtlkffoD7KcSCg2AaHoyrzFohVYM73iEoVANLluswiQYtkHLjqwIkZDmDn/Q
1quDuu4aCXYkryCskvyy080qlbLCnLxm5jaYmuIF1SLZRa7W559SKY7hOYGWpWMs
PamszbJkvvo4ctlqnL2XT10yIWP4fRotqb3PxDJrFPem6vygOxCVJ7Hz8NLHBbpK
HjqjOb7ErZlz7Bm8BVzx7oYYkhpPRw4Q1WySnY3n4/8sPQMjI29YR/24p7cJ7MNA
Vq5K8sstXIWs6VebJ5xKzBBDnB70v49ABFwn1vhyGDSgqT6TEWtZ8AYESdge6voU
nvH3xg0LuQ78qeSwFmmsdosWoXqym7WIQbTbtNbbLBABNiGR1u1NHWwYp0UHXwiT
xsNftb8fB6N3f4ve98Ki9J0bMzJAWGptWkOzh65/9aCtcdc6m+1bD/xZIEuNisIa
wrl1D7eGKTXWVq0Ih6LOCk5szbb4O0hBUMH42L5Dp3aH84GxpeHh3ltrLYdtMYTU
hdwQJbec/1lhpcIOtszLnSjZ3eCKZD2JOrpG920xWncfWq4NTTmAyxKgnYt+VJH+
RdHQVzWX7l2KYNA5eApKxFStpTl/82NEsicIvPp+wcJx7IMtlpbhfJoZaCYiTgSx
eA4ttflLdrYeymjjj+LQTcj5J/Bk9POayePlQrq7bmI=
=Rs9c
-----END PGP SIGNATURE-----
