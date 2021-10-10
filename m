Return-Path: <SRS0=D0CK=O6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BEDC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 10 Oct 2021 21:20:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6300660F22
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 10 Oct 2021 21:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6300660F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lists.m7n.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e42e907;
	Sun, 10 Oct 2021 21:19:25 +0000 (UTC)
Received: from smtp3.m7n.se (smtp3.m7n.se [193.200.238.100])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 592b87d5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Oct 2021 21:19:23 +0000 (UTC)
Received: from [10.49.33.218] (unknown [10.49.33.218])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp3.m7n.se (Postfix) with ESMTPSA id B28CA293F2E0
 for <wireguard@lists.zx2c4.com>; Sun, 10 Oct 2021 21:19:22 +0000 (UTC)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: mikma.wg@lists.m7n.se
Subject: [PATCH] wireguard-tools: embeddable-wg-library: add named wg_endpoint
 union
Message-ID: <b28e05e1-4209-8b82-1b00-e963b2e8fc85@m7n.se>
Date: Sun, 10 Oct 2021 23:19:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------A294398FB460BEEE893760A9"
Content-Language: en-US
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

This is a multi-part message in MIME format.
--------------A294398FB460BEEE893760A9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

It would be useful to have a named wg_endpoint type in the embeddable wg 
library. It's added by the attached patch.

/Mikael


--------------A294398FB460BEEE893760A9
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-embeddable-wg-library-add-named-wg_endpoint-union.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-embeddable-wg-library-add-named-wg_endpoint-union.patch"

From 62b35cb221af7208399fced86660585080c688f5 Mon Sep 17 00:00:00 2001
From: Mikael Magnusson <mikma@users.sourceforge.net>
Date: Sat, 7 Nov 2020 13:32:56 +0100
Subject: [PATCH] embeddable-wg-library: add named wg_endpoint union

Define wg_endpoint as a named union to allow users of the emeddable
library to use the type in function arguments, variables etc.

Signed-off-by: Mikael Magnusson <mikma@users.sourceforge.net>
---
 contrib/embeddable-wg-library/wireguard.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/contrib/embeddable-wg-library/wireguard.h b/contrib/embeddable-wg-library/wireguard.h
index fbd8765..328fcb4 100644
--- a/contrib/embeddable-wg-library/wireguard.h
+++ b/contrib/embeddable-wg-library/wireguard.h
@@ -40,17 +40,19 @@ enum wg_peer_flags {
 	WGPEER_HAS_PERSISTENT_KEEPALIVE_INTERVAL = 1U << 4
 };
 
+typedef union wg_endpoint {
+	struct sockaddr addr;
+	struct sockaddr_in addr4;
+	struct sockaddr_in6 addr6;
+} wg_endpoint;
+
 typedef struct wg_peer {
 	enum wg_peer_flags flags;
 
 	wg_key public_key;
 	wg_key preshared_key;
 
-	union {
-		struct sockaddr addr;
-		struct sockaddr_in addr4;
-		struct sockaddr_in6 addr6;
-	} endpoint;
+	wg_endpoint endpoint;
 
 	struct timespec64 last_handshake_time;
 	uint64_t rx_bytes, tx_bytes;
-- 
2.25.1


--------------A294398FB460BEEE893760A9--
