Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 828e1884
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:59 +0000 (UTC)
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com
 [IPv6:2a00:1450:400c:c09::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce833211
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:46 +0000 (UTC)
Received: by mail-wm0-x236.google.com with SMTP id b19-v6so2157405wme.3
 for <wireguard@lists.zx2c4.com>; Tue, 11 Sep 2018 12:13:39 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v3 11/12] tools: allow modification of transit net
Date: Tue, 11 Sep 2018 21:13:10 +0200
Message-Id: <20180911191311.25373-12-ju.orth@gmail.com>
In-Reply-To: <20180911191311.25373-1-ju.orth@gmail.com>
References: <20180911191311.25373-1-ju.orth@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

The command is

wg set <device> [...] transit-netns <pid|file-path> [...]

For example:

wg set wg0 transit-netns 1
wg set wg0 transit-netns /proc/1/ns/net
---
 src/tools/config.c     | 8 ++++++++
 src/tools/containers.h | 5 ++++-
 src/tools/ipc.c        | 4 ++++
 src/tools/man/wg.8     | 9 +++++++--
 src/tools/set.c        | 2 +-
 5 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/src/tools/config.c b/src/tools/config.c
index 93525fb..2424f3d 100644
--- a/src/tools/config.c
+++ b/src/tools/config.c
@@ -19,6 +19,7 @@
 #include "containers.h"
 #include "ipc.h"
 #include "encoding.h"
+#include "netns.h"
 
 #define COMMENT_CHAR '#'
 
@@ -392,6 +393,8 @@ static bool process_line(struct config_ctx *ctx, const char *line)
 	if (ctx->is_device_section) {
 		if (key_match("ListenPort"))
 			ret = parse_port(&ctx->device->listen_port, &ctx->device->flags, value);
+		else if (key_match("TransitNetns"))
+			ret = netns_parse(&ctx->device->transit_netns, value);
 		else if (key_match("FwMark"))
 			ret = parse_fwmark(&ctx->device->fwmark, &ctx->device->flags, value);
 		else if (key_match("PrivateKey")) {
@@ -525,6 +528,11 @@ struct wgdevice *config_read_cmd(char *argv[], int argc)
 				goto error;
 			argv += 2;
 			argc -= 2;
+		} else if (!strcmp(argv[0], "transit-netns") && argc >= 2 && !peer) {
+			if (!netns_parse(&device->transit_netns, argv[1]))
+				goto error;
+			argv += 2;
+			argc -= 2;
 		} else if (!strcmp(argv[0], "fwmark") && argc >= 2 && !peer) {
 			if (!parse_fwmark(&device->fwmark, &device->flags, argv[1]))
 				goto error;
diff --git a/src/tools/containers.h b/src/tools/containers.h
index 326071b..638c69c 100644
--- a/src/tools/containers.h
+++ b/src/tools/containers.h
@@ -75,7 +75,9 @@ enum {
 	WGDEVICE_HAS_PRIVATE_KEY = 1U << 1,
 	WGDEVICE_HAS_PUBLIC_KEY = 1U << 2,
 	WGDEVICE_HAS_LISTEN_PORT = 1U << 3,
-	WGDEVICE_HAS_FWMARK = 1U << 4
+	WGDEVICE_HAS_FWMARK = 1U << 4,
+	WGDEVICE_HAS_TRANSIT_NETNS_PID = 1U << 5,
+	WGDEVICE_HAS_TRANSIT_NETNS_FD = 1U << 6,
 };
 
 struct wgdevice {
@@ -89,6 +91,7 @@ struct wgdevice {
 
 	uint32_t fwmark;
 	uint16_t listen_port;
+	struct wgnetns transit_netns;
 
 	struct wgpeer *first_peer, *last_peer;
 };
diff --git a/src/tools/ipc.c b/src/tools/ipc.c
index 6e0b4e7..d88ace7 100644
--- a/src/tools/ipc.c
+++ b/src/tools/ipc.c
@@ -569,6 +569,10 @@ again:
 			mnl_attr_put(nlh, WGDEVICE_A_PRIVATE_KEY, sizeof(dev->private_key), dev->private_key);
 		if (dev->flags & WGDEVICE_HAS_LISTEN_PORT)
 			mnl_attr_put_u16(nlh, WGDEVICE_A_LISTEN_PORT, dev->listen_port);
+		if (dev->transit_netns.flags & WGNETNS_HAS_PID)
+			mnl_attr_put_u32(nlh, WGDEVICE_A_TRANSIT_NETNS_PID, dev->transit_netns.pid);
+		if (dev->transit_netns.flags & WGNETNS_HAS_FD)
+			mnl_attr_put_u32(nlh, WGDEVICE_A_TRANSIT_NETNS_FD, (uint32_t)dev->transit_netns.fd);
 		if (dev->flags & WGDEVICE_HAS_FWMARK)
 			mnl_attr_put_u32(nlh, WGDEVICE_A_FWMARK, dev->fwmark);
 		if (dev->flags & WGDEVICE_REPLACE_PEERS)
diff --git a/src/tools/man/wg.8 b/src/tools/man/wg.8
index 5bae7ca..d1f95f7 100644
--- a/src/tools/man/wg.8
+++ b/src/tools/man/wg.8
@@ -55,12 +55,17 @@ transfer-rx, transfer-tx, persistent-keepalive.
 Shows the current configuration of \fI<interface>\fP in the format described
 by \fICONFIGURATION FILE FORMAT\fP below.
 .TP
-\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fIfwmark\fP \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP \fI<base64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP] [\fIendpoint\fP \fI<ip>:<port>\fP] [\fIpersistent-keepalive\fP \fI<interval seconds>\fP] [\fIallowed-ips\fP \fI<ip1>/<cidr1>\fP[,\fI<ip2>/<cidr2>\fP]...] ]...
+\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fItransit-netns\fP \fI<pid|file-path>\fP] [\fIfwmark\fP \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP \fI<base64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP] [\fIendpoint\fP \fI<ip>:<port>\fP] [\fIpersistent-keepalive\fP \fI<interval seconds>\fP] [\fIallowed-ips\fP \fI<ip1>/<cidr1>\fP[,\fI<ip2>/<cidr2>\fP]...] ]...
 Sets configuration values for the specified \fI<interface>\fP. Multiple
 \fIpeer\fPs may be specified, and if the \fIremove\fP argument is given
 for a peer, that peer is removed, not configured. If \fIlisten-port\fP
 is not specified, the port will be chosen randomly when the
-interface comes up. Both \fIprivate-key\fP and \fIpreshared-key\fP must
+interface comes up. If transit-netns is not specified, the network namespace
+through which encrypted packets are routed is the one in which the device
+was created. Otherwise the network namespace through which encrypted packets are
+routed is the one specified by the argument. If the argument is an unsigned
+32-bit integer, it is interpeted as a process id, otherwise it is interpreted as
+a file path. Both \fIprivate-key\fP and \fIpreshared-key\fP must
 be a files, because command line arguments are not considered private on
 most systems but if you are using
 .BR bash (1),
diff --git a/src/tools/set.c b/src/tools/set.c
index 24b72b8..f22d86b 100644
--- a/src/tools/set.c
+++ b/src/tools/set.c
@@ -18,7 +18,7 @@ int set_main(int argc, char *argv[], struct wgoptions *options)
 	int ret = 1;
 
 	if (argc < 3) {
-		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
+		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [transit-netns <pid|file path>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
 		return 1;
 	}
 
-- 
2.18.0
