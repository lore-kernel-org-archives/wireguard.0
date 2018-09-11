Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9de844bb
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:39 +0000 (UTC)
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com
 [IPv6:2a00:1450:400c:c09::242])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2eb16b8f
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:38 +0000 (UTC)
Received: by mail-wm0-x242.google.com with SMTP id y139-v6so2142600wmc.2
 for <wireguard@lists.zx2c4.com>; Tue, 11 Sep 2018 12:13:31 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v3 04/12] netlink: restrict access to the UDP socket
Date: Tue, 11 Sep 2018 21:13:03 +0200
Message-Id: <20180911191311.25373-5-ju.orth@gmail.com>
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

To interact with the UDP socket the caller must either be in the
network namespace of the socket or have CAP_NET_ADMIN in that network
namespace.
---
 src/netlink.c        | 21 ++++++++++++++++++---
 src/uapi/wireguard.h |  7 +++++++
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index 19fe92d..0775a2a 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -179,6 +179,14 @@ static struct net *get_attr_net(struct nlattr *net_pid, struct nlattr *net_fd)
 	return NULL;
 }
 
+static int test_socket_net_capable(struct net *net)
+{
+	if (net != current->nsproxy->net_ns &&
+			!ns_capable(net->user_ns, CAP_NET_ADMIN))
+		return -EPERM;
+	return 0;
+}
+
 static int get_device_start(struct netlink_callback *cb)
 {
 	struct nlattr **attrs = genl_family_attrbuf(&genl_family);
@@ -255,9 +263,12 @@ static int get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
 	genl_dump_check_consistent(cb, hdr);
 
 	if (!last_peer_cursor) {
-		if (nla_put_u16(skb, WGDEVICE_A_LISTEN_PORT,
-				wg->incoming_port) ||
-		    nla_put_u32(skb, WGDEVICE_A_FWMARK, wg->fwmark) ||
+		if (test_socket_net_capable(wg->creating_net) == 0) {
+			if (nla_put_u16(skb, WGDEVICE_A_LISTEN_PORT,
+						wg->incoming_port))
+				goto out;
+		}
+		if (nla_put_u32(skb, WGDEVICE_A_FWMARK, wg->fwmark) ||
 		    nla_put_u32(skb, WGDEVICE_A_IFINDEX, wg->dev->ifindex) ||
 		    nla_put_string(skb, WGDEVICE_A_IFNAME, wg->dev->name))
 			goto out;
@@ -344,7 +355,11 @@ static int get_device_done(struct netlink_callback *cb)
 static int set_port(struct wireguard_device *wg, u16 port)
 {
 	struct wireguard_peer *peer;
+	int ret;
 
+	ret = test_socket_net_capable(wg->creating_net);
+	if (ret)
+		return ret;
 	if (wg->incoming_port == port)
 		return 0;
 	list_for_each_entry (peer, &wg->peer_list, peer_list)
diff --git a/src/uapi/wireguard.h b/src/uapi/wireguard.h
index cff46f9..71958ff 100644
--- a/src/uapi/wireguard.h
+++ b/src/uapi/wireguard.h
@@ -30,6 +30,9 @@
  * socket. The caller must have CAP_NET_ADMIN in the namespace of the Wireguard
  * device.
  *
+ * If the caller is not in the transit namespace and does not have CAP_NET_ADMIN
+ * in the transit namespace, then the WGDEVICE_A_LISTEN_PORT is not returned.
+ *
  * The kernel will then return several messages (NLM_F_MULTI) containing the
  * following tree of nested items:
  *
@@ -92,6 +95,10 @@
  * of the netlink socket. The caller must have CAP_NET_ADMIN in the namespace of
  * the Wireguard device.
  *
+ * If WGDEVICE_A_LISTEN_PORT is provided and the calling process is not in the
+ * transit namespace, then the calling process must have CAP_NET_ADMIN the
+ * transit namespace.
+ *
  *    WGDEVICE_A_IFINDEX: NLA_U32
  *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMESIZ - 1
  *    WGDEVICE_A_FLAGS: NLA_U32, 0 or WGDEVICE_F_REPLACE_PEERS if all current
-- 
2.18.0
