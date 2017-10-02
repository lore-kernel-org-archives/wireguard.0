Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11db0ae4
 for <wireguard@lists.zx2c4.com>; Mon, 2 Oct 2017 00:39:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca6d8b21
 for <wireguard@lists.zx2c4.com>; Mon, 2 Oct 2017 00:39:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d131b08
 for <wireguard@lists.zx2c4.com>; Mon, 2 Oct 2017 00:58:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id edfcfdd0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Oct 2017 00:58:20 +0000 (UTC)
Date: Mon, 02 Oct 2017 03:06:42 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20171001` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <364f636e1f32d22c@frisell.zx2c4.com>
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

A new snapshot, `0.0.20171001`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * receive: use netif_receive_skb instead of netif_rx
  
  netif_rx queues things up to a per-cpu backlog, whereas
  netif_receive_skb immediately delivers the packet to the underlying
  network device and mostly never fails. In the event where decrypting
  packets is actually happening faster than the networking subsystem
  receive them -- like with 65k packets with UDPv6 in `make test-qemu`
  -- then this backlog fills up and we wind up dropping some packets.
  This is fine and not all together terrible, but it does raise the
  question of why we bothered spending CPU cycles decrypting those
  packets if they were just going to be dropped anyway. So, moving from
  netif_rx to netif_receive_skb means that whatever time netif_receive_skb
  needs winds up slowing down the dequeuing of decryption packets, which
  in turn means the decryption receive queue fills up sooner, so that we
  drop packets before decryption, rather than after, thus saving precious
  CPU cycles.
  
  * contrib: add sticky sockets example code
  
  A description of how our socket roaming algorithm works by translating it
  into userspace as an example for others.
  
  * queueing: no need to memzero struct
  * send: don't take uninitialized lock
  * device: properly arrange structs
  * peer: rearrange structs
  * queueing: clean up worthless helper
  * queueing: rename cpumask function
  * timers: convert to use netif_running
  * config: do not reset device port
  * tools: use key_is_zero for comparing to zeros
  * queueing: more standard init/uninit names
  * receive: mark function static
  * tools: uapi: only make sure socket file is socket
  * receive: do not consider netfilter drop a real drop
  * peer: ensure that lookup tables are added last
  * timers: ensure safe timer removal
  * peer: remove from RCU lists when the kref is zero
  * noise: use spinlock for rotating keys
  * messages: reduce maximum staged packets per peer
  * ratelimiter: wait for destruction, not for read_unlock
  * tools: do not warn on unrecognized items
  * wg-quick: anchor sysctl regex to start and end
  * wg-quick: verify wireguard interface in more clever way
  * wg-quick: check permissions of parent directory
  
  Tons of bug fixes and cleanups, some of which were quite important. This
  was a very important development life-cycle for shaking out some subtle
  issues.
  
  * netns: disable rp_filter for final test
  * debug: add better insert target
  * qemu: add watchdog for not hanging on oops
  
  Some improvements to our debugging tools, most notably a watchdog timer
  so that build.wireguard.com can properly report OOPSes.
  
  * netlink: switch from ioctl to netlink for configuration
  
  This is fairly huge, and one of the most important things we needed
  to do for reaching mainline inclusion. Rather than ioctl, we now use
  netlink. This was mostly a terrible experience, adding bloat and
  complexity, and making things a lot harder to understand. But upstream
  requires it. I think we did an okay job, and things should go smoothly,
  but all and all I was unimpressed by the clunkiness of the whole
  endeavour. Implementors wishing to integrate WireGuard into their
  network managers can refer to the uapi/wireguard.h documentation header:
  <https://git.zx2c4.com/WireGuard/tree/src/uapi/wireguard.h>.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20171001.tar.xz
  SHA2-256: ecff9a184685b7dd2d81576eba5bd96bb59031c9e9b5eeee05d6dc298f30998e
  BLAKE2b-256: c2a8532f6940fbfe9e554402b4a8896c6b8809c20eca394f3adef7a0e9a040a0

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlnRkJUQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrlujD/4kLLiZMI07QbVKdPpD5mN/IBWcXPaqGOb1
q+mcw0x7oJ8FjJ/2GRQE9HiuDXYNZLCG8Q5/5NjgaJsjukTAc7w5ZzzgWlD3UAl6
dkwvK88AZmxHJATBUixdGnQwwCME540LdNIMxUBSDJ2gkB7ZahgSXlJYddexcwa4
wleUjNUy2zTOt2Hqlk05ulGmydBkGHWHvO0xffZAjMUFy9ZS11eRDhLMz98tEPFu
VhYJEt64OhhTNXRRwjRUQbJv3lYFFk7DVj+vlu4sPSIdHGcZrLiCiP7m2nSd68/X
cT39Cjn85rwCuzyKL08YdvpxHuOekyIif20P344vioC/JwolZo8VHS2UrAojvU1T
PH4rsd7dS7usSly8tCTkma1ooVp5Xn4afQdtXg0e3Xqtxvh9au89TQY7XTvAuD/g
txgrc2bKjSzylb0hW9M1objQ6ypGT6mZXTYeAIdc/p+cDdNwGaEIDuvL9dkyw05H
b5D3bqt1DjUdFxYpB3uwEu8TbTcXFEt/qFRcmWnPtG2L/4YpmV8DBenuZzVRuTBH
DcJy1oojXkvwDDhcOBIy236drvRAJVNZ66pmxApqw6V3zUA88dMOcq6cKDSUdtiM
CUTQdYvBoI4v+zaayQhWCb5+OANKQ/MaE9utfpSApFrTls9XUYqoxMFlualDtawT
4qtyC6ubNA==
=8tLq
-----END PGP SIGNATURE-----
