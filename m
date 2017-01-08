Return-Path: jftucker@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05732681
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 19:43:28 +0000 (UTC)
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
 [209.85.192.194])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95cd77f4
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 19:43:28 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f144so4153831pfa.2
 for <wireguard@lists.zx2c4.com>; Sun, 08 Jan 2017 11:52:58 -0800 (PST)
Return-Path: <jftucker@gmail.com>
From: James Tucker <jftucker@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] uapi.h: add missing userspace headers
Date: Sun,  8 Jan 2017 11:52:21 -0800
Message-Id: <20170108195221.28068-1-jftucker@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Signed-off-by: James Tucker <jftucker@gmail.com>
---
 src/uapi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/uapi.h b/src/uapi.h
index b139d43..cd4b86b 100644
--- a/src/uapi.h
+++ b/src/uapi.h
@@ -77,6 +77,8 @@ typedef int32_t __s32;
 #include <linux/time.h>
 #include <linux/socket.h>
 #else
+#include <net/if.h>
+#include <netinet/in.h>
 #include <sys/time.h>
 #include <sys/socket.h>
 #endif
-- 
2.11.0
