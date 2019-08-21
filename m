Return-Path: <SRS0=EGLd=WR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C20DC3A59E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Aug 2019 15:43:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ECF222DA7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Aug 2019 15:43:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="y9xtNJy9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ECF222DA7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=airmail.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8825da2;
	Wed, 21 Aug 2019 15:43:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c92e4ad9
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Aug 2019 03:52:58 +0000 (UTC)
Received: from cock.li (cock.li [IPv6:2a06:1700:0:b::c0cc])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 052df015
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Aug 2019 03:52:58 +0000 (UTC)
To: wireguard@lists.zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
 t=1566359575; bh=qe0vvK/4Uqua3vVLOPO8hPHB5rthgpNd1nW8wiCupVM=;
 h=To:From:Subject:Date:From;
 b=y9xtNJy9EKZ+4w+EO2bKHH6VDXf05rGV+zxXYlv8PK9phE153vnthAfpM0BenDFN6
 bzDaaOxow9CPEtLv8CIQeG/k3arlykIKptSPItqSwsEyKXOvHwOUHKjbcJDSzU30Rj
 I8cc/tiDNYFnoF4ihS4v9cjrvQrfbWkNy5Cteqsa9z5j1hMQR3VtP6EErwRDU/bppJ
 nAl0oQ1MsXrrnoQixQn14fICQ5oVV0gFO995J0aaH2UW5kJv1JxFvU0wKjY5nmfava
 uON1wB5xhlVQJhhdnvvm0UMF4mGoYo18jUwiNA2id3ty0ed3O7Cc58QDrCBgyzr/BW
 kW7dT4dPZlzsA==
From: Mikkmar <mikkmar@airmail.cc>
Subject: [PATCH] Makefile: rework kernel version logic
Message-ID: <8f2456ea-9f59-96c5-1053-1567f28a7a2c@airmail.cc>
Date: Wed, 21 Aug 2019 06:52:50 +0300
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 21 Aug 2019 17:43:05 +0200
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

From 9a959c2a542d3c7f584e26dca2673dd7dd1ef8fb Mon Sep 17 00:00:00 2001
From: Mikk <mikkmar@airmail.cc>
Date: Wed, 21 Aug 2019 06:48:02 +0300
Subject: [PATCH] Makefile: rework kernel version logic

This makes depmod actually work when building/installing the module for
a kernel other than the currently running one

Signed-off-by: Mikk <mikkmar@airmail.cc>
---
 src/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/src/Makefile b/src/Makefile
index 24b2ba0..d0d6c4d 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -2,7 +2,8 @@
 #
 # Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All
Rights Reserved.

-KERNELDIR ?= /lib/modules/$(shell uname -r)/build
+KVER ?= $(shell uname -r)
+KERNELDIR ?= /lib/modules/$(KVER)/build
 PREFIX ?= /usr
 DESTDIR ?=
 SRCDIR ?= $(PREFIX)/src
@@ -45,7 +46,7 @@ clean:

 module-install:
 	@$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
-	$(DEPMOD) -a
+	$(DEPMOD) -a $(KVER)

 install: module-install tools-install

-- 
2.23.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
