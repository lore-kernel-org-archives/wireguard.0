Return-Path: <SRS0=rird=RS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8F6C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Mar 2019 05:15:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4634421871
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Mar 2019 05:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ntsPfGW0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4634421871
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63ed2b3d;
	Fri, 15 Mar 2019 05:03:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b6fab4f
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Mar 2019 05:03:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f6d1a1d
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Mar 2019 05:03:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42b81c6f;
 Fri, 15 Mar 2019 04:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding; s=mail; bh=3NznwkIVY+jD+Ah2VSkMxl64+
 Tw=; b=ntsPfGW0nV1b3r6N5/60/57YB3bwzFnGR/UDEHmASqpQos261KGu2U31j
 GKsrBb6DwcFXUrUAldI5cVtm8Z/+uPE5mqHnqu+Phji4pkGkrG5vG3uhBBXNDU/F
 TBJnFnHzpI8MLpKRiN+1tCN/spJb6iy86jPd8i67iD7ovrY5pM6kw78tDah0mwiP
 OmYbY8KZk8NOfyOzMbW0QLf0/8A0eMpQug/S8cRCXHsthuBwl9cK1zYSz3RGVBQj
 NjjuboBFxneEwnMfYHlpUUh3Ca4248tuH3wSEWEPxSQt/TjZ3eyeKAm6ZYID4ZXu
 t/86Qm5UT66JM+kdWiZkbjOnce+QQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b28cbf94
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Fri, 15 Mar 2019 04:53:53 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Bruno Wolff III <bruno@wolff.to>,
	wireguard@lists.zx2c4.com
Subject: [PATCH] global: the _bh variety of rcu helpers have been unified
Date: Thu, 14 Mar 2019 23:14:39 -0600
Message-Id: <20190315051439.19361-1-Jason@zx2c4.com>
In-Reply-To: <20190314200549.GA23870@wolff.to>
References: <20190314200549.GA23870@wolff.to>
MIME-Version: 1.0
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

---
Hey Bruno,

Based on your research, how does the below strike you? It's certainly
not pretty, but I'm struggling to come up with a better solution.

Jason


 src/allowedips.c    |  6 +++---
 src/compat/compat.h | 11 +++++++++++
 src/device.c        |  6 +++---
 src/noise.c         |  2 +-
 src/peer.c          |  8 ++++----
 src/ratelimiter.c   |  9 +++++++++
 src/socket.c        |  2 +-
 7 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/src/allowedips.c b/src/allowedips.c
index bfb6020f..592501e3 100644
--- a/src/allowedips.c
+++ b/src/allowedips.c
@@ -112,7 +112,7 @@ static void walk_remove_by_peer(struct allowedips_node __rcu **top,
 				if (!node->bit[0] || !node->bit[1]) {
 					rcu_assign_pointer(*nptr, DEREF(
 					       &node->bit[!REF(node->bit[0])]));
-					call_rcu_bh(&node->rcu, node_free_rcu);
+					call_rcu(&node->rcu, node_free_rcu);
 					node = DEREF(nptr);
 				}
 			}
@@ -300,12 +300,12 @@ void wg_allowedips_free(struct allowedips *table, struct mutex *lock)
 	RCU_INIT_POINTER(table->root6, NULL);
 	if (rcu_access_pointer(old4)) {
 		root_remove_peer_lists(old4);
-		call_rcu_bh(&rcu_dereference_protected(old4,
+		call_rcu(&rcu_dereference_protected(old4,
 				lockdep_is_held(lock))->rcu, root_free_rcu);
 	}
 	if (rcu_access_pointer(old6)) {
 		root_remove_peer_lists(old6);
-		call_rcu_bh(&rcu_dereference_protected(old6,
+		call_rcu(&rcu_dereference_protected(old6,
 				lockdep_is_held(lock))->rcu, root_free_rcu);
 	}
 }
diff --git a/src/compat/compat.h b/src/compat/compat.h
index 2dcdbaeb..8662b835 100644
--- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -778,6 +778,17 @@ struct __kernel_timespec {
 #define skb_probe_transport_header(a) skb_probe_transport_header(a, 0)
 #endif
 
+
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 1, 0)
+/* Note that all intentional uses of the non-_bh variety need to explicitly
+ * undef these, conditionalized on COMPAT_CANNOT_DEPRECIATE_BH_RCU.
+ */
+#define synchronize_rcu synchronize_rcu_bh
+#define call_rcu call_rcu_bh
+#define rcu_barrier rcu_barrier_bh
+#define COMPAT_CANNOT_DEPRECIATE_BH_RCU
+#endif
+
 /* https://github.com/ClangBuiltLinux/linux/issues/7 */
 #if defined( __clang__) && (!defined(CONFIG_CLANG_VERSION) || CONFIG_CLANG_VERSION < 80000)
 #include <linux/bug.h>
diff --git a/src/device.c b/src/device.c
index 2866dd98..779c4152 100644
--- a/src/device.c
+++ b/src/device.c
@@ -94,7 +94,7 @@ static int wg_pm_notification(struct notifier_block *nb, unsigned long action,
 		mutex_unlock(&wg->device_update_lock);
 	}
 	rtnl_unlock();
-	rcu_barrier_bh();
+	rcu_barrier();
 	return 0;
 }
 
@@ -244,7 +244,7 @@ static void wg_destruct(struct net_device *dev)
 	destroy_workqueue(wg->packet_crypt_wq);
 	wg_packet_queue_free(&wg->decrypt_queue, true);
 	wg_packet_queue_free(&wg->encrypt_queue, true);
-	rcu_barrier_bh(); /* Wait for all the peers to be actually freed. */
+	rcu_barrier(); /* Wait for all the peers to be actually freed. */
 	wg_ratelimiter_uninit();
 	memzero_explicit(&wg->static_identity, sizeof(wg->static_identity));
 	skb_queue_purge(&wg->incoming_handshakes);
@@ -468,5 +468,5 @@ void wg_device_uninit(void)
 #ifdef CONFIG_PM_SLEEP
 	unregister_pm_notifier(&pm_notifier);
 #endif
-	rcu_barrier_bh();
+	rcu_barrier();
 }
diff --git a/src/noise.c b/src/noise.c
index 4405125e..2e05e274 100644
--- a/src/noise.c
+++ b/src/noise.c
@@ -132,7 +132,7 @@ static void keypair_free_kref(struct kref *kref)
 			    keypair->entry.peer->internal_id);
 	wg_index_hashtable_remove(keypair->entry.peer->device->index_hashtable,
 				  &keypair->entry);
-	call_rcu_bh(&keypair->rcu, keypair_free_rcu);
+	call_rcu(&keypair->rcu, keypair_free_rcu);
 }
 
 void wg_noise_keypair_put(struct noise_keypair *keypair, bool unreference_now)
diff --git a/src/peer.c b/src/peer.c
index 996f40b9..0c7e942f 100644
--- a/src/peer.c
+++ b/src/peer.c
@@ -99,7 +99,7 @@ static void peer_make_dead(struct wg_peer *peer)
 	/* Mark as dead, so that we don't allow jumping contexts after. */
 	WRITE_ONCE(peer->is_dead, true);
 
-	/* The caller must now synchronize_rcu_bh() for this to take effect. */
+	/* The caller must now synchronize_rcu() for this to take effect. */
 }
 
 static void peer_remove_after_dead(struct wg_peer *peer)
@@ -171,7 +171,7 @@ void wg_peer_remove(struct wg_peer *peer)
 	lockdep_assert_held(&peer->device->device_update_lock);
 
 	peer_make_dead(peer);
-	synchronize_rcu_bh();
+	synchronize_rcu();
 	peer_remove_after_dead(peer);
 }
 
@@ -189,7 +189,7 @@ void wg_peer_remove_all(struct wg_device *wg)
 		peer_make_dead(peer);
 		list_add_tail(&peer->peer_list, &dead_peers);
 	}
-	synchronize_rcu_bh();
+	synchronize_rcu();
 	list_for_each_entry_safe(peer, temp, &dead_peers, peer_list)
 		peer_remove_after_dead(peer);
 }
@@ -228,7 +228,7 @@ static void kref_release(struct kref *refcount)
 	wg_packet_purge_staged_packets(peer);
 
 	/* Free the memory used. */
-	call_rcu_bh(&peer->rcu, rcu_release);
+	call_rcu(&peer->rcu, rcu_release);
 }
 
 void wg_peer_put(struct wg_peer *peer)
diff --git a/src/ratelimiter.c b/src/ratelimiter.c
index b3b1d258..0780d113 100644
--- a/src/ratelimiter.c
+++ b/src/ratelimiter.c
@@ -3,6 +3,15 @@
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
 
+#ifdef COMPAT_CANNOT_DEPRECIATE_BH_RCU
+/* We normally alias all non-_bh functions to the _bh ones in the compat layer,
+ * but that's not appropriate here, where we actually do want _bh ones.
+ */
+#undef synchronize_rcu
+#undef call_rcu
+#undef rcu_barrier
+#endif
+
 #include "ratelimiter.h"
 #include <linux/siphash.h>
 #include <linux/mm.h>
diff --git a/src/socket.c b/src/socket.c
index 652d7981..5a77b0c9 100644
--- a/src/socket.c
+++ b/src/socket.c
@@ -426,7 +426,7 @@ void wg_socket_reinit(struct wg_device *wg, struct sock *new4,
 	if (new4)
 		wg->incoming_port = ntohs(inet_sk(new4)->inet_sport);
 	mutex_unlock(&wg->socket_update_lock);
-	synchronize_rcu_bh();
+	synchronize_rcu();
 	synchronize_net();
 	sock_free(old4);
 	sock_free(old6);
-- 
2.21.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
