Return-Path: <SRS0=LfNZ=6Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_RANDY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC23C47255
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 04:28:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC76D207FF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 04:28:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="we/0HAbd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC76D207FF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 203d4dc3;
	Mon, 11 May 2020 04:15:13 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ddddad15
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 04:15:10 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcae3b12
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 04:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=mn7BSobDIuX3EirxJ
 XfrOOPbKB4=; b=we/0HAbdRzeQrt12sp8CRjl/ZysX2nTkUnPPDzWt8fZsooooG
 O1/p5F3l1XsPH3t28vZAH82CTOAlpxdRP5ZLDVhAD7KSpn+4g9Sti+3klYQy6l4+
 D0HhEVffhHcVETNYYVZdB2fRr0XQgDyVFDBrvD3+2IiSTOmbZd6xJa8smVWgffgw
 Qi85jpFFdZm9RlkPxjBkwPXqw7q78p0482uoybdWGe2IxsMWB+Zy970/OiiexTtx
 xJqkaWHG9DeosD7Mv1V7sYLBaU00gyx83WfIUOPjLmW9jiaF6EXitf7GzsYBpmWQ
 CLiSn6t6+M0necwQMdchvof5QPHsNerY9SY5A==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 86077064
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 04:15:10 +0000 (UTC)
Date: Sun, 10 May 2020 22:28:25 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20200510 released 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <5f287badbb95231b@mail.zx2c4.com>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20200510, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * ipc: add support for openbsd kernel implementation
  * ipc: cleanup openbsd support
  * wg-quick: add support for openbsd kernel implementation
  * wg-quick: cleanup openbsd support
  
  Very exciting! wg(8) and wg-quick(8) now support the kernel implementation for
  OpenBSD. OpenBSD is the second kernel, after Linux, to receive full fledged
  and supported WireGuard kernel support. We'll probably send our patch set up
  to the list during this next week. `ifconfig wg0 create` to make an interface,
  and `wg ...` like usual to configure WireGuard aspects of it, like usual.
  
  * wg-quick: support dns search domains
  
  If DNS= has a non-IP in it, it is now treated as a search domain in
  resolv.conf.  This new feature will be rolling out across our various GUI
  clients in the next week or so.
  
  * Makefile: simplify silent cleaning
  * ipc: remove extra space
  * git: add gitattributes so tarball doesn't have gitignore files
  * terminal: specialize color_mode to stdout only
  
  Small cleanups.
  
  * highlighter: insist on 256-bit keys, not 257-bit or 258-bit
  
  The highlighter's key checker is now stricter with base64 validation.
  
  * wg-quick: android: support application whitelist
  
  Android users can now have an application whitelist instead of application
  blacklist.
  
  * systemd: add wg-quick.target
  
  This enables all wg-quick@.services to be restarted or managed as a unit via
  wg-quick.target.

This release contains commits from: Jason A. Donenfeld, Matt Dunwoodie, and 
Martin Hauke.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200510.tar.xz
  SHA2-256: cd526c7ea177e59ae4c0ebc4f3cc360b8524881b090d043426bdf7e3c85ac8e7

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200510.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl641EsQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrvZRD/sELKd5m3m1zl53wDK1PBvEYyRs9c1M/BZt
z4XlNPBInbhakwA9pFXL/xzL/TWq1s02JUC0qcAthZgnBU/ugO13VK2xRhRLCmZC
m1uci/Qa4Z1t/hWxqGB5CgkZ3hDs2Wml00cT933I3R/bHAXCi7GOr5t6+bqSpZ8U
V33C4mEDvDxmzqZwMI93fRY4IxZVhKh0M6aZopHn+otdciggsHAe1eLCBAqzZmuF
jy1lQxhjFiR09bUd+rbwtes4DRHLqEZ5nsR6pvR7uEhPzaJlizjy9y7QM6e2NyRQ
WiB34yCez10eIHNiVS3Zxmh2ddDvsT8iZpwt4JmqOF5Gzmvh8r52g5vUSNWFiulX
emcZD2pgTslYCXCdhnyEEHYANrQ5qGA/VTUzAWXkWEkqEOAHdhdFlltCb5ZlXynh
i/hOVGibpSK+pAh+sGpkqlb9CrqvxiaPgS0voD0aF0FP9ev0RWIeaYf6owUWznP+
aPExOwrzQ6/8oO8Vygbs5vkhVyh6quu9YJFeECZ/u2Ov6EACjoymppcqzY2RoJkR
ngDc/nNZuPolDxsKzS+cb9oVsaSPbfEoMc3dRcGelYnkWVwp2ZY9DsNVrjvxqUgp
oZW4D5lIAGTeSQYJ+Vc2inhWVvLR6EnZkCE+xrL7RPwMBZk+Fo5lsiOOKAm83U0s
TdNKeMFlMQ==
=gwNR
-----END PGP SIGNATURE-----
