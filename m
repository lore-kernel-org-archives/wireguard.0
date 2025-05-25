Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E80C54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 May 2025 12:33:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a78e437;
	Sun, 25 May 2025 12:33:56 +0000 (UTC)
Received: from sharkgirl.ing (sharkgirl.ing [2a01:4f8:c012:afee::])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 180e497d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 May 2025 08:05:02 +0000 (UTC)
Received: from sharkgirl.ing by sharkgirl.ing ([IPv6:2a01:4f8:c012:afee::])
 via tcp with ESMTPSA id uhmnuksGggIMRc5CXdLW5w (TLS1.3
 TLS_AES_128_GCM_SHA256) 25 May 2025 08:05:01 +0000
DKIM-Signature: v=1; d=claire.sharkgirl.ing; s=2025a;
 i=git@claire.sharkgirl.ing; a=ed25519-sha256; t=1748160301; x=1748419501;
 h=From:To:Cc:Bcc:Reply-To:References:In-Reply-To:Subject:Date:Message-Id:
 Content-Type:From:To:Cc:Subject:Date:Message-Id;
 bh=8ZYW5RIp025ZIf6Q0bVFpU52Zy75N8P3Oa4005JXdY4=; b=U/c081oVCPbOCNhVaqCKxH6P
 xZXxFgD+mZ0aIGkYwGlyLZZ5Q8bOYnJUMlnFPjrafobsNq7d4enL4ilBFMS4BA==
DKIM-Signature: v=1; d=claire.sharkgirl.ing; s=2025b;
 i=git@claire.sharkgirl.ing; a=rsa-sha256; t=1748160301; x=1748419501;
 h=From:To:Cc:Bcc:Reply-To:References:In-Reply-To:Subject:Date:Message-Id:
 Content-Type:From:To:Cc:Subject:Date:Message-Id;
 bh=8ZYW5RIp025ZIf6Q0bVFpU52Zy75N8P3Oa4005JXdY4=; b=Ba9I7n76mTMYel+aemKBnq+U
 Bq49EZtRXjPEsDbata9E2N++Nh1ovkvXXMyDrBT53jKvJrdCtHmvi9G8bCn6WM5do59T49VlTIs
 QdBSHNSbFI21MVRIvXp6sG3fOCv2cofZvpmd8/LrHAL0OXs7n1xJD0KtKbdkz+ZO2xgOJm6Ju8Y
 7tAhqEjYklDf2bguY5fqgRVLZEWVz55+xwJBcpDkyY8ecGpnfcBmkCOPb0KaG9/Bql696iS35e2
 EZqXbJFARuD+9FMARP4QnzfFtMCVfuUhVjxQpKqjViC5qTbHXtU+wRz7BU55yIAxIbuvrBhoze5
 Ska1rQMJZYf3jCNJWA==
Authentication-Results: sharkgirl.ing;
 auth=pass smtp.mailfrom=git@claire.sharkgirl.ing
From: Claire Elaina <git@claire.sharkgirl.ing>
To: wireguard@lists.zx2c4.com
Cc: Claire Elaina <git@claire.sharkgirl.ing>
Subject: [PATCH wireguard-tools] wg-quick: android: add support for {Pre,
 Post}{Up, Down} hooks
Date: Sun, 25 May 2025 18:04:57 +1000
Message-ID: <20250525080457.998659-1-git@claire.sharkgirl.ing>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 25 May 2025 12:33:55 +0000
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

---
 src/wg-quick/android.c | 96 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 89 insertions(+), 7 deletions(-)

diff --git a/src/wg-quick/android.c b/src/wg-quick/android.c
index 1263ee4..8a8df47 100644
--- a/src/wg-quick/android.c
+++ b/src/wg-quick/android.c
@@ -60,6 +60,15 @@ static void *xcalloc(size_t nmemb, size_t size)
 	exit(errno);
 }
 
+static void *xrealloc(void *ptr, size_t size)
+{
+	void *ret = realloc(ptr, size);
+	if (ret)
+		return ret;
+	perror("Error: realloc");
+	exit(errno);
+}
+
 static void *xstrdup(const char *str)
 {
 	char *ret = strdup(str);
@@ -126,6 +135,27 @@ static void free_command_buffer(struct command_buffer *c)
 	free(c->line);
 }
 
+struct str_list {
+	char **items;
+	size_t len;
+};
+
+static void append_str_list(struct str_list *l, char *item)
+{
+	l->len++;
+	l->items = xrealloc(l->items, sizeof(char*) * l->len);
+	l->items[l->len - 1] = item;
+}
+
+static void free_str_list(struct str_list *l)
+{
+	if (!l)
+		return;
+	for (size_t i = 0; i < l->len; ++i)
+		free(l->items[i]);
+	free(l->items);
+}
+
 static void freep(void *p)
 {
 	free(*(void **)p);
@@ -140,6 +170,7 @@ static void fclosep(FILE **f)
 #define _cleanup_regfree_ _cleanup_(regfree)
 
 #define DEFINE_CMD(name) _cleanup_(free_command_buffer) struct command_buffer name = { 0 };
+#define DEFINE_STR_LIST(name) _cleanup_(free_str_list) struct str_list name = { 0 };
 
 static char *vcmd_ret(struct command_buffer *c, const char *cmd_fmt, va_list args)
 {
@@ -239,6 +270,12 @@ _printf_(1, 2) static void cndc(const char *cmd_fmt, ...)
 	}
 }
 
+static void execute_hooks(const struct str_list *hooks)
+{
+	for (size_t i = 0; i < hooks->len; ++i)
+		cmd("%s", hooks->items[i]);
+}
+
 /* Values are from AOSP repository platform/frameworks/native in libs/binder/ndk/include_ndk/android/binder_status.h. */
 enum {
 	STATUS_OK = 0,
@@ -1112,7 +1149,7 @@ static void cmd_up_cleanup(void)
 	free(cleanup_iface);
 }
 
-static void cmd_up(const char *iface, const char *config, unsigned int mtu, const char *addrs, const char *dnses, const char *excluded_applications, const char *included_applications)
+static void cmd_up(const char *iface, const char *config, unsigned int mtu, const char *addrs, const char *dnses, const char *excluded_applications, const char *included_applications, const struct str_list *pre_up, const struct str_list *post_up)
 {
 	DEFINE_CMD(c);
 	unsigned int netid = 0;
@@ -1127,6 +1164,7 @@ static void cmd_up(const char *iface, const char *config, unsigned int mtu, cons
 	atexit(cmd_up_cleanup);
 
 	add_if(iface);
+	execute_hooks(pre_up);
 	set_config(iface, config);
 	listen_port = determine_listen_port(iface);
 	up_if(&netid, iface, listen_port);
@@ -1135,6 +1173,7 @@ static void cmd_up(const char *iface, const char *config, unsigned int mtu, cons
 	set_routes(iface, netid);
 	set_mtu(iface, mtu);
 	set_users(netid, excluded_applications, included_applications);
+	execute_hooks(post_up);
 	broadcast_change();
 
 	free(cleanup_iface);
@@ -1142,7 +1181,7 @@ static void cmd_up(const char *iface, const char *config, unsigned int mtu, cons
 	exit(EXIT_SUCCESS);
 }
 
-static void cmd_down(const char *iface)
+static void cmd_down(const char *iface, const struct str_list *pre_down, const struct str_list *post_down)
 {
 	DEFINE_CMD(c);
 	bool found = false;
@@ -1161,12 +1200,14 @@ static void cmd_down(const char *iface)
 		exit(EMEDIUMTYPE);
 	}
 
+	execute_hooks(pre_down);
 	del_if(iface);
+	execute_hooks(post_down);
 	broadcast_change();
 	exit(EXIT_SUCCESS);
 }
 
-static void parse_options(char **iface, char **config, unsigned int *mtu, char **addrs, char **dnses, char **excluded_applications, char **included_applications, const char *arg)
+static void parse_options(char **iface, char **config, unsigned int *mtu, char **addrs, char **dnses, char **excluded_applications, char **included_applications, struct str_list *pre_up, struct str_list *post_up, struct str_list *pre_down, struct str_list *post_down, const char *arg)
 {
 	_cleanup_fclose_ FILE *file = NULL;
 	_cleanup_free_ char *line = NULL;
@@ -1236,6 +1277,27 @@ static void parse_options(char **iface, char **config, unsigned int *mtu, char *
 		}
 		clean[j] = '\0';
 
+		char *line_value = strchr(line, '=');
+		_cleanup_free_ char *unstripped_value = NULL;
+		if (line_value) {
+			/* Skip equal sign. */
+			line_value++;
+
+			/* Skip leading whitespace. */
+			while (isspace(line_value[0]))
+				line_value++;
+
+			/* Calculate length of the value without trailing whitespace. */
+			size_t line_value_len = strlen(line_value);
+			while (line_value_len && isspace(line_value[line_value_len - 1]))
+				line_value_len--;
+
+			/* Create the string. */
+			unstripped_value = xmalloc(line_value_len + 1);
+			memcpy(unstripped_value, line_value, line_value_len);
+			unstripped_value[line_value_len] = '\0';
+		}
+
 		if (clean[0] == '[')
 			in_interface_section = false;
 		if (!strcasecmp(clean, "[Interface]"))
@@ -1256,6 +1318,22 @@ static void parse_options(char **iface, char **config, unsigned int *mtu, char *
 			} else if (!strncasecmp(clean, "MTU=", 4) && j > 4) {
 				*mtu = atoi(clean + 4);
 				continue;
+			} else if (!strncasecmp(clean, "PreUp=", 6) && j > 6) {
+				append_str_list(pre_up, unstripped_value);
+				unstripped_value = NULL;
+				continue;
+			} else if (!strncasecmp(clean, "PostUp=", 7) && j > 7) {
+				append_str_list(post_up, unstripped_value);
+				unstripped_value = NULL;
+				continue;
+			} else if (!strncasecmp(clean, "PreDown=", 8) && j > 8) {
+				append_str_list(pre_down, unstripped_value);
+				unstripped_value = NULL;
+				continue;
+			} else if (!strncasecmp(clean, "PostDown=", 9) && j > 9) {
+				append_str_list(post_down, unstripped_value);
+				unstripped_value = NULL;
+				continue;
 			}
 		}
 		*config = concat_and_free(*config, "", line);
@@ -1279,6 +1357,10 @@ int main(int argc, char *argv[])
 	_cleanup_free_ char *dnses = NULL;
 	_cleanup_free_ char *excluded_applications = NULL;
 	_cleanup_free_ char *included_applications = NULL;
+	DEFINE_STR_LIST(pre_up);
+	DEFINE_STR_LIST(post_up);
+	DEFINE_STR_LIST(pre_down);
+	DEFINE_STR_LIST(post_down);
 	unsigned int mtu;
 	char prop[PROP_VALUE_MAX + 1];
 
@@ -1289,12 +1371,12 @@ int main(int argc, char *argv[])
 		cmd_usage(argv[0]);
 	else if (argc == 3 && !strcmp(argv[1], "up")) {
 		auto_su(argc, argv);
-		parse_options(&iface, &config, &mtu, &addrs, &dnses, &excluded_applications, &included_applications, argv[2]);
-		cmd_up(iface, config, mtu, addrs, dnses, excluded_applications, included_applications);
+		parse_options(&iface, &config, &mtu, &addrs, &dnses, &excluded_applications, &included_applications, &pre_up, &post_up, &pre_down, &post_down, argv[2]);
+		cmd_up(iface, config, mtu, addrs, dnses, excluded_applications, included_applications, &pre_up, &post_up);
 	} else if (argc == 3 && !strcmp(argv[1], "down")) {
 		auto_su(argc, argv);
-		parse_options(&iface, &config, &mtu, &addrs, &dnses, &excluded_applications, &included_applications, argv[2]);
-		cmd_down(iface);
+		parse_options(&iface, &config, &mtu, &addrs, &dnses, &excluded_applications, &included_applications, &pre_up, &post_up, &pre_down, &post_down, argv[2]);
+		cmd_down(iface, &pre_down, &post_down);
 	} else {
 		cmd_usage(argv[0]);
 		return 1;
-- 
2.49.0

