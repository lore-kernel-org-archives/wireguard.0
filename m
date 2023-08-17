Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D66C64E78
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Aug 2023 20:19:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91441e98;
	Thu, 17 Aug 2023 20:12:24 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a5894b9b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Aug 2023 20:12:17 +0000 (UTC)
Received: janet.servers.dxld.at; Thu, 17 Aug 2023 22:12:17 +0200
From: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
Subject: [PATCH 5/5] Replace print_endpoint with print_sockaddr_inet
Date: Thu, 17 Aug 2023 22:11:38 +0200
Message-Id: <20230817201138.930780-5-dxld@darkboxed.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817201138.930780-1-dxld@darkboxed.org>
References: <20230817201138.930780-1-dxld@darkboxed.org>
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

Note this changes the commandline behaviour slightly. Previously we would
output the gai_strerror message instead of the address when getnameinfo
fails.

I don't think this behaviour is very useful for scripts as it's hard to
match for since we're missing, say, an "error: " prefix. Instead print the
error to stderr and just don't print anything on stdout in this case. Empty
string is easier to detect than an arbitrary set of (possibly localised!)
error messages.

Signed-off-by: Daniel Gröber <dxld@darkboxed.org>
---
 src/show.c | 29 +++--------------------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/src/show.c b/src/show.c
index 3048183..ec830d1 100644
--- a/src/show.c
+++ b/src/show.c
@@ -104,29 +104,6 @@ static char *ip(const struct wgallowedip *ip)
 	return buf;
 }
 
-char *print_endpoint(const struct sockaddr *addr)
-{
-	char host[4096 + 1];
-	char service[512 + 1];
-	static char buf[sizeof(host) + sizeof(service) + 4];
-	int ret;
-	socklen_t addr_len = 0;
-
-	memset(buf, 0, sizeof(buf));
-	if (addr->sa_family == AF_INET)
-		addr_len = sizeof(struct sockaddr_in);
-	else if (addr->sa_family == AF_INET6)
-		addr_len = sizeof(struct sockaddr_in6);
-
-	ret = getnameinfo(addr, addr_len, host, sizeof(host), service, sizeof(service), NI_DGRAM | NI_NUMERICSERV | NI_NUMERICHOST);
-	if (ret) {
-		strncpy(buf, gai_strerror(ret), sizeof(buf) - 1);
-		buf[sizeof(buf) - 1] = '\0';
-	} else
-		snprintf(buf, sizeof(buf), (addr->sa_family == AF_INET6 && strchr(host, ':')) ? "[%s]:%s" : "%s:%s", host, service);
-	return buf;
-}
-
 char *print_sockaddr_inet(const struct sockaddr_inet *sa)
 {
 	char host[4096 + 1], service[512 + 1], ifname_buf[IF_NAMESIZE+10] = "%";
@@ -271,7 +248,7 @@ static void pretty_print(struct wgdevice *device)
 		if (peer->flags & WGPEER_HAS_PRESHARED_KEY)
 			terminal_printf("  " TERMINAL_BOLD "preshared key" TERMINAL_RESET ": %s\n", masked_key(peer->preshared_key));
 		if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6)
-			terminal_printf("  " TERMINAL_BOLD "endpoint" TERMINAL_RESET ": %s\n", print_endpoint(&peer->endpoint.addr));
+			terminal_printf("  " TERMINAL_BOLD "endpoint" TERMINAL_RESET ": %s\n", print_sockaddr_inet(&peer->endpoint.addr_inet));
 		terminal_printf("  " TERMINAL_BOLD "allowed ips" TERMINAL_RESET ": ");
 		if (peer->first_allowedip) {
 			for_each_wgallowedip(peer, allowedip)
@@ -315,7 +292,7 @@ static void dump_print(struct wgdevice *device, bool with_interface)
 		printf("%s\t", key(peer->public_key));
 		printf("%s\t", maybe_key(peer->preshared_key, peer->flags & WGPEER_HAS_PRESHARED_KEY));
 		if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6)
-			printf("%s\t", print_endpoint(&peer->endpoint.addr));
+			printf("%s\t", print_sockaddr_inet(&peer->endpoint.addr_inet));
 		else
 			printf("(none)\t");
 		if (peer->first_allowedip) {
@@ -366,7 +343,7 @@ static bool ugly_print(struct wgdevice *device, const char *param, bool with_int
 				printf("%s\t", device->name);
 			printf("%s\t", key(peer->public_key));
 			if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6)
-				printf("%s\n", print_endpoint(&peer->endpoint.addr));
+				printf("%s\n", print_sockaddr_inet(&peer->endpoint.addr_inet));
 			else
 				printf("(none)\n");
 		}
-- 
2.39.2

