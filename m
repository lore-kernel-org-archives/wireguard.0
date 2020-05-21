Return-Path: <SRS0=2ld3=7D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_RANDY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF8DC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 04:40:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AEC4207F9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 04:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="moZphxo+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AEC4207F9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84b9f41d;
	Thu, 21 May 2020 04:25:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3de77a0f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 04:25:32 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49684930
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 04:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=N4qg1nKmkp5dHMlH1
 kXaNqizfhg=; b=moZphxo+1pWjUw5hH+7hqBBdqY6HjeDSGhgg/g/MZIfBFpDYH
 es/q71pxPvNM5Cywv834rUx/TQ0df9alz2WUcYcA0JOwq13PVf7HQfJoOc/g/NXM
 llOumDTCmrS463LVUp7SQsH+hCzvMgAL3utv8Zb8F0lF87/g28pN+UU2gOx/mdE+
 BFXMv+Vbd8OEqAXjFT+tBxLJWSeHMGShTj7kCf/lT+kTLF2a9SsKOek5pGCoiPOx
 PYM87gqe8ZmI/kDnGNSGBhD8IHvMq8QZaBnR158G7dbdiDfp1IVNAmmIU5y7aZYz
 dwhjyCdgSFrszdrM7rgbUIdeTWIR6u6tdZyWw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0784ed9e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 04:25:31 +0000 (UTC)
Date: Wed, 20 May 2020 22:40:01 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20200520 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <5f29b0a4e49519be@mail.zx2c4.com>
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

A new version, v1.0.20200520, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  This release aligns with the changes I sent to DaveM for 5.7-rc7 and were
  pushed to net.git about 45 minutes ago.
  
  * qemu: use newer iproute2 for gcc-10
  * qemu: add -fcommon for compiling ping with gcc-10
  
  These enable the test suite to compile with gcc-10.
  
  * noise: read preshared key while taking lock
  
  Matt noticed a benign data race when porting the Linux code to OpenBSD.
  
  * queueing: preserve flow hash across packet scrubbing
  * noise: separate receive counter from send counter
  
  WireGuard now works with fq_codel, cake, and other qdiscs that make use of
  skb->hash. This should significantly improve latency spikes related to
  buffer bloat. Here's a before and after graph from some data Toke measured:
  https://data.zx2c4.com/removal-of-buffer-bloat-in-wireguard.png
  
  * compat: support RHEL 8 as 8.2, drop 8.1 support
  * compat: support CentOS 8 explicitly
  * compat: RHEL7 backported the skb hash renamings
  
  The usual RHEL churn.
  
  * compat: backport renamed/missing skb hash members
  
  The new support for fq_codel and friends meant more backporting work.
  
  * compat: ip6_dst_lookup_flow was backported to 4.14, 4.9, and 4.4
  
  The main motivation for releasing this now: three stable kernels were released
  at the same time, with a patch that necessitated updating in our compat layer.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200520.tar.xz
  SHA2-256: 16e7ae4bef734b243428eea07f3b3c3d4721880c3ea8eb8f98628fd6ae5b77c3

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200520.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl7GBgoQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrlKZEACPH+a9eZpo7+wsXdSGph4F9yVN5NxwpxNM
l/ymAzh0ttuoQMYjL8lcU7YSaXYO0LijGooIsUzp/42ex8tawsrOeOkrbMbHW4Gs
nhLxQpoFMSDnGDuVXpPJ44xjdakyB6WfsbqpAgT2Eopzr0bn8Wi2lYxI8Oj8xbE/
g7tjHkV0HwAbetbDsnzy+SrWhKG5mZFL9ZX5dcR1NiaYvFGKoKF2hWlQwxMFQCMs
53Cjfsc0iiZ2D+eHKiIqclju/aRcwJZdmgrjSA8kGqggbdSCSin81rvEEhbDauri
uchnqcNE8DdRDyQP0/jeRVxz1OZw6yc0BLbvERh5ppCqFZFQTFfRCSttrmelgCKU
yCp501Zz5aJsRNsBpyhatFQkLuUmqZJOTZl5g25HdXYMK5Xt6kd9mO6Fyyz8ENcP
Egses+nB9udkO51t6AboBc4OMpu1v8/EVDX+/JJaCXjG22UVYEnHLsNVBJdCnqbD
8ccgWx2alrUZ/tBOl/vISbTwdMSca6VOa1Mvmg05B4EKdioF2qVqgH+58Pt0jTBT
j9YbuG9jeh93DVZmTY9R/vaPDlMKlg8/uzQJQhchpDUOZjWBtB6n17h+y8ySq5dM
QgZbgcHgYqxBzX8Q0fUyT2TrZlcYTfw5+kAbJktxbWS4/+tS0tac+J9YgDwhPmsL
eLHfHZSN5A==
=MZPt
-----END PGP SIGNATURE-----
