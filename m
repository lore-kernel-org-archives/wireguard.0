Return-Path: <SRS0=NvnE=2C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60068C2D0C9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 12:04:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9C40206A5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 12:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9C40206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25e23c69;
	Thu, 12 Dec 2019 12:03:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc93b761
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 12:03:49 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e602c23a
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 12:03:48 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2B8B07037F60CBF7E77B;
 Thu, 12 Dec 2019 20:03:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 12 Dec 2019 20:03:35 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH net-next] wireguard: Using kfree_rcu() to simplify the code
Date: Thu, 12 Dec 2019 12:00:55 +0000
Message-ID: <20191212120055.129801-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Wei Yongjun <weiyongjun1@huawei.com>, wireguard@lists.zx2c4.com
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

The callback function of call_rcu() just calls a kfree(), so we
can use kfree_rcu() instead of call_rcu() + callback function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireguard/allowedips.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
index 72667d5399c3..121d9ea0f135 100644
--- a/drivers/net/wireguard/allowedips.c
+++ b/drivers/net/wireguard/allowedips.c
@@ -31,11 +31,6 @@ static void copy_and_assign_cidr(struct allowedips_node *node, const u8 *src,
 #define CHOOSE_NODE(parent, key) \
 	parent->bit[(key[parent->bit_at_a] >> parent->bit_at_b) & 1]
 
-static void node_free_rcu(struct rcu_head *rcu)
-{
-	kfree(container_of(rcu, struct allowedips_node, rcu));
-}
-
 static void push_rcu(struct allowedips_node **stack,
 		     struct allowedips_node __rcu *p, unsigned int *len)
 {
@@ -112,7 +107,7 @@ static void walk_remove_by_peer(struct allowedips_node __rcu **top,
 				if (!node->bit[0] || !node->bit[1]) {
 					rcu_assign_pointer(*nptr, DEREF(
 					       &node->bit[!REF(node->bit[0])]));
-					call_rcu(&node->rcu, node_free_rcu);
+					kfree_rcu(node, rcu);
 					node = DEREF(nptr);
 				}
 			}



_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
