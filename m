Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8881EC43444
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24281206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tqG2UTk4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24281206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4bfd3b4;
	Sat, 15 Dec 2018 16:56:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19c7cde0
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:27 +0000 (UTC)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2b3d4e1
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:26 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id f9so7401457eds.10
 for <wireguard@lists.zx2c4.com>; Sat, 15 Dec 2018 08:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mH1bkwmCi29Nqg6b+S0hFgn+QyEwFHxBSsskgLKnlZI=;
 b=tqG2UTk4x6dlpmNmR4YEHUGG5qTjjRt1suLsXOdmssg7ev0lwG+JWAjxQHJ4xAsMlN
 kpg+7BYBPiwfyIi0h3K8LWA2tWCdsWseoS0AuKSQAK/swa6M9di10aTp8gHyZG2cfu6X
 g27MouWAu2DJrvlCmuvuPsvVQvZ/rh1pZOyfoZ7YGQ+xOGRYkiI4SotEhkbgvQHwgLp0
 lesSE6gjTnrok5id0P7O5GlSC5IupaBKJ+mbvkH+c6/IUqW5QQfEuF9Y/U8QGZjO5AVa
 +aL7z4v7wXwY8OdKCb3TAhEiWwMX6K28yFSq7jZpcaX6DFZUaR0SpviI2kMUkdY46wIp
 0dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mH1bkwmCi29Nqg6b+S0hFgn+QyEwFHxBSsskgLKnlZI=;
 b=Lp8VVb4FOrK6Kezry8mFqD36LVqzHo1gy2w//1//eqyzRH4++HPpfwpcMSK/J05t5Z
 sde+cUC9tmVds6IzBbJeLT2Fkf3gELNv3g8y02MGN7KOr+7cI/WCBH9gvwsb6XKMw5nk
 0L+jEXiR0tbXf8biq2uGK/HnzhsjycwduaDb64IcxuKGlzK3JkgruH1cF//8TWLSltml
 I2DGf+Fpn+Q/XKIV5DDFbnCwgL2oPGBlEIayHxvbFdTl+bAgE2VXQOHmGtlFaY/BAyT7
 d3ykEVyctG+1vgy065y7xXwQ0uyvPb7yVSVWrUSrFBzC/YaYLP/HUt1cUq0BfBc1RrQ8
 LnnA==
X-Gm-Message-State: AA+aEWYT7hBzpEgqHhD8LrViYIQiCxB95zwCXAQWLoeGRVuBOSw6QkGH
 Mf412ojEH2I3eB7cr3fGahBhZbku
X-Google-Smtp-Source: AFSGD/UPWWcVrMOQUXrZVcgpegAT9zK8ahfjb878lpRZoFF96E/Yo4tqtoLEZ6zEFoeqlW9dC2DZbQ==
X-Received: by 2002:a17:906:6308:: with SMTP id
 p8-v6mr5554392ejk.100.1544892990398; 
 Sat, 15 Dec 2018 08:56:30 -0800 (PST)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id q50sm2356015edd.66.2018.12.15.08.56.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Dec 2018 08:56:29 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v5 02/11] netlink: allow specifying the device namespace
Date: Sat, 15 Dec 2018 17:56:04 +0100
Message-Id: <20181215165613.5486-3-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181215165613.5486-1-ju.orth@gmail.com>
References: <20181215165613.5486-1-ju.orth@gmail.com>
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

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
index 364d4d8..96ad555 100644
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
 
 static struct wg_device *lookup_interface(struct nlattr **attrs,
-					  struct sk_buff *skb)
+					  struct net *net)
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
@@ -160,10 +162,22 @@ err:
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
 static int wg_get_device_start(struct netlink_callback *cb)
 {
 	struct nlattr **attrs = genl_family_attrbuf(&genl_family);
-	struct net *dev_net = sock_net(cb->skb->sk);
+	struct net *owned_dev_net = NULL, *dev_net;
+	struct allowedips_cursor *cursor = NULL;
 	struct wg_device *wg;
 	int ret;
 
@@ -171,20 +185,42 @@ static int wg_get_device_start(struct netlink_callback *cb)
 			  genl_family.maxattr, device_policy, NULL);
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
 
 static int wg_get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
@@ -473,16 +509,23 @@ out:
 
 static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 {
-	struct net *dev_net = sock_net(skb->sk);
+	struct net *owned_dev_net, *dev_net;
 	struct wg_device *wg;
 	int ret;
 
+	owned_dev_net = get_attr_net(info->attrs[WGDEVICE_A_DEV_NETNS_PID],
+			info->attrs[WGDEVICE_A_DEV_NETNS_FD]);
+	if (IS_ERR(owned_dev_net)) {
+		ret = PTR_ERR(owned_dev_net);
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
@@ -565,6 +608,9 @@ out:
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
index 0203f2c..bcfcf4f 100644
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
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
