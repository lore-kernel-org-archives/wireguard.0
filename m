Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5264DC433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:54:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC1AD20825
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC1AD20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fad2f660;
	Mon, 13 Jul 2020 23:31:24 +0000 (UTC)
Received: from sym2.noone.org (sym2.noone.org [2a01:4f8:120:4161::3])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0e7b8bf0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Jul 2020 10:54:34 +0000 (UTC)
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4B1Kbj5V7hzvjc1; Tue,  7 Jul 2020 13:15:13 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] device: use RTMGRP_IPV4_ROUTE to specify multicast groups mask
Date: Tue,  7 Jul 2020 13:15:13 +0200
Message-Id: <20200707111513.28080-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 01:31:20 +0200
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

Use the RTMGRP_IPV4_ROUTE const from x/sys/unix instead of using the
corresponding RTNLGRP_IPV4_ROUTE const to create the multicast groups
mask.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 device/sticky_linux.go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device/sticky_linux.go b/device/sticky_linux.go
index e3efc8694090..f1c7069f616a 100644
--- a/device/sticky_linux.go
+++ b/device/sticky_linux.go
@@ -206,7 +206,7 @@ func createNetlinkRouteSocket() (int, error) {
 	}
 	saddr := &unix.SockaddrNetlink{
 		Family: unix.AF_NETLINK,
-		Groups: uint32(1 << (unix.RTNLGRP_IPV4_ROUTE - 1)),
+		Groups: unix.RTMGRP_IPV4_ROUTE,
 	}
 	err = unix.Bind(sock, saddr)
 	if err != nil {
-- 
2.27.0

