Return-Path: <SRS0=osqO=FO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAF2C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Dec 2020 09:24:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C262343B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Dec 2020 09:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C262343B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unstable.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5445da4b;
	Thu, 10 Dec 2020 09:16:57 +0000 (UTC)
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 96500895
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Dec 2020 09:16:55 +0000 (UTC)
From: Antonio Quartulli <a@unstable.cc>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Antonio Quartulli <a@unstable.cc>
Subject: [PATCH] wireguard: avoid double unlikely() notation when using
 IS_ERR()
Date: Thu, 10 Dec 2020 09:55:05 +0100
Message-Id: <20201210085505.21575-1-a@unstable.cc>
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

The definition of IS_ERR() already applies the unlikely() notation
when checking the error status of the passed pointer. For this
reason there is no need to have the same notation outside of
IS_ERR() itself.

Clean up code by removing redundant notation.

Signed-off-by: Antonio Quartulli <a@unstable.cc>
---
 drivers/net/wireguard/device.c | 2 +-
 drivers/net/wireguard/socket.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index a3ed49cd95c3..cd51a2afa28e 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -157,7 +157,7 @@ static netdev_tx_t wg_xmit(struct sk_buff *skb, struct net_device *dev)
 	} else {
 		struct sk_buff *segs = skb_gso_segment(skb, 0);
 
-		if (unlikely(IS_ERR(segs))) {
+		if (IS_ERR(segs)) {
 			ret = PTR_ERR(segs);
 			goto err_peer;
 		}
diff --git a/drivers/net/wireguard/socket.c b/drivers/net/wireguard/socket.c
index c33e2c81635f..e9c35130846c 100644
--- a/drivers/net/wireguard/socket.c
+++ b/drivers/net/wireguard/socket.c
@@ -71,7 +71,7 @@ static int send4(struct wg_device *wg, struct sk_buff *skb,
 				ip_rt_put(rt);
 			rt = ip_route_output_flow(sock_net(sock), &fl, sock);
 		}
-		if (unlikely(IS_ERR(rt))) {
+		if (IS_ERR(rt)) {
 			ret = PTR_ERR(rt);
 			net_dbg_ratelimited("%s: No route to %pISpfsc, error %d\n",
 					    wg->dev->name, &endpoint->addr, ret);
@@ -138,7 +138,7 @@ static int send6(struct wg_device *wg, struct sk_buff *skb,
 		}
 		dst = ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock, &fl,
 						      NULL);
-		if (unlikely(IS_ERR(dst))) {
+		if (IS_ERR(dst)) {
 			ret = PTR_ERR(dst);
 			net_dbg_ratelimited("%s: No route to %pISpfsc, error %d\n",
 					    wg->dev->name, &endpoint->addr, ret);
-- 
2.29.2

