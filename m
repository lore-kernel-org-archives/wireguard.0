Return-Path: <SRS0=+szR=7V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5ACC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Jun 2020 23:17:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C17120775
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Jun 2020 23:17:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxNtBIKj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C17120775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7035237;
	Mon, 8 Jun 2020 23:00:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b0de0ca8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Jun 2020 23:00:01 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69E7720775;
 Mon,  8 Jun 2020 23:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658220;
 bh=vneSzTGBLL7Yq4AAPxWktSIlblo7fdYNJFih5aaigNg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fxNtBIKjgBX9sdhhDHYIhL5nuO9em3Qgkl7CO8PNzTTi3uFWg2KnLxNZTymJ/rcsH
 8sFoi/bJ7D/o/l4V/+Z/eqrTIGQBgYmeGsnrcE6g+esmTYJIhITBYu8wOZ6o75WX6/
 xaejCcrjwtL5156MziLSLnLTyOulEiHr5183xXtw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Dave Taht <dave.taht@gmail.com>,
 =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 "David S . Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 235/606] wireguard: queueing: preserve flow hash
 across packet scrubbing
Date: Mon,  8 Jun 2020 19:06:00 -0400
Message-Id: <20200608231211.3363633-235-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

[ Upstream commit c78a0b4a78839d572d8a80f6a62221c0d7843135 ]

It's important that we clear most header fields during encapsulation and
decapsulation, because the packet is substantially changed, and we don't
want any info leak or logic bug due to an accidental correlation. But,
for encapsulation, it's wrong to clear skb->hash, since it's used by
fq_codel and flow dissection in general. Without it, classification does
not proceed as usual. This change might make it easier to estimate the
number of innerflows by examining clustering of out of order packets,
but this shouldn't open up anything that can't already be inferred
otherwise (e.g. syn packet size inference), and fq_codel can be disabled
anyway.

Furthermore, it might be the case that the hash isn't used or queried at
all until after wireguard transmits the encrypted UDP packet, which
means skb->hash might still be zero at this point, and thus no hash
taken over the inner packet data. In order to address this situation, we
force a calculation of skb->hash before encrypting packet data.

Of course this means that fq_codel might transmit packets slightly more
out of order than usual. Toke did some testing on beefy machines with
high quantities of parallel flows and found that increasing the
reply-attack counter to 8192 takes care of the most pathological cases
pretty well.

Reported-by: Dave Taht <dave.taht@gmail.com>
Reviewed-and-tested-by: Toke Høiland-Jørgensen <toke@toke.dk>
Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/wireguard/messages.h |  2 +-
 drivers/net/wireguard/queueing.h | 10 +++++++++-
 drivers/net/wireguard/receive.c  |  2 +-
 drivers/net/wireguard/send.c     |  7 ++++++-
 4 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/messages.h b/drivers/net/wireguard/messages.h
index b8a7b9ce32ba..208da72673fc 100644
--- a/drivers/net/wireguard/messages.h
+++ b/drivers/net/wireguard/messages.h
@@ -32,7 +32,7 @@ enum cookie_values {
 };
 
 enum counter_values {
-	COUNTER_BITS_TOTAL = 2048,
+	COUNTER_BITS_TOTAL = 8192,
 	COUNTER_REDUNDANT_BITS = BITS_PER_LONG,
 	COUNTER_WINDOW_SIZE = COUNTER_BITS_TOTAL - COUNTER_REDUNDANT_BITS
 };
diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 3432232afe06..c58df439dbbe 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -87,12 +87,20 @@ static inline bool wg_check_packet_protocol(struct sk_buff *skb)
 	return real_protocol && skb->protocol == real_protocol;
 }
 
-static inline void wg_reset_packet(struct sk_buff *skb)
+static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
 {
+	u8 l4_hash = skb->l4_hash;
+	u8 sw_hash = skb->sw_hash;
+	u32 hash = skb->hash;
 	skb_scrub_packet(skb, true);
 	memset(&skb->headers_start, 0,
 	       offsetof(struct sk_buff, headers_end) -
 		       offsetof(struct sk_buff, headers_start));
+	if (encapsulating) {
+		skb->l4_hash = l4_hash;
+		skb->sw_hash = sw_hash;
+		skb->hash = hash;
+	}
 	skb->queue_mapping = 0;
 	skb->nohdr = 0;
 	skb->peeked = 0;
diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
index 2566e13a292d..758d6a019184 100644
--- a/drivers/net/wireguard/receive.c
+++ b/drivers/net/wireguard/receive.c
@@ -485,7 +485,7 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
 		if (unlikely(wg_socket_endpoint_from_skb(&endpoint, skb)))
 			goto next;
 
-		wg_reset_packet(skb);
+		wg_reset_packet(skb, false);
 		wg_packet_consume_data_done(peer, skb, &endpoint);
 		free = false;
 
diff --git a/drivers/net/wireguard/send.c b/drivers/net/wireguard/send.c
index e8a7d0a0cb88..0d64a7531f64 100644
--- a/drivers/net/wireguard/send.c
+++ b/drivers/net/wireguard/send.c
@@ -170,6 +170,11 @@ static bool encrypt_packet(struct sk_buff *skb, struct noise_keypair *keypair)
 	struct sk_buff *trailer;
 	int num_frags;
 
+	/* Force hash calculation before encryption so that flow analysis is
+	 * consistent over the inner packet.
+	 */
+	skb_get_hash(skb);
+
 	/* Calculate lengths. */
 	padding_len = calculate_skb_padding(skb);
 	trailer_len = padding_len + noise_encrypted_len(0);
@@ -298,7 +303,7 @@ void wg_packet_encrypt_worker(struct work_struct *work)
 		skb_list_walk_safe(first, skb, next) {
 			if (likely(encrypt_packet(skb,
 					PACKET_CB(first)->keypair))) {
-				wg_reset_packet(skb);
+				wg_reset_packet(skb, true);
 			} else {
 				state = PACKET_STATE_DEAD;
 				break;
-- 
2.25.1

