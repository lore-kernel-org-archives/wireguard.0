Return-Path: <SRS0=fSJ2=JR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A70EC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 Apr 2021 04:52:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF35613AE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 Apr 2021 04:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFF35613AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=physik.uni-regensburg.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66bbfc63;
	Tue, 20 Apr 2021 04:52:27 +0000 (UTC)
Received: from mx2.uni-regensburg.de (mx2.uni-regensburg.de
 [2001:638:a05:137:165:0:3:bdf8])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62b16d86
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Apr 2021 20:58:09 +0000 (UTC)
Received: from mx2.uni-regensburg.de (localhost [127.0.0.1])
 by localhost (Postfix) with SMTP id D6C21600004E;
 Mon, 19 Apr 2021 22:51:32 +0200 (CEST)
Received: from smtp1.uni-regensburg.de (smtp1.uni-regensburg.de
 [194.94.157.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "smtp.uni-regensburg.de",
 Issuer "DFN-Verein Global Issuing CA" (not verified))
 by mx2.uni-regensburg.de (Postfix) with ESMTPS id C0003600004D;
 Mon, 19 Apr 2021 22:51:32 +0200 (CEST)
From: Peter Georg <peter.georg@physik.uni-regensburg.de>
To: wireguard@lists.zx2c4.com
Cc: Peter Georg <peter.georg@physik.uni-regensburg.de>
Subject: [PATCH compat] Update and improve detection of CentOS Stream 8
Date: Mon, 19 Apr 2021 22:51:25 +0200
Message-Id: <20210419205125.2835077-1-peter.georg@physik.uni-regensburg.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Apr 2021 04:52:21 +0000
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

CentOS Stream 8 by now (4.18.0-301.1.el8) reports RHEL_MINOR=5. The
current RHEL 8 minor release is still 3. RHEL 8.4 is in beta. Replace
equal comparison by greater equal to (hopefully) be a little bit more
future proof.

Signed-off-by: Peter Georg <peter.georg@physik.uni-regensburg.de>
---
 src/compat/compat-asm.h | 2 +-
 src/compat/compat.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/compat/compat-asm.h b/src/compat/compat-asm.h
index 7067afd..fde21da 100644
--- a/src/compat/compat-asm.h
+++ b/src/compat/compat-asm.h
@@ -15,7 +15,7 @@
 #define ISRHEL7
 #elif RHEL_MAJOR == 8
 #define ISRHEL8
-#if RHEL_MINOR == 4
+#if RHEL_MINOR >= 4
 #define ISCENTOS8S
 #endif
 #endif
diff --git a/src/compat/compat.h b/src/compat/compat.h
index 0227204..26a6d7e 100644
--- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -16,7 +16,7 @@
 #define ISRHEL7
 #elif RHEL_MAJOR == 8
 #define ISRHEL8
-#if RHEL_MINOR == 4
+#if RHEL_MINOR >= 4
 #define ISCENTOS8S
 #endif
 #endif
-- 
2.31.1

