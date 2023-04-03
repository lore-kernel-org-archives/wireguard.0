Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B2CC76188
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Apr 2023 22:41:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fed347d;
	Mon, 3 Apr 2023 22:38:23 +0000 (UTC)
Received: from unit193.net (unit193.net [144.217.123.16])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8e7d3153
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Apr 2023 21:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=unit193.net;
 s=201810; t=1680558717;
 bh=kKZrROo3HQ5ELU87tn7THaJ0m0OyuCZvE14bD+ICkck=;
 h=From:To:Cc:Subject:Date:From;
 b=Y5DIcIB5Bee2lSBTpCYuHB3xSXpHAqFM9NMJZpjw5mts3up2Euk8zFqohrT5jDgZI
 1bxUkG5u17R7x8xNnjQ7y91kywPLDPy2n389kgY4tf5oVHlXXCWe9KD6bJ1Kxmrs2l
 FXoZypULnCKDLGaVBuc68mO2V/tfb15PT/gHIzsA=
Received: from localhost.localdomain (cpe-71-74-148-110.neo.res.rr.com
 [71.74.148.110])
 by unit193.net (Postfix) with ESMTPSA id 533F85C1304;
 Mon,  3 Apr 2023 17:51:57 -0400 (EDT)
From: Unit 193 <unit193@unit193.net>
To: wireguard@lists.zx2c4.com
Cc: Doug Freed <dwfreed@mtu.edu>
Subject: [PATCH] wg-quick@.service: Add deps on wg-quick.target
Date: Mon,  3 Apr 2023 17:51:17 -0400
Message-Id: <20230403215117.766701-1-unit193@unit193.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Apr 2023 22:38:22 +0000
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

From: Doug Freed <dwfreed@mtu.edu>

These dependencies ensure that instances of this service are started
before wg-quick.target is considered started, allowing other services
to depend on wg-quick.target to mean "all wg-quick services are started"

Signed-off-by: Doug Freed <dwfreed@mtu.edu>
---
 src/systemd/wg-quick@.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
index dbdab44..41e71b8 100644
--- a/src/systemd/wg-quick@.service
+++ b/src/systemd/wg-quick@.service
@@ -1,5 +1,6 @@
 [Unit]
 Description=WireGuard via wg-quick(8) for %I
+Before=wg-quick.target
 After=network-online.target nss-lookup.target
 Wants=network-online.target nss-lookup.target
 PartOf=wg-quick.target
@@ -19,4 +20,4 @@ ExecReload=/bin/bash -c 'exec /usr/bin/wg syncconf %i <(exec /usr/bin/wg-quick s
 Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity
 
 [Install]
-WantedBy=multi-user.target
+WantedBy=multi-user.target wg-quick.target
-- 
2.39.2

