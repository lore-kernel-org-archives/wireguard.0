Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED401C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 10:08:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D98DB60FE8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 10:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D98DB60FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4645503a;
	Thu, 23 Sep 2021 10:07:24 +0000 (UTC)
Received: from sym2.noone.org (sym2.noone.org [178.63.92.236])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c1aa66e6
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 10:07:20 +0000 (UTC)
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4HFW6w1Chxzvjfm; Thu, 23 Sep 2021 12:07:19 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-go] tun: make operateonfd.go build tags more specific
Date: Thu, 23 Sep 2021 12:07:19 +0200
Message-Id: <20210923100719.2083-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
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

(*NativeTun).operateOnFd is only used on darwin and freebsd. Adjust the
build tags accordingly.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 tun/operateonfd.go | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tun/operateonfd.go b/tun/operateonfd.go
index aab71161f27c..bc804539169f 100644
--- a/tun/operateonfd.go
+++ b/tun/operateonfd.go
@@ -1,5 +1,5 @@
-//go:build !windows
-// +build !windows
+//go:build darwin || freebsd
+// +build darwin freebsd
 
 /* SPDX-License-Identifier: MIT
  *
-- 
2.33.0

