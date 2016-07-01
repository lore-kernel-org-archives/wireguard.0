Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8b11403
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 13:08:54 +0000 (UTC)
Received: from fifthhorseman.net (unknown [38.109.115.130])
 by che.mayfirst.org (Postfix) with ESMTPSA id 05ED2F98B
 for <wireguard@lists.zx2c4.com>; Fri,  1 Jul 2016 09:11:50 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Fri,  1 Jul 2016 09:11:50 -0400
Message-Id: <1467378710-13114-1-git-send-email-dkg@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Subject: [WireGuard] =?utf-8?q?=5BPATCH=5D_more_http=E2=86=92https_cleanup?=
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

TIL djb actually enbled TLS on cr.yp.to
---
 src/noise.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/noise.c b/src/noise.c
index 3762e2d..0514730 100644
--- a/src/noise.c
+++ b/src/noise.c
@@ -295,7 +295,7 @@ static void tai64n_now(u8 output[NOISE_TIMESTAMP_LEN])
 {
 	struct timeval now;
 	do_gettimeofday(&now);
-	/* http://cr.yp.to/libtai/tai64.html */
+	/* https://cr.yp.to/libtai/tai64.html */
 	*(__be64 *)output = cpu_to_be64(now.tv_sec);
 	*(__be32 *)(output + sizeof(__be64)) = cpu_to_be32(1000 * now.tv_usec + 500);
 }
-- 
2.8.1
