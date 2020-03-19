Return-Path: <SRS0=ccJ7=5E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72EFC4332B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Mar 2020 05:23:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3E320409
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Mar 2020 05:23:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QxsPPKAb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D3E320409
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d7eb70b;
	Thu, 19 Mar 2020 05:16:50 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 128f6678
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Mar 2020 05:16:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60ba7a72
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Mar 2020 05:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=lD84bsrZFpA3dXCOV
 LhFeX3Li/M=; b=QxsPPKAb4RzLRP338vRYqBltr2vM6vLYL88qgwlvCu45gbQZ5
 w0UM+wZbPlGYkljHRXsLfPAS6PpNiOM+YeuU9FvUhiz5QhYSwxr0VS1bR2aPNvJG
 i1G3ovxJJ/PILoomvcV+EETbHXPLRkYIXtBdwwG8mGMgyDKPUm0Cn9u1y63L8q4s
 JE2B2nxHOGjiANuPIEoLsemYOgdAGp1zmBld5GxUZ2urHiflWsF5JuBJ/A3ZR7tQ
 rmEGqtnFJUNhgEC3a/2rn9ckni5sebHUrbKQ705lCHLsEg2WfFNzQDUuUaqHiFZW
 VUaGPP8DhJrbi+gq7A6nQGlXzEwvPyF7LN/aw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5c07d913
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Mar 2020 05:16:47 +0000 (UTC)
Date: Wed, 18 Mar 2020 23:23:12 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v0.0.20200318 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <3882ea40964a09cf@frisell.zx2c4.com>
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

A new version, v0.0.20200318, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

Please note that until Linux 5.6 is released, this snapshot is a
snapshot rather than a secure final release.

== Changes ==

  WireGuard had a brief professional security audit. The auditors didn't find
  any vulnerabilities, but they did suggest one defense-in-depth suggestion to
  protect against potential API misuse down the road, mentioned below. This
  compat snapshot corresponds with the patches I just pushed to Dave for
  5.6-rc7.
  
  * compat: RHEL 7 backported skb_ensure_writable()
  * compat: RHEL 8.2 backported ipv6_dst_lookup_flow
  
  Usual set of fixes for the RHEL kernels.
  
  * curve25519-x86_64: avoid use of r12
  
  This buys us 100 extra cycles, which isn't much, but it winds up being even
  faster on PaX kernels, which use r12 as a RAP register.
  
  * wireguard: queueing: account for skb->protocol==0
  
  This is the defense-in-depth change. We deal with skb->protocol==0 just fine,
  but the advice to deal explicitly with it seems like a good idea.
  
  * receive: remove dead code from default packet type case
  
  A default case of a particular switch statement should never be hit, so
  instead of printing a pretty debug message there, we full-on WARN(), so that
  we get bug reports.
  
  * noise: error out precomputed DH during handshake rather than config
  
  All peer keys will now be addable, even if they're low order. However, no
  handshake messages will be produced successfully. This is a more consistent
  behavior with other low order keys, where the handshake just won't complete if
  they're being used anywhere.
  
  * send: use normaler alignment formula from upstream
  
  We're trying to keep a minimal delta with upstream for the compat backport.

This release contains commits from: Jason A. Donenfeld and Luis Ressel.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200318.tar.xz
  SHA2-256: fa74a8627f731754fbf4ea7d6ae8f571a2cfe8cd4b744a5f165065619cb836a1

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200318.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl5zAa8QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrrYxEACi9sfH52BtJgCjyF+dTpM4fj/JsxTdS76K
3dE7YP4ML2UW3yGDwSRryeyW2LZnv7c9y0utSnjObp69uTTA0AvN70b1qjveFURk
bvI19FtuK5S8OrzPdlU+o3OVg3T+/7+LrVnJnI65NUddMZVwgBPFQJXEsmgymlZW
ULJO0D28S0K7dZAoKD8noAwqaMEKNE0R/e+QmP4F0JvaVWxNZFN6b5lj6HcRqqq8
zwOje/OBVTJqiiXPwUJrWn6t1ecDSgzHMdmUGV3znWHdfAxbRQpgZUdsGT0CPrOZ
+uR89rNIEn4GPGBC7uoFE2WjfEUphjo949JhIlQPZ7v8lAkMEPYZh9bcmSBecp/C
joptq/+FSImLUUXwbMPixs0CfSWwfga6o2YI237QWPc4kBj/VkAG9e3FVXtyI+6A
S+3IgiVlPMl5nZYSUz2HUDpELKoDl1EBdpNBxgAZ88/AUKNURpBdENWZ7S3mkjkR
Q0bLulcWnaiSxAd5sqW1COCkytNGpdRebzAxSlPXDw9SLMGTXvuesM3WqkPIYFr7
X8O6+n1r0/7q3dVoVUiy+zTJEp4kQ69CDEGGKERlRR4VqMGwgggnJdPCbw4W1xIk
5VDvG+d1S/n1ab68Ik4L+/827K+CHHem4MVDYNMn5PTMJb1ULduzt9/Bg80h/+Jo
I1eq24NntA==
=eef/
-----END PGP SIGNATURE-----
