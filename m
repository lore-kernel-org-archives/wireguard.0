Return-Path: <SRS0=vG4s=HV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22365C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Feb 2021 14:14:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3321464E67
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Feb 2021 14:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3321464E67
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55f0d76e;
	Fri, 19 Feb 2021 14:14:53 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 51f3668d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Feb 2021 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1613744088;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=qaHK3Ex85ARERJELBg5R4l2MXA51xHG0GB5DFaE6I3Y=;
 b=PdKjbADHthTUWOgf5Xe73MYUGDgZompKypHiNkD44/XQVqSujf4U7XmPQV1xAf0p6FB0zA
 +b4A8EGBaBGCe8RqTxPetGB7i7UdD9pVf1sAUlWgVrLsOivxpZZVQTgj340zuzta2LpWvt
 mJfcRvvDT6aboV93FClxcLuZXrU+IqI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 564a2a48
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Feb 2021 14:14:47 +0000 (UTC)
Date: Fri, 19 Feb 2021 15:14:45 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20210219 released
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
Message-ID: <5b82970bf3f56fa5@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20210219, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * compat: remove unused version.h headers
  * compat: redefine version constants for sublevel>=256
  * compat: skb_mark_not_on_list will be backported to Ubuntu 18.04
  * compat: zero out skb->cb before icmp
  
  Various compat fixes, most notable of which is that the 4.9.256 and 4.4.256
  kernels no longer cause integer wraparound problems. For more info:
  https://lwn.net/Articles/845120/ https://lwn.net/Articles/845207/
  
  * selftests: test multiple parallel streams
  * qemu: bump default kernel version
  
  Usual test harness improvements.
  
  * peer: put frequently used members above cache lines
  * device: do not generate ICMP for non-IP packets
  * queueing: get rid of per-peer ring buffers
  
  Most notable here is the queueing commit. Having two ring buffers per-peer
  means that every peer resulted in two massive ring allocations. On an 8-core
  x86_64 machine, this commit reduces the per-peer allocation from 18,688 bytes
  to 1,856 bytes, which is an 90% reduction. With some single-machine
  deployments approaching 500,000 peers, we're talking about a reduction from 7
  gigs of memory down to 700 megs of memory.

This release contains commits from: Jason A. Donenfeld and Thadeu Lima de 
Souza Cascardo.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20210219.tar.xz
  SHA2-256: 99d35296b8d847a0d4db97a4dda96b464311a6354e75fe0bef6e7c4578690f00

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20210219.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmAvx8IQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrplOD/9DhOh9/IcW0HtQ1dpY3oiCQQwoSfZNwBsy
84xOTMDs3+/OcTklLJabyryMOMbzOtR9sj0Dlp32PNsIxPEpCrmi4QfjmAT77SnS
+Om4QsQhlzxAAuEdA0ZVlbHdV9+9Lxa1ajn1yHnz0oC2iDWIrMjvascggBBcexX4
9qmJV/bsEjVlI3LYS7WrISeFW9MhEMt1eDkUgGV32UlLDMkHNvexg/fRFaEl5bJL
u95mmY28nqv4MgtP0m5RRcQgWlgp/W3fYBp+ThRvm2rMPV1EjH1ZHphZ9imH7ZUt
w+aXiQHbIzlV0jUKWIVGISsHqT1rHXGhTH0fxQSl8oaa3jNBPj/RDWU1uxGfMJDP
OY5DP5x9RkEjmv6KfZS3aIz2OXgDHOVa/2M9HTo+ye5SLSr0Og374LXAHVvHR+xK
yjkLi5yturusltjbo3iK/0LzUZ6QZt3gc6fzid0ljlg1+QJW332qQCtZAEmeSKzt
xVf8iAapl5ezwN6NZNxTSxuzlVDl0f1c9sgjAjGbVAphziQvrmK9n4Iz52oOyNre
bLe5Al/tUBysnT6yKglODJhr7jrhtOEoaoU5ROEcPswT6QmBUOW2EAMVoQ+AYyp9
vMGQ97Jvew1sNBYmfAUrO1l/Azpfi0Mj3nFtyOGx/mgVPkGqhntWpFol0aImaEPc
7SReRurgMA==
=wGOc
-----END PGP SIGNATURE-----
