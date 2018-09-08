Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8308f37
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 12:18:54 +0000 (UTC)
Received: from mail-wm0-x231.google.com (mail-wm0-x231.google.com
 [IPv6:2a00:1450:400c:c09::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3e71a8b
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 12:18:54 +0000 (UTC)
Received: by mail-wm0-x231.google.com with SMTP id q8-v6so17025756wmq.4
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 05:19:23 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 3/7] device: store a copy of the device net
Date: Sat,  8 Sep 2018 14:18:37 +0200
Message-Id: <20180908121841.8372-4-ju.orth@gmail.com>
In-Reply-To: <20180908121841.8372-1-ju.orth@gmail.com>
References: <20180908121841.8372-1-ju.orth@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

---
 src/device.c | 5 +++--
 src/device.h | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/device.c b/src/device.c
index 92aefc4..cb54ae1 100644
--- a/src/device.c
+++ b/src/device.c
@@ -396,10 +396,11 @@ static int netdevice_notification(struct notifier_block *nb,
 	if (action != NETDEV_REGISTER || dev->netdev_ops != &netdev_ops)
 		return 0;
 
-	if (dev_net(dev) == wg->transit_net && wg->have_transit_net_ref) {
+	wg->dev_net = dev_net(dev);
+	if (wg->dev_net == wg->transit_net && wg->have_transit_net_ref) {
 		put_net(wg->transit_net);
 		wg->have_transit_net_ref = false;
-	} else if (dev_net(dev) != wg->transit_net &&
+	} else if (wg->dev_net != wg->transit_net &&
 		   !wg->have_transit_net_ref) {
 		wg->have_transit_net_ref = true;
 		get_net(wg->transit_net);
diff --git a/src/device.h b/src/device.h
index 4b7552c..0bd25f2 100644
--- a/src/device.h
+++ b/src/device.h
@@ -41,6 +41,7 @@ struct wireguard_device {
 	struct crypt_queue encrypt_queue, decrypt_queue;
 	struct sock __rcu *sock4, *sock6;
 	struct net *transit_net;
+	struct net *dev_net;
 	struct noise_static_identity static_identity;
 	struct workqueue_struct *handshake_receive_wq, *handshake_send_wq;
 	struct workqueue_struct *packet_crypt_wq;
-- 
2.18.0
