Return-Path: <SRS0=PPOQ=IV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320EAC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Mar 2021 19:08:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29CB561574
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Mar 2021 19:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29CB561574
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1fb7e56f;
	Tue, 23 Mar 2021 19:08:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f303876d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Mar 2021 19:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616526195;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=eYvYqEjWtJw3Qxul5gtzoZ2sCAKNDYhDorH6bA0gvqM=;
 b=jSwFpKTflct6rjo09quzwLQU9hoLUAQSIjEh6fUzUXIrLj2Qvgc4ONpb2rQQap7wm59pUj
 MXYNwHzAUwUOPBXcSG0ZErk8Am2rSLUdBXpRgKY2HXuDLQCzqMQXQqcQuBOrxsn/p9lKEF
 jBKmmPQiBcUXKEXeJ5o9zkQy9ouRgGg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4db02542
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Mar 2021 19:03:15 +0000 (UTC)
Date: Tue, 23 Mar 2021 13:03:14 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20210323 is available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Tue, 23 Mar 2021 19:08:27 +0000
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
Message-ID: <8d900485dd7e3ce1@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

An experimental snapshot, v0.0.20210323, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  * if_wg: do not check for null M_NOWAIT return
  * compat: backport callout_func_t to 12.1
  * wg_noise: ensure non-zero'd handshakes have a valid local index
  * if_wg: fix decryption failures on jumbo ingress
  
  Numerous correctness fixes.
  
  * if_wg: implement selection of FIB (routing table) for tunneled packets
  
  It's now possible to run `ifconfig wg0 tunnelfib 7` or the like.
  
  * if_wg: drop pointtopoint flag
  * if_wg: disable llv6
  
  Set better flags for the interface to reflect how its routing actually works.
  Note that this will need a patch to wg-quick(8), since we're leaving
  point-to-point mode. A new release of wireguard-go will be made to with the
  same change.

This snapshot contains commits from: Jason A. Donenfeld, Matt Dunwoodie, and 
Frank Behrens.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20210323.tar.xz
  SHA2-256: 9e37f330cea71974d9ac0a7f177d7c4d3252faaee574eb896ff553c55790f46d

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmBaO1YQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrgwkEAC6yIjz759hctDkwnrpEaKXrYUNCSV7hjcN
1jIP6AtnV4cgDVQ0v2yvMtkWhqovdGlFK/2Db+3zeEc9cKRarvCPBfQ1TDTKb899
NkyNVuxgXduCha3wVJyWLQGO3ry5i0765H6Wxyo52Jjb8aBWqh8VRauF+hfljbfg
BfiuLMMXXmPyhnuzlAc2p3G9SMV6NDMeGGs5ipjKk3fqBzIe4qvjVWA3Y41P4rjJ
89rXKWUrcRMgnb3/UOS/43+Q7b/9EeLfMZgHN4OUqpRcr9rJA5IED+JotcydpL5p
ar6mcurltQFL8NzE0b8AXcO8x0fB6CYUCWJDISK2neXCsonltcnGmTuZAYA7HzL1
NqA5b5/7pTqNIym/gzdummYDqwTSjtTm4/EOdac1k0z9nAoo7kDtatZTD0d6a7sP
jbM27DdwtEgIDp5aIaxkplI0x+5QRqfg/A+PjjSvRG6V8o/NpQWO2kJfu5Pcm4Ll
mJ5c2qLFj0XCVSIWwnM7oQscolVk5VYKbtXIG5ZtBDPGCwuSuG4OPM4U1s/5hAwX
1DweYZvavjOxEOimvNS2FkVRUXII50r07SbrgAqoxIgTA7iNQ9IJ6aiqC9mbf+YD
PZQbpFx8uGZUZDKHhkF9C6PROaYDgAqG6rPE01kWnWotTd8gjoVwGAGy3n0nn+Ph
NV5wf4cIJw==
=Hpzo
-----END PGP SIGNATURE-----
