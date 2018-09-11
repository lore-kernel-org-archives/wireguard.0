Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84390893
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:56 +0000 (UTC)
Received: from mail-wm0-x22b.google.com (mail-wm0-x22b.google.com
 [IPv6:2a00:1450:400c:c09::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d87ac5c
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:42 +0000 (UTC)
Received: by mail-wm0-x22b.google.com with SMTP id r1-v6so8576453wmh.0
 for <wireguard@lists.zx2c4.com>; Tue, 11 Sep 2018 12:13:34 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v3 07/12] socket: allow modification of transit_net
Date: Tue, 11 Sep 2018 21:13:06 +0200
Message-Id: <20180911191311.25373-8-ju.orth@gmail.com>
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
 src/device.c  |  8 +++++---
 src/netlink.c |  2 +-
 src/socket.c  | 18 ++++++++++--------
 src/socket.h  |  6 +++---
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/src/device.c b/src/device.c
index 71c0662..2b7286b 100644
--- a/src/device.c
+++ b/src/device.c
@@ -54,7 +54,7 @@ static int open(struct net_device *dev)
 #endif
 
 	mutex_lock(&wg->device_update_lock);
-	ret = socket_init(wg, wg->incoming_port);
+	ret = socket_init(wg, wg->transit_net, wg->incoming_port);
 	if (ret < 0)
 		goto out;
 	list_for_each_entry (peer, &wg->peer_list, peer_list) {
@@ -112,7 +112,7 @@ static int stop(struct net_device *dev)
 	}
 	mutex_unlock(&wg->device_update_lock);
 	skb_queue_purge(&wg->incoming_handshakes);
-	socket_reinit(wg, NULL, NULL);
+	socket_reinit(wg, NULL, NULL, NULL);
 	return 0;
 }
 
@@ -228,7 +228,7 @@ static void destruct(struct net_device *dev)
 	rtnl_unlock();
 	mutex_lock(&wg->device_update_lock);
 	wg->incoming_port = 0;
-	socket_reinit(wg, NULL, NULL);
+	socket_reinit(wg, NULL, NULL, NULL);
 	allowedips_free(&wg->peer_allowedips, &wg->device_update_lock);
 	/* The final references are cleared in the below calls to destroy_workqueue. */
 	peer_remove_all(wg);
@@ -398,7 +398,9 @@ static int netdevice_notification(struct notifier_block *nb,
 	if (action != NETDEV_REGISTER || dev->netdev_ops != &netdev_ops)
 		return 0;
 
+	mutex_lock(&wg->device_update_lock);
 	device_set_nets(wg, dev_net(dev), wg->transit_net);
+	mutex_unlock(&wg->device_update_lock);
 
 	return 0;
 }
diff --git a/src/netlink.c b/src/netlink.c
index 6b4350f..ed16980 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -368,7 +368,7 @@ static int set_port(struct wireguard_device *wg, u16 port)
 		wg->incoming_port = port;
 		return 0;
 	}
-	return socket_init(wg, port);
+	return socket_init(wg, wg->transit_net, port);
 }
 
 static int set_allowedip(struct wireguard_peer *peer, struct nlattr **attrs)
diff --git a/src/socket.c b/src/socket.c
index 72f3e6a..73dadcd 100644
--- a/src/socket.c
+++ b/src/socket.c
@@ -354,7 +354,7 @@ static inline void set_sock_opts(struct socket *sock)
 	sk_set_memalloc(sock->sk);
 }
 
-int socket_init(struct wireguard_device *wg, u16 port)
+int socket_init(struct wireguard_device *wg, struct net *net, u16 port)
 {
 	int ret;
 	struct udp_tunnel_sock_cfg cfg = {
@@ -384,18 +384,18 @@ int socket_init(struct wireguard_device *wg, u16 port)
 retry:
 #endif
 
-	ret = udp_sock_create(wg->transit_net, &port4, &new4);
+	ret = udp_sock_create(net, &port4, &new4);
 	if (ret < 0) {
 		pr_err("%s: Could not create IPv4 socket\n", wg->dev->name);
 		return ret;
 	}
 	set_sock_opts(new4);
-	setup_udp_tunnel_sock(wg->transit_net, new4, &cfg);
+	setup_udp_tunnel_sock(net, new4, &cfg);
 
 #if IS_ENABLED(CONFIG_IPV6)
 	if (ipv6_mod_enabled()) {
 		port6.local_udp_port = inet_sk(new4->sk)->inet_sport;
-		ret = udp_sock_create(wg->transit_net, &port6, &new6);
+		ret = udp_sock_create(net, &port6, &new6);
 		if (ret < 0) {
 			udp_tunnel_sock_release(new4);
 			if (ret == -EADDRINUSE && !port && retries++ < 100)
@@ -405,16 +405,16 @@ retry:
 			return ret;
 		}
 		set_sock_opts(new6);
-		setup_udp_tunnel_sock(wg->transit_net, new6, &cfg);
+		setup_udp_tunnel_sock(net, new6, &cfg);
 	}
 #endif
 
-	socket_reinit(wg, new4 ? new4->sk : NULL, new6 ? new6->sk : NULL);
+	socket_reinit(wg, net, new4 ? new4->sk : NULL, new6 ? new6->sk : NULL);
 	return 0;
 }
 
-void socket_reinit(struct wireguard_device *wg, struct sock *new4,
-		   struct sock *new6)
+void socket_reinit(struct wireguard_device *wg, struct net *net,
+		   struct sock *new4, struct sock *new6)
 {
 	struct sock *old4, *old6;
 
@@ -427,6 +427,8 @@ void socket_reinit(struct wireguard_device *wg, struct sock *new4,
 	rcu_assign_pointer(wg->sock6, new6);
 	if (new4)
 		wg->incoming_port = ntohs(inet_sk(new4)->inet_sport);
+	if (net && wg->transit_net != net)
+		device_set_nets(wg, wg->dev_net, net);
 	mutex_unlock(&wg->socket_update_lock);
 	synchronize_rcu_bh();
 	synchronize_net();
diff --git a/src/socket.h b/src/socket.h
index d873ffa..8419ee9 100644
--- a/src/socket.h
+++ b/src/socket.h
@@ -11,9 +11,9 @@
 #include <linux/if_vlan.h>
 #include <linux/if_ether.h>
 
-int socket_init(struct wireguard_device *wg, u16 port);
-void socket_reinit(struct wireguard_device *wg, struct sock *new4,
-		   struct sock *new6);
+int socket_init(struct wireguard_device *wg, struct net *net, u16 port);
+void socket_reinit(struct wireguard_device *wg, struct net *net,
+		   struct sock *new4, struct sock *new6);
 int socket_send_buffer_to_peer(struct wireguard_peer *peer, void *data,
 			       size_t len, u8 ds);
 int socket_send_skb_to_peer(struct wireguard_peer *peer, struct sk_buff *skb,
-- 
2.18.0
