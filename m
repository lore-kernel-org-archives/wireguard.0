Return-Path: yuanchaosun@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9f4d84d
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 07:42:28 +0000 (UTC)
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
 [209.85.128.179])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ed139ca
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 07:42:27 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id k18so23965118wre.1
 for <wireguard@lists.zx2c4.com>; Mon, 27 Nov 2017 23:48:18 -0800 (PST)
Return-Path: <yuanchaosun@gmail.com>
From: Yuanchao Sun <yuanchaosun@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/1] tools: remove '\n' in fscanf format-string
Date: Tue, 28 Nov 2017 15:49:47 +0800
Message-Id: <20171128074947.2212-2-yuanchao.sun@gmail.com>
In-Reply-To: <20171128074947.2212-1-yuanchao.sun@gmail.com>
References: <20171128074947.2212-1-yuanchao.sun@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

---
 src/tools/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tools/ipc.c b/src/tools/ipc.c
index a88672f..7264848 100644
--- a/src/tools/ipc.c
+++ b/src/tools/ipc.c
@@ -271,7 +271,7 @@ static int userspace_set_device(struct wgdevice *dev)
 	fprintf(f, "\n");
 	fflush(f);
 
-	if (fscanf(f, "errno=%d\n\n", &ret) != 1)
+	if (fscanf(f, "errno=%d", &ret) != 1)
 		ret = errno ? -errno : -EPROTO;
 	fclose(f);
 	errno = -ret;
-- 
2.15.0
