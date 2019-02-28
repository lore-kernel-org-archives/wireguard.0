Return-Path: <SRS0=YN3W=RD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBA2C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:00:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 164E120863
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 164E120863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unixzen.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7815fb12;
	Thu, 28 Feb 2019 17:50:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79d6c09f
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 16:14:15 +0000 (UTC)
Received: from mx.dal1.terarocket.io (mx.dal1.terarocket.io [108.61.222.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66b1f9f9
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 16:14:15 +0000 (UTC)
Received: by mx.dal1.terarocket.io (Postfix, from userid 1001)
 id 27DE15DC66; Thu, 28 Feb 2019 16:23:54 +0000 (UTC)
Received: from IT-AGLUCK-L.national.kw.com (unknown [66.162.93.218])
 by mx.dal1.terarocket.io (Postfix) with ESMTPSA id 815635DC65;
 Thu, 28 Feb 2019 16:23:53 +0000 (UTC)
From: Alexander von Gluck IV <kallisti5@unixzen.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 2/2] genkey: Be more aggressive in the search for entropy
Date: Thu, 28 Feb 2019 10:23:46 -0600
Message-Id: <20190228162346.23434-2-kallisti5@unixzen.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228162346.23434-1-kallisti5@unixzen.com>
References: <20190228162346.23434-1-kallisti5@unixzen.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Feb 2019 18:50:32 +0100
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

* If we don't get the amount of entropy we were looking for,
  go back to the pool several times. Haiku seems to only
  provide up to 16 bytes per urandom access resulting in
  weird behaviour in this code.
---
 src/tools/genkey.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/src/tools/genkey.c b/src/tools/genkey.c
index 645f614..6a75415 100644
--- a/src/tools/genkey.c
+++ b/src/tools/genkey.c
@@ -27,9 +27,13 @@
 #include "encoding.h"
 #include "subcommands.h"
 
+
+#define URANDOM_ATTEMPTS 8
+
+
 static inline ssize_t get_random_bytes(uint8_t *out, size_t len)
 {
-	ssize_t ret;
+	ssize_t ret = 0;
 	int fd;
 
 #if defined(__OpenBSD__) || (defined(__APPLE__) && MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_X_VERSION_10_12) || (defined(__GLIBC__) && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 25)))
@@ -47,7 +51,17 @@ static inline ssize_t get_random_bytes(uint8_t *out, size_t len)
 	fd = open("/dev/urandom", O_RDONLY);
 	if (fd < 0)
 		return fd;
-	ret = read(fd, out, len);
+
+	int attempts = 0;
+	while (ret < len) {
+		ssize_t remaining = len - ret;
+		ret += read(fd, out + ret, remaining);
+		if (attempts > URANDOM_ATTEMPTS) {
+			fprintf(stderr, "Unable to get enough entropy from /dev/urandom!");
+			close(fd);
+			return -1;
+		}
+	}
 	close(fd);
 	return ret;
 }
@@ -70,6 +84,7 @@ int genkey_main(int argc, char *argv[])
 		perror("getrandom");
 		return 1;
 	}
+
 	if (!strcmp(argv[0], "genkey"))
 		curve25519_clamp_secret(key);
 
-- 
2.20.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
