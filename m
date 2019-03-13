Return-Path: <SRS0=DyWu=RQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2E6C4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Mar 2019 22:43:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 423A42146E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Mar 2019 22:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 423A42146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63c656fc;
	Wed, 13 Mar 2019 22:31:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3242c1c
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Mar 2019 22:31:52 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dccbcbe8
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Mar 2019 22:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1]) (uid 500)
 by telperion.info with local
 id 0000000000048374.000000005C898861.0000466E; Wed, 13 Mar 2019 15:46:57 -0700
From: derrick@pallas.us
To: wireguard@lists.zx2c4.com
Subject: [PATCH 2/2] netdev: reset peer keys when changing private key
Date: Wed, 13 Mar 2019 15:46:43 -0700
Message-Id: <20190313224643.17904-2-derrick@pallas.us>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190313224643.17904-1-derrick@pallas.us>
References: <20190313224643.17904-1-derrick@pallas.us>
Mime-Version: 1.0
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
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

From: Derrick Pallas <derrick@pallas.us>

Without this change, it can take until the handshake timeout period to
reestablish with the peer.  After this change, the handshake occurs as soon
as possible and the link is reestablished much more quickly.

Signed-off-by: Derrick Pallas <derrick@pallas.us>
---
 src/netlink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/netlink.c b/src/netlink.c
index b179b31..43e1e05 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -551,6 +551,8 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 					 peer_list) {
 			if (!wg_noise_precompute_static_static(peer))
 				wg_peer_remove(peer);
+			else
+				wg_peer_reset_keys(peer);
 		}
 		wg_cookie_checker_precompute_device_keys(&wg->cookie_checker);
 		up_write(&wg->static_identity.lock);
-- 
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
