Return-Path: <SRS0=HYXs=QB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF8CC282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jan 2019 01:52:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03ED5218CD
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jan 2019 01:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03ED5218CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f95b990e;
	Fri, 25 Jan 2019 01:47:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f32dc44
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jan 2019 01:46:58 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c6337c7
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jan 2019 01:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1]) (uid 500)
 by telperion.info with local; Thu, 24 Jan 2019 17:53:42 -0800
 id 0000000000049044.000000005C4A6C26.00006C52
From: Derrick Pallas <derrick@pallas.us>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/2] peer: add wg_peer_reset_keys
Date: Thu, 24 Jan 2019 17:53:38 -0800
Message-Id: <20190125015339.27684-1-derrick@pallas.us>
X-Mailer: git-send-email 2.19.2
Mime-Version: 1.0
X-Mime-Autoconverted: from 8bit to 7bit by courier 0.75
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

This function will clear the key state for the peer and reset its handshake
timer.  This is useful, for instance, if it is known that the current key
material is bad.  Currently, this happens when the private key is changed.

Signed-off-by: Derrick Pallas <derrick@pallas.us>
---
 src/peer.c | 14 ++++++++++++++
 src/peer.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/src/peer.c b/src/peer.c
index 020a97b..49af31f 100644
--- a/src/peer.c
+++ b/src/peer.c
@@ -87,6 +87,20 @@ struct wg_peer *wg_peer_get_maybe_zero(struct wg_peer *peer)
 	return peer;
 }
 
+void wg_peer_reset_keys(struct wg_peer *peer)
+{
+	if (unlikely(!peer))
+		return;
+	lockdep_assert_held(&peer->device->device_update_lock);
+
+	wg_noise_handshake_clear(&peer->handshake);
+	wg_noise_keypairs_clear(&peer->keypairs);
+	wg_cookie_checker_precompute_peer_keys(peer);
+	atomic64_set(&peer->last_sent_handshake,
+		ktime_get_boot_fast_ns() -
+			(u64)(REKEY_TIMEOUT + 1) * NSEC_PER_SEC);
+}
+
 /* We have a separate "remove" function make sure that all active places where
  * a peer is currently operating will eventually come to an end and not pass
  * their reference onto another context.
diff --git a/src/peer.h b/src/peer.h
index 2e04262..3800e6f 100644
--- a/src/peer.h
+++ b/src/peer.h
@@ -78,5 +78,6 @@ static inline struct wg_peer *wg_peer_get(struct wg_peer *peer)
 void wg_peer_put(struct wg_peer *peer);
 void wg_peer_remove(struct wg_peer *peer);
 void wg_peer_remove_all(struct wg_device *wg);
+void wg_peer_reset_keys(struct wg_peer *peer);
 
 #endif /* _WG_PEER_H */
-- 
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
