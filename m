Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a13c5069
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:54 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a80279c4
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u12-v6so27128887wrr.4
 for <wireguard@lists.zx2c4.com>; Tue, 11 Sep 2018 12:13:33 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v3 06/12] device: store a copy of the device net
Date: Tue, 11 Sep 2018 21:13:05 +0200
Message-Id: <20180911191311.25373-7-ju.orth@gmail.com>
In-Reply-To: <20180911191311.25373-1-ju.orth@gmail.com>
References: <20180911191311.25373-1-ju.orth@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This eliminates the need for have_transit_net_ref because
have_transit_net_ref == true if and only if dev_net != transit_net.
---
 src/device.c | 27 +++++++++++++++++----------
 src/device.h |  4 +++-
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/src/device.c b/src/device.c
index 92aefc4..71c0662 100644
--- a/src/device.c
+++ b/src/device.c
@@ -243,7 +243,7 @@ static void destruct(struct net_device *dev)
 	skb_queue_purge(&wg->incoming_handshakes);
 	free_percpu(dev->tstats);
 	free_percpu(wg->incoming_handshakes_worker);
-	if (wg->have_transit_net_ref)
+	if (wg->transit_net != wg->dev_net)
 		put_net(wg->transit_net);
 	mutex_unlock(&wg->device_update_lock);
 
@@ -296,7 +296,9 @@ static int newlink(struct net *src_net, struct net_device *dev,
 	int ret = -ENOMEM;
 	struct wireguard_device *wg = netdev_priv(dev);
 
-	wg->transit_net = src_net;
+	wg->dev_net = NULL;
+	wg->transit_net = NULL;
+	device_set_nets(wg,  dev_net(dev), src_net);
 	init_rwsem(&wg->static_identity.lock);
 	mutex_init(&wg->socket_update_lock);
 	mutex_init(&wg->device_update_lock);
@@ -396,14 +398,8 @@ static int netdevice_notification(struct notifier_block *nb,
 	if (action != NETDEV_REGISTER || dev->netdev_ops != &netdev_ops)
 		return 0;
 
-	if (dev_net(dev) == wg->transit_net && wg->have_transit_net_ref) {
-		put_net(wg->transit_net);
-		wg->have_transit_net_ref = false;
-	} else if (dev_net(dev) != wg->transit_net &&
-		   !wg->have_transit_net_ref) {
-		wg->have_transit_net_ref = true;
-		get_net(wg->transit_net);
-	}
+	device_set_nets(wg, dev_net(dev), wg->transit_net);
+
 	return 0;
 }
 
@@ -449,3 +445,14 @@ void device_uninit(void)
 #endif
 	rcu_barrier_bh();
 }
+
+void device_set_nets(struct wireguard_device *wg, struct net *dev_net,
+		     struct net *transit_net)
+{
+	if (wg->transit_net != wg->dev_net)
+		put_net(wg->transit_net);
+	wg->dev_net = dev_net;
+	wg->transit_net = transit_net;
+	if (wg->transit_net != wg->dev_net)
+		get_net(wg->transit_net);
+}
diff --git a/src/device.h b/src/device.h
index 4b7552c..eb229df 100644
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
@@ -56,10 +57,11 @@ struct wireguard_device {
 	unsigned int num_peers, device_update_gen;
 	u32 fwmark;
 	u16 incoming_port;
-	bool have_transit_net_ref;
 };
 
 int device_init(void);
 void device_uninit(void);
+void device_set_nets(struct wireguard_device *wg, struct net *dev_net,
+		     struct net *transit_net);
 
 #endif /* _WG_DEVICE_H */
-- 
2.18.0
