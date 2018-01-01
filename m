Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 070b0cf3
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:52:03 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a55293d9
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:57 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 06/12] device: use UnderLoadAfterTime constant
Date: Mon,  1 Jan 2018 11:52:56 +0100
Message-Id: <47cefee70803d11b65f229706d7c391bfc5f7b2f.1514803815.git.simon@ruderich.org>
In-Reply-To: <cover.1514803815.git.simon@ruderich.org>
References: <cover.1514803815.git.simon@ruderich.org>
In-Reply-To: <cover.1514803815.git.simon@ruderich.org>
References: <cover.1514803815.git.simon@ruderich.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

---
 src/device.go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/device.go b/src/device.go
index 537af67..85d65b2 100644
--- a/src/device.go
+++ b/src/device.go
@@ -88,7 +88,7 @@ func (device *Device) IsUnderLoad() bool {
 	now := time.Now()
 	underLoad := len(device.queue.handshake) >= UnderLoadQueueSize
 	if underLoad {
-		device.underLoadUntil.Store(now.Add(time.Second))
+		device.underLoadUntil.Store(now.Add(UnderLoadAfterTime))
 		return true
 	}
 
-- 
2.15.1
