Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 627a4123
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 15:13:58 +0000 (UTC)
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 791a1d1b
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 15:13:54 +0000 (UTC)
Received: by mail-wm0-x244.google.com with SMTP id n11-v6so18816244wmc.2
 for <wireguard@lists.zx2c4.com>; Sun, 09 Sep 2018 08:14:31 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v2 09/10] netlink: allow bypassing CAP_NET_ADMIN
Date: Sun,  9 Sep 2018 17:14:01 +0200
Message-Id: <20180909151402.6033-10-ju.orth@gmail.com>
In-Reply-To: <20180909151402.6033-1-ju.orth@gmail.com>
References: <20180909151402.6033-1-ju.orth@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Two new attributes have been added:

* WGDEVICE_A_TRANSIT_CREDENTIALS_IPV4
* WGDEVICE_A_TRANSIT_CREDENTIALS_IPV6

If present, they have to refer to an IPv4 (resp. IPv6) UDP socket file
descriptor in the transit namespace. If the IPv6 fd is present, then the
IPv4 fd must also be present. If the IPv4 fd is present and the kernel
was configured with IPv6 support, then the IPv6 fd must also be present.

If they are present and these conditions are fulfilled, then changing
the listen-port or transit-netns does not require CAP_NET_ADMIN in the
transit namespace.
---
 src/netlink.c        | 74 +++++++++++++++++++++++++++++++++++++-------
 src/uapi/wireguard.h | 10 +++++-
 2 files changed, 71 insertions(+), 13 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index e7f8c69..7eeb36d 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -10,6 +10,7 @@
 #include "queueing.h"
 #include "messages.h"
 #include "uapi/wireguard.h"
+#include <linux/file.h>
 #include <linux/if.h>
 #include <net/genetlink.h>
 #include <net/sock.h>
@@ -17,16 +18,18 @@
 static struct genl_family genl_family;
 
 static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
-	[WGDEVICE_A_IFINDEX]		= { .type = NLA_U32 },
-	[WGDEVICE_A_IFNAME]		= { .type = NLA_NUL_STRING, .len = IFNAMSIZ - 1 },
-	[WGDEVICE_A_PRIVATE_KEY]	= { .len = NOISE_PUBLIC_KEY_LEN },
-	[WGDEVICE_A_PUBLIC_KEY]		= { .len = NOISE_PUBLIC_KEY_LEN },
-	[WGDEVICE_A_FLAGS]		= { .type = NLA_U32 },
-	[WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
-	[WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
-	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED },
-	[WGDEVICE_A_TRANSIT_NETNS_PID]	= { .type = NLA_U32 },
-	[WGDEVICE_A_TRANSIT_NETNS_FD]	= { .type = NLA_U32 },
+	[WGDEVICE_A_IFINDEX]			= { .type = NLA_U32 },
+	[WGDEVICE_A_IFNAME]			= { .type = NLA_NUL_STRING, .len = IFNAMSIZ - 1 },
+	[WGDEVICE_A_PRIVATE_KEY]		= { .len = NOISE_PUBLIC_KEY_LEN },
+	[WGDEVICE_A_PUBLIC_KEY]			= { .len = NOISE_PUBLIC_KEY_LEN },
+	[WGDEVICE_A_FLAGS]			= { .type = NLA_U32 },
+	[WGDEVICE_A_LISTEN_PORT]		= { .type = NLA_U16 },
+	[WGDEVICE_A_FWMARK]			= { .type = NLA_U32 },
+	[WGDEVICE_A_PEERS]			= { .type = NLA_NESTED },
+	[WGDEVICE_A_TRANSIT_NETNS_PID]		= { .type = NLA_U32 },
+	[WGDEVICE_A_TRANSIT_NETNS_FD]		= { .type = NLA_U32 },
+	[WGDEVICE_A_TRANSIT_CREDENTIALS_IPV4]	= { .type = NLA_U32 },
+	[WGDEVICE_A_TRANSIT_CREDENTIALS_IPV6]	= { .type = NLA_U32 },
 };
 
 static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
@@ -304,8 +307,55 @@ static int get_device_done(struct netlink_callback *cb)
 	return 0;
 }
 
-static int test_net_capable(struct net *net)
+static int test_net_capable_with_creds(struct net *net,
+		struct nlattr *ipv4_attr, struct nlattr *ipv6_attr)
 {
+	struct socket *ipv4 = NULL, *ipv6 = NULL;
+	int ret = -EINVAL;
+
+	ipv4 = sockfd_lookup(nla_get_u32(ipv4_attr), &ret);
+	if (!ipv4)
+		goto out;
+	if (ipv4->type != SOCK_DGRAM)
+		goto out;
+	if (ipv4->ops->family != AF_INET)
+		goto out;
+	if (sock_net(ipv4->sk) != net)
+		goto out;
+
+#if IS_ENABLED(CONFIG_IPV6)
+	ipv6 = sockfd_lookup(nla_get_u32(ipv6_attr), &ret);
+	if (!ipv6)
+		goto out;
+	if (ipv6->type != SOCK_DGRAM)
+		goto out;
+	if (ipv6->ops->family != AF_INET6)
+		goto out;
+	if (sock_net(ipv6->sk) != net)
+		goto out;
+#endif
+
+	ret = 0;
+out:
+	if (ipv4)
+		sockfd_put(ipv4);
+	if (ipv6)
+		sockfd_put(ipv6);
+	return ret;
+}
+
+static int test_net_capable(struct net *net, struct nlattr **attrs)
+{
+	struct nlattr *ipv4_attr = attrs[WGDEVICE_A_TRANSIT_CREDENTIALS_IPV4];
+	struct nlattr *ipv6_attr = attrs[WGDEVICE_A_TRANSIT_CREDENTIALS_IPV6];
+
+	if (ipv4_attr && !ipv6_attr && IS_ENABLED(CONFIG_IPV6))
+		return -EINVAL;
+	if (!ipv4_attr && ipv6_attr)
+		return -EINVAL;
+	if (ipv4_attr)
+		return test_net_capable_with_creds(net, ipv4_attr, ipv6_attr);
+
 	if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
 		return -EPERM;
 	return 0;
@@ -336,7 +386,7 @@ static int set_socket(struct wireguard_device *wg, struct nlattr **attrs)
 	else
 		port = wg->incoming_port;
 
-	ret = test_net_capable(net ? : wg->transit_net);
+	ret = test_net_capable(net ? : wg->transit_net, attrs);
 	if (ret)
 		goto out;
 
diff --git a/src/uapi/wireguard.h b/src/uapi/wireguard.h
index 40d800f..3be7def 100644
--- a/src/uapi/wireguard.h
+++ b/src/uapi/wireguard.h
@@ -79,7 +79,11 @@
  *
  * If WGDEVICE_A_TRANSIT_NETNS_PID/FD and/or WGDEVICE_A_LISTEN_PORT are
  * provided, then the calling process must have CAP_NET_ADMIN the transit
- * namespace.
+ * namespace. This requirement is waived if both
+ * WGDEVICE_A_TRANSIT_CREDENTIALS_IPV4 and WGDEVICE_A_TRANSIT_CREDENTIALS_IPV6
+ * are provided and refer to IPv4 (resp. IPv6) UDP sockets in the transit
+ * namespace. (If the kernel is configured without IPv6 support, then
+ * WGDEVICE_A_TRANSIT_CREDENTIALS_IPV6 is not necessary.)
  *
  *
  *    WGDEVICE_A_IFINDEX: NLA_U32
@@ -90,6 +94,8 @@
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16, 0 to choose randomly
  *    WGDEVICE_A_TRANSIT_NETNS_PID: NLA_U32
  *    WGDEVICE_A_TRANSIT_NETNS_FD: NLA_U32
+ *    WGDEVICE_A_TRANSIT_CREDENTIALS_IPV4: NLA_U32
+ *    WGDEVICE_A_TRANSIT_CREDENTIALS_IPV6: NLA_U32
  *    WGDEVICE_A_FWMARK: NLA_U32, 0 to disable
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
@@ -164,6 +170,8 @@ enum wgdevice_attribute {
 	WGDEVICE_A_PEERS,
 	WGDEVICE_A_TRANSIT_NETNS_PID,
 	WGDEVICE_A_TRANSIT_NETNS_FD,
+	WGDEVICE_A_TRANSIT_CREDENTIALS_IPV4,
+	WGDEVICE_A_TRANSIT_CREDENTIALS_IPV6,
 	__WGDEVICE_A_LAST
 };
 #define WGDEVICE_A_MAX (__WGDEVICE_A_LAST - 1)
-- 
2.18.0
