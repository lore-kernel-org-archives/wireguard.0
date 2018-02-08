Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 367280f9
 for <wireguard@lists.zx2c4.com>; Thu, 8 Feb 2018 20:16:01 +0000 (UTC)
Received: from smtp28.bhosted.nl (smtp28.bhosted.nl [94.124.121.40])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56eb94c9
 for <wireguard@lists.zx2c4.com>; Thu, 8 Feb 2018 20:16:01 +0000 (UTC)
From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Using the wrong variable in loop.
Date: Thu,  8 Feb 2018 21:21:43 +0100
Message-Id: <20180208202143.326-1-opensource@vdorst.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Fix compiler error:

WireGuard/src/crypto/../selftest/poly1305.h:1497:10: warning: iteration 35u invokes undefined behavior [-Waggressive-loop-optimizations]
   size_t inlen = poly1305_testvecs[i].input.size;
          ^
WireGuard/src/crypto/../selftest/poly1305.h:1494:2: note: containing loop
  for (i = 0; i < ARRAY_SIZE(chacha20poly1305_enc_vectors); ++i) {
---
 src/selftest/poly1305.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/selftest/poly1305.h b/src/selftest/poly1305.h
index 2b93d50..9428eba 100644
--- a/src/selftest/poly1305.h
+++ b/src/selftest/poly1305.h
@@ -1491,7 +1491,7 @@ bool __init poly1305_selftest(void)
 	bool success = true;
 	size_t i;
 
-	for (i = 0; i < ARRAY_SIZE(chacha20poly1305_enc_vectors); ++i) {
+	for (i = 0; i < ARRAY_SIZE(poly1305_testvecs); ++i) {
 		struct poly1305_ctx poly1305;
 		const u8 *in = poly1305_testvecs[i].input.data;
 		size_t inlen = poly1305_testvecs[i].input.size;
-- 
2.13.6
