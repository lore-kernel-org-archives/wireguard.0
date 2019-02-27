Return-Path: <SRS0=FqQ7=RC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD1CC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Feb 2019 21:28:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858D020663
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Feb 2019 21:28:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="sPi51Ulh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 858D020663
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa20b094;
	Wed, 27 Feb 2019 21:18:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7eef3409
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Feb 2019 21:18:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a66cdd80
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Feb 2019 21:18:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 614e3352
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Feb 2019 21:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=QjtvzLFVfpOLIBgfO
 xiNWBMhESw=; b=sPi51Ulh/k4N/DlN+WAeTFBmEB41ZwqvxRYvb03D4qGOS0SVP
 RhONffXwbgf1n+fnQ7B3wopeUwmev98N7UIrOHBk1hk35C6VFRVKsOYHSu2Lij8M
 9DIHeTp53sxx3i+Oy40ll1OpNovfhKX3bi3HDrJ60rCFulkSotKPfzwFCyNDAo+i
 flAaXHencgn3NO+mB0tilbDHRWa4arekCQm/oSxxiByncr0knfKEqU9Te6uF+xzk
 ESiML4b6Zw3+4aJGGssfnnvNmwpQ6x2RFg1u7Dhma9g0xXu41sl4WgShx81zS8qp
 k4OlEk9mp0y+3nd7JvM5kl/X2rklgedJH1FLw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c1b5b4ae
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Feb 2019 21:09:40 +0000 (UTC)
Date: Wed, 27 Feb 2019 22:28:27 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20190227` Available
MIME-Version: 1.0
Message-Id: <36d38d7e5c69e2dc@frisell.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new snapshot, `0.0.20190227`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not constitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * wg-quick: freebsd: allow loopback to work
  
  FreeBSD adds a route for point-to-point destination addresses. We don't
  really want to specify any destination address, but unfortunately we
  have to. Before we tried to cheat by giving our own address as the
  destination, but this had the unfortunate effect of preventing
  loopback from working on our local ip address. We work around this with
  yet another kludge: we set the destination address to 127.0.0.1. Since
  127.0.0.1 is already assigned to an interface, this has the same effect
  of not specifying a destination address, and therefore we accomplish the
  intended behavior. Note that the bad behavior is still present in Darwin,
  where such workaround does not exist.
  
  * tools: remove unused check phony declaration
  * highlighter: when subtracting char, cast to unsigned
  * chacha20: name enums
  * tools: fight compiler slightly harder
  * tools: c_acc doesn't need to be initialized
  * queueing: more reasonable allocator function convention
  
  Usual nits.
  
  * systemd: wg-quick should depend on nss-lookup.target
  
  Since wg-quick(8) calls wg(8) which does hostname lookups, we should
  probably only run this after we're allowed to look up hostnames.
  
  * compat: backport ALIGN_DOWN
  * noise: whiten the nanoseconds portion of the timestamp
  
  This mitigates unrelated sidechannel attacks that think they can turn
  WireGuard into a useful time oracle.
  
  * hashtables: decouple hashtable allocations from the main device allocation
  
  The hashtable allocations are quite large, and cause the device allocation in
  the net framework to stall sometimes while it tries to find a contiguous
  region that can fit the device struct. To fix the allocation stalls, decouple
  the hashtable allocations from the device allocation and allocate the
  hashtables with kvmalloc's implicit __GFP_NORETRY so that the allocations fall
  back to vmalloc with little resistance.
  
  * chacha20poly1305: permit unaligned strides on certain platforms
  
  The map allocations required to fix this are mostly slower than unaligned
  paths.
  
  * noise: store clamped key instead of raw key
  
  This causes `wg show` to now show the right thing. Useful for doing
  comparisons.
  
  * compat: ipv6_stub is sometimes null
  
  On ancient kernels, ipv6_stub is sometimes null in cases where IPv6 has
  been disabled with a command line flag or other failures.
  
  * Makefile: don't duplicate code in install and modules-install
  * Makefile: make the depmod path configurable
  
  * queueing: net-next has changed signature of skb_probe_transport_header
  
  A 5.1 change. This could change again, but for now it allows us to keep this
  snapshot aligned with our upstream submissions.
  
  * netlink: don't remove allowed ips for new peers
  * peer: only synchronize_rcu_bh and traverse trie once when removing all peers
  * allowedips: maintain per-peer list of allowedips
  
  This is a rather big and important change that makes it much much faster to do
  operations involving thousands of peers. Batch peer/allowedip addition and
  clearing is several orders of magnitude faster now.

This snapshot contains commits from: Jason A. Donenfeld, Luis Ressel, and 
Sultan Alsawaf.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190227.tar.xz
  SHA2-256: fcdb26fd2692d9e1dee54d14418603c38fbb973a06ce89d08fbe45292ff37f79
  BLAKE2b-256: ec2f0667b8439f8a168f2e78571a10a5dc16ffb8d887c8bd80f07653f8ab9a21

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190227.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlx3ACcQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrnsXD/9MBsXPGXp/TF2ZRaTgKDjfCe37NiMk9hP2
BN9ASGWk7PGjjcE0+qFqQSQLebv79ED6q8nbN7YTNY/IYHEQaLN85NZd0yEDDa4Q
stPe21kX0pSqBK/8eOPoBE5Z5aJBhqCAZC76B+1GgvJaM/nWkyY0r5S0fJKWhxhg
5YzRCU6tgkaPU3dUAUMd4q5/WtTr6BajSLdmPug3sfzqm3ALy9HdHV16tMAFEolK
dcYnHYJi9B+ttaE1ZlhQidgONLn2VxAG+vDSvfjnsExY2bgJ9vICnfIrK2TnEsyp
eoMYQoUFaPX88h/Gx6BDBMKsMQY82B14IbVRNeOMXuk3G/YVskigYOAHi9e4mcMb
EEoNJR6VLoHb7z+xajmzm0p+w5/Gx8F/5/awDBRS9rTvBYRvnIeFRHbtunzqxDMS
2PMPwSP11/Md2jKTr1ZtU+45y3D3B6VUZ9qTMVhJhSFCxKd55yDObVX2via1bt/S
8O0yz3+5vZ9VqYtYZxzDMIfbprhHer1ax6nTDofKTyxE53JYqq59iLvd8sPTirv6
NDKP+ZtaQBsZGyMel/d03m/wCddCbmUkTA8HjhpoNHm0a8Bj2F42nLsGfw58GEpj
PzKNBW3v1uNTT/G1rz66iiEEQqSYbCy1js6Tu4z+quXH+jJW5l1ZKaC9dMGDrfby
GAP7/0jBWQ==
=XRui
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
