Return-Path: <SRS0=+SnU=QD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BA4C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Nov 2021 16:58:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E476D6112D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Nov 2021 16:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E476D6112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=physik.uni-regensburg.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee67963f;
	Tue, 16 Nov 2021 16:58:44 +0000 (UTC)
Received: from mx1.uni-regensburg.de (mx1.uni-regensburg.de [194.94.157.146])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a355ab44
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Nov 2021 16:58:43 +0000 (UTC)
Received: from mx1.uni-regensburg.de (localhost [127.0.0.1])
 by localhost (Postfix) with SMTP id AAC74600004F
 for <wireguard@lists.zx2c4.com>; Tue, 16 Nov 2021 17:52:22 +0100 (CET)
Received: from smtp2.uni-regensburg.de (smtp2.uni-regensburg.de
 [194.94.157.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "smtp.uni-regensburg.de",
 Issuer "DFN-Verein Global Issuing CA" (not verified))
 by mx1.uni-regensburg.de (Postfix) with ESMTPS id 8FC5D600004D
 for <wireguard@lists.zx2c4.com>; Tue, 16 Nov 2021 17:52:22 +0100 (CET)
From: Peter Georg <peter.georg@physik.uni-regensburg.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH compat] Update for RHEL 8.5
Date: Tue, 16 Nov 2021 17:52:22 +0100
Message-Id: <20211116165222.3236464-1-peter.georg@physik.uni-regensburg.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

RHEL 8.5 has been released. Replace all ISCENTOS8S checks with ISRHEL8.
Increase RHEL_MINOR for CentOS 8 Stream detection to 6.

Signed-off-by: Peter Georg <peter.georg@physik.uni-regensburg.de>
---
 src/compat/compat-asm.h | 4 ++--
 src/compat/compat.h     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/compat/compat-asm.h b/src/compat/compat-asm.h
index 5bfdb94..951fc10 100644
--- a/src/compat/compat-asm.h
+++ b/src/compat/compat-asm.h
@@ -15,7 +15,7 @@
 #define ISRHEL7
 #elif RHEL_MAJOR == 8
 #define ISRHEL8
-#if RHEL_MINOR >= 4
+#if RHEL_MINOR >= 6
 #define ISCENTOS8S
 #endif
 #endif
@@ -51,7 +51,7 @@
 #undef pull
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 76) && !defined(ISCENTOS8S) && !defined(SYM_FUNC_START)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 76) && !defined(ISRHEL8) && !defined(SYM_FUNC_START)
 #define SYM_FUNC_START ENTRY
 #define SYM_FUNC_END ENDPROC
 #endif
diff --git a/src/compat/compat.h b/src/compat/compat.h
index ee45a3c..9aa767a 100644
--- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -16,7 +16,7 @@
 #define ISRHEL7
 #elif RHEL_MAJOR == 8
 #define ISRHEL8
-#if RHEL_MINOR >= 5
+#if RHEL_MINOR >= 6
 #define ISCENTOS8S
 #endif
 #endif
@@ -855,7 +855,7 @@ static inline void skb_mark_not_on_list(struct sk_buff *skb)
 #endif
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 0) && !defined(ISCENTOS8S)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 0) && !defined(ISRHEL8)
 #define genl_dumpit_info(cb) ({ \
 	struct { struct nlattr **attrs; } *a = (void *)((u8 *)cb->args + offsetofend(struct dump_ctx, next_allowedip)); \
 	BUILD_BUG_ON(sizeof(cb->args) < offsetofend(struct dump_ctx, next_allowedip) + sizeof(*a)); \
-- 
2.31.1

