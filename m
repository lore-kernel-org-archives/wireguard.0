Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E0DD10F3B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 01:45:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b5fc648;
	Mon, 18 Nov 2024 01:36:57 +0000 (UTC)
Received: from sym2.noone.org (sym.noone.org [178.63.92.236])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 13cbee7e
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Sep 2024 08:57:49 +0000 (UTC)
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4X8Ttg11tTz3j19w; Thu, 19 Sep 2024 10:57:46 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] wireguard: Omit unnecessary memset of netdev private
 data
Date: Thu, 19 Sep 2024 10:57:46 +0200
Message-Id: <20240919085746.16904-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
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

The memory for netdev_priv is allocated using kvzalloc in
alloc_netdev_mqs before rtnl_link_ops->setup is called so there is no
need to zero it again in wg_setup.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/net/wireguard/device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index 45e9b908dbfb..a2ba71fbbed4 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -302,7 +302,6 @@ static void wg_setup(struct net_device *dev)
 	/* We need to keep the dst around in case of icmp replies. */
 	netif_keep_dst(dev);
 
-	memset(wg, 0, sizeof(*wg));
 	wg->dev = dev;
 }
 
-- 
2.43.0

