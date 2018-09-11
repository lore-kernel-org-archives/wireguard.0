Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d1d6e45
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:37 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31b6c05c
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z96-v6so27199018wrb.8
 for <wireguard@lists.zx2c4.com>; Tue, 11 Sep 2018 12:13:29 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v3 02/12] netlink: check for CAP_NET_ADMIN manually
Date: Tue, 11 Sep 2018 21:13:01 +0200
Message-Id: <20180911191311.25373-3-ju.orth@gmail.com>
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
 src/netlink.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index 0bd2b97..a857aff 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -172,9 +172,12 @@ static int get_device_start(struct netlink_callback *cb)
 	int ret = nlmsg_parse(cb->nlh, GENL_HDRLEN + genl_family.hdrsize, attrs,
 			      genl_family.maxattr, device_policy, NULL);
 	struct wireguard_device *wg;
+	struct net *dev_net = sock_net(cb->skb->sk);
 
 	if (ret < 0)
 		return ret;
+	if (!netlink_ns_capable(cb->skb, dev_net->user_ns, CAP_NET_ADMIN))
+		return -EPERM;
 	cb->args[2] = (long)kzalloc(sizeof(struct allowedips_cursor),
 				    GFP_KERNEL);
 	if (unlikely(!cb->args[2]))
@@ -477,7 +480,15 @@ out:
 static int set_device(struct sk_buff *skb, struct genl_info *info)
 {
 	int ret;
-	struct wireguard_device *wg = lookup_interface(info->attrs, skb);
+	struct wireguard_device *wg;
+	struct net *dev_net = sock_net(skb->sk);
+
+	if (!netlink_ns_capable(skb, dev_net->user_ns, CAP_NET_ADMIN)) {
+		ret = -EPERM;
+		goto out_nodev;
+	}
+
+	wg = lookup_interface(info->attrs, skb);
 
 	if (IS_ERR(wg)) {
 		ret = PTR_ERR(wg);
@@ -580,12 +591,10 @@ struct genl_ops genl_ops[] = {
 		.dumpit = get_device_dump,
 		.done = get_device_done,
 		.policy = device_policy,
-		.flags = GENL_UNS_ADMIN_PERM
 	}, {
 		.cmd = WG_CMD_SET_DEVICE,
 		.doit = set_device,
 		.policy = device_policy,
-		.flags = GENL_UNS_ADMIN_PERM
 	}
 };
 
-- 
2.18.0
