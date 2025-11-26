Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B64ED1118E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Nov 2025 17:41:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1381d336;
	Wed, 26 Nov 2025 17:36:47 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9e097354
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Nov 2025 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1764178585;
 bh=FYLtqNMpFxR+mpsT+mbyaqJuN9Po8ME7GneCTwYMrs0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N1xYHHvQtMOPQcvaEiX9X9CIPWOrVphyDkAVig+MVK7eS0o/xPlHlRIDExiqyb2s1
 b3GPJltsdtE4iy3Q0o/sMKd/msdF86i6FsmbZeo2jT4oHvo5hHY2xjynIavYb8Hg3X
 lyBs+jZSV38OZQkN3XYHBqkH6ZzuMrYP4t92c4sUXhrcZd5VpNJY9fjhEuSCr0XqkF
 TOxPhX4Ibom0aZQO9BQvHAXBI9vmAg0h3fFgKLrCcus98JPYcN4ydXruqNKxjDAaJb
 N39Nj1sdEk3CUCWi9hyG1y3RUXD1ickPJRnhJQ2C9KT3Iz5eQCsKbdBR8ff/1G6plp
 mzSwIIqgVCVlw==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id A17316010E;
 Wed, 26 Nov 2025 17:36:25 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id E40B9203866; Wed, 26 Nov 2025 17:35:51 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jordan Rife <jordan@jrife.io>
Subject: [PATCH wireguard v4 06/10] wireguard: uapi: move enum wg_cmd
Date: Wed, 26 Nov 2025 17:35:38 +0000
Message-ID: <20251126173546.57681-7-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251126173546.57681-1-ast@fiberby.net>
References: <20251126173546.57681-1-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch moves enum wg_cmd to the end of the file, where ynl-gen
would generate it.

This is an incremental step towards adopting an UAPI header generated
by ynl-gen. This is split out to keep the patches readable.

This is a trivial patch with no behavioural changes intended.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 include/uapi/linux/wireguard.h | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/uapi/linux/wireguard.h b/include/uapi/linux/wireguard.h
index dee4401e0b5df..3ebfffd61269a 100644
--- a/include/uapi/linux/wireguard.h
+++ b/include/uapi/linux/wireguard.h
@@ -11,13 +11,6 @@
 
 #define WG_KEY_LEN 32
 
-enum wg_cmd {
-	WG_CMD_GET_DEVICE,
-	WG_CMD_SET_DEVICE,
-	__WG_CMD_MAX
-};
-#define WG_CMD_MAX (__WG_CMD_MAX - 1)
-
 enum wgdevice_flag {
 	WGDEVICE_F_REPLACE_PEERS = 1U << 0,
 	__WGDEVICE_F_ALL = WGDEVICE_F_REPLACE_PEERS
@@ -73,4 +66,12 @@ enum wgallowedip_attribute {
 };
 #define WGALLOWEDIP_A_MAX (__WGALLOWEDIP_A_LAST - 1)
 
+enum wg_cmd {
+	WG_CMD_GET_DEVICE,
+	WG_CMD_SET_DEVICE,
+
+	__WG_CMD_MAX
+};
+#define WG_CMD_MAX (__WG_CMD_MAX - 1)
+
 #endif /* _WG_UAPI_WIREGUARD_H */
-- 
2.51.0

