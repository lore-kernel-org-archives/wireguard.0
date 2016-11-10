Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80d77f75
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 18:27:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04630e58
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 18:27:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a4080811
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 18:27:54 +0000 (UTC)
Date: Thu, 10 Nov 2016 19:29:59 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <cec4d4147b0b4a18@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20161110`
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

A new experimental snapshot, `experimental-0.0.20161110`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * data: we care about per-peer, not per-device, inflight encryptions
  * data: squelch compiler warning on PARALLEL=n
  * socket: release dst on routing loop
  
  These are cleanups of the previous refactoring.
  
  * qemu: use sparsemem always, for kasan
  * qemu: kasan needs more memory
  
  Automatically detecting memory corruption bugs should not be much easier.
  
  
  * send: remove redundant time stamp
  * cookie: avoid void pointer arithmatic
  * debug: support dynamic debug on skb addr
  * data: only uses kmem_cache for parallism
  * chacha20poly1305: don't forget version header
  
  General bug fixes.
  
  * socket: use more reasonable skb padding
  
  Rather than the somewhat arbitrary ETH_HLEN + VLAN_HLEN + 16, we now use
  NET_SKB_PAD.
  
  * chacha20poly1305: it's just as fast to use these more simple unaligned access helpers
  
  This completes our fixup of chacha20poly1305 for platforms with slow unaligned
  access, such as MIPS.
  
  * send: simplify handshake initiation queueing and introduce lock
  
  Rate limiting is now applied globally, and while locked, which should make it
  impossible for two threads to simultaneously cause a new handshake.
  
  * selftest: add routing table tests for small subnets
  * routing-table: mask self for better IP display
  
  Giving allowed IPs an address like 192.168.121.128/16 will now be normalized
  to 192.168.0.0/16 automatically.
  
  * curve25519: use kmalloc in order to not overflow stack
  
  This is HUGE. And OPENWRT PEOPLE SHOULD UPDATE IMMEDIATELY. This is a major
  fix for platforms that do not use a separate IRQ stack, such as MIPS. All MIPS
  users should update immediately for improved stability. An interesting mailing
  list thread crossposted to LKML is on this list.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161110.tar.xz
  SHA256: 205478709127c4797b5aa9d6448fae03c10b083404414444bad33e62a609e48f

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQItBAEBCAAXBQJYJLyZEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA64J5xAA
nkVXT5UPr4oJACZVDSK36t5h3ldQtxlFiwjYaUH7wn0TeA1Ww6vYQC06CgWqE/V0
7Sp3XT5v+CGD8o6otZ46luSoqq3lMkvDwgvmZWowQqdfzg5FDO09Bz4WH2xiqrAv
kp+J6jLwMnmTekgVaytDdB1ZTK5CY2jOdeY+27oLlu+YQbzgtoHgtve7JRjvPg2z
IqCCLF4pu8H2Kgjcfq7vltfzwIDEb2E/SdjpJTSA0hmsmLWPOe2WJo9hu1fr+yAh
RupbWVhz7buvxufP7m3DcHZmQgcQJnjLnwWpuv+867Wx4hqd5/4TFR4rqmUmXWdH
sOSDbnz6pj3aoQDC4lHfcRYiMVWjyNB6jXdCvg92Msp8mTxyxepzEhRzIvrV4SYp
k06lhtTnGjv7nWyxHNCAy7JcYTM/94+mgOittRz1LyK6rAd+3tK3dcQeAqWmvHBK
K8hoZOg90Jbv4BEQAit1STnlQB7RHhYGjijQxFIdK5xZkbRNqXHud2i99sQ5sKhZ
ix/9fzf6lcOJjZMTYyOgMKd3E63QC/dCZP0xkP/qgREvqFzriUZaehLoTFwLLL/g
c+qqMDGRXBziDbFRbB7yUG95Sa8FT9kBspEAfVrseOwfIwT3jmMF60X0iGxARzWq
I5rJ+lLH8GxcTh3lZf8ajx10iIQGO6iGpg4bwZoidTI=
=/Zuy
-----END PGP SIGNATURE-----
