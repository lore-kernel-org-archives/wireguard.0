Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c9c5e5b
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jul 2018 16:45:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2430a8ec
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jul 2018 16:45:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce9f4acd
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jul 2018 16:44:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 96a83976
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jul 2018 16:44:15 +0000 (UTC)
Date: Sun, 08 Jul 2018 18:52:32 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180708` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b9ab5d4d26c6fe7b@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180708`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * device: print daddr not saddr in missing peer error
  * receive: style
  
  Debug messages now make sense again.
  
  * wg-quick: android: support excluding applications
  
  Android now supports excluding certain apps (uids) from the tunnel.
  
  * selftest: ratelimiter: improve chance of success via retry
  * qemu: bump default kernel version
  * qemu: decide debug kernel based on KERNEL_VERSION
  
  Some improvements to our testing infrastructure.
  
  * receive: use NAPI on the receive path
  
  This is a big change that should both improve preemption latency (by not
  disabling it unconditionally) and vastly improve rx performance on most
  systems by using NAPI. The main purpose of this snapshot is to test out this
  technique.

This snapshot contains commits from: Jason A. Donenfeld and Jonathan 
Neuschäfer.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180708.tar.xz
  SHA2-256: 5e38d554f7d1e3a64e3a5319ca1a3b790c84ed89c896586c490a93ac1f953a91

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180708.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAltCQTEQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drk5yD/0fpLfUMa8BaSE6wdqBGd6P0DSvA3IdjEz0
qP3++ivwGMgp33UwRM470n+2qaJ0x+pX4yMFDXJzpH/SPKkEj84ZssgGoHidEszB
EU2h0GpBPOdc7zddJHA6mUzjNXQn89py/X5AnF7XKZrW5PaaHP2YAvTd52HuB3fn
DFe5KsUqf4R+1uDoCHj0KUjS+9U6NMWpf2vPC6JdDFF7kbqYTPBUd1SNRO992RWl
0u5KypyEI2asmcNGuATA4h6P7JsLrOFkXxJePVfhyhd49ILPnYYR1PT179Si8wSb
LDX/G8vA/8vlrE40C+ALCWUoqHVQQIJmgQtJ/Dp3Kszp5fQZVUkg7UR5RT38leRD
p1vuYUcjtF9kJuyOvYBCAjhVBCtuYQ+VjSrwfdIfGT+cvO8ldbg9xVMKwjjiFuvs
z8EZ4UNqgCWORDewa8DCMNGvbQKWLV7GXUVVmEe2wnIeZOKylCTOtPBgP7oePTNx
3x29oX3D9RCoXZxfjODkYFJG4LWoBJALW0YXgqlrWLQScEW6Dxe2FhnLz7epNxl6
PDHprlX3UTFFFiLziuZrao83+eZmSFo9e7TRvsLHxne6eeQ2qQhH6MqKvDuK5U9g
MNShl+LihJqEB+fxJGvcGyJ4uMord8kdHof+M4/4VUBERpudoT3omN9jMJZoRWsL
oF9lvNmNeA==
=koRB
-----END PGP SIGNATURE-----
