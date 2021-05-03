Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8BEC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 08:01:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04339610C9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 08:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04339610C9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc207632;
	Mon, 3 May 2021 08:01:13 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f828996d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 08:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620028867;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=iX9KDsxvwBpT/r2Fyp00TUCi9HOZugm4g7BK8+xxek0=;
 b=cRv71IbB3sI3nr174U6vfuVy40sE8jd5f6psdAbVnxsFU/JKi+kGPP4MU7UO40DNVQENib
 gRnkl2918/WAeiSIBDdQw7QXZM343vTTfQ2/OgwzLg1zXfeD7LH4MEuUWV+n6wjkk/SFTD
 Ier4/fdNTbhxUZK1aiWUnE4Aw/tDoOg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 55e46b7e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 08:01:07 +0000 (UTC)
Date: Mon, 03 May 2021 10:01:04 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20210502 is available
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
Message-ID: <8eea14e403acaa00@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

An experimental snapshot, v0.0.20210502, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  * if_wg: defragment mbufs early on
  * if_wg: ensure packet is not shared before writing
  
  These should improve performance and make sure everything works with functions
  like sendfile(2).
  
  * if_wg: return to m temporary variable style
  * if_wg: pad packets properly
  * if_wg: don't memcpy data for no reason
  * if_wg: don't double increment error counter
  * wg_cookie: zero before init in selftest for witness
  * wg_noise: cleanup counter algorithm
  
  Various small correctness fixes.

This snapshot contains commits from: Jason A. Donenfeld.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20210502.tar.xz
  SHA2-256: cd59a0a711308083e40ac5e7e26abc63c8b1f4615a9d66f73f2398388b8e7b9b

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmCPrbAQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DroPhEADWbUA86iVDtnAdXgVLuaZfc+5gXYJQv8GV
EzOECSES5iG4PAVXqZHjeTcY+mj5HxTRmNUz00ci1eVeZISFojr41084dm8/pv6y
Er5LFxHXLDJRIT6o2ODadE1pxKE7ada/PgicLlUgX9gYg5VPGqoYAKrnrEBBOnmF
/9PRSsHYTGdw7kPXBfOZDafjJfrnYe/NXg7QCjwl/Fi1T3+omtbCSsxIs11XGuzf
3EjXoEVgGRRRtY0ibvO13tqEb1Q8KUVe4SHFIe2Hbbc/X9ZI6RKADzIqaqTMsxHa
sV2jTh4XpOZcy9tf2yi0M/r6pwO+GJ/DqqKqWeWLapHInQS/TIPmj0P0fpQ8aNtz
nr0Z++DQXJxnVuiT226mpcAI8z6YMw5JNO/mGUhnNney7lz9vQA8i6MGBwZlC4po
trP/QxtBgwT/zPy6lb7Bhgtl3M5OnuHzFB9nsSKfsfilsWqAmX4lbdJ6DfJ0hLtZ
1WNH7uWt623HpL3KmFgA9ACdpZGh5zBqF8E7pHl7F+XVWT4BSIrUdEb4vEPVi4PV
VeQUPmob5lbhghvEOi8F+uzflflOMdO5Z0W0iVqIST1AZywnrKqBRId5l6+sGXCf
ZxuMLlv/KM+3nF7Xol9iEuksg4NnPr+QVxrn1chDcUkDb8nZDtVxDLd627ojQBZD
miKJ6+4Z/g==
=rFq4
-----END PGP SIGNATURE-----
