Return-Path: <SRS0=dlhK=HU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C73C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Feb 2021 19:28:33 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 056A064E22
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Feb 2021 19:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 056A064E22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54d92e06;
	Thu, 18 Feb 2021 19:25:54 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bae10a18
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Feb 2021 17:18:23 +0000 (UTC)
Received: from [179.228.36.197] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1lCmgM-00056s-5P; Thu, 18 Feb 2021 17:01:38 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: wireguard@lists.zx2c4.com
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Subject: [PATCH] compat: skb_mark_not_on_list will be backported to Ubuntu
 18.04
Date: Thu, 18 Feb 2021 14:01:32 -0300
Message-Id: <20210218170132.22917-1-cascardo@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 Feb 2021 19:25:53 +0000
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

linux commit 22f6bbb7bcfcef0b373b0502a7ff390275c575dd ("net: use
skb_list_del_init() to remove from RX sublists") will be backported to Ubuntu
18.04 default kernel, which is based on linux 4.15.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
---
 src/compat/compat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/compat/compat.h b/src/compat/compat.h
index c1b77d99e817..78e942dec084 100644
--- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -823,7 +823,7 @@ static __always_inline void old_rcu_barrier(void)
 #define COMPAT_CANNOT_DEPRECIATE_BH_RCU
 #endif
 
-#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 10) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0) && !defined(ISRHEL8)) || LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 217)
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 10) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0) && !defined(ISRHEL8) && !defined(ISUBUNTU1804)) || LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 217)
 static inline void skb_mark_not_on_list(struct sk_buff *skb)
 {
 	skb->next = NULL;
-- 
2.27.0

