Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6253C61CE8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Aug 2023 20:19:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96abf9c7;
	Thu, 17 Aug 2023 20:12:21 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d3b4a8f7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Aug 2023 20:12:16 +0000 (UTC)
Received: janet.servers.dxld.at; Thu, 17 Aug 2023 22:12:16 +0200
From: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
Subject: [PATCH 3/5] Support binding sockets to address and netdev for
 multihomed hosts
Date: Thu, 17 Aug 2023 22:11:36 +0200
Message-Id: <20230817201138.930780-3-dxld@darkboxed.org>
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

Signed-off-by: Daniel Gröber <dxld@darkboxed.org>
---
 src/config.c      | 116 +++++++++++++++++++++++++++-------------------
 src/containers.h  |  33 +++++++++++--
 src/ipc-freebsd.h |   4 ++
 src/ipc-linux.h   |  38 ++++++++++++++-
 src/ipc-openbsd.h |   4 ++
 src/ipc-uapi.h    |   2 +
 src/ipc-windows.h |   4 ++
 src/man/wg.8      |  27 +++++++----
 src/set.c         |   2 +-
 src/show.c        |  65 +++++++++++++++++++++++---
 src/show.h        |  13 ++++++
 src/showconf.c    |  12 +++--
 12 files changed, 246 insertions(+), 74 deletions(-)
 create mode 100644 src/show.h

diff --git a/src/config.c b/src/config.c
index f9980fe..01c73f9 100644
--- a/src/config.c
+++ b/src/config.c
@@ -36,44 +36,6 @@ static const char *get_value(const char *line, const char *key)
 	return line + keylen;
 }
 
-static inline bool parse_port(uint16_t *port, uint32_t *flags, const char *value)
-{
-	int ret;
-	struct addrinfo *resolved;
-	struct addrinfo hints = {
-		.ai_family = AF_UNSPEC,
-		.ai_socktype = SOCK_DGRAM,
-		.ai_protocol = IPPROTO_UDP,
-		.ai_flags = AI_PASSIVE
-	};
-
-	if (!strlen(value)) {
-		fprintf(stderr, "Unable to parse empty port\n");
-		return false;
-	}
-
-	ret = getaddrinfo(NULL, value, &hints, &resolved);
-	if (ret) {
-		fprintf(stderr, "%s: `%s'\n", ret == EAI_SYSTEM ? strerror(errno) : gai_strerror(ret), value);
-		return false;
-	}
-
-	ret = -1;
-	if (resolved->ai_family == AF_INET && resolved->ai_addrlen == sizeof(struct sockaddr_in)) {
-		*port = ntohs(((struct sockaddr_in *)resolved->ai_addr)->sin_port);
-		ret = 0;
-	} else if (resolved->ai_family == AF_INET6 && resolved->ai_addrlen == sizeof(struct sockaddr_in6)) {
-		*port = ntohs(((struct sockaddr_in6 *)resolved->ai_addr)->sin6_port);
-		ret = 0;
-	} else
-		fprintf(stderr, "Neither IPv4 nor IPv6 address found: `%s'\n", value);
-
-	freeaddrinfo(resolved);
-	if (!ret)
-		*flags |= WGDEVICE_HAS_LISTEN_PORT;
-	return ret == 0;
-}
-
 static inline bool parse_fwmark(uint32_t *fwmark, uint32_t *flags, const char *value)
 {
 	unsigned long ret;
@@ -192,10 +154,12 @@ static inline int parse_dns_retries(void)
 	return (int)ret;
 }
 
-static inline bool parse_endpoint(struct sockaddr *endpoint, const char *value, int family)
+static inline bool parse_endpoint(struct sockaddr_inet *endpoint, const char *value, int family, int allow_retry)
 {
+	bool ok;
 	char *mutable = strdup(value);
 	char *begin, *end;
+	char *scope = NULL;
 	int ret, retries = parse_dns_retries();
 	struct addrinfo *resolved;
 	struct addrinfo hints = {
@@ -203,6 +167,8 @@ static inline bool parse_endpoint(struct sockaddr *endpoint, const char *value,
 		.ai_socktype = SOCK_DGRAM,
 		.ai_protocol = IPPROTO_UDP
 	};
+	if (!allow_retry)
+		retries = 0;
 	if (!mutable) {
 		perror("strdup");
 		return false;
@@ -214,16 +180,20 @@ static inline bool parse_endpoint(struct sockaddr *endpoint, const char *value,
 	}
 	if (mutable[0] == '[') {
 		begin = &mutable[1];
+
+	        scope = strchr(begin, '%');
+		if (scope)
+			scope++;
 		end = strchr(mutable, ']');
 		if (!end) {
 			free(mutable);
-			fprintf(stderr, "Unable to find matching brace of endpoint: `%s'\n", value);
+			fprintf(stderr, "Unable to find matching brace in address: `%s'\n", value);
 			return false;
 		}
 		*end++ = '\0';
 		if (*end++ != ':' || !*end) {
 			free(mutable);
-			fprintf(stderr, "Unable to find port of endpoint: `%s'\n", value);
+			fprintf(stderr, "Unable to find port in address: `%s'\n", value);
 			return false;
 		}
 	} else {
@@ -231,7 +201,7 @@ static inline bool parse_endpoint(struct sockaddr *endpoint, const char *value,
 		end = strrchr(mutable, ':');
 		if (!end || !*(end + 1)) {
 			free(mutable);
-			fprintf(stderr, "Unable to find port of endpoint: `%s'\n", value);
+			fprintf(stderr, "Unable to find port in address: `%s'\n", value);
 			return false;
 		}
 		*end++ = '\0';
@@ -269,16 +239,59 @@ static inline bool parse_endpoint(struct sockaddr *endpoint, const char *value,
 	    (resolved->ai_family == AF_INET6 && resolved->ai_addrlen == sizeof(struct sockaddr_in6)))
 		memcpy(endpoint, resolved->ai_addr, resolved->ai_addrlen);
 	else {
-		freeaddrinfo(resolved);
-		free(mutable);
+		ok = false;
 		fprintf(stderr, "Neither IPv4 nor IPv6 address found: `%s'\n", value);
-		return false;
+		goto out;
+	}
+	if(scope) {
+		unsigned ifindex = if_nametoindex(scope);
+		if (resolved->ai_family == AF_INET)
+			endpoint->sin_scope_id = ifindex;
+		else if (resolved->ai_family == AF_INET6)
+			endpoint->sin6_scope_id = ifindex;
 	}
+
+	ok = true;
+out:
 	freeaddrinfo(resolved);
 	free(mutable);
+	return ok;
+}
+
+
+static inline bool parse_listen(struct sockaddr_inet *listen, uint32_t *flags, const char *value)
+{
+	if (!parse_endpoint(listen, value, AF_UNSPEC, /*allow_retry=*/0))
+		return false;
+
+	listen->sinet_port = ntohs(listen->sinet_port);
+
+	*flags |= WGDEVICE_HAS_LISTEN;
 	return true;
 }
 
+static inline bool parse_port(struct sockaddr_inet *listen, uint32_t *flags, const char *value)
+{
+	bool err;
+	char *addr_str = NULL;
+	asprintf(&addr_str, "[::]:%s", value);
+	if (!addr_str) {
+		perror("asprintf");
+		return false;
+	}
+
+	err = parse_listen(listen, flags, addr_str);
+	free(addr_str);
+
+	listen->sinet_family = AF_UNSPEC;
+
+	if (!err) {
+		*flags |= WGDEVICE_HAS_LISTEN_PORT;
+		*flags &= ~WGDEVICE_HAS_LISTEN;
+	}
+	return err;
+}
+
 static inline bool parse_address_family(int *family, const char *value)
 {
 	if (strcmp(value, "inet") == 0)
@@ -457,7 +470,9 @@ static bool process_line(struct config_ctx *ctx, const char *line)
 
 	if (ctx->is_device_section) {
 		if (key_match("ListenPort"))
-			ret = parse_port(&ctx->device->listen_port, &ctx->device->flags, value);
+			ret = parse_port(&ctx->device->listen_inet, &ctx->device->flags, value);
+		else if (key_match("Listen"))
+			ret = parse_listen(&ctx->device->listen_inet, &ctx->device->flags, value);
 		else if (key_match("FwMark"))
 			ret = parse_fwmark(&ctx->device->fwmark, &ctx->device->flags, value);
 		else if (key_match("PrivateKey")) {
@@ -561,7 +576,7 @@ struct wgdevice *config_read_finish(struct wgdevice *device)
 			goto err;
 		}
 
-		if (!parse_endpoint(&peer->endpoint.addr, peer->endpoint_value, peer->addr_fam))
+		if (!parse_endpoint(&peer->endpoint.addr_inet, peer->endpoint_value, peer->addr_fam, /*allow_retry=*/1))
 			goto err;
 	}
 	return device;
@@ -600,7 +615,12 @@ struct wgdevice *config_read_cmd(const char *argv[], int argc)
 	}
 	while (argc > 0) {
 		if (!strcmp(argv[0], "listen-port") && argc >= 2 && !peer) {
-			if (!parse_port(&device->listen_port, &device->flags, argv[1]))
+			if (!parse_port(&device->listen_inet, &device->flags, argv[1]))
+				goto error;
+			argv += 2;
+			argc -= 2;
+		} else if (!strcmp(argv[0], "listen") && argc >= 2 && !peer) {
+			if (!parse_listen(&device->listen_inet, &device->flags, argv[1]))
 				goto error;
 			argv += 2;
 			argc -= 2;
diff --git a/src/containers.h b/src/containers.h
index c111621..2f3d88f 100644
--- a/src/containers.h
+++ b/src/containers.h
@@ -13,7 +13,7 @@
 #include <net/if.h>
 #include <netinet/in.h>
 #if defined(__linux__)
-#include <linux/wireguard.h>
+#include "uapi/linux/linux/wireguard.h"
 #elif defined(__OpenBSD__)
 #include <net/if_wg.h>
 #endif
@@ -28,6 +28,22 @@ struct timespec64 {
 	int64_t tv_nsec;
 };
 
+struct sockaddr_inet {
+	sa_family_t sinet_family;
+	in_port_t   sinet_port;
+	union {
+		struct {
+			struct in_addr sin_addr;
+			uint32_t sin_scope_id; // on top of sockaddr_in padding
+		};
+		struct {
+			uint32_t sin6_flowinfo;
+			struct in6_addr sin6_addr;
+			uint32_t sin6_scope_id;
+		};
+	};
+};
+
 struct wgallowedip {
 	uint16_t family;
 	union {
@@ -57,6 +73,7 @@ struct wgpeer {
 		struct sockaddr addr;
 		struct sockaddr_in addr4;
 		struct sockaddr_in6 addr6;
+		struct sockaddr_inet addr_inet;
 	} endpoint;
 
 	int addr_fam;
@@ -74,7 +91,8 @@ enum {
 	WGDEVICE_HAS_PRIVATE_KEY = 1U << 1,
 	WGDEVICE_HAS_PUBLIC_KEY = 1U << 2,
 	WGDEVICE_HAS_LISTEN_PORT = 1U << 3,
-	WGDEVICE_HAS_FWMARK = 1U << 4
+	WGDEVICE_HAS_LISTEN = 1U << 4,
+	WGDEVICE_HAS_FWMARK = 1U << 5,
 };
 
 struct wgdevice {
@@ -87,7 +105,16 @@ struct wgdevice {
 	uint8_t private_key[WG_KEY_LEN];
 
 	uint32_t fwmark;
-	uint16_t listen_port;
+	union {
+		struct sockaddr listen;
+		struct sockaddr_in listen4;
+		struct sockaddr_in6 listen6;
+		struct sockaddr_inet listen_inet;
+		struct {
+			sa_family_t listen_family;
+			in_port_t listen_port;
+		};
+	};
 
 	struct wgpeer *first_peer, *last_peer;
 };
diff --git a/src/ipc-freebsd.h b/src/ipc-freebsd.h
index fa74edd..a06b245 100644
--- a/src/ipc-freebsd.h
+++ b/src/ipc-freebsd.h
@@ -272,6 +272,10 @@ static int kernel_set_device(struct wgdevice *dev)
 		nvlist_add_binary(nvl_device, "private-key", dev->private_key, sizeof(dev->private_key));
 	if (dev->flags & WGDEVICE_HAS_LISTEN_PORT)
 		nvlist_add_number(nvl_device, "listen-port", dev->listen_port);
+	if (dev->flags & WGDEVICE_HAS_LISTEN) {
+		errno = EOPNOTSUPP;
+		goto err;
+	}
 	if (dev->flags & WGDEVICE_HAS_FWMARK)
 		nvlist_add_number(nvl_device, "user-cookie", dev->fwmark);
 	if (dev->flags & WGDEVICE_REPLACE_PEERS)
diff --git a/src/ipc-linux.h b/src/ipc-linux.h
index d29c0c5..3e3f27c 100644
--- a/src/ipc-linux.h
+++ b/src/ipc-linux.h
@@ -17,11 +17,11 @@
 #include <linux/if_link.h>
 #include <linux/netlink.h>
 #include <linux/rtnetlink.h>
-#include <linux/wireguard.h>
 #include <netinet/in.h>
 #include "containers.h"
 #include "encoding.h"
 #include "netlink.h"
+#include "uapi/linux/linux/wireguard.h"
 
 #define IPC_SUPPORTS_KERNEL_INTERFACE
 
@@ -163,6 +163,17 @@ again:
 			mnl_attr_put(nlh, WGDEVICE_A_PRIVATE_KEY, sizeof(dev->private_key), dev->private_key);
 		if (dev->flags & WGDEVICE_HAS_LISTEN_PORT)
 			mnl_attr_put_u16(nlh, WGDEVICE_A_LISTEN_PORT, dev->listen_port);
+		if (dev->flags & WGDEVICE_HAS_LISTEN) {
+			mnl_attr_put_u16(nlh, WGDEVICE_A_LISTEN_PORT, dev->listen_port);
+			if (dev->listen_family == AF_INET) {
+				mnl_attr_put(nlh, WGDEVICE_A_LISTEN_ADDR, sizeof(struct in_addr), &dev->listen4.sin_addr);
+				mnl_attr_put_u32(nlh, WGDEVICE_A_LISTEN_IFINDEX, dev->listen_inet.sin_scope_id);
+			} else if (dev->listen_family == AF_INET6) {
+				mnl_attr_put(nlh, WGDEVICE_A_LISTEN_ADDR, sizeof(struct in6_addr), &dev->listen6.sin6_addr);
+				mnl_attr_put_u32(nlh, WGDEVICE_A_LISTEN_IFINDEX, dev->listen_inet.sin6_scope_id);
+			}
+		}
+
 		if (dev->flags & WGDEVICE_HAS_FWMARK)
 			mnl_attr_put_u32(nlh, WGDEVICE_A_FWMARK, dev->fwmark);
 		if (dev->flags & WGDEVICE_REPLACE_PEERS)
@@ -406,6 +417,8 @@ static int parse_device(const struct nlattr *attr, void *data)
 {
 	struct wgdevice *device = data;
 
+	uint32_t listen_ifindex = 0;
+
 	switch (mnl_attr_get_type(attr)) {
 	case WGDEVICE_A_UNSPEC:
 		break;
@@ -435,6 +448,24 @@ static int parse_device(const struct nlattr *attr, void *data)
 		if (!mnl_attr_validate(attr, MNL_TYPE_U16))
 			device->listen_port = mnl_attr_get_u16(attr);
 		break;
+	case WGDEVICE_A_LISTEN_ADDR: {
+		union {
+			struct in_addr addr4;
+			struct in6_addr addr6;
+		} *u = mnl_attr_get_payload(attr);
+		if (mnl_attr_get_payload_len(attr) == sizeof(u->addr4)) {
+			device->listen4.sin_family = AF_INET;
+			memcpy(&device->listen4.sin_addr, &u->addr4, sizeof(device->listen4.sin_addr));
+		} else if (mnl_attr_get_payload_len(attr) == sizeof(u->addr6)) {
+			device->listen6.sin6_family = AF_INET6;
+			memcpy(&device->listen6.sin6_addr, &u->addr6, sizeof(device->listen6.sin6_addr));
+		}
+		break;
+	}
+	case WGDEVICE_A_LISTEN_IFINDEX:
+		if (!mnl_attr_validate(attr, MNL_TYPE_U32))
+			listen_ifindex = mnl_attr_get_u32(attr);
+		break;
 	case WGDEVICE_A_FWMARK:
 		if (!mnl_attr_validate(attr, MNL_TYPE_U32))
 			device->fwmark = mnl_attr_get_u32(attr);
@@ -443,6 +474,11 @@ static int parse_device(const struct nlattr *attr, void *data)
 		return mnl_attr_parse_nested(attr, parse_peers, device);
 	}
 
+	if (listen_ifindex && device->listen_family == AF_INET)
+		device->listen_inet.sin_scope_id = listen_ifindex;
+	else if (listen_ifindex && device->listen_family == AF_INET6)
+		device->listen6.sin6_scope_id = listen_ifindex;
+
 	return MNL_CB_OK;
 }
 
diff --git a/src/ipc-openbsd.h b/src/ipc-openbsd.h
index 03fbdb5..eddec45 100644
--- a/src/ipc-openbsd.h
+++ b/src/ipc-openbsd.h
@@ -212,6 +212,10 @@ static int kernel_set_device(struct wgdevice *dev)
 		wg_iface->i_port = dev->listen_port;
 		wg_iface->i_flags |= WG_INTERFACE_HAS_PORT;
 	}
+	if (dev->flags & WGDEVICE_HAS_LISTEN) {
+		errno = EOPNOTSUPP;
+		goto out;
+	}
 
 	if (dev->flags & WGDEVICE_HAS_FWMARK) {
 		wg_iface->i_rtable = dev->fwmark;
diff --git a/src/ipc-uapi.h b/src/ipc-uapi.h
index f582916..7079fbd 100644
--- a/src/ipc-uapi.h
+++ b/src/ipc-uapi.h
@@ -47,6 +47,8 @@ static int userspace_set_device(struct wgdevice *dev)
 	}
 	if (dev->flags & WGDEVICE_HAS_LISTEN_PORT)
 		fprintf(f, "listen_port=%u\n", dev->listen_port);
+	if (dev->flags & WGDEVICE_HAS_LISTEN)
+		return -EOPNOTSUPP;
 	if (dev->flags & WGDEVICE_HAS_FWMARK)
 		fprintf(f, "fwmark=%u\n", dev->fwmark);
 	if (dev->flags & WGDEVICE_REPLACE_PEERS)
diff --git a/src/ipc-windows.h b/src/ipc-windows.h
index d237fc9..77e32b3 100644
--- a/src/ipc-windows.h
+++ b/src/ipc-windows.h
@@ -381,6 +381,10 @@ static int kernel_set_device(struct wgdevice *dev)
 		wg_iface->ListenPort = dev->listen_port;
 		wg_iface->Flags |= WG_IOCTL_INTERFACE_HAS_LISTEN_PORT;
 	}
+	if (dev->flags & WGDEVICE_HAS_LISTEN) {
+		errno = EOPNOTSUPP;
+		goto out;
+	}
 
 	if (dev->flags & WGDEVICE_REPLACE_PEERS)
 		wg_iface->Flags |= WG_IOCTL_INTERFACE_REPLACE_PEERS;
diff --git a/src/man/wg.8 b/src/man/wg.8
index 48f084d..0310fd0 100644
--- a/src/man/wg.8
+++ b/src/man/wg.8
@@ -36,7 +36,7 @@ Sub-commands that take an INTERFACE must be passed a WireGuard interface.
 .SH COMMANDS
 
 .TP
-\fBshow\fP { \fI<interface>\fP | \fIall\fP | \fIinterfaces\fP } [\fIpublic-key\fP | \fIprivate-key\fP | \fIlisten-port\fP | \fIfwmark\fP | \fIpeers\fP | \fIpreshared-keys\fP | \fIendpoints\fP | \fIallowed-ips\fP | \fIlatest-handshakes\fP | \fIpersistent-keepalive\fP | \fItransfer\fP | \fIdump\fP]
+\fBshow\fP { \fI<interface>\fP | \fIall\fP | \fIinterfaces\fP } [\fIpublic-key\fP | \fIprivate-key\fP | \fIlisten-port\fP | \fIlisten\fP | \fIfwmark\fP | \fIpeers\fP | \fIpreshared-keys\fP | \fIendpoints\fP | \fIallowed-ips\fP | \fIlatest-handshakes\fP | \fIpersistent-keepalive\fP | \fItransfer\fP | \fIdump\fP]
 Shows current WireGuard configuration and runtime information of specified \fI<interface>\fP.
 If no \fI<interface>\fP is specified, \fI<interface>\fP defaults to \fIall\fP.
 If \fIinterfaces\fP is specified, prints a list of all WireGuard interfaces,
@@ -46,7 +46,7 @@ meant for the terminal. Otherwise, prints specified information grouped by
 newlines and tabs, meant to be used in scripts. For this script-friendly display,
 if \fIall\fP is specified, then the first field for all categories of information
 is the interface name. If \fPdump\fP is specified, then several lines are printed;
-the first contains in order separated by tab: private-key, public-key, listen-port,
+the first contains in order separated by tab: private-key, public-key, listen(-port),
 fwmark. Subsequent lines are printed for each peer and contain in order separated
 by tab: public-key, preshared-key, endpoint, allowed-ips, latest-handshake,
 transfer-rx, transfer-tx, persistent-keepalive.
@@ -55,11 +55,13 @@ transfer-rx, transfer-tx, persistent-keepalive.
 Shows the current configuration of \fI<interface>\fP in the format described
 by \fICONFIGURATION FILE FORMAT\fP below.
 .TP
-\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fIfwmark\fP \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP \fI<base64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP] [\fIendpoint\fP \fI<ip>:<port>\fP] [\fIaddress-family\fP \fI<family>\fP] [\fIpersistent-keepalive\fP \fI<interval seconds>\fP] [\fIallowed-ips\fP \fI<ip1>/<cidr1>\fP[,\fI<ip2>/<cidr2>\fP]...] ]...
+\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fIlisten\fP \fI<ip>[%<iface>]:<port>\fP] [\fIfwmark\fP \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP \fI<base64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP] [\fIendpoint\fP \fI<ip>:<port>\fP] [\fIaddress-family\fP \fI<family>\fP] [\fIpersistent-keepalive\fP \fI<interval seconds>\fP] [\fIallowed-ips\fP \fI<ip1>/<cidr1>\fP[,\fI<ip2>/<cidr2>\fP]...] ]...
 Sets configuration values for the specified \fI<interface>\fP. Multiple
 \fIpeer\fPs may be specified, and if the \fIremove\fP argument is given
-for a peer, that peer is removed, not configured. If \fIlisten-port\fP
-is not specified, or set to 0, the port will be chosen randomly when the
+for a peer, that peer is removed, not configured. The \fIlisten-port\fP
+and \fIlisten\fP options override each other. If a \fIport\fP is not set
+using either after the interface is created, or is set to 0, the port will
+be chosen randomly when the
 interface comes up. Both \fIprivate-key\fP and \fIpreshared-key\fP must
 be files, because command line arguments are not considered private on
 most systems but if you are using
@@ -139,6 +141,13 @@ PrivateKeyFile \(em path to a file containing a base64 private key. May be used
 ListenPort \(em a 16-bit port for listening. Optional; if not specified, chosen
 randomly.
 .IP \(bu
+Listen \(em an address:port tupel to use for listening. A network interface
+to bind to may be specified using the [address%iface]:port form. Note that
+an IPv4 address may be spcified inside square brackets, even together with an
+iface. A hostname may be used instead of a numeric IP but no resolution
+retries will be done so use of DNS is discouraged here. Optional. Overrides
+ListenPort.
+.IP \(bu
 FwMark \(em a 32-bit fwmark for outgoing packets. If set to 0 or "off", this
 option is disabled. May be specified in hexadecimal by prepending "0x". Optional.
 .P
@@ -162,10 +171,10 @@ which outgoing traffic for this peer is directed. The catch-all
 \fI::/0\fP may be specified for matching all IPv6 addresses. May be specified
 multiple times.
 .IP \(bu
-Endpoint \(em an endpoint IP or hostname, followed by a colon, and then a
-port number. This endpoint will be updated automatically to the most recent
-source IP address and port of correctly authenticated packets from the peer.
-Optional.
+Endpoint \(em an endpoint IP (optionally enclosed in) or hostname,
+followed by a colon, and then a port number. This endpoint will be updated
+automatically to the most recent source IP address and port of correctly
+authenticated packets from the peer.  Optional.
 .IP \(bu
 AddressFamily \(em one of \fIinet\fP, \fIinet6\fP or \fIunspec\fP. When a
 hostname is given for \fIEndpoint\fP, setting this to \fIinet\fP or
diff --git a/src/set.c b/src/set.c
index 20ee85e..30482bd 100644
--- a/src/set.c
+++ b/src/set.c
@@ -18,7 +18,7 @@ int set_main(int argc, const char *argv[])
 	int ret = 1;
 
 	if (argc < 3) {
-		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [address-family <family>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
+		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [listen <addr>%%<iface>:<port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [address-family <family>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
 		return 1;
 	}
 
diff --git a/src/show.c b/src/show.c
index 13777cf..754f952 100644
--- a/src/show.c
+++ b/src/show.c
@@ -18,6 +18,7 @@
 #include <time.h>
 #include <netdb.h>
 
+#include "show.h"
 #include "containers.h"
 #include "ipc.h"
 #include "terminal.h"
@@ -103,7 +104,7 @@ static char *ip(const struct wgallowedip *ip)
 	return buf;
 }
 
-static char *endpoint(const struct sockaddr *addr)
+char *print_endpoint(const struct sockaddr *addr)
 {
 	char host[4096 + 1];
 	char service[512 + 1];
@@ -126,6 +127,47 @@ static char *endpoint(const struct sockaddr *addr)
 	return buf;
 }
 
+char *print_sockaddr_inet(const struct sockaddr_inet *sa_const)
+{
+	char host[4096 + 1], service[512 + 1], ifname_buf[IF_NAMESIZE+10] = "%";
+	static char buf[sizeof(host) + sizeof(service) + sizeof(ifname_buf) + 4];
+        struct sockaddr_inet sa = *sa_const;
+	socklen_t sa_len = 0;
+	unsigned int ifindex = 0;
+	int ret;
+
+	sa.sinet_port = htons(sa.sinet_port);
+
+	if (sa.sinet_family == AF_INET) {
+		sa_len = sizeof(struct sockaddr_in);
+		ifindex = sa.sin_scope_id;
+	} else if (sa.sinet_family == AF_INET6) {
+		sa_len = sizeof(struct sockaddr_in6);
+		ifindex = sa.sin6_scope_id;
+	}
+	ret = getnameinfo((struct sockaddr*)&sa, sa_len, host, sizeof(host), service, sizeof(service), NI_DGRAM | NI_NUMERICSERV | NI_NUMERICHOST);
+	if (ret) {
+		buf[0] = '\0';
+		goto out;
+	}
+
+	const char *ifname = "";
+	if (ifindex) {
+		ifname = if_indextoname(ifindex , ifname_buf+1);
+		if (!ifname) {
+			snprintf(ifname_buf, sizeof(ifname_buf), "%%%u", ifindex);
+			ifname = ifname_buf;
+		}
+	}
+
+	if ((sa.sinet_family == AF_INET6 && strchr(host, ':')) || ifindex)
+		snprintf(buf, sizeof(buf), "[%s%s]:%s", host, ifname, service);
+	else
+		snprintf(buf, sizeof(buf), "%s:%s", host, service);
+out:
+	return buf;
+}
+
 static size_t pretty_time(char *buf, const size_t len, unsigned long long left)
 {
 	size_t offset = 0;
@@ -202,7 +244,7 @@ static char *bytes(uint64_t b)
 static const char *COMMAND_NAME;
 static void show_usage(void)
 {
-	fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces } [public-key | private-key | listen-port | fwmark | peers | preshared-keys | endpoints | allowed-ips | latest-handshakes | transfer | persistent-keepalive | dump]\n", PROG_NAME, COMMAND_NAME);
+	fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces } [public-key | private-key | listen-port | listen | fwmark | peers | preshared-keys | endpoints | allowed-ips | latest-handshakes | transfer | persistent-keepalive | dump]\n", PROG_NAME, COMMAND_NAME);
 }
 
 static void pretty_print(struct wgdevice *device)
@@ -216,7 +258,9 @@ static void pretty_print(struct wgdevice *device)
 		terminal_printf("  " TERMINAL_BOLD "public key" TERMINAL_RESET ": %s\n", key(device->public_key));
 	if (device->flags & WGDEVICE_HAS_PRIVATE_KEY)
 		terminal_printf("  " TERMINAL_BOLD "private key" TERMINAL_RESET ": %s\n", masked_key(device->private_key));
-	if (device->listen_port)
+	if (device->listen_family != AF_UNSPEC)
+		terminal_printf("  " TERMINAL_BOLD "listening on" TERMINAL_RESET ": %s\n", print_sockaddr_inet(&device->listen_inet));
+	else if (device->listen_port)
 		terminal_printf("  " TERMINAL_BOLD "listening port" TERMINAL_RESET ": %u\n", device->listen_port);
 	if (device->fwmark)
 		terminal_printf("  " TERMINAL_BOLD "fwmark" TERMINAL_RESET ": 0x%x\n", device->fwmark);
@@ -229,7 +273,7 @@ static void pretty_print(struct wgdevice *device)
 		if (peer->flags & WGPEER_HAS_PRESHARED_KEY)
 			terminal_printf("  " TERMINAL_BOLD "preshared key" TERMINAL_RESET ": %s\n", masked_key(peer->preshared_key));
 		if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6)
-			terminal_printf("  " TERMINAL_BOLD "endpoint" TERMINAL_RESET ": %s\n", endpoint(&peer->endpoint.addr));
+			terminal_printf("  " TERMINAL_BOLD "endpoint" TERMINAL_RESET ": %s\n", print_endpoint(&peer->endpoint.addr));
 		terminal_printf("  " TERMINAL_BOLD "allowed ips" TERMINAL_RESET ": ");
 		if (peer->first_allowedip) {
 			for_each_wgallowedip(peer, allowedip)
@@ -259,7 +303,10 @@ static void dump_print(struct wgdevice *device, bool with_interface)
 		printf("%s\t", device->name);
 	printf("%s\t", maybe_key(device->private_key, device->flags & WGDEVICE_HAS_PRIVATE_KEY));
 	printf("%s\t", maybe_key(device->public_key, device->flags & WGDEVICE_HAS_PUBLIC_KEY));
-	printf("%u\t", device->listen_port);
+	if (device->listen_family != AF_UNSPEC)
+		printf("%s\t", print_sockaddr_inet(&device->listen_inet));
+	else
+		printf("%u\t", device->listen_port);
 	if (device->fwmark)
 		printf("0x%x\n", device->fwmark);
 	else
@@ -270,7 +317,7 @@ static void dump_print(struct wgdevice *device, bool with_interface)
 		printf("%s\t", key(peer->public_key));
 		printf("%s\t", maybe_key(peer->preshared_key, peer->flags & WGPEER_HAS_PRESHARED_KEY));
 		if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6)
-			printf("%s\t", endpoint(&peer->endpoint.addr));
+			printf("%s\t", print_endpoint(&peer->endpoint.addr));
 		else
 			printf("(none)\t");
 		if (peer->first_allowedip) {
@@ -304,6 +351,10 @@ static bool ugly_print(struct wgdevice *device, const char *param, bool with_int
 		if (with_interface)
 			printf("%s\t", device->name);
 		printf("%u\n", device->listen_port);
+	} else if (!strcmp(param, "listen")) {
+		if (with_interface)
+			printf("%s\t", device->name);
+		printf("%s\n", print_sockaddr_inet(&device->listen_inet));
 	} else if (!strcmp(param, "fwmark")) {
 		if (with_interface)
 			printf("%s\t", device->name);
@@ -317,7 +368,7 @@ static bool ugly_print(struct wgdevice *device, const char *param, bool with_int
 				printf("%s\t", device->name);
 			printf("%s\t", key(peer->public_key));
 			if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6)
-				printf("%s\n", endpoint(&peer->endpoint.addr));
+				printf("%s\n", print_endpoint(&peer->endpoint.addr));
 			else
 				printf("(none)\n");
 		}
diff --git a/src/show.h b/src/show.h
new file mode 100644
index 0000000..3673b65
--- /dev/null
+++ b/src/show.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2015-2020 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
+ */
+
+#ifndef SHOW_H
+#define SHOW_H
+struct sockaddr_inet;
+
+char *print_endpoint(const struct sockaddr *addr);
+char *print_sockaddr_inet(const struct sockaddr_inet *addr);
+
+#endif
diff --git a/src/showconf.c b/src/showconf.c
index 62070dc..d165eb2 100644
--- a/src/showconf.c
+++ b/src/showconf.c
@@ -13,6 +13,7 @@
 #include <stdlib.h>
 #include <netdb.h>
 
+#include "show.h"
 #include "containers.h"
 #include "encoding.h"
 #include "ipc.h"
@@ -22,6 +23,8 @@ int showconf_main(int argc, const char *argv[])
 {
 	char base64[WG_KEY_LEN_BASE64];
 	char ip[INET6_ADDRSTRLEN];
+	char host[4096 + 1], service[512 + 1];
+	socklen_t addr_len = 0;
 	struct wgdevice *device = NULL;
 	struct wgpeer *peer;
 	struct wgallowedip *allowedip;
@@ -38,7 +41,9 @@ int showconf_main(int argc, const char *argv[])
 	}
 
 	printf("[Interface]\n");
-	if (device->listen_port)
+	if (device->listen_family != AF_UNSPEC)
+		printf("Listen = %s", print_sockaddr_inet(&device->listen_inet));
+	else if (device->listen_port)
 		printf("ListenPort = %u\n", device->listen_port);
 	if (device->fwmark)
 		printf("FwMark = 0x%x\n", device->fwmark);
@@ -72,11 +77,8 @@ int showconf_main(int argc, const char *argv[])
 		if (peer->first_allowedip)
 			printf("\n");
 
+		// TODO: use print_endpoint
 		if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6) {
-			char host[4096 + 1];
-			char service[512 + 1];
-			socklen_t addr_len = 0;
-
 			if (peer->endpoint.addr.sa_family == AF_INET)
 				addr_len = sizeof(struct sockaddr_in);
 			else if (peer->endpoint.addr.sa_family == AF_INET6)
-- 
2.39.2

