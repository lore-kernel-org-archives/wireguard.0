Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 084f4b8d
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 14:15:52 +0000 (UTC)
Received: from fifthhorseman.net (c-174-62-194-216.hsd1.ct.comcast.net
 [174.62.194.216])
 by che.mayfirst.org (Postfix) with ESMTPSA id EB171F98B
 for <wireguard@lists.zx2c4.com>; Sat,  2 Jul 2016 10:18:56 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Sat,  2 Jul 2016 10:18:55 -0400
Message-Id: <1467469135-30518-1-git-send-email-dkg@fifthhorseman.net>
Subject: [WireGuard] [PATCH] "wg help" cleanup and normalization
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

The "help" subcommand should return success and print to stdout, not
stderr.  It should also make it easy to consistently display the usage
of other subcommands.

This changeset collects the usage instructions of every subcommand
into wg.c for easier re-use.
---
 src/tools/set.c         |  2 +-
 src/tools/setconf.c     |  2 +-
 src/tools/show.c        |  3 +-
 src/tools/showconf.c    |  4 +--
 src/tools/subcommands.h |  9 +++++
 src/tools/wg.8          |  4 +--
 src/tools/wg.c          | 89 ++++++++++++++++++++++++++++++++++---------------
 7 files changed, 79 insertions(+), 34 deletions(-)

diff --git a/src/tools/set.c b/src/tools/set.c
index f85162d..1cac342 100644
--- a/src/tools/set.c
+++ b/src/tools/set.c
@@ -13,7 +13,7 @@ int set_main(int argc, char *argv[])
 	int ret = 1;
 
 	if (argc < 3) {
-		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [private-key <file path>] [peer <base64 public key> [remove] [endpoint <ip>:<port>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
+		fprintf(stderr, "Usage: %s %s %s\n", PROG_NAME, argv[0], get_subcommand_desc(argv[0])->usage);
 		return 1;
 	}
 
diff --git a/src/tools/setconf.c b/src/tools/setconf.c
index 81faa64..9d0fae7 100644
--- a/src/tools/setconf.c
+++ b/src/tools/setconf.c
@@ -19,7 +19,7 @@ int setconf_main(int argc, char *argv[])
 	int ret = 1;
 
 	if (argc != 3) {
-		fprintf(stderr, "Usage: %s %s <interface> <configuration filename>\n", PROG_NAME, argv[0]);
+		fprintf(stderr, "Usage: %s %s %s\n", PROG_NAME, argv[0], get_subcommand_desc(argv[0])->usage);
 		return 1;
 	}
 
diff --git a/src/tools/show.c b/src/tools/show.c
index 1662751..d8574d3 100644
--- a/src/tools/show.c
+++ b/src/tools/show.c
@@ -176,7 +176,7 @@ static char *bytes(uint64_t b)
 static const char *COMMAND_NAME = NULL;
 static void show_usage(void)
 {
-	fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces } [public-key | private-key | preshared-key | listen-port | peers | endpoints | allowed-ips | latest-handshake | bandwidth]\n", PROG_NAME, COMMAND_NAME);
+	fprintf(stderr, "Usage: %s %s %s\n", PROG_NAME, COMMAND_NAME, get_subcommand_desc(COMMAND_NAME)->usage);
 }
 
 static void pretty_print(struct wgdevice *device)
@@ -329,6 +329,7 @@ int show_main(int argc, char *argv[])
 	} else if (!strcmp(argv[1], "interfaces")) {
 		char *interfaces, *interface;
 		if (argc > 2) {
+			fprintf(stderr, "`%s %s %s` takes no additional arguments\n", PROG_NAME, argv[0], argv[1]);
 			show_usage();
 			return 1;
 		}
diff --git a/src/tools/showconf.c b/src/tools/showconf.c
index faf2482..54f9ca0 100644
--- a/src/tools/showconf.c
+++ b/src/tools/showconf.c
@@ -27,13 +27,13 @@ int showconf_main(int argc, char *argv[])
 	int ret = 1;
 
 	if (argc != 2) {
-		fprintf(stderr, "Usage: %s %s <interface>\n", PROG_NAME, argv[0]);
+		fprintf(stderr, "Usage: %s %s %s\n", PROG_NAME, argv[0], get_subcommand_desc(argv[0])->usage);
 		return 1;
 	}
 
 	if (!kernel_has_wireguard_interface(argv[1])) {
 		fprintf(stderr, "`%s` is not a valid WireGuard interface\n", argv[1]);
-		fprintf(stderr, "Usage: %s %s <interface>\n", PROG_NAME, argv[0]);
+		fprintf(stderr, "Usage: %s %s %s\n", PROG_NAME, argv[0], get_subcommand_desc(argv[0])->usage);
 		return 1;
 	}
 
diff --git a/src/tools/subcommands.h b/src/tools/subcommands.h
index 8351f8f..1072f8a 100644
--- a/src/tools/subcommands.h
+++ b/src/tools/subcommands.h
@@ -10,5 +10,14 @@ int set_main(int argc, char *argv[]);
 int setconf_main(int argc, char *argv[]);
 int genkey_main(int argc, char *argv[]);
 int pubkey_main(int argc, char *argv[]);
+int help_main(int argc, char *argv[]);
+
+struct subcommand_desc {
+	const char *subcommand;
+	int (*function)(int, char**);
+	const char *description;
+	const char *usage;
+};
+const struct subcommand_desc* get_subcommand_desc(const char *subcommand);
 
 #endif
diff --git a/src/tools/wg.8 b/src/tools/wg.8
index eee6d7b..d15bead 100644
--- a/src/tools/wg.8
+++ b/src/tools/wg.8
@@ -97,8 +97,8 @@ A private key and a corresponding public key may be generated at once by calling
 .br
     $ wg genkey | tee private.key | wg pubkey > public.key
 .TP
-\fBhelp\fP
-Show usage message.
+\fBhelp [\fI<subcommand>\fP...]\fP
+Show usage message or info about specific subcommands.
 
 .SH CONFIGURATION FILE FORMAT
 The configuration file format is based on \fIINI\fP. There are two top level sections
diff --git a/src/tools/wg.c b/src/tools/wg.c
index d4d2965..d834c18 100644
--- a/src/tools/wg.c
+++ b/src/tools/wg.c
@@ -8,49 +8,84 @@
 
 const char *PROG_NAME;
 
-static const struct {
-	const char *subcommand;
-	int (*function)(int, char**);
-	const char *description;
-} subcommands[] = {
-	{ "show", show_main, "Shows the current configuration and device information" },
-	{ "showconf", showconf_main, "Shows the current configuration of a given WireGuard interface, for use with `setconf`" },
-	{ "set", set_main, "Change the current configuration, add peers, remove peers, or change peers" },
-	{ "setconf", setconf_main, "Applies a configuration file to a WireGuard interface" },
-	{ "addconf", setconf_main, "Appends a configuration file to a WireGuard interface" },
-	{ "genkey", genkey_main, "Generates a new private key and writes it to stdout" },
-	{ "genpsk", genkey_main, "Generates a new pre-shared key and writes it to stdout" },
-	{ "pubkey", pubkey_main, "Reads a private key from stdin and writes a public key to stdout" }
+static const struct subcommand_desc
+subcommands[] = {
+	{ "show", show_main, "Shows the current configuration and device information",
+	  "{ <interface> | all | interfaces } [public-key | private-key | preshared-key | listen-port | peers | endpoints | allowed-ips | latest-handshake | bandwidth]" },
+	{ "showconf", showconf_main, "Shows the current configuration of a given WireGuard interface, for use with `setconf`",
+	  "<interface>" },
+	{ "set", set_main, "Change the current configuration, add peers, remove peers, or change peers",
+	  "<interface> [listen-port <port>] [private-key <file path>] [peer <base64 public key> [remove] [endpoint <ip>:<port>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]..." },
+	{ "setconf", setconf_main, "Applies a configuration file to a WireGuard interface",
+	  "<interface> <configuration filename>" },
+	{ "addconf", setconf_main, "Appends a configuration file to a WireGuard interface",
+	  "<interface> <configuration filename>" },
+	{ "genkey", genkey_main, "Generates a new private key and writes it to stdout",
+	  "" },
+	{ "genpsk", genkey_main, "Generates a new pre-shared key and writes it to stdout",
+	  "" },
+	{ "pubkey", pubkey_main, "Reads a private key from stdin and writes a public key to stdout",
+	  "" },
+	{ "help", help_main, "Show this usage message or info about another subcommand",
+	  "[<subcommand>...]" }
 };
 
-static void show_usage(void)
+const struct subcommand_desc* get_subcommand_desc(const char *subcommand)
 {
-	fprintf(stderr, "Usage: %s <cmd> [<args>]\n\n", PROG_NAME);
-	fprintf(stderr, "Available subcommands:\n");
 	for (size_t i = 0; i < sizeof(subcommands) / sizeof(subcommands[0]); ++i)
-		fprintf(stderr, "  %s: %s\n", subcommands[i].subcommand, subcommands[i].description);
+		if (!strcmp(subcommand, subcommands[i].subcommand))
+			return &subcommands[i];
+	return NULL;
+}
+
+static void show_usage(FILE* stream)
+{
+	fprintf(stream, "Usage: %s <subcommand> [<args>]\n\n", PROG_NAME);
+	fprintf(stream, "Available subcommands:\n\n");
+	for (size_t i = 0; i < sizeof(subcommands) / sizeof(subcommands[0]); ++i)
+		fprintf(stream, "  %-10s %s\n", subcommands[i].subcommand, subcommands[i].description);
+	fprintf(stream, "\nFor info about a specific subcommand:  %s help <subcommand>\n", PROG_NAME);
+}
+
+int help_main(int argc, char *argv[])
+{
+	int ret = 0, once = 0;
+	if (argc <= 1)
+		show_usage(stdout);
+	for (int i = 1; i < argc; ++i) {
+		const struct subcommand_desc *desc = get_subcommand_desc(argv[i]);
+		if (desc) {
+			if (once)
+				fprintf(stdout, "\n");
+			fprintf(stdout, "Help for %s %s\n    %s\n", PROG_NAME, desc->subcommand, desc->description);
+			fprintf(stdout, "Usage: %s %s%s%s\n", PROG_NAME, desc->subcommand, (desc->usage[0] ? " " : ""), desc->usage);
+			once = 1;
+		} else {
+			fprintf(stderr, "%s: no such subcommand: %s\n", PROG_NAME, argv[i]);
+			ret = 1;
+		}
+	}
+	return ret;
 }
 
 int main(int argc, char *argv[])
 {
 	char *tmp = NULL;
+	const struct subcommand_desc *subcommand;
 	PROG_NAME = argv[0];
 
-	if (argc == 2 && (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help") || !strcmp(argv[1], "help"))) {
-		show_usage();
-		return 1;
-	}
-
 	if (argc == 1) {
 		char *new_argv[] = { "show", NULL };
 		return show_main(1, new_argv);
 	}
 
+	if (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help"))
+		argv[1] = "help";
+
 findsubcommand:
-	for (size_t i = 0; i < sizeof(subcommands) / sizeof(subcommands[0]); ++i) {
-		if (!strcmp(argv[1], subcommands[i].subcommand))
-			return subcommands[i].function(argc - 1, argv + 1);
-	}
+	subcommand = get_subcommand_desc(argv[1]);
+	if (subcommand)
+		return subcommand->function(argc - 1, argv + 1);
 
 	/* Crude way of supporting "wg wg0 show..." */
 	if (!tmp && argc >= 3) {
@@ -61,6 +96,6 @@ findsubcommand:
 	}
 
 	fprintf(stderr, "Invalid subcommand: `%s`\n", argv[1]);
-	show_usage();
+	show_usage(stderr);
 	return 1;
 }
-- 
2.8.1
