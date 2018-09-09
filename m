Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afe534a2
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 15:14:05 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be4a778f
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 15:13:55 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id j26-v6so19333091wre.2
 for <wireguard@lists.zx2c4.com>; Sun, 09 Sep 2018 08:14:32 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v2 10/10] tools: add support for transit-credentials
Date: Sun,  9 Sep 2018 17:14:02 +0200
Message-Id: <20180909151402.6033-11-ju.orth@gmail.com>
In-Reply-To: <20180909151402.6033-1-ju.orth@gmail.com>
References: <20180909151402.6033-1-ju.orth@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

The command is

wg set <device> transit-credentials <fd>[,<fd>]

For example

wg set wg0 transit-credentials 100
wg set wg0 transit-credentials 100,101
---
 src/tools/config.c     | 30 ++++++++++++++++++++++++++++++
 src/tools/containers.h |  4 ++++
 src/tools/ipc.c        |  4 ++++
 src/tools/set.c        |  2 +-
 4 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/src/tools/config.c b/src/tools/config.c
index dffec76..b1f4d8d 100644
--- a/src/tools/config.c
+++ b/src/tools/config.c
@@ -99,6 +99,31 @@ static bool parse_transit_netns(struct wgdevice *device, const char *arg)
 	return false;
 }
 
+static bool parse_transit_credentials(struct wgdevice *device, const char *arg)
+{
+	char *end;
+	bool valid, have_ipv6 = false;
+
+	valid = isdigit(*arg);
+	device->transit_credentials_ipv4 = strtoul(arg, &end, 10);
+	if (*end) {
+		have_ipv6 = *end == ',' && isdigit(end[1]);
+		device->transit_credentials_ipv6 = strtoul(end + 1, &end, 10);
+	}
+	if (*end)
+		valid = false;
+
+	if (valid) {
+		device->flags |= WGDEVICE_HAS_TRANSIT_CREDENTIALS_IPV4;
+		if (have_ipv6)
+			device->flags |= WGDEVICE_HAS_TRANSIT_CREDENTIALS_IPV6;
+	} else {
+		fprintf(stderr, "Format of transit-credentials is invalid: '%s'\n", arg);
+	}
+
+	return valid;
+}
+
 static inline bool parse_fwmark(uint32_t *fwmark, uint32_t *flags, const char *value)
 {
 	unsigned long ret;
@@ -557,6 +582,11 @@ struct wgdevice *config_read_cmd(char *argv[], int argc)
 				goto error;
 			argv += 2;
 			argc -= 2;
+		} else if (!strcmp(argv[0], "transit-credentials") && argc >= 2 && !peer) {
+			if (!parse_transit_credentials(device, argv[1]))
+				goto error;
+			argv += 2;
+			argc -= 2;
 		} else if (!strcmp(argv[0], "fwmark") && argc >= 2 && !peer) {
 			if (!parse_fwmark(&device->fwmark, &device->flags, argv[1]))
 				goto error;
diff --git a/src/tools/containers.h b/src/tools/containers.h
index c6dd6fe..368e8d1 100644
--- a/src/tools/containers.h
+++ b/src/tools/containers.h
@@ -61,6 +61,8 @@ enum {
 	WGDEVICE_HAS_FWMARK = 1U << 4,
 	WGDEVICE_HAS_TRANSIT_NETNS_PID = 1U << 5,
 	WGDEVICE_HAS_TRANSIT_NETNS_FD = 1U << 6,
+	WGDEVICE_HAS_TRANSIT_CREDENTIALS_IPV4 = 1U << 7,
+	WGDEVICE_HAS_TRANSIT_CREDENTIALS_IPV6 = 1U << 8,
 };
 
 struct wgdevice {
@@ -76,6 +78,8 @@ struct wgdevice {
 	uint16_t listen_port;
 	uint32_t transit_netns_pid;
 	int transit_netns_fd;
+	int transit_credentials_ipv4;
+	int transit_credentials_ipv6;
 
 	struct wgpeer *first_peer, *last_peer;
 };
diff --git a/src/tools/ipc.c b/src/tools/ipc.c
index aa82cb3..383737a 100644
--- a/src/tools/ipc.c
+++ b/src/tools/ipc.c
@@ -573,6 +573,10 @@ again:
 			mnl_attr_put_u32(nlh, WGDEVICE_A_TRANSIT_NETNS_PID, dev->transit_netns_pid);
 		if (dev->flags & WGDEVICE_HAS_TRANSIT_NETNS_FD)
 			mnl_attr_put_u32(nlh, WGDEVICE_A_TRANSIT_NETNS_FD, (uint32_t)dev->transit_netns_fd);
+		if (dev->flags & WGDEVICE_HAS_TRANSIT_CREDENTIALS_IPV4)
+			mnl_attr_put_u32(nlh, WGDEVICE_A_TRANSIT_CREDENTIALS_IPV4, (uint32_t)dev->transit_credentials_ipv4);
+		if (dev->flags & WGDEVICE_HAS_TRANSIT_CREDENTIALS_IPV6)
+			mnl_attr_put_u32(nlh, WGDEVICE_A_TRANSIT_CREDENTIALS_IPV6, (uint32_t)dev->transit_credentials_ipv6);
 		if (dev->flags & WGDEVICE_HAS_FWMARK)
 			mnl_attr_put_u32(nlh, WGDEVICE_A_FWMARK, dev->fwmark);
 		if (dev->flags & WGDEVICE_REPLACE_PEERS)
diff --git a/src/tools/set.c b/src/tools/set.c
index 37be9a0..9947cd4 100644
--- a/src/tools/set.c
+++ b/src/tools/set.c
@@ -18,7 +18,7 @@ int set_main(int argc, char *argv[])
 	int ret = 1;
 
 	if (argc < 3) {
-		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [transit-netns <pid|file path>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
+		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [transit-netns <pid|file path>] [transit-credentials <fd>[,<fd>]] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
 		return 1;
 	}
 
-- 
2.18.0
