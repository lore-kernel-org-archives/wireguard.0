Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c5c3178
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 20:58:29 +0000 (UTC)
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74a5b88d
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 20:58:29 +0000 (UTC)
From: danrl <mail@danrl.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] tools: fixed typo in wg-show usage
Date: Wed, 14 Dec 2016 22:07:40 +0100
Message-Id: <20161214210740.35426-1-mail@danrl.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Signed-off-by: Dan Luedtke <mail@danrl.com>
---
 src/tools/show.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tools/show.c b/src/tools/show.c
index ec92098..624f789 100644
--- a/src/tools/show.c
+++ b/src/tools/show.c
@@ -203,7 +203,7 @@ static char *bytes(uint64_t b)
 static const char *COMMAND_NAME = NULL;
 static void show_usage(void)
 {
-	fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces } [public-key | private-key | preshared-key | listen-port | peers | endpoints | allowed-ips | latest-handshake | bandwidth | persistent-keepalive]\n", PROG_NAME, COMMAND_NAME);
+	fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces } [public-key | private-key | preshared-key | listen-port | peers | endpoints | allowed-ips | latest-handshakes | bandwidth | persistent-keepalive]\n", PROG_NAME, COMMAND_NAME);
 }
 
 static void pretty_print(struct wgdevice *device)
-- 
2.10.0
