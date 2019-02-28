Return-Path: <SRS0=YN3W=RD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2CCC10F00
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:00:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C9820863
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2C9820863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unixzen.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4bd66de;
	Thu, 28 Feb 2019 17:50:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be98ddcb
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 16:14:22 +0000 (UTC)
Received: from mx.dal1.terarocket.io (mx.dal1.terarocket.io [108.61.222.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86d44bc4
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 16:14:15 +0000 (UTC)
Received: by mx.dal1.terarocket.io (Postfix, from userid 1001)
 id C43E15DC68; Thu, 28 Feb 2019 16:23:53 +0000 (UTC)
Received: from IT-AGLUCK-L.national.kw.com (unknown [66.162.93.218])
 by mx.dal1.terarocket.io (Postfix) with ESMTPSA id AFAB55DC60;
 Thu, 28 Feb 2019 16:23:51 +0000 (UTC)
From: Alexander von Gluck IV <kallisti5@unixzen.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/2] build/tools: Add support for Haiku
Date: Thu, 28 Feb 2019 10:23:45 -0600
Message-Id: <20190228162346.23434-1-kallisti5@unixzen.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Feb 2019 18:50:32 +0100
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

---
 src/tools/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/tools/Makefile b/src/tools/Makefile
index f2904f2..0eecc57 100644
--- a/src/tools/Makefile
+++ b/src/tools/Makefile
@@ -51,6 +51,9 @@ LIBMNL_LDLIBS := $(shell $(PKG_CONFIG) --libs libmnl 2>/dev/null || echo -lmnl)
 CFLAGS += $(LIBMNL_CFLAGS)
 LDLIBS += $(LIBMNL_LDLIBS)
 endif
+ifeq ($(PLATFORM),haiku)
+LDLIBS += -lnetwork -lbsd
+endif
 
 ifneq ($(V),1)
 BUILT_IN_LINK.o := $(LINK.o)
-- 
2.20.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
