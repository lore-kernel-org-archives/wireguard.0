Return-Path: <SRS0=jP9u=M6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C270ECDE42
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Oct 2018 00:38:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E7B21470
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Oct 2018 00:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="D8HfuJJ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E7B21470
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de25d98d;
	Thu, 18 Oct 2018 00:35:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2bdb323
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Oct 2018 00:35:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54c443c1
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Oct 2018 00:35:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccf85616
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Oct 2018 00:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=sbkCmSqoGjdeBBTSU
 ffXndxsChI=; b=D8HfuJJ9r9aAi8QQdDBzUkJTo5eWpJGqx/HNpcuAnKMikTNud
 TROG08cwEkRA7EyXOamSe8Qxuu0fK4vQyHUyVAoyym2UXk4jIOY5YCjYUQhIuJsu
 vXA1GhIkjdciLZBX/DHZVVjMOXHe2GAIg37DK/rLV+N/JnWWYlwIVQCPbutPZR0r
 FYMWIiqaWYlFDow7JfPfERKamVqACOku2HWKS0bbUYHePQ9erwD3HixUXHEb7ctc
 04HspgeiolTGxFyw5LdU024Vpo3IKlpZzfpVU5hswLb37AYgpE3y6ZzRdPZ6inI5
 RpaLdEZoed1PcssoT6Ew9ZuVv5Aw4rtOuTIDA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9ad1f4ac
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Oct 2018 00:35:45 +0000 (UTC)
Date: Thu, 18 Oct 2018 02:37:41 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20181018` Available
MIME-Version: 1.0
Message-Id: <6b34a5e81df1ea96@frisell.zx2c4.com>
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

A new snapshot, `0.0.20181018`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * compat: don't output for grep errors
  * compat: look in Kbuild and Makefile since they differ based on arch
  * create-patch: blacklist instead of whitelist
  
  This should solve the last of the compat issues introduced with the revamped
  build system and upstream changes.
  
  * qemu: kill after 20 minutes
  
  Our test suite now accounts for hangs.
  
  * global: prefix functions used in callbacks with wg_
  * global: rename struct wireguard_ to struct wg_
  * global: more nits
  * timers: avoid using control statements in macro
  * allowedips: remove control statement from macro by rewriting
  * device: use textual error labels always
  * global: give if statements brackets and other cleanups
  * main: change module description
  * main: get rid of unloaded debug message
  
  Stylistic cleanups from upstream.
  
  * netlink: do not stuff index into nla type
  
  It's not used for anything, and LKML doesn't like the type being used as an
  index value. Technically this changes UAPI, but in practice nobody used this,
  and if they did use it for anything, that thing was probably broken anyway.
  
  * allowedips: swap endianness early on
  
  Otherwise if gcc's optimizer is able to look far in but not overly far
  in, we wind up with "warning: 'key' may be used uninitialized in this
  function [-Wmaybe-uninitialized]".
  
  * tools: use libc's endianness macro if no compiler macro
  * tools: compile on gnu99
  
  This lets us be compiled with ancient gcc.
  
  * tools: don't fail if a netlink interface dump is inconsistent
  
  Netlink returns NLM_F_DUMP_INTR if the set of all tunnels changed
  during the dump. That's unfortunate, but is pretty common on busy
  systems that are adding and removing tunnels all the time. Rather
  than retrying, potentially indefinitely, we just work with the
  partial results.
  
  
  * tools: wg-quick: wait for interface to disappear on freebsd
  
  This should improve init scripts that restart tunnels using wg-quick.

This snapshot contains commits from: Jason A. Donenfeld, Davide Garberi, and 
Arnd Bergmann.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181018.tar.xz
  SHA2-256: af05824211b27cbeeea2b8d6b76be29552c0d80bfe716471215e4e43d259e327
  BLAKE2b-256: b4cf187d3448e577d8c47f114156ebc2ad183d058fa64f0ef9e431095237669f

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181018.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlvH1csQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drr4BD/4/ich9CAiiiNszyTkF1LrMzUgzU7KjtWSm
s/Q8udkHp0dcx4PZl5EFFoZ75PlunCCjIK2i7J/Mjs+yxh+1VjZoA0Yo2rHa0QPe
oqb1BA3vC3j9S8aKRlXgsZnIhm6mpbCdUxY/gx691DUlXFgS4KdjJDdgkg1f7JhK
95X7VZBGgtfyA+ZpJWxbJ+hKoogD11zRR1EO+er9tQFKhnxU7uD6cwMog8Ge/WGh
k0ZxuFbSm++WX+D2zYXig8Kz76Bb12ejdIMeG9nxKzLloLxesJ26OkAAs1UfDw3P
6ti1W10anglBMWF8s3Sf8a5z404D2SwR47f3Iq018Q1BbckGKJrq0mdPZlAdbx3d
XRnmDkb6jrLFZwDRJpYhRRT9Zl6xNCzSMgo7EaYuCfTWJVjQ050a/2FGy6AHUxPx
jc/71/YPDEjAGHk46uG0pwVejxfCms5n9w1cW+/hoVEorb2QQzBPOMLmsFgyyqd2
TLbSGrgm++8pRnjyMFTQ8sKSg+z0SDOaidSeBH+bip5wMFUbUVWUXlnJSRg2X7/7
phrwVjvmyZbfWOep7/xF1blhkVBvjFd8rIZ36aK7hmif/AQpORQBd9f4GySmPO/Y
8lkhkI9fYhgnihNpZQ+bm886HxXJKem+NsQtYAqcUsJgp0cFveBNLY9TH46uYI89
0vjf2a+Mjw==
=LN/J
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
