Return-Path: <SRS0=zPJk=RR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1490C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 05:33:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677132087C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 05:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677132087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd546752;
	Thu, 14 Mar 2019 05:21:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ba0bc40
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 05:21:34 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id b1eefdea
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 05:21:34 +0000 (UTC)
Received: (qmail 10220 invoked from network); 14 Mar 2019 05:32:17 -0000
Received: from unknown (HELO wolff.to) (127.0.0.1)
 by wolff.to with SMTP; 14 Mar 2019 05:32:17 -0000
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] net/netfilter/nf_nat_core.h was removed by
 d2c5c103b1337f590b7edf1509a6e294bdf22402
Date: Thu, 14 Mar 2019 00:32:14 -0500
Message-Id: <20190314053214.10176-1-bruno@wolff.to>
X-Mailer: git-send-email 2.21.0
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

It looks like net/netfilter/nf_nat_core.h isn't needed any more and things
seemed to work without it.
---
 src/compat/compat.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/compat/compat.h b/src/compat/compat.h
index 7a61e4c1a5cd..2dcdbaeb0ad6 100644
--- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -792,7 +792,9 @@ struct __kernel_timespec {
 #include <net/ipv6.h>
 #include <net/icmp.h>
 #include <net/netfilter/nf_conntrack.h>
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 1, 0)
 #include <net/netfilter/nf_nat_core.h>
+#endif
 static inline void new_icmp_send(struct sk_buff *skb_in, int type, int code, __be32 info)
 {
 	enum ip_conntrack_info ctinfo;
-- 
2.21.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
