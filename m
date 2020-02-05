Return-Path: <SRS0=aHSR=3Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56706C35254
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Feb 2020 13:42:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 942B020702
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Feb 2020 13:42:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="FISUMLF7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 942B020702
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0747c203;
	Wed, 5 Feb 2020 13:41:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34494169
 for <wireguard@lists.zx2c4.com>; Wed, 5 Feb 2020 13:41:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4451e1cd
 for <wireguard@lists.zx2c4.com>; Wed, 5 Feb 2020 13:41:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ce52036
 for <wireguard@lists.zx2c4.com>; Wed, 5 Feb 2020 13:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=3nqFIo9b1EcYJyCkS
 YYDirSYqw0=; b=FISUMLF7Da1SlpXdHjVIyKJlpGedpvFlooWhFST/TpB7ClYE9
 SNCDjbUvWKu8/eVnlQ+m7Va8gyRMy5qXwqf942VJrDPlxRa71BEhD7vINIXZJb90
 ndqiQgIwyxzy2LbfZILmA6j1Ha534Y1eoYgfwyGr/9I15KH5ZyV3bHo4EZ6FDSgU
 AybXmPRJVEadOy44uIFQGtTojA7RLVaVQk2LvOqNx3czI9J8IHMXP6qCkCp8MOy9
 swtcGS44DXV7pgJw0zl6kfaiAUqFDb2mcYTKRAwEY+8+98ZXMhQ3cM4i9QybMrGX
 g/t7ODIVgWGTr5l72NObSlGuK49M/G8YQcTvg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 831fb01e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 5 Feb 2020 13:41:55 +0000 (UTC)
Date: Wed, 05 Feb 2020 14:42:49 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v0.0.20200205 released
MIME-Version: 1.0
Message-Id: <ff1abd785bd78c9e@frisell.zx2c4.com>
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

A new version, v0.0.20200205, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

Please note that until Linux 5.6 is released, this snapshot is a
snapshot rather than a secure final release.

== Changes ==

  * compat: support building for RHEL-8.2
  * compat: remove RHEL-7.6 workaround
  
  Bleeding edge RHEL users should be content now (which includes the actual
  RedHat employees I've been talking to about getting this into the RHEL kernel
  itself). Also, we remove old hacks for versions we no longer support anyway.
  
  * allowedips: remove previously added list item when OOM fail
  * noise: reject peers with low order public keys
  
  With this now being upstream, we benefit from increased fuzzing coverage of
  the code, uncovering these two bugs.
  
  * netns: ensure non-addition of peers with failed precomputation
  * netns: tie socket waiting to target pid
  
  An added test to our test suite for the above and a small fix for high-load CI
  scenarios.

This release contains commits from: Jason A. Donenfeld, Ilie Halip, and Eric 
Dumazet.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200205.tar.xz
  SHA2-256: 9669e165fc7252cab7f908ba57f160f6d57539b7cc81180f260cb675d2fd362b

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200205.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl46xksQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrgDRD/9ZMO1hpbyHjoguYN/NrdExxnWX3RoAHxry
yX5Dz3Pyl5WuFQ4dbvIW1PsZ4208sgx8/2wQ/F1tspmST32QwXiCyrLV1kJS30xK
CbtIcyX34rA+qu8hbtbGyRoEea/6Z8oMug+yoFydoZOKcnpcfR6dGkHvUy005c3R
mWq9ROva5kKJETU6D3ry+pGJv9ItfUnkIv/FJoPXx4cPF8K0bm2wzL0APOr/gGjt
IrvvHtUJ6r6QasiP6K2fMO9ihVczS7m9hVL4M7Bxx1X3lEmMRpwiMf2zInkoL9HV
b+FZzlFyNA+d7iRA/ZU40u9AxOwOwifbolm94aw8KI8dr9aKLmnusxIIAKsIYYa5
X7NeKdTJ3GsILMQGbNCESP44Tr4LgVM743m92P8MvHJZtDZAigPBrGS4mr/uASDi
XpU+dHqfL/Wehdk7UCaj2MJsgM42XzsSzGr6fAROP/Ck7JLaY83u17G6UbC26c30
Ktt1xPTL3FLJBnd23MMb3vlWNITytEVa7NoVN/i4Hv1+tFeUvSdzzE/+EvdlLotd
3c1gncM/TtbBUPa4o17IqF3vvzHQKsjQFl9BnvnusVEpNOBZRCadnqEr9sKQZ3Wa
X4H2LJaCtGMTrugQ/eF5wsaV+92aWNQ1s6fplNg/lwl9qX6mxAk118L2y8Aq0Oxd
O25DLiz/5A==
=fdbn
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
