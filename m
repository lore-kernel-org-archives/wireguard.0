Return-Path: jftucker@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e92b072
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 19:28:38 +0000 (UTC)
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
 [209.85.192.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efd1e12f
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 19:28:38 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y143so1975122pfb.1
 for <wireguard@lists.zx2c4.com>; Sun, 08 Jan 2017 11:38:08 -0800 (PST)
Return-Path: <jftucker@gmail.com>
From: James Tucker <jftucker@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] uapi.h: add missing userspace headers
Date: Sun,  8 Jan 2017 11:37:42 -0800
Message-Id: <20170108193742.27679-1-jftucker@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

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
