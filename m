Return-Path: <SRS0=YN3W=RD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA3BC10F00
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 19:05:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCDAC20C01
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 19:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCDAC20C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unixzen.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6a8b6f0;
	Thu, 28 Feb 2019 18:55:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b14af3f6
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 18:55:39 +0000 (UTC)
Received: from mx.dal1.terarocket.io (2001:19f0:6401:8d3:5400:1ff:fe4f:75e6
 [IPv6:2001:19f0:6401:8d3:5400:1ff:fe4f:75e6])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbe025a9
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 18:55:37 +0000 (UTC)
Received: by mx.dal1.terarocket.io (Postfix, from userid 1001)
 id 534CA5DC68; Thu, 28 Feb 2019 19:05:19 +0000 (UTC)
Received: from IT-AGLUCK-L.national.kw.com (unknown [66.162.93.218])
 by mx.dal1.terarocket.io (Postfix) with ESMTPSA id DA3F85DC65;
 Thu, 28 Feb 2019 19:05:18 +0000 (UTC)
From: Alexander von Gluck IV <kallisti5@unixzen.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 2/2] genkey: v2. Be more aggressive in the search for entropy
Date: Thu, 28 Feb 2019 13:05:12 -0600
Message-Id: <20190228190512.6209-2-kallisti5@unixzen.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228190512.6209-1-kallisti5@unixzen.com>
References: <20190228190512.6209-1-kallisti5@unixzen.com>
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

* If we don't get the amount of entropy we were looking for,
  go back to the pool several times. Haiku seems to only
  provide up to 16 bytes per urandom access resulting in
  weird behaviour in this code.
* Prevents one of those lovely "error: success" errors when
  no entropy can be had from /dev/urandom
---
 src/tools/genkey.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/src/tools/genkey.c b/src/tools/genkey.c
index 645f614..67c4752 100644
--- a/src/tools/genkey.c
+++ b/src/tools/genkey.c
@@ -29,7 +29,7 @@
 
 static inline ssize_t get_random_bytes(uint8_t *out, size_t len)
 {
-	ssize_t ret;
+	ssize_t ret = 0;
 	int fd;
 
 #if defined(__OpenBSD__) || (defined(__APPLE__) && MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_X_VERSION_10_12) || (defined(__GLIBC__) && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 25)))
@@ -47,7 +47,18 @@ static inline ssize_t get_random_bytes(uint8_t *out, size_t len)
 	fd = open("/dev/urandom", O_RDONLY);
 	if (fd < 0)
 		return fd;
-	ret = read(fd, out, len);
+
+	int attempts = 0;
+	while (ret < len) {
+		ssize_t remaining = len - ret;
+		ret += read(fd, out + ret, remaining);
+		if (attempts > 64) {
+			fprintf(stderr, "Unable to get enough entropy from /dev/urandom!");
+			close(fd);
+			return -1;
+		}
+		attempts++;
+	}
 	close(fd);
 	return ret;
 }
@@ -70,6 +81,7 @@ int genkey_main(int argc, char *argv[])
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
