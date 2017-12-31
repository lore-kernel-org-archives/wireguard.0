Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05702c77
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:09 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94567823
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:07 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 3/7] tun_linux: document packet information header values
Date: Sun, 31 Dec 2017 17:16:50 +0100
Message-Id: <6a5d929ecf3211b72d7a4f04c7fc59c3c77b0af3.1514726309.git.simon@ruderich.org>
In-Reply-To: <cover.1514726309.git.simon@ruderich.org>
References: <cover.1514726309.git.simon@ruderich.org>
In-Reply-To: <cover.1514726309.git.simon@ruderich.org>
References: <cover.1514726309.git.simon@ruderich.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

---
 src/tun_linux.go | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/tun_linux.go b/src/tun_linux.go
index 7fcbe00..dfa74a6 100644
--- a/src/tun_linux.go
+++ b/src/tun_linux.go
@@ -258,6 +258,8 @@ func (tun *NativeTun) Write(buff []byte, offset int) (int, error) {
 	buff = buff[offset-PIHeaderSize:]
 
 	// add packet information header
+	// bytes 0-1: flags
+	// bytes 2-3: protocol
 
 	buff[0] = 0x00
 	buff[1] = 0x00
-- 
2.15.1
