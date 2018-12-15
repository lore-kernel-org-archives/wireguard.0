Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA138C43444
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65792206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cl5OnLUI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65792206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b822a009;
	Sat, 15 Dec 2018 16:57:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 394019eb
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:57:17 +0000 (UTC)
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6ccedac
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:33 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p6so7451485eds.0
 for <wireguard@lists.zx2c4.com>; Sat, 15 Dec 2018 08:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HkODb6ZdzNf9w6E1DbhPN4t891lPYFnqJWjvKMYtifk=;
 b=cl5OnLUI73Kn64zXwhM4tbpTlh1KCf5SJoLCBJdf6Tdpx08IcpkNPOElr/unYLRD1P
 UkBLgKl6A1dBNptGh7TBrSp/b60ZG4jDXPC/F8TjRjEukVZ1Yk1dhLpmY0jnB3o07m3+
 3EcxRjeQYHF1cdxu28SSngXg+nbJ8CI89k0Z2dsK/M3aBiRzKG6Y7Vmxsrm8YuNjL0ru
 GYwSUwctWrlyHBcJ9tX2HYnk2LpdLLcvgUM8L4sozXUbU9v3AMp8fWLoHDkPbl5dhxMB
 +YIAdwlyG+q/9bSqdlwsB6Hqq7CA75lce9HLZljHqNRnr4ZnvdJmQjE5k3Cx/YgkqZ5Z
 KqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HkODb6ZdzNf9w6E1DbhPN4t891lPYFnqJWjvKMYtifk=;
 b=ZhiEKvr9yJ1/VHJUmuThXlmf8Y3qG7bM5qaGiFFUDhl/5R7HRz60cRvRS6KiO7FnWe
 pdpDjEA+Yit5ICMY9APnWzxAuEetX0Q/MdSRg6xlc9Zng6bv/VZHYoCGQR2gEYp73ddh
 Kxn8zpXT8mdk/cIxXIEV3YJCpD0OQDDcR2Z/JwWJZ5ovvt7yhBYE5qygGdV3vihmeKOJ
 SNkZLyusP32mlqU1Qfv1S+cE56piRsvmJEIDdGG0wvdP8ObJEkFixLI9x7NvQr+4BHAD
 uRtlTxzAh845Sb8XVtCAFEBiU3cB1TOa8iQlUJ0efgz+5MFmhx3IDrtuwVV6v1yFBRIb
 L8Og==
X-Gm-Message-State: AA+aEWaUk6SWXJeH7/Mkk5I4RVvWhhBmLVKeApMX0WoeifsLvBYTnf1M
 nIyclR2m2buFJeLK675yJrgbO/mJ
X-Google-Smtp-Source: AFSGD/UBhJKVfT8IfoagZn28gse8Xiy4PZ/ehZ7KQzOThNd5chQ0d6Ou0nkJZNsWUIsK5r7p4cTr+A==
X-Received: by 2002:a17:906:2313:: with SMTP id
 l19-v6mr5410806eja.204.1544892998172; 
 Sat, 15 Dec 2018 08:56:38 -0800 (PST)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id q50sm2356015edd.66.2018.12.15.08.56.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Dec 2018 08:56:37 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v5 10/11] tools: allow modification of transit net
Date: Sat, 15 Dec 2018 17:56:12 +0100
Message-Id: <20181215165613.5486-11-ju.orth@gmail.com>
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
index 2c16897..e66cd2c 100644
--- a/src/tools/ipc.c
+++ b/src/tools/ipc.c
@@ -575,6 +575,10 @@ again:
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
index 2013825..0ddad87 100644
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
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
