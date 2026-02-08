Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EF5EF06EB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:13:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8bd1e262;
	Sun, 8 Feb 2026 17:13:09 +0000 (UTC)
Received: from secundus.vsp.im (secundus.vsp.im [2a03:4000:6:508b::42])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0ed13e2f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Feb 2026 17:05:49 +0000 (UTC)
Received: from sky.vs-b.lan (unknown
 [IPv6:fd04:f774:a13e:5801:fbeb:e9a5:1c28:3a49])
 by secundus.vsp.im (Postfix) with ESMTP id C76B5FFA25;
 Sun,  8 Feb 2026 18:05:47 +0100 (CET)
From: Valentin Spreckels <valentin@spreckels.dev>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Valentin Spreckels <valentin@spreckels.dev>
Subject: [PATCH wireguard] wireguard: prevent ipv6 addrconf via
 IFF_NO_ADDRCONF flag
Date: Sun,  8 Feb 2026 18:05:45 +0100
Message-ID: <20260208170545.31942-1-valentin@spreckels.dev>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:12:58 +0000
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

Use the flag introduced in commit 8a321cf7becc6 ("net: add
IFF_NO_ADDRCONF and use it in bonding to prevent ipv6 addrconf")
instead of mangling the addr_gen_mode to prevent ipv6 addrconf.

Signed-off-by: Valentin Spreckels <valentin@spreckels.dev>
---
 drivers/net/wireguard/device.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index 46a71ec36af87..4b29f2fa51d1d 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -31,7 +31,6 @@ static LIST_HEAD(device_list);
 static int wg_open(struct net_device *dev)
 {
 	struct in_device *dev_v4 = __in_dev_get_rtnl(dev);
-	struct inet6_dev *dev_v6 = __in6_dev_get(dev);
 	struct wg_device *wg = netdev_priv(dev);
 	struct wg_peer *peer;
 	int ret;
@@ -44,8 +43,6 @@ static int wg_open(struct net_device *dev)
 		IN_DEV_CONF_SET(dev_v4, SEND_REDIRECTS, false);
 		IPV4_DEVCONF_ALL(dev_net(dev), SEND_REDIRECTS) = false;
 	}
-	if (dev_v6)
-		dev_v6->cnf.addr_gen_mode = IN6_ADDR_GEN_MODE_NONE;
 
 	mutex_lock(&wg->device_update_lock);
 	ret = wg_socket_init(wg, wg->incoming_port);
@@ -288,7 +285,7 @@ static void wg_setup(struct net_device *dev)
 	dev->needed_tailroom = noise_encrypted_len(MESSAGE_PADDING_MULTIPLE);
 	dev->type = ARPHRD_NONE;
 	dev->flags = IFF_POINTOPOINT | IFF_NOARP;
-	dev->priv_flags |= IFF_NO_QUEUE;
+	dev->priv_flags |= IFF_NO_QUEUE | IFF_NO_ADDRCONF;
 	dev->lltx = true;
 	dev->features |= WG_NETDEV_FEATURES;
 	dev->hw_features |= WG_NETDEV_FEATURES;
-- 
2.52.0

