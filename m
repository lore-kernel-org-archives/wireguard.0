Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2570FC676D4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B84F020882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVTnsNty"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B84F020882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cd33241;
	Sun, 7 Oct 2018 14:11:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a80be445
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:34 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a37840fb
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e4-v6so18044819wrs.0
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 07:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NyQT3/s0n1bLyl+09LCmuV2JPKFOqBX9FMtdoHR8KJc=;
 b=MVTnsNtyUfoPFHJ0Wcpd75RdOPyRwwYKEcU6JDsqhvqnDxO/vKWFImuw7Bzvu2+Wjp
 nhQ2WqVmRWe2Dt4gTeTSh0OH5RLotqS2N9boPavGijhRTb8H3Z7/DHZqfAsfw+ZybPKw
 ouxTArAfL2C2U4Y6w6wsvmadiWKTncvBlcmmX7k6rDq+bkFku9FTVovXm7ACKuHImblN
 E8i9J9GhNrWpYn8lK/rcWMY4t76xvsmjOTsE5+/wTgOiDLtLYgjDLoPsXJtSZFciTHNi
 goH3gSZNJzRtKiHQLQ8zy2/x3zU6jj6J3a3TKwCKiRewuTwxRaeS4g6bdY+QJuzaW0t1
 hMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NyQT3/s0n1bLyl+09LCmuV2JPKFOqBX9FMtdoHR8KJc=;
 b=QNUcE5QI9nmnzdlO34bg7Pt76jxMDIUFDx1BHFg0zpjQCXplhN3y23JHbvsPm6jnG6
 afn3kFxwzTYi76MA2q8snvrAvltv+S9npeeAX/vPtZouABOgZ1zjpO5aVdtdTpJc0ls3
 hR+KcbhJHoPNjzFqwm0NA6/h7QM5hYGC67bdcKHr/JC6rfK5CZKulEu3g84NRAlEknMt
 2K7/wKIKsmRrAYYnxR+2NbRP5ywhCG1pJV8RpqRyrMyFwqclf3nJgeQNfDJu643zGFI8
 tjDgH/wzQURFAJTkl6oFPF5wkJK4xLCwvNbdEH24By9/Lg6L60OIpDJsmApQAf0FYEA9
 NLeA==
X-Gm-Message-State: ABuFfogPv1+POTDi09+EBSqre9F3ZnkWUCqg141uvNMvnbqP+q3Vr3Fd
 EqhcKazYVLaOHwmtkIWQWu0Stt8l
X-Google-Smtp-Source: ACcGV60703+MnR+Gb7w/U/7DqjNw2+QF94AiCoIcOJRcIjK5WbUQtjEUEav87ZobTX/3di+jVXfPeQ==
X-Received: by 2002:adf:90a2:: with SMTP id
 i31-v6mr12774093wri.77.1538921520239; 
 Sun, 07 Oct 2018 07:12:00 -0700 (PDT)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id w72-v6sm28940116wrc.52.2018.10.07.07.11.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Oct 2018 07:11:59 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v4 09/12] tools: add framework for shared options
Date: Sun,  7 Oct 2018 16:11:36 +0200
Message-Id: <20181007141139.26310-10-ju.orth@gmail.com>
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

---
 src/tools/containers.h  |  3 +++
 src/tools/genkey.c      |  3 ++-
 src/tools/pubkey.c      |  3 ++-
 src/tools/set.c         |  3 ++-
 src/tools/setconf.c     |  3 ++-
 src/tools/show.c        |  3 ++-
 src/tools/showconf.c    |  3 ++-
 src/tools/subcommands.h | 14 ++++++-----
 src/tools/wg.c          | 56 +++++++++++++++++++++++++++++++++++------
 9 files changed, 72 insertions(+), 19 deletions(-)

diff --git a/src/tools/containers.h b/src/tools/containers.h
index 619094e..cd757e4 100644
--- a/src/tools/containers.h
+++ b/src/tools/containers.h
@@ -15,6 +15,9 @@
 
 #include "../uapi/wireguard.h"
 
+struct wgoptions {
+};
+
 struct wgallowedip {
 	uint16_t family;
 	union {
diff --git a/src/tools/genkey.c b/src/tools/genkey.c
index e50d64b..d286cc0 100644
--- a/src/tools/genkey.c
+++ b/src/tools/genkey.c
@@ -52,11 +52,12 @@ static inline ssize_t get_random_bytes(uint8_t *out, size_t len)
 	return ret;
 }
 
-int genkey_main(int argc, char *argv[])
+int genkey_main(int argc, char *argv[], struct wgoptions *options)
 {
 	uint8_t key[WG_KEY_LEN];
 	char base64[WG_KEY_LEN_BASE64];
 	struct stat stat;
+	(void)options;
 
 	if (argc != 1) {
 		fprintf(stderr, "Usage: %s %s\n", PROG_NAME, argv[0]);
diff --git a/src/tools/pubkey.c b/src/tools/pubkey.c
index cf8e256..08a3e9a 100644
--- a/src/tools/pubkey.c
+++ b/src/tools/pubkey.c
@@ -11,11 +11,12 @@
 #include "encoding.h"
 #include "subcommands.h"
 
-int pubkey_main(int argc, char *argv[])
+int pubkey_main(int argc, char *argv[], struct wgoptions *options)
 {
 	uint8_t key[WG_KEY_LEN];
 	char base64[WG_KEY_LEN_BASE64];
 	int trailing_char;
+	(void)options;
 
 	if (argc != 1) {
 		fprintf(stderr, "Usage: %s %s\n", PROG_NAME, argv[0]);
diff --git a/src/tools/set.c b/src/tools/set.c
index 9d84ccd..4e90940 100644
--- a/src/tools/set.c
+++ b/src/tools/set.c
@@ -12,10 +12,11 @@
 #include "ipc.h"
 #include "subcommands.h"
 
-int set_main(int argc, char *argv[])
+int set_main(int argc, char *argv[], struct wgoptions *options)
 {
 	struct wgdevice *device = NULL;
 	int ret = 1;
+	(void)options;
 
 	if (argc < 3) {
 		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
diff --git a/src/tools/setconf.c b/src/tools/setconf.c
index 7135e85..8133bdd 100644
--- a/src/tools/setconf.c
+++ b/src/tools/setconf.c
@@ -13,7 +13,7 @@
 #include "ipc.h"
 #include "subcommands.h"
 
-int setconf_main(int argc, char *argv[])
+int setconf_main(int argc, char *argv[], struct wgoptions *options)
 {
 	struct wgdevice *device = NULL;
 	struct config_ctx ctx;
@@ -21,6 +21,7 @@ int setconf_main(int argc, char *argv[])
 	char *config_buffer = NULL;
 	size_t config_buffer_len = 0;
 	int ret = 1;
+	(void)options;
 
 	if (argc != 3) {
 		fprintf(stderr, "Usage: %s %s <interface> <configuration filename>\n", PROG_NAME, argv[0]);
diff --git a/src/tools/show.c b/src/tools/show.c
index b50af2a..1ebe6e2 100644
--- a/src/tools/show.c
+++ b/src/tools/show.c
@@ -377,10 +377,11 @@ static bool ugly_print(struct wgdevice *device, const char *param, bool with_int
 	return true;
 }
 
-int show_main(int argc, char *argv[])
+int show_main(int argc, char *argv[], struct wgoptions *options)
 {
 	int ret = 0;
 
+	(void)options;
 	COMMAND_NAME = argv[0];
 
 	if (argc > 3) {
diff --git a/src/tools/showconf.c b/src/tools/showconf.c
index 777e022..1de65b0 100644
--- a/src/tools/showconf.c
+++ b/src/tools/showconf.c
@@ -18,7 +18,7 @@
 #include "ipc.h"
 #include "subcommands.h"
 
-int showconf_main(int argc, char *argv[])
+int showconf_main(int argc, char *argv[], struct wgoptions *options)
 {
 	char base64[WG_KEY_LEN_BASE64];
 	char ip[INET6_ADDRSTRLEN];
@@ -26,6 +26,7 @@ int showconf_main(int argc, char *argv[])
 	struct wgpeer *peer;
 	struct wgallowedip *allowedip;
 	int ret = 1;
+	(void)options;
 
 	if (argc != 2) {
 		fprintf(stderr, "Usage: %s %s <interface>\n", PROG_NAME, argv[0]);
diff --git a/src/tools/subcommands.h b/src/tools/subcommands.h
index 2a7e36e..6707ead 100644
--- a/src/tools/subcommands.h
+++ b/src/tools/subcommands.h
@@ -6,12 +6,14 @@
 #ifndef SUBCOMMANDS_H
 #define SUBCOMMANDS_H
 
+#include "containers.h"
+
 extern const char *PROG_NAME;
-int show_main(int argc, char *argv[]);
-int showconf_main(int argc, char *argv[]);
-int set_main(int argc, char *argv[]);
-int setconf_main(int argc, char *argv[]);
-int genkey_main(int argc, char *argv[]);
-int pubkey_main(int argc, char *argv[]);
+int show_main(int argc, char *argv[], struct wgoptions *);
+int showconf_main(int argc, char *argv[], struct wgoptions *);
+int set_main(int argc, char *argv[], struct wgoptions *);
+int setconf_main(int argc, char *argv[], struct wgoptions *);
+int genkey_main(int argc, char *argv[], struct wgoptions *);
+int pubkey_main(int argc, char *argv[], struct wgoptions *);
 
 #endif
diff --git a/src/tools/wg.c b/src/tools/wg.c
index 4c24ff0..f70b5c5 100644
--- a/src/tools/wg.c
+++ b/src/tools/wg.c
@@ -6,14 +6,17 @@
 #include <stddef.h>
 #include <stdio.h>
 #include <string.h>
+#include <stdbool.h>
+#include <getopt.h>
 
 #include "subcommands.h"
+#include "containers.h"
 
 const char *PROG_NAME;
 
 static const struct {
 	const char *subcommand;
-	int (*function)(int, char**);
+	int (*function)(int, char**, struct wgoptions *);
 	const char *description;
 } subcommands[] = {
 	{ "show", show_main, "Shows the current configuration and device information" },
@@ -35,26 +38,65 @@ static void show_usage(FILE *file)
 	fprintf(file, "You may pass `--help' to any of these subcommands to view usage.\n");
 }
 
+static bool parse_options(int argc, char *argv[], struct wgoptions *options)
+{
+	int ch;
+	struct option opts[] = {
+		{
+			.name = "help",
+			.val = 'h',
+		},
+		{
+			0
+		}
+	};
+	(void)options;
+
+	setenv("POSIXLY_CORRECT", "", 0);
+
+	while ((ch = getopt_long(argc, argv, "h", opts, NULL)) != -1) {
+		switch (ch) {
+		case '?':
+			return false;
+		case 'h':
+			show_usage(stdout);
+			exit(0);
+		}
+	}
+
+	return true;
+}
+
 int main(int argc, char *argv[])
 {
+	struct wgoptions options = { };
+
 	PROG_NAME = argv[0];
 
-	if (argc == 2 && (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help") || !strcmp(argv[1], "help"))) {
+	if (argc == 2 && !strcmp(argv[1], "help")) {
 		show_usage(stdout);
 		return 0;
 	}
 
-	if (argc == 1) {
+	if (!parse_options(argc, argv, &options)) {
+		show_usage(stderr);
+		return 1;
+	}
+
+	argv += optind;
+	argc -= optind;
+
+	if (argc == 0) {
 		static char *new_argv[] = { "show", NULL };
-		return show_main(1, new_argv);
+		return show_main(1, new_argv, &options);
 	}
 
 	for (size_t i = 0; i < sizeof(subcommands) / sizeof(subcommands[0]); ++i) {
-		if (!strcmp(argv[1], subcommands[i].subcommand))
-			return subcommands[i].function(argc - 1, argv + 1);
+		if (!strcmp(argv[0], subcommands[i].subcommand))
+			return subcommands[i].function(argc, argv, &options);
 	}
 
-	fprintf(stderr, "Invalid subcommand: `%s'\n", argv[1]);
+	fprintf(stderr, "Invalid subcommand: `%s'\n", argv[0]);
 	show_usage(stderr);
 	return 1;
 }
-- 
2.19.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
