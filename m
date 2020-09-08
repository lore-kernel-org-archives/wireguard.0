Return-Path: <SRS0=wFle=CR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00558C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Sep 2020 14:59:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 305C522BEA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Sep 2020 14:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="lqWy7OWW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 305C522BEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bca39628;
	Tue, 8 Sep 2020 14:30:27 +0000 (UTC)
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [2607:f8b0:4864:20::749])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 19ec1aec
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Sep 2020 14:30:25 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id v16so9231206qka.18
 for <wireguard@lists.zx2c4.com>; Tue, 08 Sep 2020 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=8GtHzLamWF1VdpdZidutHU6JDUt0jFOujpQJCbTVejU=;
 b=lqWy7OWW74aa4m2zpN6hqIuEagOzSA/htlHyrXpcAmPOTf33E6mdnBfjwjkzRQok+p
 YvdQZmZ3uznQuN6K5pxSv+ASDSwzbHgU5orwq3IngNKqdUFlQF1k7K7XpoiX3xjy2cA6
 +8FzATgomKonTJcHenXKWLhV6q/nMxRpeZos4QqCIh+I6dtXZE4SYkL5Pm6fe2Unlefq
 1cKUVKBfR2ei2pNRnCDWUTthi8Dc+2B3fjfcP+AvSvcgK+iTfPn13IYn+sozSewPsXIh
 jEsm7MGckoHZXuXfx2xxKw3Mlho9eP0c8mTsyYVvdjAkXJyq7l1PidySDlQoQSV+hkED
 SDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=8GtHzLamWF1VdpdZidutHU6JDUt0jFOujpQJCbTVejU=;
 b=f+uDdWUQoO1GWEjCmDZ0mamhwnGTFsWgJXXR6uWT5bGYaCr55J7cNLaQ91FpTjaido
 Q/LthWtLzLxAFZ7TOBLr/Ar0cn3gWVPF81nPPxC0qltImaKGhvKYPQK6pQ6dWGaj6w2N
 eT6b8uH1FYciZYhUQy+zmz55Bi9H+1EHOQlCRAxT+p/otOYBN7owyB6Ien5ZeqHG5/Lv
 IvMeiHFS5w3up8JgNMDyJ+ZEhFLz4MjuUJpat/FseIKNBsz2CgbUMrczC38aaw8Txrwx
 GCUo+B9dE7nlJsnFv7YYAv3fp12IWiPowWivdaTS63LITNWio5xvysYFXHL1PPF4lN4c
 etNQ==
X-Gm-Message-State: AOAM532BNvtJbIvJPrXReVrwPOWkp74IW2I6sFwCSXxjo7l1CqPWktax
 DFTZ9XzLYaee3pMYyuVy0YlEkA82rht3Jw==
X-Google-Smtp-Source: ABdhPJx5ddNvLuQ3mwAl4vJMNyRzuwtxd3GYMxGLIuj1NP1TQ9VX8nFburf9EJSoK9nppQFupFhFiPR9/jSB1g==
X-Received: from edumazet1.svl.corp.google.com
 ([2620:15c:2c4:201:7220:84ff:fe09:1424])
 (user=edumazet job=sendgmr) by 2002:a0c:b2d4:: with SMTP id
 d20mr471451qvf.1.1599577158168; Tue, 08 Sep 2020 07:59:18 -0700 (PDT)
Date: Tue,  8 Sep 2020 07:59:11 -0700
Message-Id: <20200908145911.4090480-1-edumazet@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH net] wireguard: fix race in wg_index_hashtable_replace()
From: Eric Dumazet <edumazet@google.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: netdev <netdev@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, 
 Eric Dumazet <eric.dumazet@gmail.com>, syzbot <syzkaller@googlegroups.com>, 
 "Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

syzbot got a NULL dereference in wg_index_hashtable_replace() [1]

Issue here is that right after checking hlist_unhashed(&old->index_hash)
another cpu might have removed @old already from the hash.

Since we are dealing with a very unlikely case, we can simply
acquire the table lock earlier.

[1]
general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 PID: 7395 Comm: kworker/0:3 Not tainted 5.9.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: wg-kex-wg1 wg_packet_handshake_receive_worker
RIP: 0010:hlist_replace_rcu include/linux/rculist.h:505 [inline]
RIP: 0010:wg_index_hashtable_replace+0x176/0x330 drivers/net/wireguard/peerlookup.c:174
Code: 00 fc ff df 48 89 f9 48 c1 e9 03 80 3c 01 00 0f 85 44 01 00 00 48 b9 00 00 00 00 00 fc ff df 48 8b 45 10 48 89 c6 48 c1 ee 03 <80> 3c 0e 00 0f 85 06 01 00 00 48 85 d2 4c 89 28 74 47 e8 a3 4f b5
RSP: 0018:ffffc90006a97bf8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888050ffc4f8 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88808e04e010
RBP: ffff88808e04e000 R08: 0000000000000001 R09: ffff8880543d0000
R10: ffffed100a87a000 R11: 000000000000016e R12: ffff8880543d0000
R13: ffff88808e04e008 R14: ffff888050ffc508 R15: ffff888050ffc500
FS:  0000000000000000(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000f5505db0 CR3: 0000000097cf7000 CR4: 00000000001526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 wg_noise_handshake_begin_session+0x752/0xc9a drivers/net/wireguard/noise.c:820
 wg_receive_handshake_packet drivers/net/wireguard/receive.c:183 [inline]
 wg_packet_handshake_receive_worker+0x33b/0x730 drivers/net/wireguard/receive.c:220
 process_one_work+0x94c/0x1670 kernel/workqueue.c:2269
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
 kthread+0x3b5/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
Modules linked in:
---[ end trace 0d737db78b72da84 ]---
RIP: 0010:hlist_replace_rcu include/linux/rculist.h:505 [inline]
RIP: 0010:wg_index_hashtable_replace+0x176/0x330 drivers/net/wireguard/peerlookup.c:174
Code: 00 fc ff df 48 89 f9 48 c1 e9 03 80 3c 01 00 0f 85 44 01 00 00 48 b9 00 00 00 00 00 fc ff df 48 8b 45 10 48 89 c6 48 c1 ee 03 <80> 3c 0e 00 0f 85 06 01 00 00 48 85 d2 4c 89 28 74 47 e8 a3 4f b5
RSP: 0018:ffffc90006a97bf8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888050ffc4f8 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88808e04e010
RBP: ffff88808e04e000 R08: 0000000000000001 R09: ffff8880543d0000
R10: ffffed100a87a000 R11: 000000000000016e R12: ffff8880543d0000
R13: ffff88808e04e008 R14: ffff888050ffc508 R15: ffff888050ffc500
FS:  0000000000000000(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000f5505db0 CR3: 0000000097cf7000 CR4: 00000000001526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Eric Dumazet <edumazet@google.com>
Reported-by: syzbot <syzkaller@googlegroups.com>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
---
 drivers/net/wireguard/peerlookup.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireguard/peerlookup.c b/drivers/net/wireguard/peerlookup.c
index e4deb331476b3d67c1d24eb269b26f587798cbc2..d82eba263292474a7cdfb133b2ba1862a2e9352c 100644
--- a/drivers/net/wireguard/peerlookup.c
+++ b/drivers/net/wireguard/peerlookup.c
@@ -167,21 +167,25 @@ bool wg_index_hashtable_replace(struct index_hashtable *table,
 				struct index_hashtable_entry *old,
 				struct index_hashtable_entry *new)
 {
-	if (unlikely(hlist_unhashed(&old->index_hash)))
-		return false;
+
+	bool replaced = false;
+
 	spin_lock_bh(&table->lock);
-	new->index = old->index;
-	hlist_replace_rcu(&old->index_hash, &new->index_hash);
+	if (likely(!hlist_unhashed(&old->index_hash))) {
+		replaced = true;
+		new->index = old->index;
+		hlist_replace_rcu(&old->index_hash, &new->index_hash);
 
-	/* Calling init here NULLs out index_hash, and in fact after this
-	 * function returns, it's theoretically possible for this to get
-	 * reinserted elsewhere. That means the RCU lookup below might either
-	 * terminate early or jump between buckets, in which case the packet
-	 * simply gets dropped, which isn't terrible.
-	 */
-	INIT_HLIST_NODE(&old->index_hash);
+		/* Calling init here NULLs out index_hash, and in fact after this
+		 * function returns, it's theoretically possible for this to get
+		 * reinserted elsewhere. That means the RCU lookup below might either
+		 * terminate early or jump between buckets, in which case the packet
+		 * simply gets dropped, which isn't terrible.
+		 */
+		INIT_HLIST_NODE(&old->index_hash);
+	}
 	spin_unlock_bh(&table->lock);
-	return true;
+	return replaced;
 }
 
 void wg_index_hashtable_remove(struct index_hashtable *table,
-- 
2.28.0.526.ge36021eeef-goog

