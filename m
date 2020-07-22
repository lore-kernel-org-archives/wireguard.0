Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD26C433E4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:27:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72C42206EB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:27:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMyKG2mg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72C42206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 803bf09a;
	Fri, 24 Jul 2020 08:04:10 +0000 (UTC)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 40a648c1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jul 2020 11:18:29 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p14so1261898wmg.1
 for <wireguard@lists.zx2c4.com>; Wed, 22 Jul 2020 04:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4Y0lnqyPLLHM/HA/YICEc/LYkFixUHn4i9bzXZLgH4o=;
 b=YMyKG2mg2+pTUnJOTvH1GrEYS3NJcInmrO+Ao4GTVrvJMRI0+E6Zxs/OzCjZIHQ7A2
 sBjGuue0gaXBrQH+6Rau2MfsLR9IbKNLCIfd1D6qIlcHamWoaGqA/dCmIt9cr9VoJLsw
 rRwD5/7zzRDt8EFdDdurJN+B0xfshVOoqgvAZDXBJJAe0YlqOgOVCFjVWSF0cgKwPChs
 xkulU6tAkBZ7zCW7wZ0TE++KHD6sj+CzjQr9a5vx/GPGOOOO4aSZr6M2ZgBBg5XIr8Fb
 tAM7l11/qRkdxrDwdxaBFb23ryyTdOnc7rWBkw/nkPdFSHiSTCnvcNyghj3zBfClhYva
 EMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4Y0lnqyPLLHM/HA/YICEc/LYkFixUHn4i9bzXZLgH4o=;
 b=hNlJQTxUwfncaCBlPlAHsvmjzWTmLEwfJaV3B5i0c96AAukOTor/tnEHmnopVseKrp
 7xj8bDaKkN/pUDUmghgTP3XVZwYjwmcLFXC2fNR+66MCGg7T23uDLQ5vkJplDrA735GU
 X3QCv+3VJ4+BeKGOxqq0MtHSSrix8bjUBPjWvX+WM8TR5bSmebCazgjIoxJVRWClXwdj
 2fRJwya/4behUQG9VAbMNn4MmzSoyfXw9GvpsnKJNlA9OdosJ17Y68tnOp5GkEz29qHz
 sl8L+bF0eTV+iqtvQ5A1Qy8NK0T7SdAGNT/UPakSQhrUizSxl9Yp2McXlb+KagFtDU6P
 np2Q==
X-Gm-Message-State: AOAM532RKQi6iXM01bPXV6PxlHPMxabR6KTJQjFHFlLEWPWES+PtLzUz
 norOOXk0R0w08PS5cChCF03fJ6NYdxo=
X-Google-Smtp-Source: ABdhPJw1427SnW0gmBNJdVnr83v0SK4HBekC2BsN49X2ziA+W6ZDTIxASIFV/tSZc9nHLofX5YwAWA==
X-Received: by 2002:a1c:7706:: with SMTP id t6mr7848177wmi.3.1595418067364;
 Wed, 22 Jul 2020 04:41:07 -0700 (PDT)
Received: from venus.lan (241.red-213-98-206.dynamicip.rima-tde.net.
 [213.98.206.241])
 by smtp.gmail.com with ESMTPSA id g14sm44447556wrw.83.2020.07.22.04.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 04:41:06 -0700 (PDT)
From: mendoza.ricardo@gmail.com
To: wireguard@lists.zx2c4.com
Cc: Ricardo Mendoza <ricmm@pantacor.com>
Subject: [PATCH] compat: allow override of depmod basedir
Date: Wed, 22 Jul 2020 13:40:51 +0200
Message-Id: <20200722114051.1919-1-mendoza.ricardo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 24 Jul 2020 10:04:05 +0200
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

From: Ricardo Mendoza <ricmm@pantacor.com>

When building in an environment with a different modules install path
we need to be able to also override the depmod basedir flag.

Signed-off-by: Ricardo Mendoza <ricmm@pantacor.com>
---
 src/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/Makefile b/src/Makefile
index c20bfd3..35e8e98 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -9,6 +9,7 @@ DESTDIR ?=
 SRCDIR ?= $(PREFIX)/src
 DKMSDIR ?= $(SRCDIR)/wireguard
 DEPMOD ?= depmod
+MODBASE ?= /
 
 PWD := $(shell pwd)
 
@@ -32,7 +33,7 @@ clean:
 
 module-install:
 	@$(MAKE) -C $(KERNELDIR) M=$(PWD) WIREGUARD_VERSION="$(WIREGUARD_VERSION)" modules_install
-	$(DEPMOD) -a $(KERNELRELEASE)
+	$(DEPMOD) -b $(MODBASE) -a $(KERNELRELEASE)
 
 install: module-install
 
-- 
2.17.1

