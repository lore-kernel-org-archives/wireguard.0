Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497ADC43612
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9AB1206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhVLEMPO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9AB1206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a06c8c15;
	Sat, 15 Dec 2018 16:57:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c228d48
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:57:16 +0000 (UTC)
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ade79ead
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:33 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id y20so1272802edw.9
 for <wireguard@lists.zx2c4.com>; Sat, 15 Dec 2018 08:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O49tc7uzAgo70zXx8Clsb7/skLZHiQoNO1T2eoU9WAU=;
 b=DhVLEMPOdx5UIbGIQywsJ2/JsSaVULW0Ukc5apSCDxpu0TQmXyy/NdiklGtmSBDtdp
 mzCLoK+o1/YhHolJCBrRCWqCfP+aYETdJ+VdHzgk5/I5A4vy6Hbo34Vl5DWtPxU19/FH
 pOrG0P05bBqlfENpBRBbMiKoFiHa655MGY2a5WehrQPT1Wu0Hxd4U7QUNN4iZQot0YJz
 JprMwEGabnJFKg1bm+qDCsKfbJafqg60eFg9d1vFKHMg+7CLeiNvpstjlES8XQRzXpGR
 X0bAiREb6xvJmEphj9SHVJqd5685L8AcgZUC/UCG7C9R/5M4jRve17JMPUXyJRcRJ9W3
 ymiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O49tc7uzAgo70zXx8Clsb7/skLZHiQoNO1T2eoU9WAU=;
 b=e2wc21tK1QLao/FrCKeRl+gqY5eIjnWPQljgfh3Y1Tvp8QxC+mQWBiPHoTM5Z4/GBK
 rijFsdEJHw6w7KLqHmJQal9pRfyuhDNDChpDxR/2n23/IM5yViAE3wMj39JKKEGtcByu
 vaDc2DeoEYiVVTLHxwo4E4c8vQryjHcVea9rkpGYyHrbHI2wuOOLKzmHvf044AmVaTUK
 xTdHV/DdsK40WeFxltbcNqTBAx6zGwZmd7JeMISh0/M5iPfJ7qoaLl7HgEFWmzsB1GV4
 prWCmYhF5qwieUEVmJIT9K8C9dNpUtVtcC2hohlu5a67h+NDRSdj7ZsGzzO6P3STrn/1
 KlvQ==
X-Gm-Message-State: AA+aEWZOe5uwNGbjkhK7EkRMvUUX/lTv+B5mD6JDPSXslQgIfxbWWYRo
 Dhu5yIzht/48MJyTY84XfujH9Cb1
X-Google-Smtp-Source: AFSGD/VZaVedsXsqGRh8f7xvf4MiZ+ZlCbM3Ydfmt/xT6ErWJ8JSztfJiHI4tXCOVmt/JcHbzORhXA==
X-Received: by 2002:a50:a395:: with SMTP id s21mr7249058edb.1.1544892997356;
 Sat, 15 Dec 2018 08:56:37 -0800 (PST)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id q50sm2356015edd.66.2018.12.15.08.56.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Dec 2018 08:56:36 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v5 09/11] tools: allow specifying the device namespace
Date: Sat, 15 Dec 2018 17:56:11 +0100
Message-Id: <20181215165613.5486-10-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181215165613.5486-1-ju.orth@gmail.com>
References: <20181215165613.5486-1-ju.orth@gmail.com>
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

The user can now use

wg --netns <pid|file-path> <subcommand>

to specify the network namespace in which wg should act. This sets the
attribute WGDEVICE_A_DEV_NETNS_PID or WGDEVICE_A_DEV_NETNS_FD.

In the case of

wg --netns <pid|file-path> show all

we have to try to enter the network namespace because the kernel
interface does not allow us to list devices in a network namespace
referenced by pid or fd. Since entering a network namespace requires
CAP_SYS_ADMIN in the current user namespace and the target user
namespace, this is almost useless. TODO: Add the missing functionality
to the kernel.
---
 src/tools/containers.h | 14 ++++++++++
 src/tools/ipc.c        | 22 +++++++++++----
 src/tools/ipc.h        |  7 +++--
 src/tools/netns.c      | 62 ++++++++++++++++++++++++++++++++++++++++++
 src/tools/netns.h      | 18 ++++++++++++
 src/tools/set.c        |  3 +-
 src/tools/setconf.c    |  3 +-
 src/tools/show.c       | 36 +++++++++++++++++-------
 src/tools/showconf.c   |  3 +-
 src/tools/wg.c         | 14 ++++++++--
 10 files changed, 155 insertions(+), 27 deletions(-)
 create mode 100644 src/tools/netns.c
 create mode 100644 src/tools/netns.h

diff --git a/src/tools/containers.h b/src/tools/containers.h
index cd757e4..d588a44 100644
--- a/src/tools/containers.h
+++ b/src/tools/containers.h
@@ -15,7 +15,21 @@
 
 #include "../uapi/wireguard.h"
 
+struct wgnetns {
+	uint32_t flags;
+
+	uint32_t pid;
+	int fd;
+};
+
+enum {
+	WGNETNS_HAS_PID = 1U << 0,
+	WGNETNS_HAS_FD = 1U << 1,
+};
+
+
 struct wgoptions {
+	struct wgnetns dev_netns;
 };
 
 struct wgallowedip {
diff --git a/src/tools/ipc.c b/src/tools/ipc.c
index 5879109..2c16897 100644
--- a/src/tools/ipc.c
+++ b/src/tools/ipc.c
@@ -551,7 +551,7 @@ cleanup:
 	return ret;
 }
 
-static int kernel_set_device(struct wgdevice *dev)
+static int kernel_set_device(struct wgnetns *dev_netns, struct wgdevice *dev)
 {
 	int ret = 0;
 	struct wgpeer *peer = NULL;
@@ -579,6 +579,10 @@ again:
 			mnl_attr_put_u32(nlh, WGDEVICE_A_FWMARK, dev->fwmark);
 		if (dev->flags & WGDEVICE_REPLACE_PEERS)
 			flags |= WGDEVICE_F_REPLACE_PEERS;
+		if (dev_netns->flags & WGNETNS_HAS_PID)
+			mnl_attr_put_u32(nlh, WGDEVICE_A_DEV_NETNS_PID, dev_netns->pid);
+		if (dev_netns->flags & WGNETNS_HAS_FD)
+			mnl_attr_put_u32(nlh, WGDEVICE_A_DEV_NETNS_FD, (uint32_t)dev_netns->fd);
 		if (flags)
 			mnl_attr_put_u32(nlh, WGDEVICE_A_FLAGS, flags);
 	}
@@ -885,7 +889,8 @@ static void coalesce_peers(struct wgdevice *device)
 	}
 }
 
-static int kernel_get_device(struct wgdevice **device, const char *interface)
+static int kernel_get_device(struct wgnetns *dev_netns,
+		struct wgdevice **device, const char *interface)
 {
 	int ret = 0;
 	struct nlmsghdr *nlh;
@@ -905,6 +910,10 @@ try_again:
 
 	nlh = mnlg_msg_prepare(nlg, WG_CMD_GET_DEVICE, NLM_F_REQUEST | NLM_F_ACK | NLM_F_DUMP);
 	mnl_attr_put_strz(nlh, WGDEVICE_A_IFNAME, interface);
+	if (dev_netns->flags & WGNETNS_HAS_PID)
+		mnl_attr_put_u32(nlh, WGDEVICE_A_DEV_NETNS_PID, dev_netns->pid);
+	if (dev_netns->flags & WGNETNS_HAS_FD)
+		mnl_attr_put_u32(nlh, WGDEVICE_A_DEV_NETNS_FD, (uint32_t)dev_netns->fd);
 	if (mnlg_socket_send(nlg, nlh) < 0) {
 		ret = -errno;
 		goto out;
@@ -959,23 +968,24 @@ cleanup:
 	return buffer.buffer;
 }
 
-int ipc_get_device(struct wgdevice **dev, const char *interface)
+int ipc_get_device(struct wgnetns *dev_netns, struct wgdevice **dev,
+		const char *interface)
 {
 #ifdef __linux__
 	if (userspace_has_wireguard_interface(interface))
 		return userspace_get_device(dev, interface);
-	return kernel_get_device(dev, interface);
+	return kernel_get_device(dev_netns, dev, interface);
 #else
 	return userspace_get_device(dev, interface);
 #endif
 }
 
-int ipc_set_device(struct wgdevice *dev)
+int ipc_set_device(struct wgnetns *dev_netns, struct wgdevice *dev)
 {
 #ifdef __linux__
 	if (userspace_has_wireguard_interface(dev->name))
 		return userspace_set_device(dev);
-	return kernel_set_device(dev);
+	return kernel_set_device(dev_netns, dev);
 #else
 	return userspace_set_device(dev);
 #endif
diff --git a/src/tools/ipc.h b/src/tools/ipc.h
index e75be20..4cb7dca 100644
--- a/src/tools/ipc.h
+++ b/src/tools/ipc.h
@@ -8,10 +8,13 @@
 
 #include <stdbool.h>
 
+#include "containers.h"
+
 struct wgdevice;
 
-int ipc_set_device(struct wgdevice *dev);
-int ipc_get_device(struct wgdevice **dev, const char *interface);
+int ipc_set_device(struct wgnetns *dev_netns, struct wgdevice *dev);
+int ipc_get_device(struct wgnetns *dev_netns, struct wgdevice **dev,
+		const char *interface);
 char *ipc_list_devices(void);
 
 #endif
diff --git a/src/tools/netns.c b/src/tools/netns.c
new file mode 100644
index 0000000..73ce762
--- /dev/null
+++ b/src/tools/netns.c
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (C) 2018 Julian orth <ju.orth@gmail.com>. All Rights Reserved.
+ */
+
+#include <fcntl.h>
+#include <stdio.h>
+#include <sched.h>
+#include <ctype.h>
+
+#include "netns.h"
+
+struct wgnetns netns_current = { 0 };
+
+bool netns_enter(struct wgnetns *netns)
+{
+	int fd = netns->fd;
+
+	if (!netns->flags)
+		return true;
+
+	if (netns->flags & WGNETNS_HAS_PID) {
+		char path[64];
+		sprintf(path, "/proc/%d/ns/net", netns->pid);
+		fd = open(path, O_RDONLY);
+		if (fd == -1) {
+			perror("Unable to open netns by pid");
+			return false;
+		}
+	}
+
+	if (setns(fd, CLONE_NEWNET)) {
+		perror("setns");
+		return false;
+	}
+
+	return true;
+}
+
+bool netns_parse(struct wgnetns *netns, const char *arg)
+{
+	/* U32 arg -> PID */
+	if (isdigit(*arg)) {
+		char *end;
+		unsigned long pid = strtoul(arg, &end, 10);
+		if (!*end && pid <= UINT32_MAX) {
+			netns->pid = pid;
+			netns->flags |= WGNETNS_HAS_PID;
+			return true;
+		}
+	}
+
+	/* Otherwise -> file path */
+	netns->fd = open(arg, O_RDONLY);
+	if (netns->fd >= 0) {
+		netns->flags |= WGNETNS_HAS_FD;
+		return true;
+	}
+
+	perror("open");
+	return false;
+}
diff --git a/src/tools/netns.h b/src/tools/netns.h
new file mode 100644
index 0000000..df7723a
--- /dev/null
+++ b/src/tools/netns.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (C) 2018 Julian orth <ju.orth@gmail.com>. All Rights Reserved.
+ */
+
+#ifndef NETNS_H
+#define NETNS_H
+
+#include <stdbool.h>
+
+#include "containers.h"
+
+bool netns_enter(struct wgnetns *netns);
+bool netns_parse(struct wgnetns *netns, const char *arg);
+
+extern struct wgnetns netns_current;
+
+#endif
diff --git a/src/tools/set.c b/src/tools/set.c
index 4e90940..5457c67 100644
--- a/src/tools/set.c
+++ b/src/tools/set.c
@@ -16,7 +16,6 @@ int set_main(int argc, char *argv[], struct wgoptions *options)
 {
 	struct wgdevice *device = NULL;
 	int ret = 1;
-	(void)options;
 
 	if (argc < 3) {
 		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
@@ -29,7 +28,7 @@ int set_main(int argc, char *argv[], struct wgoptions *options)
 	strncpy(device->name, argv[1], IFNAMSIZ -  1);
 	device->name[IFNAMSIZ - 1] = '\0';
 
-	if (ipc_set_device(device) != 0) {
+	if (ipc_set_device(&options->dev_netns, device) != 0) {
 		perror("Unable to modify interface");
 		goto cleanup;
 	}
diff --git a/src/tools/setconf.c b/src/tools/setconf.c
index 8133bdd..cf224fe 100644
--- a/src/tools/setconf.c
+++ b/src/tools/setconf.c
@@ -21,7 +21,6 @@ int setconf_main(int argc, char *argv[], struct wgoptions *options)
 	char *config_buffer = NULL;
 	size_t config_buffer_len = 0;
 	int ret = 1;
-	(void)options;
 
 	if (argc != 3) {
 		fprintf(stderr, "Usage: %s %s <interface> <configuration filename>\n", PROG_NAME, argv[0]);
@@ -51,7 +50,7 @@ int setconf_main(int argc, char *argv[], struct wgoptions *options)
 	strncpy(device->name, argv[1], IFNAMSIZ - 1);
 	device->name[IFNAMSIZ - 1] = '\0';
 
-	if (ipc_set_device(device) != 0) {
+	if (ipc_set_device(&options->dev_netns, device) != 0) {
 		perror("Unable to modify interface");
 		goto cleanup;
 	}
diff --git a/src/tools/show.c b/src/tools/show.c
index 1ebe6e2..bfd07e6 100644
--- a/src/tools/show.c
+++ b/src/tools/show.c
@@ -23,6 +23,7 @@
 #include "terminal.h"
 #include "encoding.h"
 #include "subcommands.h"
+#include "netns.h"
 
 static int peer_cmp(const void *first, const void *second)
 {
@@ -377,17 +378,14 @@ static bool ugly_print(struct wgdevice *device, const char *param, bool with_int
 	return true;
 }
 
-int show_main(int argc, char *argv[], struct wgoptions *options)
+static int show_all(int argc, char *argv[], struct wgoptions *options)
 {
 	int ret = 0;
 
-	(void)options;
-	COMMAND_NAME = argv[0];
-
-	if (argc > 3) {
-		show_usage();
+	// The kernel interface used by ipc_list_devices does not allow us to
+	// list devices in a namespace referenced via pid or fd.
+	if (!netns_enter(&options->dev_netns))
 		return 1;
-	}
 
 	if (argc == 1 || !strcmp(argv[1], "all")) {
 		char *interfaces = ipc_list_devices(), *interface;
@@ -401,7 +399,7 @@ int show_main(int argc, char *argv[], struct wgoptions *options)
 		for (size_t len = 0; (len = strlen(interface)); interface += len + 1) {
 			struct wgdevice *device = NULL;
 
-			if (ipc_get_device(&device, interface) < 0) {
+			if (ipc_get_device(&netns_current, &device, interface) < 0) {
 				fprintf(stderr, "Unable to access interface %s: %s\n", interface, strerror(errno));
 				continue;
 			}
@@ -436,12 +434,30 @@ int show_main(int argc, char *argv[], struct wgoptions *options)
 		for (size_t len = 0; (len = strlen(interface)); interface += len + 1)
 			printf("%s%c", interface, strlen(interface + len + 1) ? ' ' : '\n');
 		free(interfaces);
-	} else if (argc == 2 && (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help") || !strcmp(argv[1], "help")))
+	}
+
+	return ret;
+}
+
+int show_main(int argc, char *argv[], struct wgoptions *options)
+{
+	int ret = 0;
+
+	COMMAND_NAME = argv[0];
+
+	if (argc > 3) {
+		show_usage();
+		return 1;
+	}
+
+	if (argc == 1 || !strcmp(argv[1], "all") || !strcmp(argv[1], "interfaces"))
+		ret = show_all(argc, argv, options);
+	else if (argc == 2 && (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help") || !strcmp(argv[1], "help")))
 		show_usage();
 	else {
 		struct wgdevice *device = NULL;
 
-		if (ipc_get_device(&device, argv[1]) < 0) {
+		if (ipc_get_device(&options->dev_netns, &device, argv[1]) < 0) {
 			perror("Unable to access interface");
 			return 1;
 		}
diff --git a/src/tools/showconf.c b/src/tools/showconf.c
index 1de65b0..239968c 100644
--- a/src/tools/showconf.c
+++ b/src/tools/showconf.c
@@ -26,14 +26,13 @@ int showconf_main(int argc, char *argv[], struct wgoptions *options)
 	struct wgpeer *peer;
 	struct wgallowedip *allowedip;
 	int ret = 1;
-	(void)options;
 
 	if (argc != 2) {
 		fprintf(stderr, "Usage: %s %s <interface>\n", PROG_NAME, argv[0]);
 		return 1;
 	}
 
-	if (ipc_get_device(&device, argv[1])) {
+	if (ipc_get_device(&options->dev_netns, &device, argv[1])) {
 		perror("Unable to access interface");
 		goto cleanup;
 	}
diff --git a/src/tools/wg.c b/src/tools/wg.c
index f70b5c5..1fd8157 100644
--- a/src/tools/wg.c
+++ b/src/tools/wg.c
@@ -11,6 +11,7 @@
 
 #include "subcommands.h"
 #include "containers.h"
+#include "netns.h"
 
 const char *PROG_NAME;
 
@@ -46,21 +47,28 @@ static bool parse_options(int argc, char *argv[], struct wgoptions *options)
 			.name = "help",
 			.val = 'h',
 		},
+		{
+			.name = "netns",
+			.has_arg = 1,
+			.val = 'n',
+		},
 		{
 			0
 		}
 	};
-	(void)options;
 
 	setenv("POSIXLY_CORRECT", "", 0);
 
-	while ((ch = getopt_long(argc, argv, "h", opts, NULL)) != -1) {
+	while ((ch = getopt_long(argc, argv, "hn:", opts, NULL)) != -1) {
 		switch (ch) {
 		case '?':
 			return false;
 		case 'h':
 			show_usage(stdout);
 			exit(0);
+		case 'n':
+			netns_parse(&options->dev_netns, optarg);
+			break;
 		}
 	}
 
@@ -69,7 +77,7 @@ static bool parse_options(int argc, char *argv[], struct wgoptions *options)
 
 int main(int argc, char *argv[])
 {
-	struct wgoptions options = { };
+	struct wgoptions options = { 0 };
 
 	PROG_NAME = argv[0];
 
-- 
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
