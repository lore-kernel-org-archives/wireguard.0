Return-Path: sedlmeyer@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52541ac7
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jan 2018 18:07:02 +0000 (UTC)
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
 [209.85.220.193])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1fd53abf
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jan 2018 18:07:02 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id a5so949659qkg.10
 for <wireguard@lists.zx2c4.com>; Sat, 27 Jan 2018 10:11:39 -0800 (PST)
Return-Path: <sedlmeyer@gmail.com>
Received: from Timothys-MBP.sedlmeyer.org
 (pool-70-106-218-76.clppva.fios.verizon.net. [70.106.218.76])
 by smtp.gmail.com with ESMTPSA id i31sm7179674qtb.5.2018.01.27.10.11.37
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Jan 2018 10:11:38 -0800 (PST)
From: Tim Sedlmeyer <tim@sedlmeyer.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] tools: fix removing preshared keys failing on some platforms
Date: Sat, 27 Jan 2018 13:11:36 -0500
Message-Id: <20180127181136.88756-1-tim@sedlmeyer.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

errno is checked following fread of the preshared key file. fread doesn't set errno, so it shouldn't be checked. On the EdgeRouter ER-X when wg uses glibc instead of musl libc this incorrect check causes removal of preshared keys to fail. This patch removes the check of errno.

Signed-off-by: Tim Sedlmeyer <tim@sedlmeyer.org>
---
 src/tools/config.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/src/tools/config.c b/src/tools/config.c
index 5ab6ece..0407b36 100644
--- a/src/tools/config.c
+++ b/src/tools/config.c
@@ -128,10 +128,6 @@ static bool parse_keyfile(uint8_t key[static WG_KEY_LEN], const char *path)
 	}
 
 	if (fread(dst, WG_KEY_LEN_BASE64 - 1, 1, f) != 1) {
-		if (errno) {
-			perror("fread");
-			goto out;
-		}
 		/* If we're at the end and we didn't read anything, we're /dev/null or an empty file. */
 		if (!ferror(f) && feof(f) && !ftell(f)) {
 			memset(key, 0, WG_KEY_LEN);
-- 
2.16.1
