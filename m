Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CC7C35254
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:24:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 895DE22522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:24:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=venev.name header.i=@venev.name header.b="iW6EIIC7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 895DE22522
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=venev.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b65b6b5b;
	Sat, 8 Feb 2020 21:23:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a4fd1a6
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 19:59:36 +0000 (UTC)
Received: from mtel-bg02.venev.name (mtel-bg02.venev.name [77.70.28.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id babe00b2
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 19:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=venev.name; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UelF4LKIbXcBa6nUWrAcYpbrtkyh4NNsghXnn8f7zrE=; b=iW6EIIC7aoZA2+0tmERVv/WXMa
 7KOXDns8XvlCE+dMWFQW+sdq0s8T7YfmUv+HsZRjUJZX7OqZ+mml4ZhjIkShnWNZLpZMu578InNpp
 Csk3eUCbYN57DT4cG23OdzNpya2fD2z/Tr4vRAOfc+QsApftq4480Ea8c5L3azsIc+14PzDvcLvMO
 pPXVy61FGH0yyLS+b8Cz1hc9XqTUop3AaZBWHRWTU9StBc8TzkfgRfsPpuTyqZA+U26oWRQECn4tJ
 lEwiDbJHCvkEw9Fex6m0KMQGfqdALOb+GI6/l0mXiJB2fpyyeGNy60Sf8Yyp3wEtWAPwGcmpLXAsa
 Phj21rORMG2Nn5NFQowAe7SI4oQv4HwTpjLAHVFK2k2Up1hhpMpk41oVDm0j+tuquFSOlPYJcgvng
 QvbEPVKBz/Nb0dJtv5oYZvOfEZjK+MOrHe/EERSs1DJntRdTA3IR81j5+esgq1iu7j896cI1hG0Yh
 BjsUW88UrnjAjueV78VOH7V0iOhIr2Z3+EjJ+9cVHPEMaijUa05sAGe9i0yrHl5nBB8cqxbpzDYCe
 //8SuPy0x3gnVQPuzeZQA1C0ezP77RMCMm6NGyReJ5Zrxf3ZMiKRDJyMKevHHuH2GgCT7vYMKwaZy
 ZJp59cbBtv0MuhRkbRDCmEBGCwBlxTrXLtiYHd0BI=;
X-Check-Malware: ok
Received: from mtel-bg02.venev.name by mtel-bg02.venev.name with esmtpsa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (envelope-from <hristo@venev.name>)
 id 1j09ny-000XB8-68; Fri, 07 Feb 2020 20:00:46 +0000
From: Hristo Venev <hristo@venev.name>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Implement reading keys from stdin.
Date: Fri,  7 Feb 2020 20:00:35 +0000
Message-Id: <20200207200035.69579-1-hristo@venev.name>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 08 Feb 2020 22:23:07 +0100
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

If "-" is specified as a path, the key is read as a single line from stdin. If
multiple "-" keys are specified, the order of the lines containing the keys is
the same as the order of the "-" arguments. An empty line means that there is
no key.
---
 src/config.c   | 68 +++++++++++++++++++++++++++++++++-----------------
 src/fuzz/set.c | 20 +++++++++++----
 2 files changed, 60 insertions(+), 28 deletions(-)

diff --git a/src/config.c b/src/config.c
index b8394a5..c5e5267 100644
--- a/src/config.c
+++ b/src/config.c
@@ -21,6 +21,7 @@
 #include "encoding.h"
 
 #define COMMENT_CHAR '#'
+#define KEY_LINE_MAX_LEN (WG_KEY_LEN_BASE64 + 1)
 
 static const char *get_value(const char *line, const char *key)
 {
@@ -118,42 +119,63 @@ static bool parse_keyfile(uint8_t key[static WG_KEY_LEN], const char *path)
 {
 	FILE *f;
 	int c;
-	char dst[WG_KEY_LEN_BASE64];
+	char dst[KEY_LINE_MAX_LEN];
+	bool is_file = false;
 	bool ret = false;
 
-	f = fopen(path, "r");
-	if (!f) {
-		perror("fopen");
-		return false;
+	if (!strcmp(path, "-"))
+		f = stdin;
+	else {
+		f = fopen(path, "r");
+		if (!f) {
+			perror("fopen");
+			return false;
+		}
+		is_file = true;
 	}
 
-	if (fread(dst, WG_KEY_LEN_BASE64 - 1, 1, f) != 1) {
-		/* If we're at the end and we didn't read anything, we're /dev/null or an empty file. */
-		if (!ferror(f) && feof(f) && !ftell(f)) {
-			memset(key, 0, WG_KEY_LEN);
-			ret = true;
-			goto out;
-		}
+	if (!fgets(dst, KEY_LINE_MAX_LEN, f)) {
+		dst[0] = '\0';
+	}
 
-		fprintf(stderr, "Invalid length key in key file\n");
+	if (ferror(f)) {
+		perror("fgets");
 		goto out;
 	}
-	dst[WG_KEY_LEN_BASE64 - 1] = '\0';
 
-	while ((c = getc(f)) != EOF) {
-		if (!isspace(c)) {
-			fprintf(stderr, "Found trailing character in key file: `%c'\n", c);
+	/* fgets stores the trailing newline into the buffer. If it is not there and
+	 * we have not hit EOF, there must be more of the line left. */
+	size_t n = strlen(dst);
+	if (n != 0 && dst[n - 1] == '\n') {
+		n--;
+		dst[n] = '\0';
+	} else if(!feof(f)) {
+		fprintf(stderr, "Key too long: `%s...'\n", dst);
+		goto out;
+	}
+
+	if (is_file) {
+		while ((c = getc(f)) != EOF) {
+			if (!isspace(c)) {
+				fprintf(stderr, "Found trailing character in key file: `%c'\n", c);
+				goto out;
+			}
+		}
+		if (ferror(f) && errno) {
+			perror("getc");
 			goto out;
 		}
 	}
-	if (ferror(f) && errno) {
-		perror("getc");
-		goto out;
-	}
-	ret = parse_key(key, dst);
+
+	if(n == 0) {
+		memset(key, 0, WG_KEY_LEN);
+		ret = true;
+	} else
+		ret = parse_key(key, dst);
 
 out:
-	fclose(f);
+	if (is_file)
+		fclose(f);
 	return ret;
 }
 
diff --git a/src/fuzz/set.c b/src/fuzz/set.c
index 2f40615..ded26e6 100644
--- a/src/fuzz/set.c
+++ b/src/fuzz/set.c
@@ -37,20 +37,30 @@ static FILE *hacked_fopen(const char *pathname, const char *mode)
 int LLVMFuzzerTestOneInput(const char *data, size_t data_len)
 {
 	char *argv[8192] = { "set", "wg0" }, *args;
-	size_t argc = 2;
+	size_t args_len, stdin_len, argc = 2;
+	FILE *input;
 
-	if (!data_len)
+	args_len = strnlen(data, data_len);
+	stdin_len = data_len - args_len;
+	/* POSIX (and therefore glibc) doesn't like fmemopen(_, 0, _) */
+	if (args_len == 0 || stdin_len == 0)
 		return 0;
 
-	assert((args = malloc(data_len)));
-	memcpy(args, data, data_len);
-	args[data_len - 1] = '\0';
+	assert((args = malloc(args_len + 1)));
+	memcpy(args, data, args_len);
+	args[args_len] = '\0';
+
+	assert((input = fmemopen((void*)(data + args_len), stdin_len, "r")));
+	/* discard null character, also permit tests where stdin is empty */
+	fgetc(input);
 
 	for (char *arg = strtok(args, " \t\n\r"); arg && argc < 8192; arg = strtok(NULL, " \t\n\r")) {
 		if (arg[0])
 			argv[argc++] = arg;
 	}
+	stdin = input;
 	set_main(argc, argv);
 	free(args);
+	fclose(stdin);
 	return 0;
 }
-- 
2.24.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
