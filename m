Return-Path: <SRS0=6TfW=GY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADD0C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Jan 2021 13:40:58 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2918723877
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Jan 2021 13:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2918723877
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tls.msk.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fc94b73;
	Thu, 21 Jan 2021 13:40:50 +0000 (UTC)
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5b232a39
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jan 2021 10:18:03 +0000 (UTC)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2C4BC404DB
 for <wireguard@lists.zx2c4.com>; Mon, 18 Jan 2021 13:08:16 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with SMTP id 219858D;
 Mon, 18 Jan 2021 13:08:16 +0300 (MSK)
Received: (nullmailer pid 8679 invoked by uid 1000);
 Mon, 18 Jan 2021 10:08:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: wireguard@lists.zx2c4.com
Cc: Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 2/2] recognize and ignore commands used by wg-quick
Date: Mon, 18 Jan 2021 13:08:02 +0300
Message-Id: <20210118100802.8568-3-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210118100802.8568-1-mjt@tls.msk.ru>
References: <20210118100802.8568-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Jan 2021 00:20:04 +0000
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

When reading the config file, recognize and ignore commands in the [Interface] section
which are used by wg-qukck. This way wg-quick config file can be read by wg too directly
so there's no need to filter it out by wg-quick and it's easy to reload configuration too.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 src/config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/config.c b/src/config.c
index b4280e5..0095556 100644
--- a/src/config.c
+++ b/src/config.c
@@ -460,6 +460,10 @@ static bool process_line(struct config_ctx *ctx, const char *line)
 			ret = parse_key_or_file(ctx->device->private_key, value);
 			if (ret)
 				ctx->device->flags |= WGDEVICE_HAS_PRIVATE_KEY;
+		} else if (key_match("Address") || key_match("DNS") || key_match("MTU") || key_match("Table") ||
+		           key_match("PreUp") || key_match("PostUp") || key_match("PreDown") || key_match("PostDown") ||
+		           key_match("SaveConfig")) {
+			/* ignore commands used by wg-quick */
 		} else
 			goto error;
 	} else if (ctx->is_peer_section) {
-- 
2.20.1

