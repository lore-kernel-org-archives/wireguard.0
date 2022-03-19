Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D109C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Mar 2022 00:47:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 35ae1b7b;
	Sat, 19 Mar 2022 00:47:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 438ba895
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Mar 2022 00:47:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 04C3861727;
 Sat, 19 Mar 2022 00:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B6FC340E8;
 Sat, 19 Mar 2022 00:47:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Pl/X7qFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1647650867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=V4QfcpmMfKhbZqAZheZzQjZAaNrrDgRvupNqVg+Dm9M=;
 b=Pl/X7qFbbxwPisO6SyUf+jefdvDcX1DrwWHRYXnWjmMB0qnsoAteqOeD8FIL2wpXMTI6QM
 U/CgtR3aeRTEzMoY/rvBml6A87nQzwNdYKlamhaeKhjIETyXYqR3ahwH+ZcHu3gFEMkGcw
 JIjJIuIcevHKelAb26CGAvpT2y1xR+w=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 252b7d66
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sat, 19 Mar 2022 00:47:46 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: netdev@vger.kernel.org,
	wireguard@lists.zx2c4.com,
	kuba@kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Saeed Mahameed <saeed@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] net: remove lockdep asserts from ____napi_schedule()
Date: Fri, 18 Mar 2022 18:47:38 -0600
Message-Id: <20220319004738.1068685-1-Jason@zx2c4.com>
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

This reverts commit fbd9a2ceba5c ("net: Add lockdep asserts to
____napi_schedule()."). While good in theory, in practice it causes
issues with various drivers, and so it can be revisited earlier in the
cycle where those drivers can be adjusted if needed.

Link: https://lore.kernel.org/netdev/20220317192145.g23wprums5iunx6c@sx1/
Link: https://lore.kernel.org/netdev/CAHmME9oHFzL6CYVh8nLGkNKOkMeWi2gmxs_f7S8PATWwc6uQsw@mail.gmail.com/
Link: https://lore.kernel.org/wireguard/0000000000000eaff805da869d5b@google.com/
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Saeed Mahameed <saeed@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 include/linux/lockdep.h | 7 -------
 net/core/dev.c          | 5 +----
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 0cc65d216701..467b94257105 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -329,12 +329,6 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 
 #define lockdep_assert_none_held_once()		\
 	lockdep_assert_once(!current->lockdep_depth)
-/*
- * Ensure that softirq is handled within the callchain and not delayed and
- * handled by chance.
- */
-#define lockdep_assert_softirq_will_run()	\
-	lockdep_assert_once(hardirq_count() | softirq_count())
 
 #define lockdep_recursing(tsk)	((tsk)->lockdep_recursion)
 
@@ -420,7 +414,6 @@ extern int lockdep_is_held(const void *);
 #define lockdep_assert_held_read(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held_once(l)		do { (void)(l); } while (0)
 #define lockdep_assert_none_held_once()	do { } while (0)
-#define lockdep_assert_softirq_will_run()	do { } while (0)
 
 #define lockdep_recursing(tsk)			(0)
 
diff --git a/net/core/dev.c b/net/core/dev.c
index 8e0cc5f2020d..6cad39b73a8e 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4277,9 +4277,6 @@ static inline void ____napi_schedule(struct softnet_data *sd,
 {
 	struct task_struct *thread;
 
-	lockdep_assert_softirq_will_run();
-	lockdep_assert_irqs_disabled();
-
 	if (test_bit(NAPI_STATE_THREADED, &napi->state)) {
 		/* Paired with smp_mb__before_atomic() in
 		 * napi_enable()/dev_set_threaded().
@@ -4887,7 +4884,7 @@ int __netif_rx(struct sk_buff *skb)
 {
 	int ret;
 
-	lockdep_assert_softirq_will_run();
+	lockdep_assert_once(hardirq_count() | softirq_count());
 
 	trace_netif_rx_entry(skb);
 	ret = netif_rx_internal(skb);
-- 
2.35.1

