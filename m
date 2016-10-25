Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe7ee985
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Oct 2016 13:18:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac383d03
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Oct 2016 13:18:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d32910bf
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Oct 2016 13:18:33 +0000 (UTC)
Date: Tue, 25 Oct 2016 22:18:36 +0900
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffffcdd4bae0@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20161025`
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

A new experimental snapshot, `experimental-0.0.20161025`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * noise: comment/document the key swapping
  
  It turns out this is a bit interesting, and there's an interesting TODO item
  in there now regarding a KPI choice that may or may not be an issue.
  
  * debug: keep alive -> keepalive
  * device: better debug message for unroutable packets
  
  The latter should make it more clear why certain packets aren't being sent. In
  most cases for properly configured interfaces, this will just show v6 RA
  addresses.
  
  * timers: avoid thundering herd for simultaneous initiation
  
  By applying slack time to the initiation schedule, we can take advantage of
  the fact that jiffies does not have the same exact start quantum on all
  computers, giving us the natural jitter we need.
  
  * timers: kill half-open handshakes after a while
  
  This ensures partial ephemeral sessions are cleared, even if they're never
  used.
  
  * timers: always delay handshakes for responder
  * timers: only have initiator rekey
  
  These are two different solutions to the same problem. Namely, we don't want
  the responder to reinitiate a handshake at the same time as the initiator, in
  the case that a TCP SYN is sent after 120 seconds of the session. See the
  individual commit messages for an in depth explanation of the two different
  approaches and the one I ultimately chose.
  
  * receive: always send confirmation, even if queue is empty
  
  It's essential that the initiator always sends confirmation to the responder,
  so that the responder can send packets using the new key ASAP. This is
  required when handshakes roll-over during sparsely utilized links.
  
  
  * compat: support PaX constify plugin
  * data: reset all packet fields like tun.c
  * compat: grsecurity backports get_random_long
  
  WireGuard now compiles and runs fine on both grsecurity/PaX stable and testing.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161025.tar.xz
  SHA256: 433fb84d00afa566d77dcb29f87c30e17c1c9c8dc9a9a0026619addfc6553027

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQItBAEBCAAXBQJYD1ujEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA66jnQ/+
J6YOAmnrdY+yQcYeyWEM3YY6GAwWVhTCPByA3ShcNB2xAFSjG6B6z1WgcHf5F+eU
/Ug/C6mNP8QbcMSf82xprG7YP7pXHizhcjEaIl2Vk+zxVxAHLGrruWc4KS5YG/dn
bKBJb/SvnApEhLBcPXCJvUMU3O3muhMl7NzNBPbtGz5lhaWKcq8+6JpTdFdDGO7N
p0PiIiuicl2rSt54hbtKns8kA432F+SaAY0meD55j366j/CqQ6m6LIEMWrF+Zfto
6b566QpU6bL67CM9ZM7Be9F/kZB0nij+2XHoO7Oer6DH7lYfQBsqtsaV4kqWyTYZ
IAysVmNK+A+1JVoxhJhUOmPMYvJaYExyrfuK/dtUANhLuJJwzEbrULgEZclOVr8M
Phc5D7lh49lBEHJvhAQ0AzJv5zfs54vafs65wbdWF2z9HVcVma5i/tO9UC65lM20
AcCVTdwQV6WKRp2mQ+4ej4eD/2PlOR9tWeSoB80oeGhG9F6ViAaTWJ84Tafznva7
ia6leez4MNuwrwFszbLFlb+Q7TPazcHwyot6RJIuU6rsaFw/kPNTBaj6GwPTRFEx
XOLoghuUXNgabhXp8PPzHvK3CSZ170D4vosRqA2icJJd0Mz4Hv+MmaURNmv0l6Qa
qYV7edAXS6e9ua193kc6qkBZLXimnT5+feeE7i/h4WM=
=6JnR
-----END PGP SIGNATURE-----
