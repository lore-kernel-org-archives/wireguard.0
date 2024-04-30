Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34701D49224
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:24:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81fcfd3f;
	Mon, 18 Nov 2024 12:38:21 +0000 (UTC)
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d6b667aa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Apr 2024 12:25:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfout.west.internal (Postfix) with ESMTP id 4A07C1C00121
 for <wireguard@lists.zx2c4.com>; Tue, 30 Apr 2024 08:25:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 30 Apr 2024 08:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dotat.at; h=cc
 :content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
 t=1714479936; x=1714566336; bh=fI3UmgvdQuVWtx6lSJnzjr/i9UQhXCyg
 Sphw0tPEMN4=; b=J75o/i+gHtDH0SjdnW2Kjb28ua+eNtDebQS3tz+UK3AVmzb5
 l0cf8e7+hHttWv1x9vDiz4TuHIFmN7ejtnym7N96lvT7kzyPWPNngPSh54SdO7VH
 YWa8ief/Ib1HKOgGSnVYyJ4Cjubd11ul8Jj0rFWQvRE8NG8e3lPjXi38byumHLf4
 dPIw47OJG/f9F0npQtdiHS982m9zIjnb5w/ZP3MMnJJCQEAGBwnX43WxVXUjgG9d
 F5lu9merVYTHCBuoQWDPeUXJx7Bio0EUn0mD3U1VZLzpqA7+LCZPuGYJXuqR3Hot
 87/6prQgFZb/OM/9th1L78iGUJXZTvONmdbNdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1714479936; x=1714566336; bh=fI3UmgvdQuVWtx6lSJnzjr/i9UQhXCygSph
 w0tPEMN4=; b=QsLl36nisXQTu/+9IH85W1yrvIDx4r8fRztllGUU4Bk0ncIcd5E
 Pa9HtMPUMyJKfiJdY98JX4dbaFaZA47HRNJB6ap9MqueQ3TsFKaFmMIFSZX7dtu+
 pJTZnLTPvJLc1yAh8VwEtcYJh3R4PvTKSxgIAkB7wZPBCckK16oEZOWmLhzR+6Bm
 ldsH5lnXEfRbGpO8nrS1YAera+iHVhW3GFHa5zSz5w4CdIVdll+S/6+DvnTVtaJE
 /ZDun//p1kW4CqpenOo0Gxx0D4YYbJ+n5NMHs/2FtudFJ1Hbb5TJoX6M71aa9U6u
 KMjfmLL4joKM8Z6OOyVJrA+bMOYdVm24usg==
X-ME-Sender: <xms:QOMwZkMSAqpJpyYXZf8bv-UdZ6JvdakqiTyJ7f4eqKW_2OqtcLX9Bg>
 <xme:QOMwZq8UBHesIw9So1V9tnCoFhvQiFm23VUXO64cJHjSsXjqE_8Ip6kiIsxIW5xl8
 LypkrF6zOBAYOU>
X-ME-Received: <xmr:QOMwZrRgBiKcQVntbx4s3_MVIgpW13qxKSbpO9feA8ZtMIL3jLZdMOMF_ehZuGgw9aEB0JYMz2WyQQNwpR6TFec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddufedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtsehttdertddttd
 dvnecuhfhrohhmpefvohhnhicuhfhinhgthhcuoeguohhtseguohhtrghtrdgrtheqnecu
 ggftrfgrthhtvghrnhepheelvedttdfgjeekfeevtdfgheeuteduffffhffgtedvkeejke
 ffuddttddtieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepughothesughothgrthdrrght
X-ME-Proxy: <xmx:QOMwZstQbLqoewFkhEpMAorgcQ2zssNgy-4soJvm13VKKukgG8KBtg>
 <xmx:QOMwZseMHHJItAtKtGjaDgfRic9r6F567nJIxdjK4V6ll2s7oRqXkw>
 <xmx:QOMwZg1X_RaeRqTsrUmw8PtZqaPWcz6Mm3-O7Aq4FUX2EohklxaQuw>
 <xmx:QOMwZg9QrV6Chm8w13HgzjeNzEaiJsXz4Pdi-SYiz_Hi_dTIagW4TA>
 <xmx:QOMwZoGK0itOem6a8YVPQBI2DAJZbkDpMTvRbe8J-kvH7X2ALR_IdQlw>
Feedback-ID: i7158435c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <wireguard@lists.zx2c4.com>; Tue, 30 Apr 2024 08:25:36 -0400 (EDT)
Date: Tue, 30 Apr 2024 13:25:34 +0100
From: Tony Finch <dot@dotat.at>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] wg: include filename in error messages
Message-ID: <a0fe98b4-15a5-a60b-9eb2-2c721e60dd6d@dotat.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:38:13 +0000
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

When wg(8) is invoked from a script, it can be hard to tell what
caused an error message if the message does not contain enough
context.

Signed-off-by: Tony Finch <dot@dotat.at>
---
 src/config.c  |  8 ++++----
 src/setconf.c | 11 +++++++----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git src/config.c src/config.c
index 81ccb47..9f15477 100644
--- src/config.c
+++ src/config.c
@@ -123,7 +123,7 @@ static bool parse_keyfile(uint8_t key[static WG_KEY_LEN], const char *path)

 	f = fopen(path, "r");
 	if (!f) {
-		perror("fopen");
+		fprintf(stderr, "open %s: %s", path, strerror(errno));
 		return false;
 	}

@@ -135,19 +135,19 @@ static bool parse_keyfile(uint8_t key[static WG_KEY_LEN], const char *path)
 			goto out;
 		}

-		fprintf(stderr, "Invalid length key in key file\n");
+		fprintf(stderr, "Invalid length key in %s\n", path);
 		goto out;
 	}
 	dst[WG_KEY_LEN_BASE64 - 1] = '\0';

 	while ((c = getc(f)) != EOF) {
 		if (!char_is_space(c)) {
-			fprintf(stderr, "Found trailing character in key file: `%c'\n", c);
+			fprintf(stderr, "Found trailing character `%c' in %s\n", c, path);
 			goto out;
 		}
 	}
 	if (ferror(f) && errno) {
-		perror("getc");
+		fprintf(stderr, "read %s: %s", path, strerror(errno));
 		goto out;
 	}
 	ret = parse_key(key, dst);
diff --git src/setconf.c src/setconf.c
index 1c5b138..414785d 100644
--- src/setconf.c
+++ src/setconf.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2015-2020 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */

+#include <errno.h>
 #include <stddef.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -102,6 +103,7 @@ int setconf_main(int argc, const char *argv[])
 {
 	struct wgdevice *device = NULL;
 	struct config_ctx ctx;
+	const char *path = NULL;
 	FILE *config_input = NULL;
 	char *config_buffer = NULL;
 	size_t config_buffer_len = 0;
@@ -112,9 +114,10 @@ int setconf_main(int argc, const char *argv[])
 		return 1;
 	}

-	config_input = fopen(argv[2], "r");
+	path = argv[2];
+	config_input = fopen(path, "r");
 	if (!config_input) {
-		perror("fopen");
+		fprintf(stderr, "open %s: %s", path, strerror(errno));
 		return 1;
 	}
 	if (!config_read_init(&ctx, !strcmp(argv[0], "addconf"))) {
@@ -123,13 +126,13 @@ int setconf_main(int argc, const char *argv[])
 	}
 	while (getline(&config_buffer, &config_buffer_len, config_input) >= 0) {
 		if (!config_read_line(&ctx, config_buffer)) {
-			fprintf(stderr, "Configuration parsing error\n");
+			fprintf(stderr, "Configuration parsing error in %s\n", path);
 			goto cleanup;
 		}
 	}
 	device = config_read_finish(&ctx);
 	if (!device) {
-		fprintf(stderr, "Invalid configuration\n");
+		fprintf(stderr, "Invalid configuration in %s\n", path);
 		goto cleanup;
 	}
 	strncpy(device->name, argv[1], IFNAMSIZ - 1);
-- 
2.39.2

