Return-Path: <SRS0=zB+C=YF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA513C4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 12 Oct 2019 15:04:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E082206CD
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 12 Oct 2019 15:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mI3riJae"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E082206CD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0329bdb9;
	Sat, 12 Oct 2019 15:04:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2a4493d
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Oct 2019 15:04:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6cb46b5
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Oct 2019 15:04:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f6d03a2
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Oct 2019 14:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=alJPNOoyGkTcWX6iA
 4pmhZtTd8U=; b=mI3riJaeyatVd846CpLVlILztd0gvxqKJVnN7TNJSy1LHwZ9L
 7BTdP6YFFuo0VYGa8h4aiz9HBFWaSDbmABErBGTFVKdo+BoD73pbBKyXryCJ1MyV
 VEdp946m6muOwrjY7ZRrizXMcMx13K4+S9H1ilawxour8b/wediFEmxM6ZalocyT
 OCde05HLcwaWyLJDdGNNn6a1Gv6eCNE3S/l15L/Z6s5TT31jkpeyspqdinkoByCV
 JoLV8jesamAMKrsdPBfZzdQrtGUnOmaHce3Y/fB7H0PVOn4TfIrl+u2kcLtPXJfH
 CyZObYcpBWwKrUeafv87gxeVh0wuw3EeStUOg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 21018572
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Oct 2019 14:16:55 +0000 (UTC)
Date: Sat, 12 Oct 2019 17:04:49 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20191012` Available
MIME-Version: 1.0
Message-Id: <fa44965fdbb56e19@frisell.zx2c4.com>
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

A new snapshot, `0.0.20191012`, has been tagged in the git repository.

Please note that this snapshot is a snapshot rather than a final
release that is considered secure and bug-free. WireGuard is generally
thought to be fairly stable, and most likely will not crash your
computer (though it may).  However, as this is a snapshot, it comes
with no guarantees; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * qemu: bump default version
  * netns: add test for failing 5.3 FIB changes
  
  Kernels 5.3.0 - 5.3.3 crash (and are probably exploitable) via this one liner:
  
  unshare -rUn sh -c 'ip link add dummy1 type dummy && ip link set dummy1 up && ip -6 route add default dev dummy1 && ip -6 rule add table main suppress_prefixlength 0 && ping -f 1234::1'
  
  We fixed this upstream here:
  
  https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit/?id=ca7a03c4175366a92cee0ccc4fec0038c3266e26
  
  This is relevant to WireGuard because a very similar sequence of commands is
  used by wg-quick(8).
  
  So, we've now added some tests to catch this code path in the future. While
  the bug here was a random old use-after-free, the test checks the general
  policy routing setup used by wg-quick(8), so that we make sure this continues
  to work with future kernels.
  
  * noise: recompare stamps after taking write lock
  
  We now recompare counters while holding a write lock.
  
  * netlink: allow preventing creation of new peers when updating
  
  This is a small enhancement for wg-dynamic, so that we can update peers
  without readding them if they've already been removed.
  
  * wg-quick: android: use Binder for setting DNS on Android 10
  
  wg-quick(8) for Android now supports Android 10 (Q). We'll be releasing a new
  version of the app for this later today.

This snapshot contains commits from: Jason A. Donenfeld and Nicolas Douma.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191012.tar.xz
  SHA2-256: 93573193c9c1c22fde31eb1729ad428ca39da77a603a3d81561a9816ccecfa8e
  BLAKE2b-256: d7979c453201b9fb6b1ad12092515b27ea6899397637a34f46e74b52b36ddf56

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191012.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl2h64gQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drhw1D/9dQzRVt647BccXpBTJuCQhBB8jrW6XTk0S
1es84sx491kLZFNPv+ykT1lv/sWGoB9IKHXMxQFWutwpk3HmqAt8HgUPbfB7eM/L
QxMGNe8beiXhTrtx3g2ZLduvi0mHC2JEqUu3+1UzqLtfsgq75wWzy1FicVQKgcy7
cAFBbPPz7O3L4QXN1tj3OnBjj8wBUqRrriwkjdCd+gwiktJ2DfUPDX/39wb/qpJx
hA7A2XnJV9td0Y4fHZnAoHZ3MRWryUGN/EMIL5Cy/JnuppY9bNibTGWB5dUiUjYt
ANRRdNvst/LZrVgaocWjMh51O9S7a/Z1OP6Ewts48M0gxja2pIFgT4nzS8hzwQRE
okxAsMoEAzVRp+O3Hra/ZRswzjNI1iOQAfDtFbq8upD6W3COx479gQySzD6l7cdY
M06gmtZVrfey7s5K4fFw5axKv/l2AwSrCSpxiMFYked72vsFSlzvF2Gr8YCtyQSh
cliiptR+KBqExcvYo7x/R2vfVA5yR4+vaDgCWYb44gUIZIYcHvyi1MG/SgeFa8VO
amTaqngGsdxK6eBxlpzdW9XKFro39GYKiWIrMIdjBFZOSR+h06OVhmtpe538vOjk
Zqh64lpiCRWHrS0dd/mR3+FX0l4Jyy1V3STt8vuvvjECtFFWMovGoHXscQY1jAx/
XdPy0w2vUQ==
=hiCl
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
