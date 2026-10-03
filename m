Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454C6CA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 09:24:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e5b78de9;
	Mon, 5 Oct 2026 06:56:42 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 812d9931
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 3 Oct 2026 20:16:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so7231315e9.2
 for <wireguard@lists.zx2c4.com>; Sat, 03 Oct 2026 13:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791058593; x=1791663393; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xSJHmcS6fdALBnPJ5e4ZZCDQp3UfYu5aUPElGXfZW+Q=;
 b=MTrjzwNtjpI/ndwPeq+LYCi9kBgQOK/9pfFeKtpQChTLSv5alx+iN83DLKeDO+0LkH
 /8Y5ZCwkYrrFg/FDcmKTZdKkDzD+ypglCzWe/CRbaIf/moqlS2DbbgJBsEhdcd644oAS
 rHyXIpDoCPyyEkSAwZEmKlIKnqu4j/dvhiEiut7FL363tAQd+WApHVRpF5JfZVp8X66C
 NpUhZWBGOazNxKZtHhmzpmhSzJQ0ekij/vP7vnzCcwxJPolyqOzBoH30iHjplOUwihPn
 SHvHSvX4GFQu1gZIzfsh48yIf83Df9I3s5kk+UsIe50rMUGVJi4ipfV776AwEMoj5rYn
 G7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791058593; x=1791663393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xSJHmcS6fdALBnPJ5e4ZZCDQp3UfYu5aUPElGXfZW+Q=;
 b=XRelLTaxHf+QBeRkTSN2dE7Wsw1HmoP87eTmwBjQLBCqW581I4Izb2LA+ja2TLIk8j
 cNEyo4uEi638GHHHcfXCuwJi6NevK1QZ2uFV4wuHuTdpRZWOFB6Jrb5W2sdjqxUPnfz9
 8UJTfa/oNftpSMznqr0qbXrkGQPY4zwFzYcnFCZjCtaO8VtVhgVo8mAR8/C6hpinsSbH
 8OqUn2YV31vr2ccbMBUlVBRWy+kMW82ycDBJ8B8coQBQ9RiEqFtItkRWCiECBjJyp62l
 nkXQxFJdnCcG34rx8bETTj6IxwRJmDvkWzNg6H1BJDH+SR4kfWpc2lDaXw45AO1TD/FK
 k3ZQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzT0lO2rGpF9TirHWBdTSvJ+EEmQIuoTSaLmAleJSQroemE3q5laVNWYE0Y6jquKAOID/h9bYCus1g=@lists.zx2c4.com
X-Gm-Message-State: AFuF++m8EKDkoBrS2/T7vzJ917RQVr1ZZScFvMzScF1l7jzKk9ow4hVG
 R0shPPA4gI4SzhRrNu0Hwx4gf/4E8Rlh6VpPX7gQQEpI6n4IknNJedbQ
X-Gm-Gg: AYBFou0jUq4QXO1eU8tN+yHJplyjrYtwqPMKUMYnSYLvuAnadcgG2w113C0em9D+OC8
 o0B14y1DOSyI05N470eANZbZTw6xIcikwIe82NnYS3Uzjz5wwb1fOOLDu7qQj6ciHhvot2rYquZ
 0BAmVAcNJmQVjaIsqRXPpjXxZwJSWMe58LQ36jw8wxp4QETppdxXq60vo6l60SLpsBUsRustiWc
 /E05FF6VBTcmp4SyuBOS/1V2c5YADRJ6PD7ncNU0CwCIs1OX3/G8Nir3IuWzKrSvlTh33KAQb80
 nDIuXuqrOkDkf6Azn4yOSDZJficQZr6Cxj/W2Olp8Zo+iPHXvIsXBAU+GtOqvTHfOMDJ5q5hl2S
 CJvuric2A3u8L5qRT3T56nz7htEdHX+OzUQdgXteazJwPBFa9IEao6s7ScIaRK/hiMJ+tboH30N
 0kdgP9s8vZxB+UwvAzzrBut/6FRkPBWb9hX/7DJLj1eAbq89DBk9jqAPWp7zPsCgQXTpWPMnzGp
 pE=
X-Received: by 2002:a05:600c:c1d7:10b0:4a0:4f6:3dc5 with SMTP id
 5b1f17b1804b1-4a1680dd4f4mr34160075e9.7.1791058592594; 
 Sat, 03 Oct 2026 13:16:32 -0700 (PDT)
Received: from Mac ([188.163.8.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a16d6295f9sm51579145e9.14.2026.10.03.13.16.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 03 Oct 2026 13:16:32 -0700 (PDT)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 Andrii Pasichnyk <apasichnik9@gmail.com>
Subject: [PATCH net] wireguard: peer: free packets left on the per-peer queues
 on removal
Date: Sat,  3 Oct 2026 23:16:25 +0300
Message-ID: <20261003201625.4572-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

peer_remove_after_dead() flushes the crypt workqueue and then disables
the peer's NAPI. Once a disable is pending, __napi_poll() completes the
instance after the poll returns even if it used its whole budget, so a
peer removed while more than one budget of decrypted packets waits on
rx_queue keeps the rest there. Each entry holds a keypair and a peer
reference, so the peer is never released; the WARN_ON in rcu_release()
that checks for leftovers is never reached either.

Free whatever is left on both per-peer queues once nothing can feed them
any more: receive entries are single packets, transmit entries lists.

Reproduced with the WireGuard selftest VM (x86 KVM, 1 vCPU, net-next):
remove a peer while a UDP flood keeps its receive queue busy, re-add it,
repeat, then run the selftest's created/destroyed object check. Over
2140 removals the unpatched kernel leaked a peer and its keypair 5
times ("wg0: Peer 27: merely created"); with this patch, 0 times in
another 2140.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Assisted-by: LLM
Signed-off-by: Andrii Pasichnyk <apasichnik9@gmail.com>
---
 drivers/net/wireguard/peer.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index 1cb502a..3e08898 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -91,6 +91,25 @@ static void peer_make_dead(struct wg_peer *peer)
 	/* The caller must now synchronize_net() for this to take effect. */
 }
 
+/* Each queue entry holds a keypair and a peer reference. Transmit entries
+ * are lists of packets, receive entries single packets.
+ */
+static void peer_purge_queue(struct wg_peer *peer, struct prev_queue *queue,
+			     bool lists)
+{
+	struct sk_buff *first;
+
+	while ((first = wg_prev_queue_peek(queue)) != NULL) {
+		wg_prev_queue_drop_peeked(queue);
+		wg_noise_keypair_put(PACKET_CB(first)->keypair, false);
+		wg_peer_put(peer);
+		if (lists)
+			kfree_skb_list(first);
+		else
+			dev_kfree_skb(first);
+	}
+}
+
 static void peer_remove_after_dead(struct wg_peer *peer)
 {
 	WARN_ON(!peer->is_dead);
@@ -122,6 +141,11 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	 * here from process context.
 	 */
 	netif_napi_del(&peer->napi);
+	/* A NAPI being disabled completes after at most one more poll, which
+	 * may leave packets on rx_queue that still hold references.
+	 */
+	peer_purge_queue(peer, &peer->rx_queue, false);
+	peer_purge_queue(peer, &peer->tx_queue, true);
 
 	/* Ensure any workstructs we own (like transmit_handshake_work or
 	 * clear_peer_work) no longer are in use.
-- 
2.53.0

