Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D0AC46CD8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:55:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f841483d;
	Wed, 20 Dec 2023 05:00:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 16910734
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Oct 2023 19:24:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 635D31BF206
 for <wireguard@lists.zx2c4.com>; Tue,  3 Oct 2023 19:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koalox.com; s=gm1;
 t=1696361058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TIywFFf778kjLKkHsimE9IyzDWcvKB9yE2YydOrWG50=;
 b=SkHe17tpcNzq8rUAl/NJ4Tyf0M0vVK8YuctmKTOHskkDvugtRKeFWk/H7Z2fALpdYSDXte
 Vx3tQ0zbUZJYB2L2pmnW+LyapLVXZDtP9QLKohWdqy048QYYO9I5vcAG5PjzlECViDS0KH
 wmo9Jggb/kjpmhPbeQod2swI+vYqFgv6piftJwdk0A1DV/7N09CV+dXL18kcNovB6JT7X0
 +wPvBCmgUezL9bHT+9iTr1hbwH+eXZWvj2x4kZwXUZt9qd54TTg8QxtMg0lLvZGljKK4Wx
 Y0dFCwKirAF/i5YlOERMZvYKqlr71dp2PTXAl3eKKA+634icbQIAa7lTUuIDKw==
From: Raphael Catolino <rca@koalox.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/1] wireguard-linux: add netlink multicast group for
 notifications on peer change
Date: Tue, 03 Oct 2023 21:24:17 +0200
Message-ID: <2328185.xqv9EDfTUt@desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-GND-Sasl: rca@koalox.com
X-Mailman-Approved-At: Wed, 20 Dec 2023 05:00:21 +0000
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

From: Linus Karl <linus@lotz.li>

Add a multicast group to the wireguard netlink family, and three message
types to notify subscribers when a peer has changed .

Signed-off-by: Linus Karl <linus@lotz.li>
Co-developed-by: Raphael Catolino <rca@koalox.com>
Signed-off-by: Raphael Catolino <rca@koalox.com>
---
 drivers/net/wireguard/device.h  |   2 +
 drivers/net/wireguard/netlink.c | 231 +++++++++++++++++++++++++++++++-
 drivers/net/wireguard/netlink.h |   6 +
 drivers/net/wireguard/peer.c    |   7 +-
 drivers/net/wireguard/socket.c  |   5 +
 include/uapi/linux/wireguard.h  |  69 ++++++++++
 6 files changed, 316 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/device.h b/drivers/net/wireguard/device.h
index 43c7cebbf50b..137b1b517815 100644
--- a/drivers/net/wireguard/device.h
+++ b/drivers/net/wireguard/device.h
@@ -54,6 +54,8 @@ struct wg_device {
 	unsigned int num_peers, device_update_gen;
 	u32 fwmark;
 	u16 incoming_port;
+	bool endpoint_monitor;
+	bool peers_monitor;
 };
 
 int wg_device_init(void);
diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index 43c8c84e7ea8..b40b56e697f2 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -27,7 +27,9 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 	[WGDEVICE_A_FLAGS]		= { .type = NLA_U32 },
 	[WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
 	[WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
-	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED }
+	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED },
+	[WGDEVICE_A_MONITOR]		= { .type = NLA_U8 },
+	[WGDEVICE_A_PEER]		= { .type = NLA_NESTED }
 };
 
 static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
@@ -233,7 +235,10 @@ static int wg_get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
 				wg->incoming_port) ||
 		    nla_put_u32(skb, WGDEVICE_A_FWMARK, wg->fwmark) ||
 		    nla_put_u32(skb, WGDEVICE_A_IFINDEX, wg->dev->ifindex) ||
-		    nla_put_string(skb, WGDEVICE_A_IFNAME, wg->dev->name))
+		    nla_put_string(skb, WGDEVICE_A_IFNAME, wg->dev->name) ||
+		    nla_put_u8(skb, WGDEVICE_A_MONITOR,
+			       (wg->endpoint_monitor ? WGDEVICE_MONITOR_F_ENDPOINT : 0) |
+			       (wg->endpoint_monitor ? WGDEVICE_MONITOR_F_PEERS : 0)))
 			goto out;
 
 		down_read(&wg->static_identity.lock);
@@ -482,6 +487,10 @@ static int set_peer(struct wg_device *wg, struct nlattr **attrs)
 	if (netif_running(wg->dev))
 		wg_packet_send_staged_packets(peer);
 
+	if (wg->peers_monitor) {
+		wg_genl_mcast_peer_set(peer);
+	}
+
 out:
 	wg_peer_put(peer);
 	if (attrs[WGPEER_A_PRESHARED_KEY])
@@ -537,6 +546,18 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 			goto out;
 	}
 
+	if (info->attrs[WGDEVICE_A_MONITOR]) {
+		u8 monitor = nla_get_u8(info->attrs[WGDEVICE_A_MONITOR]);
+
+		if (monitor & ~__WGDEVICE_MONITOR_F_ALL)
+			goto out;
+
+		wg->endpoint_monitor =
+			(monitor & WGDEVICE_MONITOR_F_ENDPOINT) == WGDEVICE_MONITOR_F_ENDPOINT;
+		wg->peers_monitor =
+			(monitor & WGDEVICE_MONITOR_F_PEERS) == WGDEVICE_MONITOR_F_PEERS;
+	}
+
 	if (flags & WGDEVICE_F_REPLACE_PEERS)
 		wg_peer_remove_all(wg);
 
@@ -617,6 +638,12 @@ static const struct genl_ops genl_ops[] = {
 	}
 };
 
+static const struct genl_multicast_group wg_genl_mcgrps[] = {
+	{
+		.name = WG_MULTICAST_GROUP_PEERS
+	}
+};
+
 static struct genl_family genl_family __ro_after_init = {
 	.ops = genl_ops,
 	.n_ops = ARRAY_SIZE(genl_ops),
@@ -626,7 +653,9 @@ static struct genl_family genl_family __ro_after_init = {
 	.maxattr = WGDEVICE_A_MAX,
 	.module = THIS_MODULE,
 	.policy = device_policy,
-	.netnsok = true
+	.netnsok = true,
+	.mcgrps = wg_genl_mcgrps,
+	.n_mcgrps = ARRAY_SIZE(wg_genl_mcgrps)
 };
 
 int __init wg_genetlink_init(void)
@@ -638,3 +667,199 @@ void __exit wg_genetlink_uninit(void)
 {
 	genl_unregister_family(&genl_family);
 }
+
+int wg_genl_mcast_peer_set(struct wg_peer *peer)
+{
+	struct sk_buff *skb;
+	void *hdr;
+	struct nlattr *allowedips_nest, *peer_nest;
+	struct allowedips_node *allowedips_node;
+	int fail = 0;
+
+	skb = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
+	if (skb == NULL)
+		return -ENOMEM;
+
+	hdr = genlmsg_put(skb, 0, 0, &genl_family, 0, WG_CMD_SET_PEER);
+	if (hdr == NULL) {
+		fail = -EMSGSIZE;
+		goto err;
+	}
+
+	if (nla_put_u32(skb, WGDEVICE_A_IFINDEX, peer->device->dev->ifindex) ||
+		nla_put_string(skb, WGDEVICE_A_IFNAME, peer->device->dev->name))
+		goto err;
+
+	peer_nest = nla_nest_start(skb, WGDEVICE_A_PEER);
+	if (!peer_nest) {
+		fail = -EMSGSIZE;
+		goto err;
+	}
+
+	if (nla_put_u16(skb, WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL,
+		peer->persistent_keepalive_interval))
+		goto err;
+
+	down_read(&peer->handshake.lock);
+	fail = nla_put(skb, WGPEER_A_PUBLIC_KEY, NOISE_PUBLIC_KEY_LEN,
+		peer->handshake.remote_static);
+	up_read(&peer->handshake.lock);
+	if (fail)
+		goto err;
+
+	read_lock_bh(&peer->endpoint_lock);
+	if (peer->endpoint.addr.sa_family == AF_INET)
+		fail = nla_put(skb, WGPEER_A_ENDPOINT,
+				sizeof(peer->endpoint.addr4), &peer->endpoint.addr4);
+	else if (peer->endpoint.addr.sa_family == AF_INET6)
+		fail = nla_put(skb, WGPEER_A_ENDPOINT,
+				sizeof(peer->endpoint.addr6), &peer->endpoint.addr6);
+	read_unlock_bh(&peer->endpoint_lock);
+	if (fail)
+		goto err;
+
+	allowedips_node = list_first_entry_or_null(&peer->allowedips_list,
+			struct allowedips_node, peer_list);
+	if (!allowedips_node)
+		goto no_allowedips;
+
+	allowedips_nest = nla_nest_start(skb, WGPEER_A_ALLOWEDIPS);
+	if (!allowedips_nest) {
+		fail = -EMSGSIZE;
+		goto err;
+	}
+
+	list_for_each_entry_from(allowedips_node, &peer->allowedips_list,
+				 peer_list) {
+		u8 cidr, ip[16] __aligned(__alignof(u64));
+		int family;
+
+		family = wg_allowedips_read_node(allowedips_node, ip, &cidr);
+		if (get_allowedips(skb, ip, cidr, family)) {
+			nla_nest_end(skb, allowedips_nest);
+			goto err;
+		}
+	}
+
+	nla_nest_end(skb, allowedips_nest);
+
+no_allowedips:
+	nla_nest_end(skb, peer_nest);
+	genlmsg_end(skb, hdr);
+	fail = genlmsg_multicast_netns(&genl_family, dev_net(peer->device->dev),
+			skb, 0, 0, GFP_KERNEL);
+	return fail;
+
+err:
+	nlmsg_free(skb);
+	return fail;
+}
+
+int wg_genl_mcast_peer_remove(struct wg_peer *peer)
+{
+	struct sk_buff *skb;
+	void *hdr;
+	int fail = 0;
+	struct nlattr *peer_nest;
+
+	skb = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
+	if (skb == NULL)
+		return -ENOMEM;
+
+	hdr = genlmsg_put(skb, 0, 0, &genl_family, 0, WG_CMD_REMOVED_PEER);
+	if (hdr == NULL) {
+		fail = -EMSGSIZE;
+		goto err;
+	}
+
+	if (nla_put_u32(skb, WGDEVICE_A_IFINDEX, peer->device->dev->ifindex) ||
+		nla_put_string(skb, WGDEVICE_A_IFNAME, peer->device->dev->name)) {
+		fail = -EMSGSIZE;
+		goto err;
+	}
+
+	peer_nest = nla_nest_start(skb, WGDEVICE_A_PEER);
+	if (!peer_nest) {
+		fail = -EMSGSIZE;
+		goto err;
+	}
+
+	down_read(&peer->handshake.lock);
+	fail = nla_put(skb, WGPEER_A_PUBLIC_KEY, NOISE_PUBLIC_KEY_LEN,
+		peer->handshake.remote_static);
+	up_read(&peer->handshake.lock);
+	if (fail) {
+		goto err;
+	}
+
+	nla_nest_end(skb, peer_nest);
+	genlmsg_end(skb, hdr);
+	fail = genlmsg_multicast_netns(&genl_family, dev_net(peer->device->dev),
+			skb, 0, 0, GFP_KERNEL);
+	return fail;
+
+err:
+	nlmsg_free(skb);
+	return fail;
+}
+
+int wg_genl_mcast_peer_endpoint_change(struct wg_peer *peer)
+{
+	struct sk_buff *skb;
+	struct nlattr *peer_nest;
+	void *hdr;
+	int fail = 0;
+
+	skb = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
+	if (skb == NULL)
+		return -ENOMEM;
+
+	hdr = genlmsg_put(skb, 0, 0, &genl_family, 0, WG_CMD_CHANGED_ENDPOINT);
+	if (hdr == NULL) {
+		fail = -EMSGSIZE;
+		goto err;
+	}
+
+	if (nla_put_u32(skb, WGDEVICE_A_IFINDEX, peer->device->dev->ifindex) ||
+		nla_put_string(skb, WGDEVICE_A_IFNAME, peer->device->dev->name)) {
+		fail = -EMSGSIZE;
+		goto err;
+	}
+
+	peer_nest = nla_nest_start(skb, WGDEVICE_A_PEER);
+	if (!peer_nest) {
+		fail = -EMSGSIZE;
+		goto err;
+	}
+
+	down_read(&peer->handshake.lock);
+	fail = nla_put(skb, WGPEER_A_PUBLIC_KEY, NOISE_PUBLIC_KEY_LEN,
+		peer->handshake.remote_static);
+	up_read(&peer->handshake.lock);
+	if (fail)
+		goto err;
+
+	read_lock_bh(&peer->endpoint_lock);
+	if (peer->endpoint.addr.sa_family == AF_INET)
+		fail = nla_put(skb, WGPEER_A_ENDPOINT,
+				     sizeof(peer->endpoint.addr4),
+				     &peer->endpoint.addr4);
+	else if (peer->endpoint.addr.sa_family == AF_INET6)
+		fail = nla_put(skb, WGPEER_A_ENDPOINT,
+				     sizeof(peer->endpoint.addr6),
+				     &peer->endpoint.addr6);
+	read_unlock_bh(&peer->endpoint_lock);
+	if (fail)
+		goto err;
+
+	nla_nest_end(skb, peer_nest);
+
+	genlmsg_end(skb, hdr);
+	fail = genlmsg_multicast_netns(&genl_family, dev_net(peer->device->dev),
+			skb, 0, 0, GFP_KERNEL);
+	return fail;
+
+err:
+	nlmsg_free(skb);
+	return fail;
+}
diff --git a/drivers/net/wireguard/netlink.h b/drivers/net/wireguard/netlink.h
index 15100d92e2e3..28e2e307c838 100644
--- a/drivers/net/wireguard/netlink.h
+++ b/drivers/net/wireguard/netlink.h
@@ -6,6 +6,12 @@
 #ifndef _WG_NETLINK_H
 #define _WG_NETLINK_H
 
+#include "peer.h"
+
+int wg_genl_mcast_peer_endpoint_change(struct wg_peer *peer);
+int wg_genl_mcast_peer_remove(struct wg_peer *peer);
+int wg_genl_mcast_peer_set(struct wg_peer *peer);
+
 int wg_genetlink_init(void);
 void wg_genetlink_uninit(void);
 
diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index 1cb502a932e0..97407304152d 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -9,6 +9,7 @@
 #include "timers.h"
 #include "peerlookup.h"
 #include "noise.h"
+#include "netlink.h"
 
 #include <linux/kref.h>
 #include <linux/lockdep.h>
@@ -157,8 +158,12 @@ void wg_peer_remove(struct wg_peer *peer)
 {
 	if (unlikely(!peer))
 		return;
-	lockdep_assert_held(&peer->device->device_update_lock);
 
+	if (peer->device->peers_monitor) {
+		wg_genl_mcast_peer_remove(peer);
+	}
+
+	lockdep_assert_held(&peer->device->device_update_lock);
 	peer_make_dead(peer);
 	synchronize_net();
 	peer_remove_after_dead(peer);
diff --git a/drivers/net/wireguard/socket.c b/drivers/net/wireguard/socket.c
index 0414d7a6ce74..33e4da2a37ee 100644
--- a/drivers/net/wireguard/socket.c
+++ b/drivers/net/wireguard/socket.c
@@ -8,6 +8,7 @@
 #include "socket.h"
 #include "queueing.h"
 #include "messages.h"
+#include "netlink.h"
 
 #include <linux/ctype.h>
 #include <linux/net.h>
@@ -294,6 +295,10 @@ void wg_socket_set_peer_endpoint(struct wg_peer *peer,
 	dst_cache_reset(&peer->endpoint_cache);
 out:
 	write_unlock_bh(&peer->endpoint_lock);
+
+	if (peer->device->endpoint_monitor) {
+		wg_genl_mcast_peer_endpoint_change(peer);
+	}
 }
 
 void wg_socket_set_peer_endpoint_from_skb(struct wg_peer *peer,
diff --git a/include/uapi/linux/wireguard.h b/include/uapi/linux/wireguard.h
index ae88be14c947..b28368773f74 100644
--- a/include/uapi/linux/wireguard.h
+++ b/include/uapi/linux/wireguard.h
@@ -29,6 +29,7 @@
  *    WGDEVICE_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16
  *    WGDEVICE_A_FWMARK: NLA_U32
+ *    WGDEVICE_A_MONITOR: NLA_U8
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
  *            WGPEER_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
@@ -83,6 +84,9 @@
  *    WGDEVICE_A_PRIVATE_KEY: len WG_KEY_LEN, all zeros to remove
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16, 0 to choose randomly
  *    WGDEVICE_A_FWMARK: NLA_U32, 0 to disable
+ *    WGDEVICE_A_MONITOR: NLA_U8, set to a value of wgdevice_monitor_flag to
+ *                      enable monitoring of events using multicast messages
+ *                      over netlink
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
  *            WGPEER_A_PUBLIC_KEY: len WG_KEY_LEN
@@ -126,6 +130,59 @@
  * of a peer, it likely should not be specified in subsequent fragments.
  *
  * If an error occurs, NLMSG_ERROR will reply containing an errno.
+ *
+ * WG_CMD_CHANGED_ENDPOINT
+ * ----------------------
+ *
+ * This command is sent on the multicast group WG_MULTICAST_GROUP_PEERS
+ * when the endpoint of a peer is changed, either administratively or because
+ * of roaming.
+ * The kernel will send a single message containing the
+ * following tree of nested items:
+ *
+ *    WGDEVICE_A_IFINDEX: NLA_U32
+ *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMSIZ - 1
+ *    WGDEVICE_A_PEER: NLA_NESTED
+ *        WGPEER_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
+ *        WGPEER_A_ENDPOINT: NLA_MIN_LEN(struct sockaddr), struct sockaddr_in or struct sockaddr_in6
+ *
+ * WG_CMD_REMOVED_PEER
+ * -------------------
+ *
+ * This command is sent on the multicast group WG_MULTICAST_GROUP_PEERS
+ * when a peer is removed.
+ * The kernel will send a single message containing the
+ * following tree of nested items:
+ *
+ *    WGDEVICE_A_IFINDEX: NLA_U32
+ *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMSIZ - 1
+ *    WGDEVICE_A_PEER: NLA_NESTED
+ *        WGPEER_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
+ *
+ * WG_CMD_SET_PEER
+ * ---------------
+ *
+ * This command is sent on the multicast group WG_MULTICAST_GROUP_PEERS
+ * when a peer is added or changed.
+ * The kernel will send a single message containing the
+ * following tree of nested items:
+ *
+ *    WGDEVICE_A_IFINDEX: NLA_U32
+ *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMSIZ - 1
+ *    WGDEVICE_A_PEER: NLA_NESTED
+ *        WGPEER_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
+ *        WGPEER_A_ENDPOINT: NLA_MIN_LEN(struct sockaddr), struct sockaddr_in or struct sockaddr_in6
+ *        WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL: NLA_U16
+ *        WGPEER_A_ALLOWEDIPS: NLA_NESTED
+ *            0: NLA_NESTED
+ *                WGALLOWEDIP_A_FAMILY: NLA_U16
+ *                WGALLOWEDIP_A_IPADDR: NLA_MIN_LEN(struct in_addr), struct in_addr or struct in6_addr
+ *                WGALLOWEDIP_A_CIDR_MASK: NLA_U8
+ *            0: NLA_NESTED
+ *                ...
+ *            0: NLA_NESTED
+ *                ...
+ *
  */
 
 #ifndef _WG_UAPI_WIREGUARD_H
@@ -136,9 +193,14 @@
 
 #define WG_KEY_LEN 32
 
+#define WG_MULTICAST_GROUP_PEERS          "peers"
+
 enum wg_cmd {
 	WG_CMD_GET_DEVICE,
 	WG_CMD_SET_DEVICE,
+	WG_CMD_CHANGED_ENDPOINT,
+	WG_CMD_REMOVED_PEER,
+	WG_CMD_SET_PEER,
 	__WG_CMD_MAX
 };
 #define WG_CMD_MAX (__WG_CMD_MAX - 1)
@@ -157,9 +219,16 @@ enum wgdevice_attribute {
 	WGDEVICE_A_LISTEN_PORT,
 	WGDEVICE_A_FWMARK,
 	WGDEVICE_A_PEERS,
+	WGDEVICE_A_MONITOR,
+	WGDEVICE_A_PEER,
 	__WGDEVICE_A_LAST
 };
 #define WGDEVICE_A_MAX (__WGDEVICE_A_LAST - 1)
+enum wgdevice_monitor_flag {
+	WGDEVICE_MONITOR_F_ENDPOINT = 1U << 0,
+	WGDEVICE_MONITOR_F_PEERS = 1U << 1,
+	__WGDEVICE_MONITOR_F_ALL = WGDEVICE_MONITOR_F_ENDPOINT | WGDEVICE_MONITOR_F_PEERS
+};
 
 enum wgpeer_flag {
 	WGPEER_F_REMOVE_ME = 1U << 0,

base-commit: 0cf9deb3005f552a3d125436fc8ccedd31a925a9
-- 
2.42.0




