Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33ADC64EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 15:20:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AD572087D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 15:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="O73pH/Np"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AD572087D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 339bfc3d;
	Sun, 7 Oct 2018 15:19:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63933301
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 15:19:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 154fbd6b
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 15:19:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 384d3e30
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 15:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=1CNCsE5T512lJBAxd
 eQJCBBlmm8=; b=O73pH/NpVRlJbfIduinv2NxfLfF3T/j9vg7cB6hZnS9X2MBtk
 1UzsPnXeGu+tQsNVcEqSuImWzui7Gp+ocyPZX0KQoIPKYbhxdCmG0tsg752wy6jj
 cGVqEMPggM+HhVkGDhi7i7yu7gRJw9MpCag/k/EFdqfYOBckod1+f7HyM47JqFP4
 QI67HCabVZA8D0LZuBElVOthiOZm1KVrMm1AqYwJDKitK3UcBitIgN8IyYeff723
 rY+uou6AzMmKH7tx0MVebPfuD5Oz6c8X8zU7kXN9qo95MGxpLa6wUUr/R72+yhOG
 F9egZBDU6tc7s9u4u7NvoLobdWwkyUvY3VPFQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3f27e626
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 15:19:37 +0000 (UTC)
Date: Sun, 07 Oct 2018 17:20:15 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20181007` Available
MIME-Version: 1.0
Message-Id: <6b314daa5d672a51@frisell.zx2c4.com>
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

A new snapshot, `0.0.20181007`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * makefile: do more generic wildcard so as to avoid rename issues
  
  Yesterday's snapshot broke DKMS installation, which is the majority of distros
  using WireGuard, so we're rushing out a fix the day after so that people can
  actually run it.
  
  * compat: account for ancient ARM assembler
  * compat: make asm/simd.h conditional on its existence
  * compat: clang cannot handle __builtin_constant_p
  
  Yesterday's snapshot broke old ARM kernels and Android kernels using Clang.
  
  * crypto: disable broken implementations in selftests
  
  If the selftests determine a particular crypto implementation doesn't work, it
  prints a warning -- since that would be a pretty grave bug -- but it also just
  disables that implementation so that we don't compute anything incorrectly.
  
  * crypto: use BIT(i) & bitmap instead of (bitmap >> i) & 1
  * allowedips: document additional nobs
  * crypto: clean up remaining .h->.c
  * global: style nits
  
  Various cleanups and style nits.

This snapshot contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181007.tar.xz
  SHA2-256: d26e0d1216594871b5947e76d64c2fa50e9b34b68cdcfa3fdad588cbb314af89
  BLAKE2b-256: 50dc7e09513cac1bd9de1bf136bae4d595bb0d27afebc33dab6c3bbbb3bca175

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181007.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlu6JCsQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrtPqEADNTNN6sqqEy66hp5mtK9BhCMMcPNlErVv2
9wXFoX9bhQ2fdYWdKBuP9tOhvWtYmGpME8nWR3x5Y7wEjOFnvLWXxOoatxSuxFAA
KF1WDXWuswbXq5bxY4J1xO4kYO2BxrJLn2eaIH1Zh+uAEFEbxsHBy2rmvuM+s7Rq
YvL628nVuWce1lETBqq2rx2dBR1vgF5O1eAsDreXrDrl4LpcPdQlhiKcrS57b68x
Jkpsz5Yjm4T+czInqO6pQs+Yr0v9WckgMoMqGEombkyLiG6d4e1SZBzrnqG7JY4X
ZV85WxU77Qsy3xpWkNHwl6pmCAw2DwcPRB+rmxyWMhw0bI3IGPYhRAKo8nt/mOod
zS0KIqE0IcNOip6/IKobiYBlt0ZF5QxUkgk9NgeTnPndyoXSo5OV5qD5hiTXxJ+O
Vxfac8TbBn/xLEhkckhP9Y3k8Sl44JfCwfWp9NS+d7oLWORLVUbzWItvADYkFto1
VjwBYQPqYhyk5bfY70iDiQSnIJfmhCGzcAtCI/0RBIK/Nj39QL0cu2xKAGwiR6Lc
FhzoBT3x9KdvzlZTt4nqh3aAH4U1LwGgv3/Z+WHNhBFeKp4ctA+YlYvCeWHwH5Hj
hnKW9ZiKyjfdRumEuADomD9U1J8GTrbXf02mreKQ+Z+0ucfdqI3cvH3orErbHIXD
Q91QHvUoSw==
=5jxP
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
