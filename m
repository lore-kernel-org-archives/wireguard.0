Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E702EE49A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Aug 2023 18:13:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca374e4c;
	Sun, 20 Aug 2023 18:11:00 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 96cab701
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Aug 2023 18:10:58 +0000 (UTC)
Received: janet.servers.dxld.at; Sun, 20 Aug 2023 20:10:57 +0200
From: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
Subject: [PATCH] Check sockaddr_inet field offsets against system sockaddr
 structs
Date: Sun, 20 Aug 2023 20:10:34 +0200
Message-Id: <20230820181034.2385772-1-dxld@darkboxed.org>
X-Mailer: git-send-email 2.39.2
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

Some systems may have the sockaddr fields in a different arrangement and
need #ifdef'ing this makes this obvious to any future porters.

Signed-off-by: Daniel Gröber <dxld@darkboxed.org>
---
 src/containers.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/src/containers.h b/src/containers.h
index 2f3d88f..357df77 100644
--- a/src/containers.h
+++ b/src/containers.h
@@ -8,6 +8,8 @@
 
 #include <stdint.h>
 #include <stdlib.h>
+#include <stddef.h>
+#include <assert.h>
 #include <time.h>
 #include <sys/socket.h>
 #include <net/if.h>
@@ -44,6 +46,25 @@ struct sockaddr_inet {
 	};
 };
 
+#if defined(_MSC_VER)
+#define static_assert(x) static_assert(x, #x)
+#elif !defined(static_assert)
+#define static_assert(x) _Static_assert((x), #x)
+#endif
+
+static_assert(offsetof(struct sockaddr_in, sin_port) ==
+	      offsetof(struct sockaddr_inet, sinet_port));
+static_assert(offsetof(struct sockaddr_in6, sin6_port) ==
+	      offsetof(struct sockaddr_inet, sinet_port));
+
+#define assert_offsets_match(tyx, tyy, field) \
+	static_assert(offsetof(tyx, field) == offsetof(tyy, field))
+
+assert_offsets_match(struct sockaddr_in, struct sockaddr_inet, sin_addr);
+assert_offsets_match(struct sockaddr_in6, struct sockaddr_inet, sin6_flowinfo);
+assert_offsets_match(struct sockaddr_in6, struct sockaddr_inet, sin6_addr);
+assert_offsets_match(struct sockaddr_in6, struct sockaddr_inet, sin6_scope_id);
+
 struct wgallowedip {
 	uint16_t family;
 	union {
-- 
2.39.2

