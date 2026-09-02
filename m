Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2CDCA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:18:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bd680224;
	Mon, 5 Oct 2026 06:56:35 +0000 (UTC)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7a99a2d8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Sep 2026 15:11:36 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-4b3a61bdf22so586049b6e.3
 for <wireguard@lists.zx2c4.com>; Wed, 02 Sep 2026 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google09082023; t=1788361895; x=1788966695;
 darn=lists.zx2c4.com; 
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=6d93cyMkw6EMFToYvRlpelXx7oHrvV3y/wNVC9ldZm0=;
 b=Of38BgmPpsc25aV2UGUneC3RclQRQiQX6j5L+jTbkhcOHGhKwXifmSW0Y/xJQu+oke
 y59nqPK04unu6JY8f3JSfNE4pNVSLfL2DocfVa49Vnkkj0K94WKMPUTTWpdGtMVhVr4q
 5fQhfj9xGv+w0J4No7XFat1TiTQUfEambeWosnR5l2vyH8dqCeFRkRhRMFV33XVnHhVX
 wZQURt5DMrok5GOMU1Y6O2s/G3A58vVHOExDEQWyUTq5ytLxVdbrpwLxlUuKPFe5FLQc
 F1cVpsfxE+tVMtkAHizf47hvnhyFYJXw8vsVjxDckwK1gAgvY03DY9OlIThrGXCMKPX8
 suYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788361895; x=1788966695;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=6d93cyMkw6EMFToYvRlpelXx7oHrvV3y/wNVC9ldZm0=;
 b=O5sgw7J8nlk6EnXSFS1oz3599cYIwE1P+fDxXokKAyvAtwoQqEzpfKucLqQUcKYLz1
 QeL4z+lZtPzT9afrdtVYEWoi2pXUs1TJ1TKwwoYZ8szDNHUylAOSCiASYjEnDAulP8F2
 i8m6vuP5cq+xauyegJ4+Apv5k/MRUyoP7HfXD96BseLorhp+EAh0HWq8Jz6V90Tcueb4
 knIp1BQnUkH8lblpnvEIx6Y81nEdPSCL0dra9Za62S94osK1ANnh+OKWME1nKYW6E7si
 R4GAVe0R0t/3zqNCT7jmVNi2UK5xo+Sc98jVTlPqH/h5IAC//z6jXpLKzqSF2D5bcJOY
 aRkQ==
X-Gm-Message-State: AFuF++migsGCAhRlX4UZUg9gWj1LtyhjMkPqXZMqLepC1jLTX8nENaOf
 TUEddC4IOqxrMuKQS5U2muwMSbJHp/0tTQpU8lCAD5dBJ89fO05eZRGkAGsjCdWqk8Y=
X-Gm-Gg: AR+sD13ERSTWtPjJuI5lfNbZij5N89KxIDNwUj5U8U7RQn22xOrynG7Ngt7i2Y61asQ
 m8kY4JpZO51T41EUBQC/RyIU+47hJq4QFbWVZvhck/7mWpebZZFU2fSltk8WUkK3c2LNVDdJgiX
 LsvB1uUlYipIuZ5YOvNv2e87R+LN9cx0J/ckjEk8CW0xz51rAzwmj1f85nt8nmFnljNEW4wf4os
 MdKasrQPDuiKiMFDDaNYet0j9QCcvZQ6ocGkqp6C2+/qUBE4ccxAdkUelX7cao6a9RwPLvSUWzj
 IE7Bzfunk1zR86VlreolT8AC7WelFannPS2Oi3bSOt/CEdlDaDMUKoBEiDk1zmdpWqQBZibjheI
 93vzrOHsXojoSXzznEYx3MeO9jzoE9fg37QmIL+s/C6uoYC8VV4Rjywu00ZSQwZ9I1kWpOIwDdj
 x6tL2ZoabYj+5MlSb4w/Pd2aPYtPuI6dWguX4N1rTeGrmfn8SNBA==
X-Received: by 2002:a05:6808:1982:b0:4ae:f5be:fe29 with SMTP id
 5614622812f47-4b6bc45eb12mr4432026b6e.5.1788361894525; 
 Wed, 02 Sep 2026 08:11:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2e28::499:53])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b698a38f62sm2044063b6e.7.2026.09.02.08.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 08:11:32 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Date: Wed, 02 Sep 2026 10:11:25 -0500
Subject: [PATCH net] wireguard: wait for per-peer crypto during removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-fix-wg-peer-removal-v1-1-7a0190f5cdb1@cloudflare.com>
X-B4-Tracking: v=1; b=H4sIAJw8mGoC/yWM0Q6CMBAEf4Xcs5dcqTGBXzE+YFnwDBZyrWhC+
 HerPs5mZzZKMEWittrIsGrSORZwh4rCrYsjWPvCVEt9kkYcD/rm18gLYGx4zGs38dEPwTfSi3e
 OirkYyu1XPVNEpst/TM/rHSF/e7TvH90glU58AAAA
X-Change-ID: 20260901-fix-wg-peer-removal-43fc390d0311
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1788361892; l=5927;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=gasmKhY5QdVetN3HDkPDfGtkZpKw5F4W6g75o0Q/i88=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKpZG43U/VRAV+Prr2sW0jg3cNIEuCbnlX7R7/cMb4Ldr5itEqZVxNPbqMC463wRbQvSqRslVYr
 rxLj1VgRkpgE=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M
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

Calling peer_remove_after_dead() currently flushes device-wide packet
crypto and handshake workqueues while holding RTNL. This is problematic as
unrelated peers can continue adding work onto those queues blocking other
tasks that want to take the RTNL lock.

Instead, this patch proposes tracking pending crypto handoffs for each
peer using a counter. After marking the peer dead, synchronize_net()
prevents new submissions; wait for pending crypto workers to schedule TX
work or RX NAPI. Then flush only the peer's transmit packet and handshake
work.

This scopes teardown synchronization to the removed peer and prevents
unrelated peers from extending the RTNL hold time.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
 drivers/net/wireguard/peer.c     | 30 ++++++++++++++++--------------
 drivers/net/wireguard/peer.h     |  1 +
 drivers/net/wireguard/queueing.h |  6 ++++++
 3 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index 1cb502a932e0..f7a9c437b5b8 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -14,6 +14,7 @@
 #include <linux/lockdep.h>
 #include <linux/rcupdate.h>
 #include <linux/list.h>
+#include <linux/wait_bit.h>
 
 static struct kmem_cache *peer_cache;
 static atomic64_t peer_counter = ATOMIC64_INIT(0);
@@ -49,6 +50,8 @@ struct wg_peer *wg_peer_create(struct wg_device *wg,
 	INIT_WORK(&peer->transmit_packet_work, wg_packet_tx_worker);
 	wg_prev_queue_init(&peer->tx_queue);
 	wg_prev_queue_init(&peer->rx_queue);
+	/* Keep this above zero until teardown prevents new packet handoffs. */
+	atomic_set(&peer->packet_crypt_pending, 1);
 	rwlock_init(&peer->endpoint_lock);
 	kref_init(&peer->refcount);
 	skb_queue_head_init(&peer->staged_packet_queue);
@@ -105,28 +108,27 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	 */
 	wg_timers_stop(peer);
 
-	/* The transition between packet encryption/decryption queues isn't
-	 * guarded by is_dead, but each reference's life is strictly bounded by
-	 * two generations: once for parallel crypto and once for serial
-	 * ingestion, so we can simply flush twice, and be sure that we no
-	 * longer have references inside these queues.
+	/* Lookup removal and is_dead prevent new packets from entering the
+	 * parallel crypto queues after synchronize_net() waits for pre-existing
+	 * submission paths. Drop the initial count and wait for existing packets
+	 * to finish scheduling their serial TX work or RX NAPI processing.
 	 */
+	atomic_dec(&peer->packet_crypt_pending);
+	wait_var_event(&peer->packet_crypt_pending,
+		       !atomic_read_acquire(&peer->packet_crypt_pending));
+
+	flush_work(&peer->transmit_packet_work);
 
-	/* a) For encrypt/decrypt. */
-	flush_workqueue(peer->device->packet_crypt_wq);
-	/* b.1) For send (but not receive, since that's napi). */
-	flush_workqueue(peer->device->packet_crypt_wq);
-	/* b.2.1) For receive (but not send, since that's wq). */
 	napi_disable(&peer->napi);
-	/* b.2.1) It's now safe to remove the napi struct, which must be done
+	/* It's now safe to remove the napi struct, which must be done
 	 * here from process context.
 	 */
 	netif_napi_del(&peer->napi);
 
-	/* Ensure any workstructs we own (like transmit_handshake_work or
-	 * clear_peer_work) no longer are in use.
+	/* clear_peer_work was flushed by wg_timers_stop(). Ensure the remaining
+	 * peer-owned handshake work is no longer in use.
 	 */
-	flush_workqueue(peer->device->handshake_send_wq);
+	flush_work(&peer->transmit_handshake_work);
 
 	/* After the above flushes, a peer might still be active in a few
 	 * different contexts: 1) from xmit(), before hitting is_dead and
diff --git a/drivers/net/wireguard/peer.h b/drivers/net/wireguard/peer.h
index 718fb42bdac7..64412c67f413 100644
--- a/drivers/net/wireguard/peer.h
+++ b/drivers/net/wireguard/peer.h
@@ -37,6 +37,7 @@ struct endpoint {
 struct wg_peer {
 	struct wg_device *device;
 	struct prev_queue tx_queue, rx_queue;
+	atomic_t packet_crypt_pending;
 	struct sk_buff_head staged_packet_queue;
 	int serial_work_cpu;
 	bool is_dead;
diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 79b6d70de236..fdd34f0f15a6 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -11,6 +11,7 @@
 #include <linux/skbuff.h>
 #include <linux/ip.h>
 #include <linux/ipv6.h>
+#include <linux/wait_bit.h>
 #include <net/ip_tunnels.h>
 
 struct wg_device;
@@ -161,6 +162,7 @@ static inline int wg_queue_enqueue_per_device_and_peer(
 	 */
 	if (unlikely(!wg_prev_queue_enqueue(peer_queue, skb)))
 		return -ENOSPC;
+	atomic_inc(&PACKET_PEER(skb)->packet_crypt_pending);
 
 	/* Then we queue it up in the device queue, which consumes the
 	 * packet as soon as it can.
@@ -182,6 +184,8 @@ static inline void wg_queue_enqueue_per_peer_tx(struct sk_buff *skb, enum packet
 	atomic_set_release(&PACKET_CB(skb)->state, state);
 	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
 		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
+	if (atomic_dec_and_test(&peer->packet_crypt_pending))
+		wake_up_var(&peer->packet_crypt_pending);
 	wg_peer_put(peer);
 }
 
@@ -194,6 +198,8 @@ static inline void wg_queue_enqueue_per_peer_rx(struct sk_buff *skb, enum packet
 
 	atomic_set_release(&PACKET_CB(skb)->state, state);
 	napi_schedule(&peer->napi);
+	if (atomic_dec_and_test(&peer->packet_crypt_pending))
+		wake_up_var(&peer->packet_crypt_pending);
 	wg_peer_put(peer);
 }
 

---
base-commit: 70f3995830d3f1e79faa14eb0605914f778feca9
change-id: 20260901-fix-wg-peer-removal-43fc390d0311

Best regards,
--  
Chris J Arges <carges@cloudflare.com>

