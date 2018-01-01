Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30c19263
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:52:05 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 488b7bae
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:58 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 11/12] noise_protocol: mixHash(): remove unnecessary Reset()
Date: Mon,  1 Jan 2018 11:53:01 +0100
Message-Id: <f1dde18c6a7e8b30ec36b94697c6bd3a70554fd4.1514803815.git.simon@ruderich.org>
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

Resetting the hash is only necessary when reusing it which is not the
case as the function immediately returns.

Also prevents confusion by the reader who might expect a reason why the
hash is reset here.
---
 src/noise_protocol.go | 1 -
 1 file changed, 1 deletion(-)

diff --git a/src/noise_protocol.go b/src/noise_protocol.go
index 2bf38fe..c19f836 100644
--- a/src/noise_protocol.go
+++ b/src/noise_protocol.go
@@ -118,7 +118,6 @@ func mixHash(dst *[blake2s.Size]byte, h *[blake2s.Size]byte, data []byte) {
 	hsh.Write(h[:])
 	hsh.Write(data)
 	hsh.Sum(dst[:0])
-	hsh.Reset()
 }
 
 func (h *Handshake) mixHash(data []byte) {
-- 
2.15.1
