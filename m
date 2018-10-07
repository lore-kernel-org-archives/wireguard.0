Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5C7C65C1D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:15:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30DE520882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:15:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VS9vZwsS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30DE520882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b325e58;
	Sun, 7 Oct 2018 14:11:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cf700d0
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:35 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1efcd791
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:23 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e4-v6so18044877wrs.0
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zuinG3OxrTnw5n7S/MQC/v045TLs8SiSyEr6IfvqPp8=;
 b=VS9vZwsSChIpa88iDQ2Xdb/suk8ZiqWjJQpyz6iMObeO3WjspiSFUZ/1pB4MXz4haD
 njCmoE8Z7YJJ8AQgEDziDv5FxdscKaxUX/N3kxGbmM0+kZ9SlR4cyrISNhsZpcHnQXSj
 o10vNyiP15LcOnExP1K+rXKQejkE0C96Q39ETE/fS6/rf2dZu15NqrIPFHDxYh2AxaUK
 a+EBodYfDlTR8qq1hkiQ3RJixt2gFkGeu5jSUIB6Ef7hDlJ3pQzAP9uhKEIdUQRoPK+x
 qfxSS+CjjMdwC9/xjY8fv1541w1LHkwQ6/XKfJ9HYbBevvLKcUeFPRBcUbKrCVA5DqKg
 CkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zuinG3OxrTnw5n7S/MQC/v045TLs8SiSyEr6IfvqPp8=;
 b=L3qt8zWz0rmin+tYUYGr+QAk+49y0drIDzWnOW8Zk5v9JTtLGMhuQlHWgbDjA0MbFV
 SQ779edZ6CiPCwO8JcuLpdPlesFzkpyGZdJ6riTsTyTbTd1sKrVgZYaZGEUgcHi1r/Rm
 sZt6OsLT6XngU9+vupWutKl7X2aFV/8ykSUInxUiRzoMQrTy2n5a04hB9ZJkngJlBcNj
 f5jcXEnhe5sV1O/wgIqqZV5ZgORRwbUihSvnppmmf8i+QaVJC+HCtWrXQZLuKyttmDzB
 3hEsFIkmIxTxHU7eyUYqVZyNyLfWd7MhDgX2rN7EGy62IXe5k7nIlqXnGw3+f0hamtdG
 2/WQ==
X-Gm-Message-State: ABuFfoiAVMj2x1WjGLlLdWkoAZRNcMu1Cxmausl+zkScpfEP+9hkrXig
 CZrIfK1ZqQqcHM0wYUa9UMY1r/Hw
X-Google-Smtp-Source: ACcGV61xj7aFpaM2f/dOXLKGeTLO+7REgG76iMBKfzpWFad5khcGfYIRzM7nRaBEJS5FtQfB2dO0bw==
X-Received: by 2002:adf:ea42:: with SMTP id
 j2-v6mr14367231wrn.224.1538921522199; 
 Sun, 07 Oct 2018 07:12:02 -0700 (PDT)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id w72-v6sm28940116wrc.52.2018.10.07.07.12.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Oct 2018 07:12:01 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v4 11/12] tools: allow modification of transit net
Date: Sun,  7 Oct 2018 16:11:38 +0200
Message-Id: <20181007141139.26310-12-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181007141139.26310-1-ju.orth@gmail.com>
References: <20181007141139.26310-1-ju.orth@gmail.com>
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
index 1daa5ea..76a74f2 100644
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
index d588a44..ce812e9 100644
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
index 5dd2d78..18da0cd 100644
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
index 5457c67..f11ef8f 100644
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
2.19.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
