Return-Path: <SRS0=zPJk=RR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A89EC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 05:17:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D03A32085A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 05:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D03A32085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f3481be;
	Thu, 14 Mar 2019 05:05:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e173a156
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 05:05:27 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 7585f579
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 05:05:27 +0000 (UTC)
Received: (qmail 9843 invoked by uid 500); 14 Mar 2019 05:16:11 -0000
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Merge two rcu types
Date: Thu, 14 Mar 2019 00:16:08 -0500
Message-Id: <20190314051608.9798-1-bruno@wolff.to>
X-Mailer: git-send-email 2.21.0
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

Paul McKenney made it harder to mess up ending rcu sections with an
incorrect function call by using the same functions to end multiple
types of rcu sections.

I replaced synchronize_rcu_bh with synchronize_rcu, rcu_barrier_bh
with rcu_barrier and call_rcu_bh with call_rcu.

I'm not sure how this should be done with compat. Using the old names
and fixing things with a macro isn't going to be liked for new code.

I don't know for sure this is really the correct way to fix things.
---
 src/allowedips.c | 6 +++---
 src/device.c     | 6 +++---
 src/noise.c      | 2 +-
 src/peer.c       | 8 ++++----
 src/socket.c     | 2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/src/allowedips.c b/src/allowedips.c
index bfb6020f350e..592501e39bc3 100644
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
diff --git a/src/device.c b/src/device.c
index 2866dd98ff4e..779c41521ea9 100644
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
index 4405125e7a0a..2e05e2740685 100644
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
index 996f40b919ca..0c7e942f6893 100644
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
diff --git a/src/socket.c b/src/socket.c
index 652d79817e58..5a77b0c9ba2e 100644
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
