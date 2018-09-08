Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6b0a161
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 12:18:57 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66c37f17
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 12:18:56 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k5-v6so17347221wre.10
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 05:19:24 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 5/7] netlink: allow setting of transit net
Date: Sat,  8 Sep 2018 14:18:39 +0200
Message-Id: <20180908121841.8372-6-ju.orth@gmail.com>
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

This commit adds two new arguments:

* WGDEVICE_A_TRANSIT_NET_PID

    The argument is a U32 process id that refers to a process whose
    network namespace is to be used as the transit namespace.

* WGDEVICE_A_TRANSIT_NET_FD

    The argument is a U32 file descriptor that refers to a network
    namespace that is to be used as the transit namespace.
---
 src/netlink.c        | 52 ++++++++++++++++++++++++++++++++++----------
 src/uapi/wireguard.h | 12 +++++++---
 2 files changed, 49 insertions(+), 15 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index 73d9a74..321df1a 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -24,7 +24,9 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 	[WGDEVICE_A_FLAGS]		= { .type = NLA_U32 },
 	[WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
 	[WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
-	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED }
+	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED },
+	[WGDEVICE_A_TRANSIT_NET_PID]	= { .type = NLA_U32 },
+	[WGDEVICE_A_TRANSIT_NET_FD]	= { .type = NLA_U32 },
 };
 
 static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
@@ -302,19 +304,48 @@ static int get_device_done(struct netlink_callback *cb)
 	return 0;
 }
 
-static int set_port(struct wireguard_device *wg, u16 port)
+static int set_socket(struct wireguard_device *wg, struct nlattr **attrs)
 {
 	struct wireguard_peer *peer;
+	struct nlattr *port_attr, *net_pid, *net_fd;
+	u16 port;
+	struct net *net = NULL;
+	int ret = 0;
+
+	port_attr = attrs[WGDEVICE_A_LISTEN_PORT];
+	net_pid = attrs[WGDEVICE_A_TRANSIT_NET_PID];
+	net_fd = attrs[WGDEVICE_A_TRANSIT_NET_FD];
+
+	if (net_pid && net_fd)
+		return -EINVAL;
+	if (net_pid)
+		net = get_net_ns_by_pid(nla_get_u32(net_pid));
+	if (net_fd)
+		net = get_net_ns_by_fd(nla_get_u32(net_fd));
+	if (IS_ERR(net))
+		return PTR_ERR(net);
+	if (port_attr)
+		port = nla_get_u16(port_attr);
+	else
+		port = wg->incoming_port;
+
+	if (wg->incoming_port == port && (!net || wg->transit_net == net))
+		goto out;
 
-	if (wg->incoming_port == port)
-		return 0;
 	list_for_each_entry (peer, &wg->peer_list, peer_list)
 		socket_clear_peer_endpoint_src(peer);
 	if (!netif_running(wg->dev)) {
 		wg->incoming_port = port;
-		return 0;
+		if (net)
+			device_set_transit_net(wg, net);
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
@@ -496,12 +527,9 @@ static int set_device(struct sk_buff *skb, struct genl_info *info)
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
index 3d73ad7..8faea3e 100644
--- a/src/uapi/wireguard.h
+++ b/src/uapi/wireguard.h
@@ -72,9 +72,11 @@
  * WG_CMD_SET_DEVICE
  * -----------------
  *
- * May only be called via NLM_F_REQUEST. The command should contain the
- * following tree of nested items, containing one but not both of
- * WGDEVICE_A_IFINDEX and WGDEVICE_A_IFNAME:
+ * May only be called via NLM_F_REQUEST. The command must contain the following
+ * tree of nested items. Exactly one of WGDEVICE_A_IFINDEX and WGDEVICE_A_IFNAME
+ * must be provided. All other top-level items are optional. At most one of
+ * WGDEVICE_A_TRANSIT_NET_PID and WGDEVICE_A_TRANSIT_NET_FD may be provided.
+ *
  *
  *    WGDEVICE_A_IFINDEX: NLA_U32
  *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMESIZ - 1
@@ -82,6 +84,8 @@
  *                      peers should be removed prior to adding the list below.
  *    WGDEVICE_A_PRIVATE_KEY: len WG_KEY_LEN, all zeros to remove
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16, 0 to choose randomly
+ *    WGDEVICE_A_TRANSIT_NET_PID: NLA_U32
+ *    WGDEVICE_A_TRANSIT_NET_FD: NLA_U32
  *    WGDEVICE_A_FWMARK: NLA_U32, 0 to disable
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
@@ -154,6 +158,8 @@ enum wgdevice_attribute {
 	WGDEVICE_A_LISTEN_PORT,
 	WGDEVICE_A_FWMARK,
 	WGDEVICE_A_PEERS,
+	WGDEVICE_A_TRANSIT_NET_PID,
+	WGDEVICE_A_TRANSIT_NET_FD,
 	__WGDEVICE_A_LAST
 };
 #define WGDEVICE_A_MAX (__WGDEVICE_A_LAST - 1)
-- 
2.18.0
