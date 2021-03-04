Return-Path: <SRS0=j5R+=IC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF43C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Mar 2021 18:36:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD6F664F67
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Mar 2021 18:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD6F664F67
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syseleven.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd5fa52c;
	Thu, 4 Mar 2021 18:36:11 +0000 (UTC)
Received: from smtp01.syseleven.net (smtp01.syseleven.net [77.247.83.123])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7cf0c9b9
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Mar 2021 18:36:09 +0000 (UTC)
Received: from 127.0.0.1 (localhost [127.0.0.1])
 by smtp01.syseleven.net (Postfix) with ESMTPSA id 7833957E386E
 for <wireguard@lists.zx2c4.com>; Thu,  4 Mar 2021 19:30:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=syseleven.de;
 s=2015n001; t=1614882624;
 bh=6V8sTqGbObbptBsBV3xd6f2BFSoi1pD2oBda5VEgkOI=;
 h=From:To:Subject:Date:From;
 b=CR+cbayO8PRrnUkMctT2J+ypYC2R9uN8nh41hB1bt4wuVSGNi9rcIqBPpRyD1Z2KP
 xEp9UfiWMMvD1wcodl4Kv2nxUSqe3UXpdKwjX5ZD0rOX+t9Cz2INNNibnE8WPqEbA6
 ObO1KIpGR8WjPD/z0JK6hYayJ71vA+GV0G1ng4I0=
From: Benedikt Braunger <b.braunger@syseleven.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] added ipv6_dst_lookup_flow define for VZ7 kernels
Date: Thu,  4 Mar 2021 19:30:18 +0100
Message-Id: <20210304183018.42658-1-b.braunger@syseleven.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.100.3 at milter01.syseleven.net
X-Virus-Status: Clean
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

This patch adds an additional check for OpenVZ / Virtuozzo 7 custom
kernels to ensure ipv6_dst_lookup_flow is defined.
It also splits the very long version checking into multiple lines for
better reading.

Signed-off-by: Benedikt Braunger <b.braunger@syseleven.de>
---
Since the error mentioned in "Wireguard DKMS build on OpenVZ 7" still
occures, I searched for a way to check if the module is compiled on 
a VZ kernel. This patch works for me, I tested on Virtuozzo 7 and 
plain CentOS 7. Can compile on both without error and the module is
loadable.
Probably Virtuozzo will backuport ipv6_dst_lookup_flow some day but
they can't (or don't want to) tell me when.
If so one can compare VZVERSION to the current one to ensure the definition
for older verions.

 src/compat/compat.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/src/compat/compat.h b/src/compat/compat.h
index 3e8e005..7700e7b 100644
--- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -91,7 +91,13 @@
 
 #if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0) && LINUX_VERSION_CODE >= KERNEL_VERSION(3, 16, 83)
 #define ipv6_dst_lookup_flow(a, b, c, d) ipv6_dst_lookup_flow(b, c, d)
-#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 5) && LINUX_VERSION_CODE >= KERNEL_VERSION(5, 4, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(5, 3, 18) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0) && !defined(ISUBUNTU1904)) || (!defined(ISRHEL8) && !defined(ISDEBIAN) && !defined(ISUBUNTU1804) && LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 119) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 181) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 10, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 224) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 5, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 4, 224) && !defined(ISUBUNTU1604) && !defined(ISRHEL7))
+#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 5) && LINUX_VERSION_CODE >= KERNEL_VERSION(5, 4, 0))\
+  || (LINUX_VERSION_CODE < KERNEL_VERSION(5, 3, 18) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0) && !defined(ISUBUNTU1904))\
+  || (!defined(ISRHEL8) && !defined(ISDEBIAN) && !defined(ISUBUNTU1804) && LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 119) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0))\
+  || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 181) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 10, 0))\
+  || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 224) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 5, 0))\
+  || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 4, 224) && !defined(ISUBUNTU1604) && !defined(ISRHEL7))\
+  || (LINUX_VERSION_CODE == KERNEL_VERSION(3, 10, 0) && defined(ISRHEL7) && defined(VZVERSION))
 #define ipv6_dst_lookup_flow(a, b, c, d) ipv6_dst_lookup(a, b, &dst, c) + (void *)0 ?: dst
 #endif
 
-- 
2.25.1

