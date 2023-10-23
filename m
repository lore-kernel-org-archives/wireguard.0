Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53A2C25B47
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Oct 2023 17:28:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23f8909c;
	Mon, 23 Oct 2023 17:09:56 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c14c3f46
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Oct 2023 17:09:44 +0000 (UTC)
Received: janet.servers.dxld.at; Mon, 23 Oct 2023 19:09:44 +0200
From: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
Subject: [PATCH v2 6/6] wg: Simplify showconf_main by using print_sockaddr_inet
Date: Mon, 23 Oct 2023 19:09:00 +0200
Message-Id: <20231023170900.131473-6-dxld@darkboxed.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023170900.131473-1-dxld@darkboxed.org>
References: <20231023170900.131473-1-dxld@darkboxed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Signed-off-by: Daniel Gröber <dxld@darkboxed.org>
---
 src/showconf.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/src/showconf.c b/src/showconf.c
index c99a6a0..f2c6a68 100644
--- a/src/showconf.c
+++ b/src/showconf.c
@@ -23,8 +23,6 @@ int showconf_main(int argc, const char *argv[])
 {
 	char base64[WG_KEY_LEN_BASE64];
 	char ip[INET6_ADDRSTRLEN];
-	char host[4096 + 1], service[512 + 1];
-	socklen_t addr_len = 0;
 	struct wgdevice *device = NULL;
 	struct wgpeer *peer;
 	struct wgallowedip *allowedip;
@@ -77,19 +75,8 @@ int showconf_main(int argc, const char *argv[])
 		if (peer->first_allowedip)
 			printf("\n");
 
-		// TODO: use print_endpoint
-		if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6) {
-			if (peer->endpoint.addr.sa_family == AF_INET)
-				addr_len = sizeof(struct sockaddr_in);
-			else if (peer->endpoint.addr.sa_family == AF_INET6)
-				addr_len = sizeof(struct sockaddr_in6);
-			if (!getnameinfo(&peer->endpoint.addr, addr_len, host, sizeof(host), service, sizeof(service), NI_DGRAM | NI_NUMERICSERV | NI_NUMERICHOST)) {
-				if (peer->endpoint.addr.sa_family == AF_INET6 && strchr(host, ':'))
-					printf("Endpoint = [%s]:%s\n", host, service);
-				else
-					printf("Endpoint = %s:%s\n", host, service);
-			}
-		}
+		if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6)
+			printf("Endpoint = %s\n", print_sockaddr_inet(&peer->endpoint.addr_inet));
 
 		if (peer->persistent_keepalive_interval)
 			printf("PersistentKeepalive = %u\n", peer->persistent_keepalive_interval);
-- 
2.39.2

