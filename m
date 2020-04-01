Return-Path: <SRS0=FpfO=5R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C070C2D0F2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Apr 2020 16:43:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C582137B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Apr 2020 16:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=eworm.de header.i=@eworm.de header.b="oMApb3Nt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19C582137B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eworm.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07fb0da7;
	Wed, 1 Apr 2020 16:34:59 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b295ff92
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Apr 2020 16:34:57 +0000 (UTC)
Received: from leda.eworm.de (p54B7982C.dip0.t-ipconnect.de [84.183.152.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mx.mylinuxtime.de (Postfix) with ESMTPSA id 5B884F6D2C;
 Wed,  1 Apr 2020 18:36:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eworm.de; s=mail;
 t=1585758964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TB7SU+Q3eWE2sNebVBZeK6qzBS+VH0EbTAF4BrL10ow=;
 b=oMApb3Nto13jVsj6k6g2cj1+1GjQJwX58m9PCQhpyDUcpLvS7krFYe4vh7RqXKwfOYXb3/
 7b3NdxkNC6usUDx84CdAFKVpr3taDmZ89223Ojn0bXDDK+a2WkFVkJKI0iiQvNFaNARUiT
 hluZIx6NQUfjKeirA6atrND+bhu1jdw=
Received: by leda.eworm.de (Postfix, from userid 1000)
 id 3129C121894; Wed,  1 Apr 2020 18:35:33 +0200 (CEST)
From: Christian Hesse <list@eworm.de>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Christian Hesse <mail@eworm.de>
Subject: [PATCH 1/1] queueing: skb_reset_redirect change has been backported
 to 5.[45]
Date: Wed,  1 Apr 2020 18:32:32 +0200
Message-Id: <20200401163232.154754-1-list@eworm.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++
Authentication-Results: mx.mylinuxtime.de;
 auth=pass smtp.auth=smtp-only@eworm.de smtp.mailfrom=eworm@leda.eworm.de
X-Rspamd-Server: mx
X-Stat-Signature: ke15i9nwdxoo9jfzyfpw9q6p1qen9mct
X-Rspamd-Queue-Id: 5B884F6D2C
X-Spamd-Result: default: False [4.45 / 15.00]; ARC_NA(0.00)[];
 GENERIC_REPUTATION(0.00)[-0.080513860322227];
 FROM_HAS_DN(0.00)[]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; TO_DN_ALL(0.00)[];
 DKIM_SIGNED(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_SHORT(-0.75)[-0.755];
 FORGED_SENDER(0.30)[list@eworm.de,eworm@leda.eworm.de];
 RCVD_COUNT_ZERO(0.00)[0]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:3320, ipnet:84.128.0.0/10, country:DE];
 FROM_NEQ_ENVFROM(0.00)[list@eworm.de,eworm@leda.eworm.de]
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

From: Christian Hesse <mail@eworm.de>

This is a follow up to 2d4fa2a6e7903ec3340f1b075456cbd84ba6a744.

Upstream commit 2c64605b590edadb3fb46d1ec6badb49e940b479 has been backported
to 5.4.29 and 5.5.14.

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 src/compat/compat.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/compat/compat.h b/src/compat/compat.h
index fe2d07e..7f16332 100644
--- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -1024,7 +1024,8 @@ out:
 #define COMPAT_CANNOT_USE_MAX_MTU
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0)
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 29) || \
+    (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 5, 0) && LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 14)))
 #include <linux/skbuff.h>
 static inline void skb_reset_redirect(struct sk_buff *skb)
 {
