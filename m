Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A498EF34C5C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Apr 2026 15:16:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 745a6f6e;
	Mon, 13 Apr 2026 15:14:35 +0000 (UTC)
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e3cee38a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Apr 2026 15:00:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1776092436; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HCp6CLPPNiSF3liA/4Omngty6B+ulEsF/QWqJxYRu//l1jXcaWZ9LC1YTCmjOUbnQJMG+uRfXf5A/On1ZjxSc6y2V8Fsbf2BNAbN8kcZWTiVqkNJgE4n4+2Lfdt9R/K4/BKV26E42jQLqjQmVWTVS/T+1hNCD3hf/UTV7XjhCbI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1776092436;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GuZMQ4obIZBfLwzT7dBWa+wWhBwlSjqniuDoLorhniA=; 
 b=MALNYq6UMVrL7xvAfa4S10qJeShDwfzUqQ5AsieDixZ88vYxoH++3ZbjSLZDxaJH6S1Ob6hHkFowFHapAAXjxuvplb8P0rB9TVNLV0Qt5LG8WirWszTPRxLp9RowvH6k14zx9qFjB6K4pBeQIRpGt1nl1E/AA9l7dqrwA6fP+ek=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=mpiricsoftware.com;
 spf=pass  smtp.mailfrom=shardul.b@mpiricsoftware.com;
 dmarc=pass header.from=<shardul.b@mpiricsoftware.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776092436; 
 s=mpiric; d=mpiricsoftware.com; i=shardul.b@mpiricsoftware.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=GuZMQ4obIZBfLwzT7dBWa+wWhBwlSjqniuDoLorhniA=;
 b=tWPem7+rKELSJXTTak1d3EXPm64tq4CR6L0Zd812NuRFVzaQ4a20fYi+zDA5TCVi
 qMgCGK6eVNzkocaCR6aUBCzKhigMyYI42+Ai1wLk/jSF6DzhHCGh8UZaFtahiUlvwAh
 D1mLVgTucRxliLj+/Cxh2FDxEmQJBmxtgVYjVTQI=
Received: by mx.zohomail.com with SMTPS id 1776092434400296.8841184266247;
 Mon, 13 Apr 2026 08:00:34 -0700 (PDT)
From: Shardul Bankar <shardul.b@mpiricsoftware.com>
To: Jason@zx2c4.com,
	kuniyu@google.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, janak@mpiric.us,
 kalpan.jani@mpiricsoftware.com, shardulsb08@gmail.com,
 Shardul Bankar <shardul.b@mpiricsoftware.com>,
 syzbot+pFBD3bslSSshiJCd3rxy@syzkaller.appspotmail.com
Subject: [PATCH] wireguard: device: use exit_rtnl callback instead of manual
 rtnl_lock in pre_exit
Date: Mon, 13 Apr 2026 20:30:24 +0530
Message-Id: <20260413150024.1003490-1-shardul.b@mpiricsoftware.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Mon, 13 Apr 2026 15:14:30 +0000
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

wg_netns_pre_exit() manually acquires rtnl_lock() inside the
pernet .pre_exit callback.  This causes a hung task when another
thread holds rtnl_mutex - the cleanup_net workqueue (or the
setup_net failure rollback path) blocks indefinitely in
wg_netns_pre_exit() waiting to acquire the lock.

Convert to .exit_rtnl, introduced in commit 7a60d91c690b ("net:
Add ->exit_rtnl() hook to struct pernet_operations."), where the
framework already holds RTNL and batches all callbacks under a
single rtnl_lock()/rtnl_unlock() pair, eliminating the contention
window.

The rcu_assign_pointer(wg->creating_net, NULL) is safe to move
from .pre_exit to .exit_rtnl (which runs after synchronize_rcu())
because all RCU readers of creating_net either use maybe_get_net()
- which returns NULL for a dying namespace with zero refcount - or
access net->user_ns which remains valid throughout the entire
ops_undo_list sequence.

Reported-by: syzbot+pFBD3bslSSshiJCd3rxy@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=cb64c22a492202ca929e18262fdb8cb89e635c70
Signed-off-by: Shardul Bankar <shardul.b@mpiricsoftware.com>
---
 drivers/net/wireguard/device.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index 46a71ec36af8..eb854c5294a3 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -411,12 +411,11 @@ static struct rtnl_link_ops link_ops __read_mostly = {
 	.newlink		= wg_newlink,
 };
 
-static void wg_netns_pre_exit(struct net *net)
+static void wg_netns_exit_rtnl(struct net *net, struct list_head *dev_kill_list)
 {
 	struct wg_device *wg;
 	struct wg_peer *peer;
 
-	rtnl_lock();
 	list_for_each_entry(wg, &device_list, device_list) {
 		if (rcu_access_pointer(wg->creating_net) == net) {
 			pr_debug("%s: Creating namespace exiting\n", wg->dev->name);
@@ -429,11 +428,10 @@ static void wg_netns_pre_exit(struct net *net)
 			mutex_unlock(&wg->device_update_lock);
 		}
 	}
-	rtnl_unlock();
 }
 
 static struct pernet_operations pernet_ops = {
-	.pre_exit = wg_netns_pre_exit
+	.exit_rtnl = wg_netns_exit_rtnl
 };
 
 int __init wg_device_init(void)
-- 
2.34.1

