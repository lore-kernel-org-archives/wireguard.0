Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bff2f412
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:58 +0000 (UTC)
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com
 [IPv6:2a00:1450:400c:c09::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd7c22f0
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:44 +0000 (UTC)
Received: by mail-wm0-x234.google.com with SMTP id f21-v6so2154735wmc.5
 for <wireguard@lists.zx2c4.com>; Tue, 11 Sep 2018 12:13:37 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v3 09/12] tools: add framework for shared options
Date: Tue, 11 Sep 2018 21:13:08 +0200
Message-Id: <20180911191311.25373-10-ju.orth@gmail.com>
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
index 455d998..8142d65 100644
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
index d2d4c53..ce45b1a 100644
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
index 385145b..19e41e3 100644
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
index d44fed9..2fb782b 100644
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
index 012c245..c28dbac 100644
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
index 9f98286..41f1a11 100644
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
index 313ad23..0c1fdc3 100644
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
index c4aa4c6..8b10fd4 100644
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
index 18a1480..3bf6252 100644
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
2.18.0
