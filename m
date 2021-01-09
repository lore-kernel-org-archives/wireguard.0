Return-Path: <SRS0=3yHi=GO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA74C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 23:30:41 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6203B22D2C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 23:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6203B22D2C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lotz.li
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f978e858;
	Mon, 11 Jan 2021 23:30:37 +0000 (UTC)
Received: from mail.dr-lotz.de (mail.dr-lotz.de [5.9.59.78])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e420022c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 9 Jan 2021 21:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.dr-lotz.de (Postfix) with ESMTP id 2B58E5AA62;
 Sat,  9 Jan 2021 22:01:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dr-lotz.de
Received: from mail.dr-lotz.de ([127.0.0.1])
 by localhost (mail.dr-lotz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKxoV1Z55b3E; Sat,  9 Jan 2021 22:01:47 +0100 (CET)
Received: from linus-pc.. (ipb21b6623.dynamic.kabel-deutschland.de
 [178.27.102.35])
 by mail.dr-lotz.de (Postfix) with ESMTPSA id D96635AA61;
 Sat,  9 Jan 2021 22:01:46 +0100 (CET)
From: Linus Lotz <linus@lotz.li>
To: 
Cc: linus@lotz.li, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] wireguard: netlink: add multicast notification for peer
 changes
Date: Sat,  9 Jan 2021 22:00:54 +0100
Message-Id: <20210109210056.160597-1-linus@lotz.li>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 Jan 2021 23:30:35 +0000
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

This commit adds a new multicast group to the netlink api for wireguard.
The purpose of this multicast group is to notify userspace when the
peers of an interface change. Right now this is only done when the
endpoint is changed by whatever means.

An example for an consumer of this API would be a service that keeps
track of all peer endpoints and sends this information to the peers.
This would allow NAT-to-NAT connections without the need of using
STUN on each client.

Signed-off-by: Linus Lotz <linus@lotz.li>
---
 drivers/net/wireguard/netlink.c | 52 ++++++++++++++++++++++++++++++++-
 drivers/net/wireguard/netlink.h |  4 +++
 drivers/net/wireguard/socket.c  |  4 +++
 include/uapi/linux/wireguard.h  |  3 ++
 4 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index d0f3b6d7f408..88eff0a797f4 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -618,6 +618,12 @@ static const struct genl_ops genl_ops[] = {
 	}
 };
 
+static struct genl_multicast_group genl_mcgrps[] = {
+	{
+		.name = WG_MULTICAST_GROUP_PEER_CHANGE
+	}
+};
+
 static struct genl_family genl_family __ro_after_init = {
 	.ops = genl_ops,
 	.n_ops = ARRAY_SIZE(genl_ops),
@@ -626,7 +632,9 @@ static struct genl_family genl_family __ro_after_init = {
 	.maxattr = WGDEVICE_A_MAX,
 	.module = THIS_MODULE,
 	.policy = device_policy,
-	.netnsok = true
+	.netnsok = true,
+	.mcgrps = genl_mcgrps,
+	.n_mcgrps = ARRAY_SIZE(genl_mcgrps)
 };
 
 int __init wg_genetlink_init(void)
@@ -638,3 +646,45 @@ void __exit wg_genetlink_uninit(void)
 {
 	genl_unregister_family(&genl_family);
 }
+
+int wg_genl_mcast_peer_endpoint_change(struct wg_peer *peer)
+{
+	struct sk_buff *skb;
+	void *hdr, *peer_nest, *peer_array_nest;
+	int fail;
+
+	skb = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
+	hdr = genlmsg_put(skb, 0, 0,
+			  &genl_family, 0, WG_CMD_CHANGED_PEER);
+
+	nla_put_u32(skb, WGDEVICE_A_IFINDEX, peer->device->dev->ifindex);
+	nla_put_string(skb, WGDEVICE_A_IFNAME, peer->device->dev->name);
+
+	peer_nest = nla_nest_start(skb, WGDEVICE_A_PEERS);
+	peer_array_nest = nla_nest_start(skb, 0);
+	down_read(&peer->handshake.lock);
+	nla_put(skb, WGPEER_A_PUBLIC_KEY, NOISE_PUBLIC_KEY_LEN,
+		peer->handshake.remote_static);
+	up_read(&peer->handshake.lock);
+
+	read_lock_bh(&peer->endpoint_lock);
+	if (peer->endpoint.addr.sa_family == AF_INET)
+		fail = nla_put(skb, WGPEER_A_ENDPOINT,
+			       sizeof(peer->endpoint.addr4),
+			       &peer->endpoint.addr4);
+	else if (peer->endpoint.addr.sa_family == AF_INET6)
+		fail = nla_put(skb, WGPEER_A_ENDPOINT,
+			       sizeof(peer->endpoint.addr6),
+			       &peer->endpoint.addr6);
+	read_unlock_bh(&peer->endpoint_lock);
+	if (fail)
+		return fail;
+
+	nla_nest_end(skb, peer_array_nest);
+	nla_nest_end(skb, peer_nest);
+	genlmsg_end(skb, hdr);
+
+	fail = genlmsg_multicast_netns(&genl_family, dev_net(peer->device->dev),
+				       skb, 0, 0, GFP_KERNEL);
+	return fail;
+}
diff --git a/drivers/net/wireguard/netlink.h b/drivers/net/wireguard/netlink.h
index 15100d92e2e3..74ecc72a79a6 100644
--- a/drivers/net/wireguard/netlink.h
+++ b/drivers/net/wireguard/netlink.h
@@ -6,6 +6,10 @@
 #ifndef _WG_NETLINK_H
 #define _WG_NETLINK_H
 
+#include "peer.h"
+
+int wg_genl_mcast_peer_endpoint_change(struct wg_peer *peer);
+
 int wg_genetlink_init(void);
 void wg_genetlink_uninit(void);
 
diff --git a/drivers/net/wireguard/socket.c b/drivers/net/wireguard/socket.c
index 410b318e57fb..d826e1f2b51c 100644
--- a/drivers/net/wireguard/socket.c
+++ b/drivers/net/wireguard/socket.c
@@ -8,6 +8,7 @@
 #include "socket.h"
 #include "queueing.h"
 #include "messages.h"
+#include "netlink.h"
 
 #include <linux/ctype.h>
 #include <linux/net.h>
@@ -293,6 +294,9 @@ void wg_socket_set_peer_endpoint(struct wg_peer *peer,
 	dst_cache_reset(&peer->endpoint_cache);
 out:
 	write_unlock_bh(&peer->endpoint_lock);
+
+	/* We need to notify the netlink listeners for about this change */
+	wg_genl_mcast_peer_endpoint_change(peer);
 }
 
 void wg_socket_set_peer_endpoint_from_skb(struct wg_peer *peer,
diff --git a/include/uapi/linux/wireguard.h b/include/uapi/linux/wireguard.h
index ae88be14c947..22a012644d71 100644
--- a/include/uapi/linux/wireguard.h
+++ b/include/uapi/linux/wireguard.h
@@ -136,9 +136,12 @@
 
 #define WG_KEY_LEN 32
 
+#define WG_MULTICAST_GROUP_PEER_CHANGE          "wg_peer_change"
+
 enum wg_cmd {
 	WG_CMD_GET_DEVICE,
 	WG_CMD_SET_DEVICE,
+	WG_CMD_CHANGED_PEER,
 	__WG_CMD_MAX
 };
 #define WG_CMD_MAX (__WG_CMD_MAX - 1)
-- 
2.26.2

