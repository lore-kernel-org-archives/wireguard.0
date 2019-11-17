Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8250FC43141
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:43:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FCD320678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=localdomain.pl header.i=@localdomain.pl header.b="aJNIzY/h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FCD320678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=localdomain.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d787bcff;
	Wed, 27 Nov 2019 09:43:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16ac46d4
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Nov 2019 13:59:57 +0000 (UTC)
Received: from smtp.megiteam.pl (smtp.megiteam.pl [31.186.83.105])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3fa9d0c8
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Nov 2019 13:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=localdomain.pl; s=megiteam; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From; bh=e89C5PR/j77GhJlgOuKGTVSP3iWfVM8k2zNtTW9NxMQ=; b=aJNIzY
 /hncPYZz59HKZ2DdFrQi/sN9BEYEDO0XtWLNjXd2i+EXPxn8WkIaG0w9bk8K/ntIGGQWT8UsoE/wI
 /QmmFy7ykwMlIe2/dATQzytCVmohIWpbfJW94D9inajwE3kJ4eJnZvJZk/79Njcrq2wrtg1aaEBul
 8TXnoTlMS3tRXObTYKkx45fcG7FrLnPRLa9v8zU8DYLYmki0pHAF0KAK3Dxyfhtkl/z+vEbN6wBxt
 AYOk86mh2C+GUd+roOp5/Bo6vasQhLkVIOmtEtpCoL1fdW7ULniSdfVIEpzRIh4UzczRMG6A+S2K9
 dL+wYAUupdNh3QYHlqrZvF3Nu6fg==;
Received: from [93.159.154.34] (helo=ubuntu1804.localdomain)
 by smtp.megiteam.pl with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86.2_XX) (envelope-from <root@localdomain.pl>)
 id 1iWL5o-0005Ew-GM; Sun, 17 Nov 2019 14:59:56 +0100
From: Grzegorz Nosek <root@localdomain.pl>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Don't delete peers if not needed on `setconf`
Date: Sun, 17 Nov 2019 05:59:28 -0800
Message-Id: <20191117135928.3349-2-root@localdomain.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191117135928.3349-1-root@localdomain.pl>
References: <20191117135928.3349-1-root@localdomain.pl>
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:43:00 +0100
Cc: Grzegorz Nosek <root@localdomain.pl>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This prevents dropping sessions during `wg setconf` without manually
removing dead peers.

Signed-off-by: Grzegorz Nosek <root@localdomain.pl>
---
 src/netlink.c |  6 +++++-
 src/peer.c    | 31 +++++++++++++++++++++++++++++++
 src/peer.h    |  3 +++
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/src/netlink.c b/src/netlink.c
index 190e405..a249380 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -434,6 +434,8 @@ static int set_peer(struct wg_device *wg, struct nlattr **attrs)
 		goto out;
 	}
 
+	peer->remove_me = false;
+
 	if (preshared_key) {
 		down_write(&peer->handshake.lock);
 		memcpy(&peer->handshake.preshared_key, preshared_key,
@@ -543,7 +545,7 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	if (flags & WGDEVICE_F_REPLACE_PEERS)
-		wg_peer_remove_all(wg);
+		wg_peer_mark(wg);
 
 	if (info->attrs[WGDEVICE_A_PRIVATE_KEY] &&
 	    nla_len(info->attrs[WGDEVICE_A_PRIVATE_KEY]) ==
@@ -599,6 +601,8 @@ skip_set_private_key:
 	}
 	ret = 0;
 
+	if (flags & WGDEVICE_F_REPLACE_PEERS)
+		wg_peer_sweep(wg);
 out:
 	mutex_unlock(&wg->device_update_lock);
 	rtnl_unlock();
diff --git a/src/peer.c b/src/peer.c
index 071eedf..26e6df2 100644
--- a/src/peer.c
+++ b/src/peer.c
@@ -195,6 +195,37 @@ void wg_peer_remove_all(struct wg_device *wg)
 		peer_remove_after_dead(peer);
 }
 
+void wg_peer_mark(struct wg_device *wg)
+{
+	struct wg_peer *peer, *temp;
+
+	lockdep_assert_held(&wg->device_update_lock);
+	list_for_each_entry_safe(peer, temp, &wg->peer_list, peer_list) {
+		peer->remove_me = true;
+	}
+}
+
+void wg_peer_sweep(struct wg_device *wg)
+{
+	struct wg_peer *peer, *temp;
+	LIST_HEAD(dead_peers);
+
+	lockdep_assert_held(&wg->device_update_lock);
+
+	list_for_each_entry_safe(peer, temp, &wg->peer_list, peer_list) {
+		if (peer->remove_me) {
+			peer_make_dead(peer);
+			list_add_tail(&peer->peer_list, &dead_peers);
+		}
+	}
+	if (list_empty(&dead_peers))
+		return;
+
+	synchronize_rcu();
+	list_for_each_entry_safe(peer, temp, &dead_peers, peer_list)
+		peer_remove_after_dead(peer);
+}
+
 static void rcu_release(struct rcu_head *rcu)
 {
 	struct wg_peer *peer = container_of(rcu, struct wg_peer, rcu);
diff --git a/src/peer.h b/src/peer.h
index 23af409..b67dd73 100644
--- a/src/peer.h
+++ b/src/peer.h
@@ -64,6 +64,7 @@ struct wg_peer {
 	u64 internal_id;
 	struct napi_struct napi;
 	bool is_dead;
+	bool remove_me;
 };
 
 struct wg_peer *wg_peer_create(struct wg_device *wg,
@@ -79,5 +80,7 @@ static inline struct wg_peer *wg_peer_get(struct wg_peer *peer)
 void wg_peer_put(struct wg_peer *peer);
 void wg_peer_remove(struct wg_peer *peer);
 void wg_peer_remove_all(struct wg_device *wg);
+void wg_peer_mark(struct wg_device *wg);
+void wg_peer_sweep(struct wg_device *wg);
 
 #endif /* _WG_PEER_H */
-- 
2.17.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
