Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 912008fc
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:49 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a79e4d2d
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:40 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u12-v6so27128823wrr.4
 for <wireguard@lists.zx2c4.com>; Tue, 11 Sep 2018 12:13:32 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v3 05/12] device: rename creating_net to transit_net
Date: Tue, 11 Sep 2018 21:13:04 +0200
Message-Id: <20180911191311.25373-6-ju.orth@gmail.com>
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

---
 src/device.c  | 20 ++++++++++----------
 src/device.h  |  4 ++--
 src/netlink.c |  4 ++--
 src/socket.c  |  8 ++++----
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/src/device.c b/src/device.c
index 88c228b..92aefc4 100644
--- a/src/device.c
+++ b/src/device.c
@@ -243,8 +243,8 @@ static void destruct(struct net_device *dev)
 	skb_queue_purge(&wg->incoming_handshakes);
 	free_percpu(dev->tstats);
 	free_percpu(wg->incoming_handshakes_worker);
-	if (wg->have_creating_net_ref)
-		put_net(wg->creating_net);
+	if (wg->have_transit_net_ref)
+		put_net(wg->transit_net);
 	mutex_unlock(&wg->device_update_lock);
 
 	pr_debug("%s: Interface deleted\n", dev->name);
@@ -296,7 +296,7 @@ static int newlink(struct net *src_net, struct net_device *dev,
 	int ret = -ENOMEM;
 	struct wireguard_device *wg = netdev_priv(dev);
 
-	wg->creating_net = src_net;
+	wg->transit_net = src_net;
 	init_rwsem(&wg->static_identity.lock);
 	mutex_init(&wg->socket_update_lock);
 	mutex_init(&wg->device_update_lock);
@@ -396,13 +396,13 @@ static int netdevice_notification(struct notifier_block *nb,
 	if (action != NETDEV_REGISTER || dev->netdev_ops != &netdev_ops)
 		return 0;
 
-	if (dev_net(dev) == wg->creating_net && wg->have_creating_net_ref) {
-		put_net(wg->creating_net);
-		wg->have_creating_net_ref = false;
-	} else if (dev_net(dev) != wg->creating_net &&
-		   !wg->have_creating_net_ref) {
-		wg->have_creating_net_ref = true;
-		get_net(wg->creating_net);
+	if (dev_net(dev) == wg->transit_net && wg->have_transit_net_ref) {
+		put_net(wg->transit_net);
+		wg->have_transit_net_ref = false;
+	} else if (dev_net(dev) != wg->transit_net &&
+		   !wg->have_transit_net_ref) {
+		wg->have_transit_net_ref = true;
+		get_net(wg->transit_net);
 	}
 	return 0;
 }
diff --git a/src/device.h b/src/device.h
index 2499782..4b7552c 100644
--- a/src/device.h
+++ b/src/device.h
@@ -40,7 +40,7 @@ struct wireguard_device {
 	struct net_device *dev;
 	struct crypt_queue encrypt_queue, decrypt_queue;
 	struct sock __rcu *sock4, *sock6;
-	struct net *creating_net;
+	struct net *transit_net;
 	struct noise_static_identity static_identity;
 	struct workqueue_struct *handshake_receive_wq, *handshake_send_wq;
 	struct workqueue_struct *packet_crypt_wq;
@@ -56,7 +56,7 @@ struct wireguard_device {
 	unsigned int num_peers, device_update_gen;
 	u32 fwmark;
 	u16 incoming_port;
-	bool have_creating_net_ref;
+	bool have_transit_net_ref;
 };
 
 int device_init(void);
diff --git a/src/netlink.c b/src/netlink.c
index 0775a2a..6b4350f 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -263,7 +263,7 @@ static int get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
 	genl_dump_check_consistent(cb, hdr);
 
 	if (!last_peer_cursor) {
-		if (test_socket_net_capable(wg->creating_net) == 0) {
+		if (test_socket_net_capable(wg->transit_net) == 0) {
 			if (nla_put_u16(skb, WGDEVICE_A_LISTEN_PORT,
 						wg->incoming_port))
 				goto out;
@@ -357,7 +357,7 @@ static int set_port(struct wireguard_device *wg, u16 port)
 	struct wireguard_peer *peer;
 	int ret;
 
-	ret = test_socket_net_capable(wg->creating_net);
+	ret = test_socket_net_capable(wg->transit_net);
 	if (ret)
 		return ret;
 	if (wg->incoming_port == port)
diff --git a/src/socket.c b/src/socket.c
index 2e9e44f..72f3e6a 100644
--- a/src/socket.c
+++ b/src/socket.c
@@ -384,18 +384,18 @@ int socket_init(struct wireguard_device *wg, u16 port)
 retry:
 #endif
 
-	ret = udp_sock_create(wg->creating_net, &port4, &new4);
+	ret = udp_sock_create(wg->transit_net, &port4, &new4);
 	if (ret < 0) {
 		pr_err("%s: Could not create IPv4 socket\n", wg->dev->name);
 		return ret;
 	}
 	set_sock_opts(new4);
-	setup_udp_tunnel_sock(wg->creating_net, new4, &cfg);
+	setup_udp_tunnel_sock(wg->transit_net, new4, &cfg);
 
 #if IS_ENABLED(CONFIG_IPV6)
 	if (ipv6_mod_enabled()) {
 		port6.local_udp_port = inet_sk(new4->sk)->inet_sport;
-		ret = udp_sock_create(wg->creating_net, &port6, &new6);
+		ret = udp_sock_create(wg->transit_net, &port6, &new6);
 		if (ret < 0) {
 			udp_tunnel_sock_release(new4);
 			if (ret == -EADDRINUSE && !port && retries++ < 100)
@@ -405,7 +405,7 @@ retry:
 			return ret;
 		}
 		set_sock_opts(new6);
-		setup_udp_tunnel_sock(wg->creating_net, new6, &cfg);
+		setup_udp_tunnel_sock(wg->transit_net, new6, &cfg);
 	}
 #endif
 
-- 
2.18.0
