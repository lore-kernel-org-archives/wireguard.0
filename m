Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73F2C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:41:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D82802183E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=poczta.onet.pl header.i=@poczta.onet.pl header.b="RGFSZc+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D82802183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poczta.onet.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4b580c5;
	Wed, 20 Mar 2019 22:41:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a3f9f9c
 for <wireguard@lists.zx2c4.com>; Sun, 3 Mar 2019 13:20:18 +0000 (UTC)
Received: from smtpo97.poczta.onet.pl (smtpo97.poczta.onet.pl
 [213.180.149.150])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4627a73a
 for <wireguard@lists.zx2c4.com>; Sun, 3 Mar 2019 13:20:18 +0000 (UTC)
Received: from [192.168.68.198] (188.146.228.15.nat.umts.dynamic.t-mobile.pl
 [188.146.228.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: namiltd@poczta.onet.pl)
 by smtp.poczta.onet.pl (Onet) with ESMTPSA id 44C3tc4RP1z1XRfP0
 for <wireguard@lists.zx2c4.com>; Sun,  3 Mar 2019 14:30:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.onet.pl;
 s=2011; t=1551619816;
 bh=ahaxCPYOOFk41kfrWRSMQS+24fbg3ZWv5XgoMF6BBfI=;
 h=From:To:Subject:Date:From;
 b=RGFSZc+/l8TbNaS24r22AXr6WXlzBRJneSW7z7FRUkTKFai9+jOcHn0kaEVEX007x
 KS1cXbGIc/V7FXmn9PTRjkVqNoRbh0JW5ZCeIPtaJ6r7MmeM9CzHmfhCa8zHjOwIBs
 xeKMYHhdobNSEJ5AmFU1cd9NLbT4AE+oJ8dLfgmY=
From: SMTP: namiltd@poczta.onet.pl;
To: wireguard@lists.zx2c4.com
Subject: [PATCH] centos 6 compatibility
Message-ID: <dd1d1bde-dd6b-6f36-e08f-3552ee0686a2@poczta.onet.pl>
Date: Sun, 3 Mar 2019 14:30:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
MIME-Version: 1.0
X-ONET_PL-MDA-SEGREGATION: 0
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:41:10 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

---
 src/crypto/zinc/blake2s/blake2s.c | 17 +++++++++++++++++
 src/socket.c                      |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/src/crypto/zinc/blake2s/blake2s.c b/src/crypto/zinc/blake2s/blake2s.c
index b881db0..60b7763 100644
--- a/src/crypto/zinc/blake2s/blake2s.c
+++ b/src/crypto/zinc/blake2s/blake2s.c
@@ -19,9 +19,16 @@
 #include <linux/init.h>
 #include <linux/bug.h>
 #include <asm/unaligned.h>
+#define GCC_VERSION (__GNUC__ * 10000 \
+		    + __GNUC_MINOR__ * 100 \
+		    + __GNUC_PATCHLEVEL__)
 
+#if GCC_VERSION > 40407
 typedef union {
 	struct {
+#else
+typedef struct {
+#endif
 		u8 digest_length;
 		u8 key_length;
 		u8 fanout;
@@ -33,8 +40,10 @@ typedef union {
 		u8 inner_length;
 		u8 salt[8];
 		u8 personal[8];
+#if GCC_VERSION > 40407
 	};
 	__le32 words[8];
+#endif
 } __packed blake2s_param;
 
 static const u32 blake2s_iv[8] = {
@@ -74,9 +83,17 @@ static inline void blake2s_init_param(struct blake2s_state *state,
 {
 	int i;
 
+#if GCC_VERSION <= 40407
+	const __le32 *words;
+	words = (const __le32 *)param;
+#endif
 	memset(state, 0, sizeof(*state));
 	for (i = 0; i < 8; ++i)
+#if GCC_VERSION > 40407
 		state->h[i] = blake2s_iv[i] ^ le32_to_cpu(param->words[i]);
+#else
+		state->h[i] = blake2s_iv[i] ^ le32_to_cpu(words[i]);
+#endif
 }
 
 void blake2s_init(struct blake2s_state *state, const size_t outlen)
diff --git a/src/socket.c b/src/socket.c
index 652d798..dfc98d3 100644
--- a/src/socket.c
+++ b/src/socket.c
@@ -16,6 +16,9 @@
 #include <linux/inetdevice.h>
 #include <net/udp_tunnel.h>
 #include <net/ipv6.h>
+#define GCC_VERSION (__GNUC__ * 10000 \
+		    + __GNUC_MINOR__ * 100 \
+		    + __GNUC_PATCHLEVEL__)
 
 static int send4(struct wg_device *wg, struct sk_buff *skb,
 		 struct endpoint *endpoint, u8 ds, struct dst_cache *cache)
@@ -363,7 +366,9 @@ int wg_socket_init(struct wg_device *wg, u16 port)
 	struct socket *new4 = NULL, *new6 = NULL;
 	struct udp_port_cfg port4 = {
 		.family = AF_INET,
+#if GCC_VERSION > 40407
 		.local_ip.s_addr = htonl(INADDR_ANY),
+#endif
 		.local_udp_port = htons(port),
 		.use_udp_checksums = true
 	};
@@ -371,7 +376,9 @@ int wg_socket_init(struct wg_device *wg, u16 port)
 	int retries = 0;
 	struct udp_port_cfg port6 = {
 		.family = AF_INET6,
+#if GCC_VERSION > 40407
 		.local_ip6 = IN6ADDR_ANY_INIT,
+#endif
 		.use_udp6_tx_checksums = true,
 		.use_udp6_rx_checksums = true,
 		.ipv6_v6only = true
-- 
2.18.0.windows.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
