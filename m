Return-Path: <SRS0=89gA=OS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A42C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 03:19:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD92A6128A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 03:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD92A6128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ab73554;
	Tue, 28 Sep 2021 03:19:51 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 526cffc1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Sep 2021 03:19:48 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id y201so28362375oie.3
 for <wireguard@lists.zx2c4.com>; Mon, 27 Sep 2021 20:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I1exPvQ4B77S0VOR4eyouzKOwo05Gi3hRLSjBNXUtiE=;
 b=gVXL9prAHEYvbN+pCDYxs6bluUJ0TQP2nDV1PXXZ48P9M8qBBSliDKZQ9NT6AVRYWz
 JCB5484DivXA0fKXFTj8XI7p3yTJKwCOOhb/3QHEMot4CULCq7TM1JqYcqTtiY/3TphW
 YSDOfafikqeVd1yOiYp33sQAcXJ04KtTegUatLWmf0/kfy9qI/wqrTu5nxhdapxMLyUA
 t+YgHapHfOT7LglJzqlueUl99ouxnFMmonpKrbObDSl6gMcIg+HOj7uaYrCvieoIO0xl
 J3YCjHVCZg8RbJHdJw/5aw0WAsQAZuUHSjMlMOP7L723qh7jjXggGSwWifSYXCBuqr6M
 zfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I1exPvQ4B77S0VOR4eyouzKOwo05Gi3hRLSjBNXUtiE=;
 b=z6hlGQZD8LoeFfXszZaeiOrn0KmJi/+MUYBSYun2b5naKZfJoHOLBAGCev2oCwOUth
 RNtTxdnPKc2f5x2ZhKONI762wjTZTEvA3NHS89f7h4Y2k3VFQXdCtqJ6GdSUjpX+jyW2
 c9V43VC6dKyIKPabKC1XqMEZxP3ZBPW2RTBaAYlZszw7rczWShtxsrbyxK3fTDuicivx
 vHieoID31qEKkuLzfUj1B9EobhcmN+X4fIN7LnJCpoFxgM4cR77YPW0Rn+fLgWu+vwGI
 4aEQ/1/vajC0de/AD2jmFn6izUyzFfQIzo1rCtXNSOk711S3YLsGrGvhmC7mLryp6gTu
 S3/Q==
X-Gm-Message-State: AOAM530eBNazWDkjmUHloN+YnX14nuhhInNfMVlKOLKdJqhoxNN7GO2s
 RqhxbsbLHUsUwg9F9EAJ/Is=
X-Google-Smtp-Source: ABdhPJyd4q87C/XwxpuuYQH1E5eNZWVh4lwNi0fwfTkr/aijTWfcRQ0mfIQpMasSoWxVs2y+7le0ww==
X-Received: by 2002:a05:6808:1151:: with SMTP id
 u17mr1928063oiu.78.1632799186975; 
 Mon, 27 Sep 2021 20:19:46 -0700 (PDT)
Received: from unknown.attlocal.net ([2600:1700:65a0:ab60:d7b8:b949:f514:88b1])
 by smtp.gmail.com with ESMTPSA id g23sm4567192otn.40.2021.09.27.20.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 20:19:46 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: netdev@vger.kernel.org
Cc: wireguard@lists.zx2c4.com, Cong Wang <cong.wang@bytedance.com>,
 Peilin Ye <peilin.ye@bytedance.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [Patch net] wireguard: preserve skb->mark on ingress side
Date: Mon, 27 Sep 2021 20:19:38 -0700
Message-Id: <20210928031938.17902-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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

From: Cong Wang <cong.wang@bytedance.com>

On ingress side, wg_reset_packet() resets skb->mark twice: with
skb_scrub_packet() (xnet==true) and with memset() following it. But
skb->mark does not have to be cleared at least when staying in the
same net namespace, and other tunnels preserve it too similarly,
especially vxlan.

In our use case, we would like to preserve this skb->mark to
distinguish which wireguard device the packets are routed from.

Tested-by: Peilin Ye <peilin.ye@bytedance.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Signed-off-by: Cong Wang <cong.wang@bytedance.com>
---
 drivers/net/wireguard/queueing.h | 9 +++++++--
 drivers/net/wireguard/receive.c  | 2 +-
 drivers/net/wireguard/send.c     | 2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 4ef2944a68bc..3516c1c59df0 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -73,15 +73,20 @@ static inline bool wg_check_packet_protocol(struct sk_buff *skb)
 	return real_protocol && skb->protocol == real_protocol;
 }
 
-static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
+static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating,
+				   bool xnet)
 {
 	u8 l4_hash = skb->l4_hash;
 	u8 sw_hash = skb->sw_hash;
 	u32 hash = skb->hash;
-	skb_scrub_packet(skb, true);
+	u32 mark;
+
+	skb_scrub_packet(skb, xnet);
+	mark = skb->mark;
 	memset(&skb->headers_start, 0,
 	       offsetof(struct sk_buff, headers_end) -
 		       offsetof(struct sk_buff, headers_start));
+	skb->mark = mark;
 	if (encapsulating) {
 		skb->l4_hash = l4_hash;
 		skb->sw_hash = sw_hash;
diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
index 7dc84bcca261..385b2b60cfd9 100644
--- a/drivers/net/wireguard/receive.c
+++ b/drivers/net/wireguard/receive.c
@@ -476,7 +476,7 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
 		if (unlikely(wg_socket_endpoint_from_skb(&endpoint, skb)))
 			goto next;
 
-		wg_reset_packet(skb, false);
+		wg_reset_packet(skb, false, !net_eq(dev_net(peer->device->dev), dev_net(skb->dev)));
 		wg_packet_consume_data_done(peer, skb, &endpoint);
 		free = false;
 
diff --git a/drivers/net/wireguard/send.c b/drivers/net/wireguard/send.c
index 5368f7c35b4b..c77ef0815c2e 100644
--- a/drivers/net/wireguard/send.c
+++ b/drivers/net/wireguard/send.c
@@ -296,7 +296,7 @@ void wg_packet_encrypt_worker(struct work_struct *work)
 		skb_list_walk_safe(first, skb, next) {
 			if (likely(encrypt_packet(skb,
 					PACKET_CB(first)->keypair))) {
-				wg_reset_packet(skb, true);
+				wg_reset_packet(skb, true, true);
 			} else {
 				state = PACKET_STATE_DEAD;
 				break;
-- 
2.30.2

