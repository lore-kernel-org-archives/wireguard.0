Return-Path: <SRS0=wYFz=3R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609D6C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 15:53:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26E721739
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 15:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lrM1qjyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A26E721739
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc5ba95b;
	Tue, 28 Jan 2020 15:53:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 858c6d50
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 15:53:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcdae8ec
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 15:53:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3829e961
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=4ukwHNto6/Zf6/dQw
 H/aed/nht8=; b=lrM1qjyilG+yreC74uXETF2m8T7fH80z+oDV9voTnALQfubbT
 8SNcGPVLKIKri9BCa1NdOVCFzwK08yH6dY1XroopRRurB+LvbR4URYA+IK8fbmoS
 8zYUgRAJdOEvB4A9/rPKmOzznDPQI2ol0fb6WizOLsZX9l/Aqn1UvqRKTw4Dyytj
 Fnsg5tgsNjVYyy3MRB8jy86+tDBgt3oY9kka2exGcvhi769tqhsLqdVh6M2jyvub
 9ReuP8jMx4g0dZ3C0RVd3ncwGhyeSpDqYPaCUX0YtBc86CwDXIsF5XPhh09+mleJ
 UgijiCfG7fLex1hBkX00c7aguVXO8BfLNqXrg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9ec55832
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 14:51:24 +0000 (UTC)
Date: Tue, 28 Jan 2020 16:53:14 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v0.0.20200128 released
MIME-Version: 1.0
Message-Id: <fa0a6e76189566b1@frisell.zx2c4.com>
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

A new version, v0.0.20200128, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

Please note that until Linux 5.6 is released, this snapshot is a
snapshot rather than a secure final release.

== Changes ==

  * qemu: bump kernel
  * compat: refuse to build on >= 5.6
  * compat: account for frankenzinc being in 5.5
  
  I thought I had worked everything out for the 5.5 release, but folks reported
  linker failures when jury rigging this into the new kernel tree, due to
  clashes with the upstream frankenzinc. So, this snapshot should get things
  building fine on 5.5 again.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200128.tar.xz
  SHA2-256: 8610c6d8712cfd885f50b1a8c572518edf318c094d68491ea218bb50566a9a8a

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200128.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl4wWOMQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrropEACA7qhFZ+R02Q972Gp3AhZ2UkQB6M/mzi1e
kTagK/1p7nvdMHThFKMdMAi/xqcpGsa0m0K4Jct8a/uBW8Z/m4vk6JqiECAxaBMR
7B0q3zmZtu+FMQBRHPvFoLmj3s7vcU7q/GCRo3YD7KJxwlkYbSPhuOk/X1HDsmfG
Kh8fzxUyeozNNTHYAQbvvwRPa1ojj2ju/vu5wwj7dG0xpw8jnywGdjndEy2BzABr
S3lW0i3/Wkr9a004dxchKE6gjOCzBkMz4acEF+qysI7Bim51OZI1PLG+uPcNHLYH
fI59R8wZo6JNHELtz9q2u7uJKyv/3KSiJ0EHaCE1zSbcpQr2feJFaq9MPTH0+znI
eKl9Ui2JnBa7ak0geKpQzyoj16NPJ2a6jiHe9n3Fdd6DO0Y2Pl0Pz5IqdJY/jfTF
Lx0iWiLfV6ICpB5CvwzjxVgogfbu6f91cnNcbllqBiJ6lsXkjp/Y7ulN1v15XNc2
M9mOuGH0qY5fl1R+o6ynjx5HJgOS0LRrxrOsIx1wAHq2Eon666kN1qUWMvQ6nnUG
1VRmkvxxB1sAmtZ/qs/lfVnIAcXcsb605AZ8VdoHv1sYqN93RALnsofZ7aA3ECR/
TUFyAx0V4JRgI2DFsItLE0tkqsjA3M9etrjS0GICW/HxgdghGhl8Rh5JLXTO/r1x
w2/3Am0H6Q==
=v2om
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
