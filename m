Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419DACF34C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 623a433c;
	Tue, 18 Nov 2025 17:32:23 +0000 (UTC)
Received: from baidu.com (mx22.baidu.com [220.181.50.185])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 927571e9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Oct 2025 12:27:05 +0000 (UTC)
From: Fushuai Wang <wangfushuai@baidu.com>
To: <Jason@zx2c4.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>
CC: <wireguard@lists.zx2c4.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Fushuai Wang <wangfushuai@baidu.com>
Subject: [PATCH] wireguard: allowedips: Use kfree_rcu() instead of call_rcu()
Date: Sun, 5 Oct 2025 20:26:26 +0800
Message-ID: <20251005122626.26988-1-wangfushuai@baidu.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.127.72.16]
X-ClientProxiedBy: bjkjy-exc2.internal.baidu.com (172.31.50.46) To
 bjkjy-exc17.internal.baidu.com (172.31.50.13)
X-FEAS-Client-IP: 172.31.50.13
X-FE-Policy-ID: 52:10:53:SYSTEM
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:16 +0000
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

Replace call_rcu() + kmem_cache_free() with kfree_rcu() to simplify
the code and reduce function size.

Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
---
 drivers/net/wireguard/allowedips.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
index 09f7fcd7da78..506f7cf0d7cf 100644
--- a/drivers/net/wireguard/allowedips.c
+++ b/drivers/net/wireguard/allowedips.c
@@ -48,11 +48,6 @@ static void push_rcu(struct allowedips_node **stack,
 	}
 }
 
-static void node_free_rcu(struct rcu_head *rcu)
-{
-	kmem_cache_free(node_cache, container_of(rcu, struct allowedips_node, rcu));
-}
-
 static void root_free_rcu(struct rcu_head *rcu)
 {
 	struct allowedips_node *node, *stack[MAX_ALLOWEDIPS_DEPTH] = {
@@ -271,13 +266,13 @@ static void remove_node(struct allowedips_node *node, struct mutex *lock)
 	if (free_parent)
 		child = rcu_dereference_protected(parent->bit[!(node->parent_bit_packed & 1)],
 						  lockdep_is_held(lock));
-	call_rcu(&node->rcu, node_free_rcu);
+	kfree_rcu(&node, rcu);
 	if (!free_parent)
 		return;
 	if (child)
 		child->parent_bit_packed = parent->parent_bit_packed;
 	*(struct allowedips_node **)(parent->parent_bit_packed & ~3UL) = child;
-	call_rcu(&parent->rcu, node_free_rcu);
+	kfree_rcu(&parent, rcu);
 }
 
 static int remove(struct allowedips_node __rcu **trie, u8 bits, const u8 *key,
-- 
2.36.1

