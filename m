Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F85C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E3C206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVti0H8Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E3C206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21ede689;
	Sat, 15 Dec 2018 16:56:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd3e725c
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:35 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5205c54a
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id h15so7431888edb.4
 for <wireguard@lists.zx2c4.com>; Sat, 15 Dec 2018 08:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x38hYqwqeFqbNvRv8jd9hCTxXqgQm9BvQzJoETB/xhA=;
 b=RVti0H8QBkCjA143QT2LEsYNe9OzYCrvv6UjuefNP5M2wIm+/CwBYUfxW0k3+NJxcV
 8II3aCFE3/HysCtGGOK+PY2bwF2uWT+wwiq0EWb8/5nctQH9cD4IZnx7eyFlUCqYSDp5
 26flc7YtGjkIIR/HzN/rrtQEngnAgXbD9p3Q0k1VO3ll/G0+UBBCgFHlYQwXY3v6AtmB
 BhKm8LXvTANhzifjWN2okYWsP7vFrh8O2ec8dZb9WOhe56B16RdLfj/CO5wo7ATnFYy8
 gwXtkFunZw64RRL4rvq8CgjDOefGXZoHDJD4BGgDRbUAGAAAkP6jCDyIj2BA9wjsEU6Z
 m3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x38hYqwqeFqbNvRv8jd9hCTxXqgQm9BvQzJoETB/xhA=;
 b=GnlifVyyCtf0xkh980RNUyAZGGyoPNOa9RuxJMXddoZs1W/jp3hW8N0NJ48SVm9tMy
 1O/RamXpnEUuzhWUlq8tuicgJniHVOsz5NQUfJa83LaQyYFtt5irO9+YdZpFTI8NjuVf
 VZgGUsfMy3Qr55onL4psBgnnuOexwE7GgKpnzaw7LegHlYl091Az69XdbgOpqoXMS3+S
 mXS6mCd72gnLzk7IBEsIEQ0jyndGwsM18hD1vf5hnAHP1badA9EHvn8Fq1v/2W7eDjwk
 Z/4FbdFeLqnK0TXNrWU/GpFBH9rd4qoGrFicWZv/tIpMp5dJSlqJoR3sVWJlDsC8Gf1G
 U2zg==
X-Gm-Message-State: AA+aEWbcLZnnBph5dqZIfxk95IOiTE2RfT6AIWzTf7047GmPoU/SUmO8
 pZYtDCDs9M5Hdydw8d3qg97T7ctu
X-Google-Smtp-Source: AFSGD/UcmcybpcywBKk6cyurdOILbL0zCqNreZspTcWvEYvtnU9ZbmKfLUkp91k7R2rHgxgxY9H5+A==
X-Received: by 2002:a50:b286:: with SMTP id p6mr6976401edd.202.1544892996350; 
 Sat, 15 Dec 2018 08:56:36 -0800 (PST)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id q50sm2356015edd.66.2018.12.15.08.56.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Dec 2018 08:56:35 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v5 08/11] tools: add framework for shared options
Date: Sat, 15 Dec 2018 17:56:10 +0100
Message-Id: <20181215165613.5486-9-ju.orth@gmail.com>
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
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
