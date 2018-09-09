Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f57e7709
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 15:13:57 +0000 (UTC)
Received: from mail-wm0-x22f.google.com (mail-wm0-x22f.google.com
 [IPv6:2a00:1450:400c:c09::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89a529ba
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 15:13:53 +0000 (UTC)
Received: by mail-wm0-x22f.google.com with SMTP id j25-v6so3384362wmc.1
 for <wireguard@lists.zx2c4.com>; Sun, 09 Sep 2018 08:14:30 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v2 08/10] netlink: require CAP_NET_ADMIN for socket changes
Date: Sun,  9 Sep 2018 17:14:00 +0200
Message-Id: <20180909151402.6033-9-ju.orth@gmail.com>
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

The calling process must have CAP_NET_ADMIN in the user namespace of the
transit namespace.
---
 src/netlink.c        | 11 +++++++++++
 src/uapi/wireguard.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/src/netlink.c b/src/netlink.c
index f74c23a..e7f8c69 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -304,6 +304,13 @@ static int get_device_done(struct netlink_callback *cb)
 	return 0;
 }
 
+static int test_net_capable(struct net *net)
+{
+	if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+		return -EPERM;
+	return 0;
+}
+
 static int set_socket(struct wireguard_device *wg, struct nlattr **attrs)
 {
 	struct wireguard_peer *peer;
@@ -329,6 +336,10 @@ static int set_socket(struct wireguard_device *wg, struct nlattr **attrs)
 	else
 		port = wg->incoming_port;
 
+	ret = test_net_capable(net ? : wg->transit_net);
+	if (ret)
+		goto out;
+
 	if (wg->incoming_port == port && (!net || wg->transit_net == net))
 		goto out;
 
diff --git a/src/uapi/wireguard.h b/src/uapi/wireguard.h
index 21bf92e..40d800f 100644
--- a/src/uapi/wireguard.h
+++ b/src/uapi/wireguard.h
@@ -77,6 +77,10 @@
  * must be provided. All other top-level items are optional. At most one of
  * WGDEVICE_A_TRANSIT_NETNS_PID and WGDEVICE_A_TRANSIT_NETNS_FD may be provided.
  *
+ * If WGDEVICE_A_TRANSIT_NETNS_PID/FD and/or WGDEVICE_A_LISTEN_PORT are
+ * provided, then the calling process must have CAP_NET_ADMIN the transit
+ * namespace.
+ *
  *
  *    WGDEVICE_A_IFINDEX: NLA_U32
  *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMESIZ - 1
-- 
2.18.0
