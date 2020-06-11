Return-Path: <SRS0=aF/C=7Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_RANDY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9964C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Jun 2020 08:22:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 316682072F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Jun 2020 08:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="2MskhfCY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 316682072F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73c29958;
	Thu, 11 Jun 2020 08:05:24 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c71357a2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jun 2020 08:05:18 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8577bf25
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jun 2020 08:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=8pnNlkV5uSSsqFJRx
 bAIBul9oFA=; b=2MskhfCYSyxwztQ9BNhKK9O65v8u1V+JU21X5khPIGXU4Tu5j
 GHHDVTMrABTQgFXPklY+/NHZAaHOY7DAcMuzCcogfdjWPGdfWjrp7xackHryP66g
 2ccJT73c+u1XTLyfT4ON5FX2FmZau7QlxMPQhyOcmYN7eywzxGIVLJ9fQl74vGNV
 DSSKN9iWkSp3Cfbb10/P4EIiU7KdBE5tQc/0TSkxDH5FTFYpYjxGWvL8wLTf21/z
 FuffJUc0w+eBBV8HIMWHPKYIK/Sx7zm4sgr5lwHJdnhwyGB268GL1ywSzuxxxvux
 C8XjwGygvmSxG18EjlA9V3eqLpwF5x/1Aad4A==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d3c5bc7d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jun 2020 08:05:18 +0000 (UTC)
Date: Thu, 11 Jun 2020 02:22:34 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20200611 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <6cd5b6c37cbc9844@mail.zx2c4.com>
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

A new version, v1.0.20200611, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * qemu: always use cbuild gcc rather than system gcc
  * qemu: remove -Werror in order to build ancient kernels better
  * qemu: patch kernels that rely on ancient make
  * qemu: force 2MB pages for binutils 2.31
  * qemu: use cbuild gcc for avx512 exclusion
  * qemu: add extra fill in idt handler for newer binutils
  * qemu: support fetching kernels for arbitrary URLs
  * qemu: patch in UTS_UBUNTU_RELEASE_ABI for Ubuntu detection
  * qemu: work around broken centos8 kernel
  * qemu: mark per_cpu_load_addr as static for gcc-10
  
  Our qemu test suite can now handle more kernels and more compilers. Scroll
  down to the bottom of https://www.wireguard.com/build-status/ to see the
  expanded array of kernels we now test against, including some distro kernels.
  
  * compat: widen breadth of integer constants
  * compat: widen breadth of memzero_explicit backport
  * compat: backport skb_scrub_packet to 3.11
  * compat: widen breadth of prandom_u32_max backport
  * compat: narrow the breadth of iptunnel_xmit backport
  * compat: backport iptunnel_xmit to 3.11
  
  With the expanded qemu test suite, it was possible to expand our list of
  mainline kernels, so the backport compat layer is now more precise.
  
  * compat: ubuntu appears to have backported ipv6_dst_lookup_flow
  * compat: bionic-hwe-5.0/disco kernel backported skb_reset_redirect and ipv6 flow
  
  Ubuntu kernels changed recently, so this ensures we can compile with the
  latest Ubuntu releases.
  
  * compat: remove stale suse support
  
  WireGuard is now part of SUSE 15.2, and the older series is no longer
  supported by SUSE. This means we only need to support SUSE 15.1.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200611.tar.xz
  SHA2-256: 9b0478c3b1f3a7b488916e632e2fcbb1383bb1a2ef294489858ce2ba1da3246d

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200611.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl7h6bgQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drpn4EACsG/Ylm9pnLWHPaZj7ztJFJ9i0H7OS3vis
cF0s3+cEm+L/nHW3wTRYRq4S2FSd4MRt2lMUvzoMNtj4AiW6YMgjTcjCiShfiXIX
QKAekPepwAo4HtwXO/WZoD28Cp1FP0Wxvx4AOVeMQ2BFcv5wTeinuM4NSN9AgDpi
iMgY1hR2WEEVflmbRC1TA1b2C7GmeS5oFgzaUDCGq4NqDnd9hRTUg7KmSmq6CN9g
8YPRo2IX8rqaIgBJKSLjwyBw9b12hmIytYC5TftSYnRHgk8kIEWFaHZKBR4mkOtQ
GxLkoARgF5O3XNb1uIgrGLpJawud3S4sa0Q9zQZXK2xG9uSNaiLXtjj9IFDyETFt
qwH1y6DSSd3Pr5+xgA06gYqNuwOtKCR7o/IlwTjgimuWy2zHG+6GXjnrOFNKODff
ERG7nEjSvrOkpJlpiDj5AKM7A4Znsg0ES1LcNM856Fj/R1TjEHQG/l0689kj8i4t
oSJ1zdLjMkN4YIAbepCiRxg5yH+ZBPbnceF6hqYWJ/7XBesKfNzNrH3jt+WYQ+HU
EdHBRv80HSliFgLn2Mkx7jFJDzGf/78wpssSRw6o31CxLRG7X1XTzkJO3Jj1JfXZ
GErrY2XabGcHu5xQL1rkYq5hcLaJBdFirIgKGf934klc3Qxg71Mdw2rKejlZY3/h
m9h+0ZmErg==
=aGAy
-----END PGP SIGNATURE-----
