Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C73C27C65
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  9 Jun 2024 08:27:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef6fca17;
	Sun, 9 Jun 2024 08:27:56 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 990f87e4
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 9 Jun 2024 08:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zD7ynr/1tlkX1uaDOLGJoOQ33RKpDATGoutWutKpPm8=;
 b=DagXZfUzdJWxwoYzmzmcEEdumUzJIa5J0CQYYbILkDG/vxnjNLrQtADH
 Zr3+IGWHHTGjtQGCVa5ooF0J9nev/GChyQeMc6SmkGK2HoL3KVzdspOzO
 VEuZqOgM9n6vbqQ+I7kkL+HhJhbcnrmDykDjT6SypihrjH36fewBvsXo3 Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,225,1712613600"; d="scan'208";a="169696896"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 10:27:48 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Paul E . McKenney" <paulmck@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu
 for simple kmem_cache_free callback
Date: Sun,  9 Jun 2024 10:27:13 +0200
Message-Id: <20240609082726.32742-2-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240609082726.32742-1-Julia.Lawall@inria.fr>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
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

Since SLOB was removed, it is not necessary to use call_rcu
when the callback only performs kmem_cache_free. Use
kfree_rcu() directly.

The changes were done using the following Coccinelle semantic patch.
This semantic patch is designed to ignore cases where the callback
function is used in another way.

// <smpl>
@r@
expression e;
local idexpression e2;
identifier cb,f;
position p;
@@

(
call_rcu(...,e2)
|
call_rcu(&e->f,cb@p)
)

@r1@
type T;
identifier x,r.cb;
@@

 cb(...) {
(
   kmem_cache_free(...);
|
   T x = ...;
   kmem_cache_free(...,x);
|
   T x;
   x = ...;
   kmem_cache_free(...,x);
)
 }

@s depends on r1@
position p != r.p;
identifier r.cb;
@@

 cb@p

@script:ocaml@
cb << r.cb;
p << s.p;
@@

Printf.eprintf "Other use of %s at %s:%d\n"
   cb (List.hd p).file (List.hd p).line

@depends on r1 && !s@
expression e;
identifier r.cb,f;
position r.p;
@@

- call_rcu(&e->f,cb@p)
+ kfree_rcu(e,f)

@r1a depends on !s@
type T;
identifier x,r.cb;
@@

- cb(...) {
(
-  kmem_cache_free(...);
|
-  T x = ...;
-  kmem_cache_free(...,x);
|
-  T x;
-  x = ...;
-  kmem_cache_free(...,x);
)
- }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

---
 drivers/net/wireguard/allowedips.c |    9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
index 0ba714ca5185..e4e1638fce1b 100644
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
@@ -330,13 +325,13 @@ void wg_allowedips_remove_by_peer(struct allowedips *table,
 			child = rcu_dereference_protected(
 					parent->bit[!(node->parent_bit_packed & 1)],
 					lockdep_is_held(lock));
-		call_rcu(&node->rcu, node_free_rcu);
+		kfree_rcu(node, rcu);
 		if (!free_parent)
 			continue;
 		if (child)
 			child->parent_bit_packed = parent->parent_bit_packed;
 		*(struct allowedips_node **)(parent->parent_bit_packed & ~3UL) = child;
-		call_rcu(&parent->rcu, node_free_rcu);
+		kfree_rcu(parent, rcu);
 	}
 }
 

