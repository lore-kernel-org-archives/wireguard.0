Return-Path: <SRS0=oxb/=FZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_RANDY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91336C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 12:00:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9394C22B37
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 12:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9394C22B37
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 007ba471;
	Mon, 21 Dec 2020 11:51:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c39b3830
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 11:51:26 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25630aba
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 11:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=M47mgIVEmAsZYEPOc
 yAXPoD47co=; b=bIgSNE8N93XRRcey6MNsoCR9nrjnEO8swpmHB7m0LoXp3xwQd
 rBZ7EGRg/fR4onYrwSNPG2EfOhGbU76m4kcWMjheJDwMTSJpMOBEuXwd23HCFykB
 eqjJE2rDxR5g5buyZzrwZFnnimEGYUwNn5pUIBKitPOBNCQDiCU/BVT6T+KFl61a
 1Zeh+I/7kQ0NQPayGg5iabAgtV6BmlPY2foTDRlw4LZdmAv/DOHguoU+Z5Y9rLmE
 Yh5gLPlbBTdgHEYD/5TPrXulbM07C6AY5hulROBHPMb762geEVCcQv4l0vk5LtMN
 H34WuGUb6l1F5+YxGrpEi676tQxoIXVuMzD0Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c2e17223
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 11:52:12 +0000 (UTC)
Date: Mon, 21 Dec 2020 13:00:26 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20201221 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <0b6a0fa9e0eb6a81@mail.zx2c4.com>
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

A new version, v1.0.20201221, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * compat: drop rhel 8.2, add rhel 8.4 support
  
  This repairs broken builds on CentOS Stream. Note that the CI is still broken,
  though, pending Red Hat's fixing of <https://bugzilla.redhat.com/show_bug.cgi?id=1905962>.
  
  * simd: detect -rt kernels >= 5.4
  
  5.4-series of rt kernels changed config symbols, which means we started
  breaking again on rt. This updates our check.
  
  * gitignore: ignore intermediary build file
  * global: avoid double unlikely() notation when using IS_ERR()
  * socket: remove bogus __be32 annotation
  
  Small cleanups.

This release contains commits from: Jason A. Donenfeld, L.W.Reek, Jann Horn, 
and Antonio Quartulli.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20201221.tar.xz
  SHA2-256: 6e5289a8b602eaaf1383aebefcbc41b8ad2721269055858b150363076c1c2132

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20201221.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl/gjkwQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrkLYD/9xEg451rcXfWakgJxn0vd3eqHKereTsm1s
qV3feIwYfxPDbxhO0gLlEt8Tn+Df4rc/XS/N7ZnBU0TFYivaXZMwAIk5zEgU0+Ok
weAVhrRglDkHkKFy0E4LC2sg2Zu4xnPhyobrB6YDuJBCOFhIZn/d0GvWWkFuEXW6
u58rCIf5GV0mG2629zexENWhZv4CJDLV5Q4ZTy602C0SD8DF/C7eJnk2PwgbRxnn
fl54eQ/uUzXNFSehkMKK/LfAVQNqqoNxYSkOw3BQRDsDaWGTjiABZYE3XtKAZtQT
Jb1Zix++0zmOPWFaCVC7pik325tAomgWVzUNrY56JSo8ShIbD/3VG0jXb4eeW29Y
usvDvAZ2ok+vRMjC2Yg5hCfyzhLaP7aEteucb6v0pBjYLmJxj2sM4+yiL9xuNMTt
jMDk3bI2W+J2ByVBTPTKdAOPnukCEQTBTSo77HGmLXv/Rf0n+Vci8i4ysIBcwcl6
SMfEA3oWNVX3AlFdWgBm+0JuMXqP2bgcIbGQk1fpgD9JUvmcP8pjypnI8QCwpYUU
7TsTn+RVyaVdMMU63R2UizpC65/oV34r3HpbqZn//i647jn0WAmvBF/21YEq/wLl
zVuVCd3WAdc8ZPgbnzB9AzZZsJD/H9O+9nqTMEWFHO7g0Cxw3I0IWoUUtm7bUgyB
4qifgJqmXA==
=4dOs
-----END PGP SIGNATURE-----
