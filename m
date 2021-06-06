Return-Path: <SRS0=ObIi=LA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A2DC47096
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 09:37:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 922DD613EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 09:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 922DD613EF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cee9f7e;
	Sun, 6 Jun 2021 09:37:00 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 79ba5b5f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 09:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1622972215;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=lA1QNPbFTeWxwWkzRJsF2ccDeSd9hRTuL0L/uiQq4EU=;
 b=GrP6AIxHcgf8hvNumf2aQrbhNbuzvCfrRK1K3mIMyImYVXpO6YG6r986bokNomIl4AI1J9
 7Rk670YaZoyRix0wXjHChibi8Sq/sMacUI4U1B4ZwqT6OxEA0rEkexbXYRS0xsqh6IklUs
 phrnDrywdxMeOBLEbuqtazQl/Vdl5BU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e94f165a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 09:36:55 +0000 (UTC)
Date: Sun, 06 Jun 2021 11:36:53 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20210606 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
Message-ID: <1649a9a43f0f2206@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20210606, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * netns: make sure rp_filter is disabled on vethc
  * kbuild: do not use -O3
  * global: use synchronize_net rather than synchronize_rcu
  * peer: allocate in kmem_cache
  * allowedips: initialize list head in selftest
  * allowedips: remove nodes in O(1)
  * allowedips: allocate nodes in kmem_cache
  * allowedips: free empty intermediate nodes when removing single node
  * allowedips: add missing __rcu annotation to satisfy sparse
  * qemu: increase default dmesg log size
  
  These are from the 5.13 pull request:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6fd815bb1ecc5d3cd99a31e0393fba0be517ed04
  
  * qemu: add disgusting hacks for RHEL 8
  
  Red Hat's latest kernel no longer compiles correctly, so we have to add all
  sorts of hacks to fix it. I sent them some patches 6 months ago but they never
  picked them up.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20210606.tar.xz
  SHA2-256: 3f5d990006e6eabfd692d925ec314fff2c5ee7dcdb869a6510d579acfdd84ec0

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20210606.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmC8lxsQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrmCUD/oCNMLbpF21NhWXh8gAlfiN2jwoRblm5Ibq
mO1VTLlBLf7Cr7PufHJ5sEWfTeqMoLIDx8XWXZdbgUwfMhPDHcNXITH1n7RQmBQt
A8b2jWUBBqqZipsEL+Sq/EBpMrVtfwNUM1mcuLsQ1j2ol2Mm6vmn42fTVjz4hvD9
NPWlLzHsnwt6q7t4/HiODWtJATXNMP+CxF7GPF5rSLL+zOAFkFSRoMupO0qTUCIi
pCjQoTYD5d5GD/5xVc12uaElYN9AJq7q7J78yAtvZ/BCubHQ80MYwXA5vwQ65sQI
dVLZ1vWPU3r4xe2xLewsvvCq318ojO54Zwn9yld0ZDpAJtgcDA0lb13iWjTh8x9o
Z7IcqUAT66tpZe1FA1YY00T2+SpqQoCNBhiMpUe8dd7Aqy//1N8y64WdGIPF9SGH
+7Eb1X2aaXebacksLbKcfkZbuXwtdExKMpY/ppHceMz3UoacEehf7F1azZmNfo+S
l+Fs6v7fduPpSOetz97HoPsgunjpffs8EfV2XuwBe8dqRXlLs97CHCjGR1ct5jua
ZOAkOh8UErsSGJc+imEQmRysXsqxIcTACAvCnijZ38d65/Tw0twouSW1EMl8yu8i
rG9GVwvwuK+8Aq9me8nXyd3Ik7pUyKtKs2Hs51/ruJQLfgYPt6lqz8k+boEl2rNn
F/yp2xPdtQ==
=JJZr
-----END PGP SIGNATURE-----
