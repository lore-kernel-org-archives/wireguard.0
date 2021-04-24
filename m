Return-Path: <SRS0=FJfC=JV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07430C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 24 Apr 2021 20:45:39 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 024E061176
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 24 Apr 2021 20:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 024E061176
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11d19f11;
	Sat, 24 Apr 2021 20:44:30 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d1a9e3d1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Apr 2021 20:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1619297064;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=QHg5n+20zzffT6OJf1Tcvbrhwk7YZHrqnD9WMq6acUk=;
 b=DylOwb7By6EiKP/y4dptlq9q3S/gtoaru0zxjSYx0fdz6xuz9SB4t35pZuUnpX/wxXBopn
 hZVZc5qqIpKfqEuz2YqWDAfe9uBp1gm6Lu/Up52LsRlxbV0fNwJkMjBsBS+6gOpzbqN7pC
 m8ObpCPjQGtZY82Jbangs3cbFTHDnOc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d9c873a4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Apr 2021 20:44:23 +0000 (UTC)
Date: Sat, 24 Apr 2021 16:44:22 -0400
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20210424 released 
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
Message-ID: <8ee718aff5086347@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20210424, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * wg-quick: freebsd: check for socket using -S, not -f
  * wg-quick: freebsd: do not assume point-to-point interface flag
  * wg-quick: freebsd: use ifconfig for determining if interface is up
  * wg-quick: kill route monitor when loop terminates
  
  These three fixes affect FreeBSD, OpenBSD, and Darwin, and are little cleanups
  around wg-quick.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20210424.tar.xz
  SHA2-256: 

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20210424.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmCEgyEQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrtGEEADJzVkTM19/miDZ3G89FpxtZU5/g+d9F47o
8gJSns642FJS0cC6HllqlYLL7bxgvBkXRVPkmnDGoDrqgrJWB+bnOKFOdtfKXv1f
Ar7QREL+2ZLfCw9NgkFWwBS3NxxCFbyHm8AjK1vAAcjISRpH3GJDzjspuzmfKqzs
bvyQ8U05Tkbvc0J6lLd3A4ei1q+JxJXTgoneWviVNEuDn5Jj8/oEqoRAJbN8d8pq
pB5C7DgbfNnPiX/2bnw+frskUgwU043n7fYHr41mCUTdKTst26DrPEOgR0ebiKU2
XGlBgHziJJoeciealqXRhPb+DFKj1FvfEozvcuYQbAPUvs1qX44gWDVcUBEXX5TJ
GAh1vVSebLuwM17J4J5zVw66pKjTnZaNIJRPA8qdaHB1/uB/ZZNnYl6DPd+OaJTN
170/HaId2iGtROGljOnojGeu/CMx+VEwv+L1WDfr9ubgd1p+N7m3YpJgsP6JutyX
b9Ff3mbERy3aKmH37CYFeQS3TG8e5pHfMJR2QwV2M1PWK0BleWE1vHk9MdImy4u8
rghju4MBEb16xdJbJcqillKG/F0j/AQdlbVbwItO57iwfT07V6NNuElpaUizwcps
obfYjqLFQ0wt0nEWTB5OxON2+E4c0YgbcZrDJFMmoYxXwlD27K8IjJM4E0zzg0vA
a6IU8oxLqg==
=36NL
-----END PGP SIGNATURE-----
