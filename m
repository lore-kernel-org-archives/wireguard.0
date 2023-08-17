Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C76C5479A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Aug 2023 20:19:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa32729f;
	Thu, 17 Aug 2023 20:12:20 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bdd64a28
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Aug 2023 20:12:16 +0000 (UTC)
Received: janet.servers.dxld.at; Thu, 17 Aug 2023 22:12:16 +0200
From: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
Subject: [PATCH 2/5] uapi/linux: Add definitions for address/netdev bound
 listen sockets
Date: Thu, 17 Aug 2023 22:11:35 +0200
Message-Id: <20230817201138.930780-2-dxld@darkboxed.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817201138.930780-1-dxld@darkboxed.org>
References: <20230817201138.930780-1-dxld@darkboxed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Daniel Gröber <dxld@darkboxed.org>
---
 src/uapi/linux/linux/wireguard.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/src/uapi/linux/linux/wireguard.h b/src/uapi/linux/linux/wireguard.h
index 0efd52c..36afb66 100644
--- a/src/uapi/linux/linux/wireguard.h
+++ b/src/uapi/linux/linux/wireguard.h
@@ -28,6 +28,8 @@
  *    WGDEVICE_A_PRIVATE_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
  *    WGDEVICE_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16
+ *    WGDEVICE_A_LISTEN_ADDR : NLA_MIN_LEN(struct sockaddr), struct sockaddr_in or struct sockaddr_in6
+ *    WGDEVICE_A_LISTEN_IFINDEX : NLA_U32
  *    WGDEVICE_A_FWMARK: NLA_U32
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
@@ -82,6 +84,8 @@
  *                      peers should be removed prior to adding the list below.
  *    WGDEVICE_A_PRIVATE_KEY: len WG_KEY_LEN, all zeros to remove
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16, 0 to choose randomly
+ *    WGDEVICE_A_LISTEN_ADDR : struct sockaddr_in or struct sockaddr_in6.
+ *    WGDEVICE_A_LISTEN_IFINDEX : NLA_U32
  *    WGDEVICE_A_FWMARK: NLA_U32, 0 to disable
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
@@ -157,6 +161,8 @@ enum wgdevice_attribute {
 	WGDEVICE_A_LISTEN_PORT,
 	WGDEVICE_A_FWMARK,
 	WGDEVICE_A_PEERS,
+	WGDEVICE_A_LISTEN_ADDR,
+	WGDEVICE_A_LISTEN_IFINDEX,
 	__WGDEVICE_A_LAST
 };
 #define WGDEVICE_A_MAX (__WGDEVICE_A_LAST - 1)
-- 
2.39.2

