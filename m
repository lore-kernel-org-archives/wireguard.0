Return-Path: <SRS0=CtsK=AE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_RANDY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC2DC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Jun 2020 22:16:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A687520724
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Jun 2020 22:16:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="r0HOpTxV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A687520724
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95972dc4;
	Tue, 23 Jun 2020 21:57:01 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0aa7aaa9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Jun 2020 21:56:58 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ebe973f
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Jun 2020 21:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=NWUsQNMm9T1a2uQG0
 gldi3FrfDI=; b=r0HOpTxVVxuG2ujQrkA2Z1dAipd/pLhMNeMTAn7RsF3zwd3sa
 72JdI/RuYCxNRcSKFjdakIZjuTDT3Qlw3HWoqfKEODqlCgJdh0y/JV/8NmjV1pSr
 syKOY91uiT3bq0AxHubvBppe5YbGi9RDVADdx+4YBgqSBbrX7U/4+7WHehNHd20l
 Na2Lc7B/GyFkvOJcwpGBR4iHw8s5bdzn2teoZL+/gIx/LUrI6ufrUHUYcG75q1Vy
 byH1yvb+DYQBILTeOyhWc66laIrTxecYiTdNs80rmuTkWM/gqsrJqgmC3WA+9nWI
 kESiXxPeOHkLLGtysPaqNBO4nMar+hCU4KCFg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6c611d60
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Jun 2020 21:56:57 +0000 (UTC)
Date: Tue, 23 Jun 2020 16:15:52 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20200623 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <6cd7bfefd767fdf2@mail.zx2c4.com>
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

A new version, v1.0.20200623, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * compat: drop centos 8.1 support as 8.2 is now out
  
  Of note, as well, is that we now have both RHEL7 and RHEL8 in our CI at
  <https://www.wireguard.com/build-status/>.
  
  * Kbuild: remove -fvisibility=hidden from cflags
  
  This fixes an issue when compiling wireguard as a module for ARM kernels in
  THUMB2 mode without the JUMP11 workaround.
  
  * noise: do not assign initiation time in if condition
  
  Style fix.
  
  * device: avoid circular netns references
  
  Fixes a circular reference issue with network namespaces.
  
  * netns: workaround bad 5.2.y backport
  
  This works around a back backport in the 5.2.y series.

This release contains commits from: Jason A. Donenfeld and Frank 
Werner-Krippendorf.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200623.tar.xz
  SHA2-256: 130937724515799edf05ff8216bc837df8acda879428f3a7f96a3287758f9445

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200623.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl7yfwcQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrvxgEAC58ZDoAAyph0sVO5manhh+t4Gvai63+Wmf
Aoja8LyoforyHWrOH7FYfKIn2G1cRQDdiZ24Bg6DrPVfJRHKd2epA5ZuRVH6TqZ4
FfZCa7o1jx6Kmyh+3nNfL8GV+yiQdPcWcz7COw/NxHSp1bp2PmS5Sso6ArKrbaPE
1+AtaTCm7x8Jje5CAJvVIWqK8KO+ap8riF2gxgA7pIi67xF1rhQVQ6A977UYSyyn
UqVQf8xeQ+AWWM6x0fsUbwYsfza2ggR2lmpZad0CbP1Jx1/x+/YnFVMaRp709Ypg
bHigMC12LuetR5U35ldV1sKiVxWlovzxnoznjNzKvwx7HjO0vLT6IyuerhVRsIYQ
O+F0piRbMDKhz423SEij72ULvmyCrxnTxYU+ML9F/13HJFTJfYCtCr9bM6bSlEjt
wCzA+leFO7WErlE9Ut05qYAawJPVNFVGQhVHgTUfTo5CPV/3iKtmfVzA46QBiJJv
+GetUADVQjl96sV+eCnuGtY2bQv/nnUMJcg+U9lUtNSfBJyi+F/dc/c5ZrW99DqW
/rMvuJHxHIUITWI1IOCxCvi1hsKaV3kPLT1dNOUtsNHbhyj7ngQCSi7wjFiOH8BU
74oLNAjU6ooD2PAWJUiam6YDii1cmBKseYRlaljpDnfXZDAn66wZdFFhtYcRmxms
TjlXXorVHQ==
=s2+A
-----END PGP SIGNATURE-----
