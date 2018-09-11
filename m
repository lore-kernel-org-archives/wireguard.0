Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5845a699
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:57 +0000 (UTC)
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e53c5d03
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:43 +0000 (UTC)
Received: by mail-wm0-x244.google.com with SMTP id j192-v6so2151022wmj.1
 for <wireguard@lists.zx2c4.com>; Tue, 11 Sep 2018 12:13:36 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v3 08/12] netlink: allow modification of transit net
Date: Tue, 11 Sep 2018 21:13:07 +0200
Message-Id: <20180911191311.25373-9-ju.orth@gmail.com>
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

This commit adds two new attributes of which at most one may be
provided:

* WGDEVICE_A_TRANSIT_NETNS_PID: NLA_U32
* WGDEVICE_A_TRANSIT_NETNS_FD: NLA_U32

The transit namespace is then set to this namespace. The caller must
either be in this namespace or have CAP_NET_ADMIN in it.
---
 src/netlink.c        | 48 +++++++++++++++++++++++++++++++-------------
 src/uapi/wireguard.h | 14 +++++++++----
 2 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index ed16980..90d02df 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -27,6 +27,8 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED },
 	[WGDEVICE_A_DEV_NETNS_PID]	= { .type = NLA_U32 },
 	[WGDEVICE_A_DEV_NETNS_FD]	= { .type = NLA_U32 },
+	[WGDEVICE_A_TRANSIT_NETNS_PID]	= { .type = NLA_U32 },
+	[WGDEVICE_A_TRANSIT_NETNS_FD]	= { .type = NLA_U32 },
 };
 
 static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
@@ -352,23 +354,44 @@ static int get_device_done(struct netlink_callback *cb)
 	return 0;
 }
 
-static int set_port(struct wireguard_device *wg, u16 port)
+static int set_socket(struct wireguard_device *wg, struct nlattr **attrs)
 {
 	struct wireguard_peer *peer;
-	int ret;
+	struct nlattr *port_attr = attrs[WGDEVICE_A_LISTEN_PORT];
+	u16 port;
+	struct net *net = NULL;
+	int ret = 0;
+
+	net = get_attr_net(attrs[WGDEVICE_A_TRANSIT_NETNS_PID],
+			attrs[WGDEVICE_A_TRANSIT_NETNS_FD]);
+	if (IS_ERR(net))
+		return PTR_ERR(net);
+	if (port_attr)
+		port = nla_get_u16(port_attr);
+	else
+		port = wg->incoming_port;
 
-	ret = test_socket_net_capable(wg->transit_net);
+	ret = test_socket_net_capable(net ? : wg->transit_net);
 	if (ret)
-		return ret;
-	if (wg->incoming_port == port)
-		return 0;
+		goto out;
+
+	if (wg->incoming_port == port && (!net || wg->transit_net == net))
+		goto out;
+
 	list_for_each_entry (peer, &wg->peer_list, peer_list)
 		socket_clear_peer_endpoint_src(peer);
 	if (!netif_running(wg->dev)) {
 		wg->incoming_port = port;
-		return 0;
+		if (net)
+			device_set_nets(wg, wg->dev_net, net);
+		goto out;
 	}
-	return socket_init(wg, wg->transit_net, port);
+	ret = socket_init(wg, net ? : wg->transit_net, port);
+
+out:
+	if (net)
+		put_net(net);
+	return ret;
 }
 
 static int set_allowedip(struct wireguard_peer *peer, struct nlattr **attrs)
@@ -565,12 +588,9 @@ static int set_device(struct sk_buff *skb, struct genl_info *info)
 			socket_clear_peer_endpoint_src(peer);
 	}
 
-	if (info->attrs[WGDEVICE_A_LISTEN_PORT]) {
-		ret = set_port(
-			wg, nla_get_u16(info->attrs[WGDEVICE_A_LISTEN_PORT]));
-		if (ret)
-			goto out;
-	}
+	ret = set_socket(wg, info->attrs);
+	if (ret)
+		goto out;
 
 	if (info->attrs[WGDEVICE_A_FLAGS] &&
 	    nla_get_u32(info->attrs[WGDEVICE_A_FLAGS]) &
diff --git a/src/uapi/wireguard.h b/src/uapi/wireguard.h
index 71958ff..35c88d2 100644
--- a/src/uapi/wireguard.h
+++ b/src/uapi/wireguard.h
@@ -88,16 +88,18 @@
  * May only be called via NLM_F_REQUEST. The command must contain the following
  * tree of nested items. Exactly one of WGDEVICE_A_IFINDEX and WGDEVICE_A_IFNAME
  * must be provided. All other top-level items are optional. At most one of
- * WGDEVICE_A_DEV_NETNS_PID and WGDEVICE_A_DEV_NETNS_FD may be provided.
+ * WGDEVICE_A_TRANSIT_NETNS_PID and WGDEVICE_A_TRANSIT_NETNS_FD may be provided.
+ * At most one of WGDEVICE_A_DEV_NETNS_PID and WGDEVICE_A_DEV_NETNS_FD may be
+ * provided.
  *
  * If WGDEVICE_A_DEV_NETNS_PID/FD is provided, the Wireguard device is looked up
  * in this network namespace. Otherwise it is looked up in the network namespace
  * of the netlink socket. The caller must have CAP_NET_ADMIN in the namespace of
  * the Wireguard device.
  *
- * If WGDEVICE_A_LISTEN_PORT is provided and the calling process is not in the
- * transit namespace, then the calling process must have CAP_NET_ADMIN the
- * transit namespace.
+ * If WGDEVICE_A_TRANSIT_NETNS_PID/FD and/or WGDEVICE_A_LISTEN_PORT are provided
+ * and the calling process is not in the transit namespace, then the calling
+ * process must have CAP_NET_ADMIN the transit namespace.
  *
  *    WGDEVICE_A_IFINDEX: NLA_U32
  *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMESIZ - 1
@@ -107,6 +109,8 @@
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16, 0 to choose randomly
  *    WGDEVICE_A_DEV_NETNS_PID: NLA_U32
  *    WGDEVICE_A_DEV_NETNS_FD: NLA_U32
+ *    WGDEVICE_A_TRANSIT_NETNS_PID: NLA_U32
+ *    WGDEVICE_A_TRANSIT_NETNS_FD: NLA_U32
  *    WGDEVICE_A_FWMARK: NLA_U32, 0 to disable
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
@@ -181,6 +185,8 @@ enum wgdevice_attribute {
 	WGDEVICE_A_PEERS,
 	WGDEVICE_A_DEV_NETNS_PID,
 	WGDEVICE_A_DEV_NETNS_FD,
+	WGDEVICE_A_TRANSIT_NETNS_PID,
+	WGDEVICE_A_TRANSIT_NETNS_FD,
 	__WGDEVICE_A_LAST
 };
 #define WGDEVICE_A_MAX (__WGDEVICE_A_LAST - 1)
-- 
2.18.0
