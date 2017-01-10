Return-Path: jftucker@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85bce7bd
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 03:40:03 +0000 (UTC)
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
 [209.85.192.196])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cbda007
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 03:40:03 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id b22so10265733pfd.3
 for <wireguard@lists.zx2c4.com>; Mon, 09 Jan 2017 19:49:43 -0800 (PST)
Return-Path: <jftucker@gmail.com>
From: James Tucker <jftucker@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] ipc: fix code style
Date: Mon,  9 Jan 2017 19:49:34 -0800
Message-Id: <20170110034934.40836-1-jftucker@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

best we don't goto fail by accident.
---
 src/tools/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tools/ipc.c b/src/tools/ipc.c
index 6237961..0e90b3c 100644
--- a/src/tools/ipc.c
+++ b/src/tools/ipc.c
@@ -240,7 +240,7 @@ static int userspace_get_device(struct wgdevice **dev, const char *interface)
 		if ((uint8_t *)peer + sizeof(struct wgpeer) > (uint8_t *)*dev + len)
 			goto out;
 		if ((uint8_t *)peer + sizeof(struct wgpeer) + sizeof(struct wgipmask) * peer->num_ipmasks > (uint8_t *)*dev + len)
-		goto out;
+			goto out;
 	}
 	ret = 0;
 out:
-- 
2.11.0
