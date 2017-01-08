Return-Path: jftucker@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb16b682
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 20:31:09 +0000 (UTC)
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
 [209.85.192.194])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8948bf9f
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 20:31:09 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y143so2018214pfb.1
 for <wireguard@lists.zx2c4.com>; Sun, 08 Jan 2017 12:40:40 -0800 (PST)
Return-Path: <jftucker@gmail.com>
From: James Tucker <jftucker@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] uapi: always print valid errors
Date: Sun,  8 Jan 2017 12:40:26 -0800
Message-Id: <20170108204026.29033-1-jftucker@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

ret_code is now initialized for the case of short reads.
The 0 length reads/eof case is now treated appropriately.

Signed-off-by: James Tucker <jftucker@gmail.com>
---
 src/tools/ipc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/tools/ipc.c b/src/tools/ipc.c
index c8ca431..cc512f3 100644
--- a/src/tools/ipc.c
+++ b/src/tools/ipc.c
@@ -164,7 +164,7 @@ static int userspace_set_device(struct wgdevice *dev)
 	struct wgpeer *peer;
 	size_t len;
 	ssize_t ret;
-	int ret_code;
+	int ret_code = 0;
 	int fd = userspace_interface_fd(dev->interface);
 	if (fd < 0)
 		return fd;
@@ -177,8 +177,10 @@ static int userspace_set_device(struct wgdevice *dev)
 	if (ret < 0)
 		goto out;
 	ret = read(fd, &ret_code, sizeof(ret_code));
-	if (ret < 0)
+	if (ret <= 0) {
+		ret = -errno;
 		goto out;
+	}
 	ret = ret_code;
 out:
 	close(fd);
-- 
2.11.0
