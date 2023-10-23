Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5AAC25B49
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Oct 2023 17:28:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2dce4b9;
	Mon, 23 Oct 2023 17:09:54 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9acbde71
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Oct 2023 17:09:42 +0000 (UTC)
Received: janet.servers.dxld.at; Mon, 23 Oct 2023 19:09:41 +0200
From: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
Subject: [PATCH v2 3/6] wg: Store sockaddr listen port in net-byte-order as is
 conventional
Date: Mon, 23 Oct 2023 19:08:57 +0200
Message-Id: <20231023170900.131473-3-dxld@darkboxed.org>
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

This will allow more codesharing with code dealing with the peer endpoints.

Signed-off-by: Daniel Gröber <dxld@darkboxed.org>
---
 src/config.c      |  2 --
 src/ipc-freebsd.h |  2 +-
 src/ipc-linux.h   |  6 +++---
 src/ipc-openbsd.h |  4 ++--
 src/ipc-uapi.h    |  2 +-
 src/ipc-windows.h |  4 ++--
 src/show.c        | 24 +++++++++++-------------
 src/showconf.c    |  2 +-
 8 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/src/config.c b/src/config.c
index 01c73f9..5c8594b 100644
--- a/src/config.c
+++ b/src/config.c
@@ -264,8 +264,6 @@ static inline bool parse_listen(struct sockaddr_inet *listen, uint32_t *flags, c
 	if (!parse_endpoint(listen, value, AF_UNSPEC, /*allow_retry=*/0))
 		return false;
 
-	listen->sinet_port = ntohs(listen->sinet_port);
-
 	*flags |= WGDEVICE_HAS_LISTEN;
 	return true;
 }
diff --git a/src/ipc-freebsd.h b/src/ipc-freebsd.h
index a06b245..75f692b 100644
--- a/src/ipc-freebsd.h
+++ b/src/ipc-freebsd.h
@@ -271,7 +271,7 @@ static int kernel_set_device(struct wgdevice *dev)
 	if (dev->flags & WGDEVICE_HAS_PRIVATE_KEY)
 		nvlist_add_binary(nvl_device, "private-key", dev->private_key, sizeof(dev->private_key));
 	if (dev->flags & WGDEVICE_HAS_LISTEN_PORT)
-		nvlist_add_number(nvl_device, "listen-port", dev->listen_port);
+		nvlist_add_number(nvl_device, "listen-port", ntohs(dev->listen_port));
 	if (dev->flags & WGDEVICE_HAS_LISTEN) {
 		errno = EOPNOTSUPP;
 		goto err;
diff --git a/src/ipc-linux.h b/src/ipc-linux.h
index 3e3f27c..735c49f 100644
--- a/src/ipc-linux.h
+++ b/src/ipc-linux.h
@@ -162,9 +162,9 @@ again:
 		if (dev->flags & WGDEVICE_HAS_PRIVATE_KEY)
 			mnl_attr_put(nlh, WGDEVICE_A_PRIVATE_KEY, sizeof(dev->private_key), dev->private_key);
 		if (dev->flags & WGDEVICE_HAS_LISTEN_PORT)
-			mnl_attr_put_u16(nlh, WGDEVICE_A_LISTEN_PORT, dev->listen_port);
+			mnl_attr_put_u16(nlh, WGDEVICE_A_LISTEN_PORT, ntohs(dev->listen_port));
 		if (dev->flags & WGDEVICE_HAS_LISTEN) {
-			mnl_attr_put_u16(nlh, WGDEVICE_A_LISTEN_PORT, dev->listen_port);
+			mnl_attr_put_u16(nlh, WGDEVICE_A_LISTEN_PORT, ntohs(dev->listen_port));
 			if (dev->listen_family == AF_INET) {
 				mnl_attr_put(nlh, WGDEVICE_A_LISTEN_ADDR, sizeof(struct in_addr), &dev->listen4.sin_addr);
 				mnl_attr_put_u32(nlh, WGDEVICE_A_LISTEN_IFINDEX, dev->listen_inet.sin_scope_id);
@@ -446,7 +446,7 @@ static int parse_device(const struct nlattr *attr, void *data)
 		break;
 	case WGDEVICE_A_LISTEN_PORT:
 		if (!mnl_attr_validate(attr, MNL_TYPE_U16))
-			device->listen_port = mnl_attr_get_u16(attr);
+			device->listen_port = htons(mnl_attr_get_u16(attr));
 		break;
 	case WGDEVICE_A_LISTEN_ADDR: {
 		union {
diff --git a/src/ipc-openbsd.h b/src/ipc-openbsd.h
index eddec45..478b4c6 100644
--- a/src/ipc-openbsd.h
+++ b/src/ipc-openbsd.h
@@ -96,7 +96,7 @@ static int kernel_get_device(struct wgdevice **device, const char *iface)
 	}
 
 	if (wg_iface->i_flags & WG_INTERFACE_HAS_PORT) {
-		dev->listen_port = wg_iface->i_port;
+		dev->listen_port = htons(wg_iface->i_port);
 		dev->flags |= WGDEVICE_HAS_LISTEN_PORT;
 	}
 
@@ -209,7 +209,7 @@ static int kernel_set_device(struct wgdevice *dev)
 	}
 
 	if (dev->flags & WGDEVICE_HAS_LISTEN_PORT) {
-		wg_iface->i_port = dev->listen_port;
+		wg_iface->i_port = ntohs(dev->listen_port);
 		wg_iface->i_flags |= WG_INTERFACE_HAS_PORT;
 	}
 	if (dev->flags & WGDEVICE_HAS_LISTEN) {
diff --git a/src/ipc-uapi.h b/src/ipc-uapi.h
index 7079fbd..0fc1524 100644
--- a/src/ipc-uapi.h
+++ b/src/ipc-uapi.h
@@ -46,7 +46,7 @@ static int userspace_set_device(struct wgdevice *dev)
 		fprintf(f, "private_key=%s\n", hex);
 	}
 	if (dev->flags & WGDEVICE_HAS_LISTEN_PORT)
-		fprintf(f, "listen_port=%u\n", dev->listen_port);
+		fprintf(f, "listen_port=%u\n", ntohs(dev->listen_port));
 	if (dev->flags & WGDEVICE_HAS_LISTEN)
 		return -EOPNOTSUPP;
 	if (dev->flags & WGDEVICE_HAS_FWMARK)
diff --git a/src/ipc-windows.h b/src/ipc-windows.h
index 77e32b3..fb8f35c 100644
--- a/src/ipc-windows.h
+++ b/src/ipc-windows.h
@@ -249,7 +249,7 @@ static int kernel_get_device(struct wgdevice **device, const char *iface)
 	dev->name[sizeof(dev->name) - 1] = '\0';
 
 	if (wg_iface->Flags & WG_IOCTL_INTERFACE_HAS_LISTEN_PORT) {
-		dev->listen_port = wg_iface->ListenPort;
+		dev->listen_port = htons(wg_iface->ListenPort);
 		dev->flags |= WGDEVICE_HAS_LISTEN_PORT;
 	}
 
@@ -378,7 +378,7 @@ static int kernel_set_device(struct wgdevice *dev)
 	}
 
 	if (dev->flags & WGDEVICE_HAS_LISTEN_PORT) {
-		wg_iface->ListenPort = dev->listen_port;
+		wg_iface->ListenPort = ntohs(dev->listen_port);
 		wg_iface->Flags |= WG_IOCTL_INTERFACE_HAS_LISTEN_PORT;
 	}
 	if (dev->flags & WGDEVICE_HAS_LISTEN) {
diff --git a/src/show.c b/src/show.c
index 754f952..3048183 100644
--- a/src/show.c
+++ b/src/show.c
@@ -127,26 +127,24 @@ char *print_endpoint(const struct sockaddr *addr)
 	return buf;
 }
 
-char *print_sockaddr_inet(const struct sockaddr_inet *sa_const)
+char *print_sockaddr_inet(const struct sockaddr_inet *sa)
 {
 	char host[4096 + 1], service[512 + 1], ifname_buf[IF_NAMESIZE+10] = "%";
 	static char buf[sizeof(host) + sizeof(service) + sizeof(ifname_buf) + 4];
-        struct sockaddr_inet sa = *sa_const;
 	socklen_t sa_len = 0;
 	unsigned int ifindex = 0;
 	int ret;
 
-	sa.sinet_port = htons(sa.sinet_port);
-
-	if (sa.sinet_family == AF_INET) {
+	if (sa->sinet_family == AF_INET) {
 		sa_len = sizeof(struct sockaddr_in);
-		ifindex = sa.sin_scope_id;
-	} else if (sa.sinet_family == AF_INET6) {
+		ifindex = sa->sin_scope_id;
+	} else if (sa->sinet_family == AF_INET6) {
 		sa_len = sizeof(struct sockaddr_in6);
-		ifindex = sa.sin6_scope_id;
+		ifindex = sa->sin6_scope_id;
 	}
-	ret = getnameinfo((struct sockaddr*)&sa, sa_len, host, sizeof(host), service, sizeof(service), NI_DGRAM | NI_NUMERICSERV | NI_NUMERICHOST);
+	ret = getnameinfo((struct sockaddr*)sa, sa_len, host, sizeof(host), service, sizeof(service), NI_DGRAM | NI_NUMERICSERV | NI_NUMERICHOST);
 	if (ret) {
+		fprintf(stderr, "error: print_sockaddr_inet: %s", gai_strerror(ret));
 		buf[0] = '\0';
 		goto out;
 	}
@@ -160,7 +158,7 @@ char *print_sockaddr_inet(const struct sockaddr_inet *sa_const)
 		}
 	}
 
-	if ((sa.sinet_family == AF_INET6 && strchr(host, ':')) || ifindex)
+	if ((sa->sinet_family == AF_INET6 && strchr(host, ':')) || ifindex)
 		snprintf(buf, sizeof(buf), "[%s%s]:%s", host, ifname, service);
 	else
 		snprintf(buf, sizeof(buf), "%s:%s", host, service);
@@ -261,7 +259,7 @@ static void pretty_print(struct wgdevice *device)
 	if (device->listen_family != AF_UNSPEC)
 		terminal_printf("  " TERMINAL_BOLD "listening on" TERMINAL_RESET ": %s\n", print_sockaddr_inet(&device->listen_inet));
 	else if (device->listen_port)
-		terminal_printf("  " TERMINAL_BOLD "listening port" TERMINAL_RESET ": %u\n", device->listen_port);
+		terminal_printf("  " TERMINAL_BOLD "listening port" TERMINAL_RESET ": %u\n", ntohs(device->listen_port));
 	if (device->fwmark)
 		terminal_printf("  " TERMINAL_BOLD "fwmark" TERMINAL_RESET ": 0x%x\n", device->fwmark);
 	if (device->first_peer) {
@@ -306,7 +304,7 @@ static void dump_print(struct wgdevice *device, bool with_interface)
 	if (device->listen_family != AF_UNSPEC)
 		printf("%s\t", print_sockaddr_inet(&device->listen_inet));
 	else
-		printf("%u\t", device->listen_port);
+		printf("%u\t", ntohs(device->listen_port));
 	if (device->fwmark)
 		printf("0x%x\n", device->fwmark);
 	else
@@ -350,7 +348,7 @@ static bool ugly_print(struct wgdevice *device, const char *param, bool with_int
 	} else if (!strcmp(param, "listen-port")) {
 		if (with_interface)
 			printf("%s\t", device->name);
-		printf("%u\n", device->listen_port);
+		printf("%u\n", ntohs(device->listen_port));
 	} else if (!strcmp(param, "listen")) {
 		if (with_interface)
 			printf("%s\t", device->name);
diff --git a/src/showconf.c b/src/showconf.c
index d165eb2..c99a6a0 100644
--- a/src/showconf.c
+++ b/src/showconf.c
@@ -44,7 +44,7 @@ int showconf_main(int argc, const char *argv[])
 	if (device->listen_family != AF_UNSPEC)
 		printf("Listen = %s", print_sockaddr_inet(&device->listen_inet));
 	else if (device->listen_port)
-		printf("ListenPort = %u\n", device->listen_port);
+		printf("ListenPort = %u\n", ntohs(device->listen_port));
 	if (device->fwmark)
 		printf("FwMark = 0x%x\n", device->fwmark);
 	if (device->flags & WGDEVICE_HAS_PRIVATE_KEY) {
-- 
2.39.2

