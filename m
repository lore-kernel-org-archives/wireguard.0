Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50750C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 13:01:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F00DE22CF8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 13:01:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="gbjiGB1S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F00DE22CF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=airmail.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ad0c41f;
	Wed, 28 Aug 2019 13:01:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f867ab2e
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 13:01:29 +0000 (UTC)
Received: from cock.li (mx1.cock.li [185.10.68.5])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a15cb597
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 13:01:29 +0000 (UTC)
From: Mikk <mikkmar@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
 t=1566997288; bh=MmRgNh+GfC/3j/gnDxWaHe6OlRMCeKN09xLxi81gt/w=;
 h=From:To:Cc:Subject:Date:From;
 b=gbjiGB1S0IGGwNL2D4jGA2ZX9i67vnDeBxun1/JJSJHcw3G/43yORH53InyDa37qL
 0aZLY6zPK9FBKicNL/Xw82OYy2KWubu+xIRwS34420CwkN3TC+9/3byxh5LsTMkLaB
 ehBjbAtn92j42yDVL5PYVj3QWrZukC4/kMu0K2COPNmJDcCc+fncYDqYQ3hqf3k2Qh
 2UXwrRzFUxJe3XLpWrJ+EMZaY9P0IwzClCasNV9HdEc8BKtRL37kecqoOuEGYXxStb
 Mc+VZfkJVkndQ8ispQhKumJ0d9cfT9+aBhIYFdTMJ2rLAR0n7ouD8gc9Ix+On/fi8e
 8/2Y83K7ZmJNg==
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Makefile: rework kernel version logic
Date: Wed, 28 Aug 2019 16:01:25 +0300
Message-Id: <20190828130125.2261931-1-mikkmar@airmail.cc>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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

This makes depmod actually work when building/installing the module for a kernel other than the currently running one

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
 # Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
 
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
