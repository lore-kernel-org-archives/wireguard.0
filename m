Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0E7C61CE5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Aug 2023 20:19:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bea4ac7;
	Thu, 17 Aug 2023 20:12:17 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 03087899
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Aug 2023 20:12:16 +0000 (UTC)
Received: janet.servers.dxld.at; Thu, 17 Aug 2023 22:12:15 +0200
From: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
Subject: [PATCH 1/5] wg: Support restricting address family of DNS resolved
 Endpoint
Date: Thu, 17 Aug 2023 22:11:34 +0200
Message-Id: <20230817201138.930780-1-dxld@darkboxed.org>
X-Mailer: git-send-email 2.39.2
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

When using wireguard tunnels for providing IPv6 connectivity to machines it
can be important to pin which IP address family should be used.

Consider a peer using a DNS name with both A/AAAA records, wg will
currently blindly follow system policy and use the first address returned
by getaddrinfo(). In typical deployments this will cause the IPv6 address
of the peer to be used, however when the whole IPv6 internet is being
routed over our wg iface all this accomplishes is a traffic black hole.

Naturally this can be worked around by having different DNS names for
v4-only / dual-stack addresses, however this may not be possible in some
situations where, say, a dynamic-DNS service is also in use.

To fix this we allow users to control which address family they want using
the new AddressFamily= config option, see wg.8 for details. We also update
reresolve-dns to take the AddressFamily option into account.

We would like to note that the not_oif patch[1] would also alleviate this
problem but since this never got merged it's not a workable solution.

[1]: http://marc.info/?t=145452167200014&r=1&w=2

Signed-off-by: Daniel Gröber <dxld@darkboxed.org>
---
 contrib/reresolve-dns/reresolve-dns.sh |  4 ++-
 src/config.c                           | 41 ++++++++++++++++++++------
 src/config.h                           |  2 +-
 src/containers.h                       |  5 ++++
 src/man/wg.8                           |  8 ++++-
 src/set.c                              |  9 +++++-
 src/setconf.c                          |  2 +-
 7 files changed, 57 insertions(+), 14 deletions(-)

diff --git a/contrib/reresolve-dns/reresolve-dns.sh b/contrib/reresolve-dns/reresolve-dns.sh
index 711c332..bdb47ac 100755
--- a/contrib/reresolve-dns/reresolve-dns.sh
+++ b/contrib/reresolve-dns/reresolve-dns.sh
@@ -17,7 +17,7 @@ process_peer() {
 	[[ $PEER_SECTION -ne 1 || -z $PUBLIC_KEY || -z $ENDPOINT ]] && return 0
 	[[ $(wg show "$INTERFACE" latest-handshakes) =~ ${PUBLIC_KEY//+/\\+}\	([0-9]+) ]] || return 0
 	(( ($EPOCHSECONDS - ${BASH_REMATCH[1]}) > 135 )) || return 0
-	wg set "$INTERFACE" peer "$PUBLIC_KEY" endpoint "$ENDPOINT"
+	wg set "$INTERFACE" peer "$PUBLIC_KEY" endpoint "$ENDPOINT" address-family "$FAMILY"
 	reset_peer_section
 }
 
@@ -25,6 +25,7 @@ reset_peer_section() {
 	PEER_SECTION=0
 	PUBLIC_KEY=""
 	ENDPOINT=""
+	FAMILY=unspec
 }
 
 reset_peer_section
@@ -38,6 +39,7 @@ while read -r line || [[ -n $line ]]; do
 		case "$key" in
 		PublicKey) PUBLIC_KEY="$value"; continue ;;
 		Endpoint) ENDPOINT="$value"; continue ;;
+		AddressFamily) FAMILY="$value"; continue ;;
 		esac
 	fi
 done < "$CONFIG_FILE"
diff --git a/src/config.c b/src/config.c
index 1e924c7..f9980fe 100644
--- a/src/config.c
+++ b/src/config.c
@@ -192,14 +192,14 @@ static inline int parse_dns_retries(void)
 	return (int)ret;
 }
 
-static inline bool parse_endpoint(struct sockaddr *endpoint, const char *value)
+static inline bool parse_endpoint(struct sockaddr *endpoint, const char *value, int family)
 {
 	char *mutable = strdup(value);
 	char *begin, *end;
 	int ret, retries = parse_dns_retries();
 	struct addrinfo *resolved;
 	struct addrinfo hints = {
-		.ai_family = AF_UNSPEC,
+		.ai_family = family,
 		.ai_socktype = SOCK_DGRAM,
 		.ai_protocol = IPPROTO_UDP
 	};
@@ -279,6 +279,20 @@ static inline bool parse_endpoint(struct sockaddr *endpoint, const char *value)
 	return true;
 }
 
+static inline bool parse_address_family(int *family, const char *value)
+{
+	if (strcmp(value, "inet") == 0)
+		*family = AF_INET;
+	else if (strcmp(value, "inet6") == 0)
+		*family = AF_INET6;
+	else if (strcmp(value, "unspec") == 0)
+		*family = AF_UNSPEC;
+	else
+		return false;
+
+	return true;
+}
+
 static inline bool parse_persistent_keepalive(uint16_t *interval, uint32_t *flags, const char *value)
 {
 	unsigned long ret;
@@ -458,8 +472,10 @@ static bool process_line(struct config_ctx *ctx, const char *line)
 			goto error;
 	} else if (ctx->is_peer_section) {
 		if (key_match("Endpoint"))
-			ret = parse_endpoint(&ctx->last_peer->endpoint.addr, value);
-		else if (key_match("PublicKey")) {
+			ctx->last_peer->endpoint_value = strdup(value);
+		else if (key_match("AddressFamily")) {
+			ret = parse_address_family(&ctx->last_peer->addr_fam, value);
+		} else if (key_match("PublicKey")) {
 			ret = parse_key(ctx->last_peer->public_key, value);
 			if (ret)
 				ctx->last_peer->flags |= WGPEER_HAS_PUBLIC_KEY;
@@ -535,19 +551,22 @@ bool config_read_init(struct config_ctx *ctx, bool append)
 	return true;
 }
 
-struct wgdevice *config_read_finish(struct config_ctx *ctx)
+struct wgdevice *config_read_finish(struct wgdevice *device)
 {
 	struct wgpeer *peer;
 
-	for_each_wgpeer(ctx->device, peer) {
+	for_each_wgpeer(device, peer) {
 		if (!(peer->flags & WGPEER_HAS_PUBLIC_KEY)) {
 			fprintf(stderr, "A peer is missing a public key\n");
 			goto err;
 		}
+
+		if (!parse_endpoint(&peer->endpoint.addr, peer->endpoint_value, peer->addr_fam))
+			goto err;
 	}
-	return ctx->device;
+	return device;
 err:
-	free_wgdevice(ctx->device);
+	free_wgdevice(device);
 	return NULL;
 }
 
@@ -619,7 +638,11 @@ struct wgdevice *config_read_cmd(const char *argv[], int argc)
 			argv += 1;
 			argc -= 1;
 		} else if (!strcmp(argv[0], "endpoint") && argc >= 2 && peer) {
-			if (!parse_endpoint(&peer->endpoint.addr, argv[1]))
+			peer->endpoint_value = strdup(argv[1]);
+			argv += 2;
+			argc -= 2;
+		} else if (!strcmp(argv[0], "address-family") && argc >= 2 && peer) {
+			if (!parse_address_family(&peer->addr_fam, argv[1]))
 				goto error;
 			argv += 2;
 			argc -= 2;
diff --git a/src/config.h b/src/config.h
index 443cf21..6f81da2 100644
--- a/src/config.h
+++ b/src/config.h
@@ -22,6 +22,6 @@ struct config_ctx {
 struct wgdevice *config_read_cmd(const char *argv[], int argc);
 bool config_read_init(struct config_ctx *ctx, bool append);
 bool config_read_line(struct config_ctx *ctx, const char *line);
-struct wgdevice *config_read_finish(struct config_ctx *ctx);
+struct wgdevice *config_read_finish(struct wgdevice *device);
 
 #endif
diff --git a/src/containers.h b/src/containers.h
index a82e8dd..c111621 100644
--- a/src/containers.h
+++ b/src/containers.h
@@ -52,12 +52,15 @@ struct wgpeer {
 	uint8_t public_key[WG_KEY_LEN];
 	uint8_t preshared_key[WG_KEY_LEN];
 
+	char *endpoint_value;
 	union {
 		struct sockaddr addr;
 		struct sockaddr_in addr4;
 		struct sockaddr_in6 addr6;
 	} endpoint;
 
+	int addr_fam;
+
 	struct timespec64 last_handshake_time;
 	uint64_t rx_bytes, tx_bytes;
 	uint16_t persistent_keepalive_interval;
@@ -99,6 +102,8 @@ static inline void free_wgdevice(struct wgdevice *dev)
 	for (struct wgpeer *peer = dev->first_peer, *np = peer ? peer->next_peer : NULL; peer; peer = np, np = peer ? peer->next_peer : NULL) {
 		for (struct wgallowedip *allowedip = peer->first_allowedip, *na = allowedip ? allowedip->next_allowedip : NULL; allowedip; allowedip = na, na = allowedip ? allowedip->next_allowedip : NULL)
 			free(allowedip);
+		if (peer->endpoint_value)
+			free(peer->endpoint_value);
 		free(peer);
 	}
 	free(dev);
diff --git a/src/man/wg.8 b/src/man/wg.8
index a5d8bcf..48f084d 100644
--- a/src/man/wg.8
+++ b/src/man/wg.8
@@ -55,7 +55,7 @@ transfer-rx, transfer-tx, persistent-keepalive.
 Shows the current configuration of \fI<interface>\fP in the format described
 by \fICONFIGURATION FILE FORMAT\fP below.
 .TP
-\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fIfwmark\fP \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP \fI<base64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP] [\fIendpoint\fP \fI<ip>:<port>\fP] [\fIpersistent-keepalive\fP \fI<interval seconds>\fP] [\fIallowed-ips\fP \fI<ip1>/<cidr1>\fP[,\fI<ip2>/<cidr2>\fP]...] ]...
+\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fIfwmark\fP \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP \fI<base64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP] [\fIendpoint\fP \fI<ip>:<port>\fP] [\fIaddress-family\fP \fI<family>\fP] [\fIpersistent-keepalive\fP \fI<interval seconds>\fP] [\fIallowed-ips\fP \fI<ip1>/<cidr1>\fP[,\fI<ip2>/<cidr2>\fP]...] ]...
 Sets configuration values for the specified \fI<interface>\fP. Multiple
 \fIpeer\fPs may be specified, and if the \fIremove\fP argument is given
 for a peer, that peer is removed, not configured. If \fIlisten-port\fP
@@ -167,6 +167,12 @@ port number. This endpoint will be updated automatically to the most recent
 source IP address and port of correctly authenticated packets from the peer.
 Optional.
 .IP \(bu
+AddressFamily \(em one of \fIinet\fP, \fIinet6\fP or \fIunspec\fP. When a
+hostname is given for \fIEndpoint\fP, setting this to \fIinet\fP or
+\fIinet6\fP will allow only addresses of the given family to be
+used. Defaults to \fIunspec\fP, which causes the first returned address of
+any type to be used.
+.IP \(bu
 PersistentKeepalive \(em a seconds interval, between 1 and 65535 inclusive, of
 how often to send an authenticated empty packet to the peer for the purpose of keeping a
 stateful firewall or NAT mapping valid persistently. For example, if the interface
diff --git a/src/set.c b/src/set.c
index 75560fd..20ee85e 100644
--- a/src/set.c
+++ b/src/set.c
@@ -18,13 +18,20 @@ int set_main(int argc, const char *argv[])
 	int ret = 1;
 
 	if (argc < 3) {
-		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
+		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [address-family <family>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
 		return 1;
 	}
 
 	device = config_read_cmd(argv + 2, argc - 2);
 	if (!device)
 		goto cleanup;
+
+	device = config_read_finish(device);
+	if (!device) {
+		fprintf(stderr, "Invalid configuration\n");
+		goto cleanup;
+	}
+
 	strncpy(device->name, argv[1], IFNAMSIZ -  1);
 	device->name[IFNAMSIZ - 1] = '\0';
 
diff --git a/src/setconf.c b/src/setconf.c
index 1c5b138..c90fd30 100644
--- a/src/setconf.c
+++ b/src/setconf.c
@@ -127,7 +127,7 @@ int setconf_main(int argc, const char *argv[])
 			goto cleanup;
 		}
 	}
-	device = config_read_finish(&ctx);
+	device = config_read_finish(ctx.device);
 	if (!device) {
 		fprintf(stderr, "Invalid configuration\n");
 		goto cleanup;
-- 
2.39.2

