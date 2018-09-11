Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 982dbb96
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:38 +0000 (UTC)
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com
 [IPv6:2a00:1450:400c:c09::241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c9be1d2
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:37 +0000 (UTC)
Received: by mail-wm0-x241.google.com with SMTP id y139-v6so2142546wmc.2
 for <wireguard@lists.zx2c4.com>; Tue, 11 Sep 2018 12:13:30 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v3 03/12] netlink: allow specifying the device namespace
Date: Tue, 11 Sep 2018 21:13:02 +0200
Message-Id: <20180911191311.25373-4-ju.orth@gmail.com>
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

 * WGDEVICE_A_DEV_NETNS_PID: NLA_U32
 * WGDEVICE_A_DEV_NETNS_FD: NLA_U32

The Wireguard device is then looked up in this namespace instead of the
namespace of the netlink socket.
---
 src/netlink.c        | 82 ++++++++++++++++++++++++++++++++++----------
 src/uapi/wireguard.h | 26 ++++++++++++--
 2 files changed, 87 insertions(+), 21 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index a857aff..19fe92d 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -24,7 +24,9 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 	[WGDEVICE_A_FLAGS]		= { .type = NLA_U32 },
 	[WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
 	[WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
-	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED }
+	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED },
+	[WGDEVICE_A_DEV_NETNS_PID]	= { .type = NLA_U32 },
+	[WGDEVICE_A_DEV_NETNS_FD]	= { .type = NLA_U32 },
 };
 
 static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
@@ -47,17 +49,17 @@ static const struct nla_policy allowedip_policy[WGALLOWEDIP_A_MAX + 1] = {
 };
 
 static struct wireguard_device *lookup_interface(struct nlattr **attrs,
-						 struct sk_buff *skb)
+						 struct net *net)
 {
 	struct net_device *dev = NULL;
 
 	if (!attrs[WGDEVICE_A_IFINDEX] == !attrs[WGDEVICE_A_IFNAME])
 		return ERR_PTR(-EBADR);
 	if (attrs[WGDEVICE_A_IFINDEX])
-		dev = dev_get_by_index(sock_net(skb->sk),
+		dev = dev_get_by_index(net,
 				       nla_get_u32(attrs[WGDEVICE_A_IFINDEX]));
 	else if (attrs[WGDEVICE_A_IFNAME])
-		dev = dev_get_by_name(sock_net(skb->sk),
+		dev = dev_get_by_name(net,
 				      nla_data(attrs[WGDEVICE_A_IFNAME]));
 	if (!dev)
 		return ERR_PTR(-ENODEV);
@@ -166,30 +168,64 @@ err:
 	return -EMSGSIZE;
 }
 
+static struct net *get_attr_net(struct nlattr *net_pid, struct nlattr *net_fd)
+{
+	if (net_pid && net_fd)
+		return ERR_PTR(-EINVAL);
+	if (net_pid)
+		return get_net_ns_by_pid(nla_get_u32(net_pid));
+	if (net_fd)
+		return get_net_ns_by_fd(nla_get_u32(net_fd));
+	return NULL;
+}
+
 static int get_device_start(struct netlink_callback *cb)
 {
 	struct nlattr **attrs = genl_family_attrbuf(&genl_family);
 	int ret = nlmsg_parse(cb->nlh, GENL_HDRLEN + genl_family.hdrsize, attrs,
 			      genl_family.maxattr, device_policy, NULL);
 	struct wireguard_device *wg;
-	struct net *dev_net = sock_net(cb->skb->sk);
+	struct net *owned_dev_net = NULL, *dev_net;
+	struct allowedips_cursor *cursor = NULL;
 
 	if (ret < 0)
 		return ret;
-	if (!netlink_ns_capable(cb->skb, dev_net->user_ns, CAP_NET_ADMIN))
-		return -EPERM;
-	cb->args[2] = (long)kzalloc(sizeof(struct allowedips_cursor),
-				    GFP_KERNEL);
-	if (unlikely(!cb->args[2]))
-		return -ENOMEM;
-	wg = lookup_interface(attrs, cb->skb);
+
+	owned_dev_net = get_attr_net(attrs[WGDEVICE_A_DEV_NETNS_PID],
+			attrs[WGDEVICE_A_DEV_NETNS_FD]);
+	if (IS_ERR(owned_dev_net)) {
+		ret = PTR_ERR(owned_dev_net);
+		owned_dev_net = NULL;
+		goto out;
+	}
+	dev_net = owned_dev_net ? : sock_net(cb->skb->sk);
+	if (!netlink_ns_capable(cb->skb, dev_net->user_ns, CAP_NET_ADMIN)) {
+		ret = -EPERM;
+		goto out;
+	}
+
+	cursor = kzalloc(sizeof(*cursor), GFP_KERNEL);
+	if (unlikely(!cursor)) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	wg = lookup_interface(attrs, dev_net);
 	if (IS_ERR(wg)) {
-		kfree((void *)cb->args[2]);
-		cb->args[2] = 0;
-		return PTR_ERR(wg);
+		ret = PTR_ERR(wg);
+		goto out;
 	}
+
 	cb->args[0] = (long)wg;
-	return 0;
+	cb->args[2] = (long)cursor;
+	cursor = NULL;
+
+out:
+	if (cursor)
+		kfree(cursor);
+	if (owned_dev_net)
+		put_net(owned_dev_net);
+	return ret;
 }
 
 static int get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
@@ -481,14 +517,21 @@ static int set_device(struct sk_buff *skb, struct genl_info *info)
 {
 	int ret;
 	struct wireguard_device *wg;
-	struct net *dev_net = sock_net(skb->sk);
+	struct net *owned_dev_net, *dev_net;
 
+	owned_dev_net = get_attr_net(info->attrs[WGDEVICE_A_DEV_NETNS_PID],
+			info->attrs[WGDEVICE_A_DEV_NETNS_FD]);
+	if (IS_ERR(owned_dev_net)) {
+		ret = PTR_ERR(wg);
+		goto out_nonet;
+	}
+	dev_net = owned_dev_net ? : sock_net(skb->sk);
 	if (!netlink_ns_capable(skb, dev_net->user_ns, CAP_NET_ADMIN)) {
 		ret = -EPERM;
 		goto out_nodev;
 	}
 
-	wg = lookup_interface(info->attrs, skb);
+	wg = lookup_interface(info->attrs, dev_net);
 
 	if (IS_ERR(wg)) {
 		ret = PTR_ERR(wg);
@@ -571,6 +614,9 @@ out:
 	rtnl_unlock();
 	dev_put(wg->dev);
 out_nodev:
+	if (owned_dev_net)
+		put_net(owned_dev_net);
+out_nonet:
 	if (info->attrs[WGDEVICE_A_PRIVATE_KEY])
 		memzero_explicit(nla_data(info->attrs[WGDEVICE_A_PRIVATE_KEY]),
 				 nla_len(info->attrs[WGDEVICE_A_PRIVATE_KEY]));
diff --git a/src/uapi/wireguard.h b/src/uapi/wireguard.h
index 3d73ad7..cff46f9 100644
--- a/src/uapi/wireguard.h
+++ b/src/uapi/wireguard.h
@@ -20,6 +20,16 @@
  *    WGDEVICE_A_IFINDEX: NLA_U32
  *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMESIZ - 1
  *
+ * At most one of the following may be provided:
+ *
+ *    WGDEVICE_A_DEV_NETNS_PID: NLA_U32
+ *    WGDEVICE_A_DEV_NETNS_FD: NLA_U32
+ *
+ * If they are provided, the Wireguard device will be looked up in this network
+ * namespace.  Otherwise it is looked up in the network namespace of the netlink
+ * socket. The caller must have CAP_NET_ADMIN in the namespace of the Wireguard
+ * device.
+ *
  * The kernel will then return several messages (NLM_F_MULTI) containing the
  * following tree of nested items:
  *
@@ -72,9 +82,15 @@
  * WG_CMD_SET_DEVICE
  * -----------------
  *
- * May only be called via NLM_F_REQUEST. The command should contain the
- * following tree of nested items, containing one but not both of
- * WGDEVICE_A_IFINDEX and WGDEVICE_A_IFNAME:
+ * May only be called via NLM_F_REQUEST. The command must contain the following
+ * tree of nested items. Exactly one of WGDEVICE_A_IFINDEX and WGDEVICE_A_IFNAME
+ * must be provided. All other top-level items are optional. At most one of
+ * WGDEVICE_A_DEV_NETNS_PID and WGDEVICE_A_DEV_NETNS_FD may be provided.
+ *
+ * If WGDEVICE_A_DEV_NETNS_PID/FD is provided, the Wireguard device is looked up
+ * in this network namespace. Otherwise it is looked up in the network namespace
+ * of the netlink socket. The caller must have CAP_NET_ADMIN in the namespace of
+ * the Wireguard device.
  *
  *    WGDEVICE_A_IFINDEX: NLA_U32
  *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMESIZ - 1
@@ -82,6 +98,8 @@
  *                      peers should be removed prior to adding the list below.
  *    WGDEVICE_A_PRIVATE_KEY: len WG_KEY_LEN, all zeros to remove
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16, 0 to choose randomly
+ *    WGDEVICE_A_DEV_NETNS_PID: NLA_U32
+ *    WGDEVICE_A_DEV_NETNS_FD: NLA_U32
  *    WGDEVICE_A_FWMARK: NLA_U32, 0 to disable
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
@@ -154,6 +172,8 @@ enum wgdevice_attribute {
 	WGDEVICE_A_LISTEN_PORT,
 	WGDEVICE_A_FWMARK,
 	WGDEVICE_A_PEERS,
+	WGDEVICE_A_DEV_NETNS_PID,
+	WGDEVICE_A_DEV_NETNS_FD,
 	__WGDEVICE_A_LAST
 };
 #define WGDEVICE_A_MAX (__WGDEVICE_A_LAST - 1)
-- 
2.18.0
