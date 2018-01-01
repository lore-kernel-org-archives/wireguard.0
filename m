Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3ff583c
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:52:04 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8eca9e14
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:58 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 08/12] conn_linux: move comment to make its meaning more
 obvious
Date: Mon,  1 Jan 2018 11:52:58 +0100
Message-Id: <e4cd6deb1ac95a3d29803e4c04f5db8863c1a2a1.1514803815.git.simon@ruderich.org>
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

At first I didn't understand the connection between errno == 0 and
"error instance", putting it immediately before the nil should help.
---
 src/conn_linux.go | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/src/conn_linux.go b/src/conn_linux.go
index 63ad2ec..571c882 100644
--- a/src/conn_linux.go
+++ b/src/conn_linux.go
@@ -477,9 +477,8 @@ func send4(sock int, end *NativeEndpoint, buff []byte) error {
 		)
 	}
 
-	// errno = 0 is still an error instance
-
 	if errno == 0 {
+		// errno = 0 is still an error instance
 		return nil
 	}
 
-- 
2.15.1
