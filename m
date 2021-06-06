Return-Path: <SRS0=ObIi=LA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92D3C4743E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 12:39:58 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1E5560C40
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 12:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1E5560C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=marvingaube.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18f4c14f;
	Sun, 6 Jun 2021 12:37:57 +0000 (UTC)
Received: from mail-1.services.margau.net (mail-1.services.margau.net
 [37.120.191.46])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6cb0e8d1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 09:30:25 +0000 (UTC)
From: Marvin Gaube <dev@marvingaube.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvingaube.de;
 s=2018; t=1622971510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gNyNZWSISyqHmQxq5eC3pDA8/rAVouFgHg53Ag4odFI=;
 b=hUqNXrOOohs6bowBLCN7arMzlscjxuEx/HNh0HQ3jsXuJODwHvLo2DmtC8SgFIhyyZZm8T
 MV29Q1K2azxhoce0ejK+zYVILMUcBWxZyCZxOlk9uNVnMvcKhbNqomd+UYbFnIzDd4d/Vl
 wMukkVel/mQuLvdmiY20oXDXNytddVW5L6xZzFIIrTIN3Ob8sigi/KPJTffHQA4hE/lTau
 AC24aolly2k3w+Y4vphbjeHjPegqspD6U5rO6mQdofm+xoJzyvsrKstGj3QhyWMXO8PgJQ
 IqfDYqsN3XZyZDs1Y0b+gtQFJ1IqkxCeEt5twgLy2BGtDpBRsicTSCr1iZ2ptA==
To: wireguard@lists.zx2c4.com
Cc: dev@marvingaube.de
Subject: [PATCH wireguard-linux] Basic support for binding the transport
 socket to a device
Date: Sun,  6 Jun 2021 11:24:20 +0200
Message-Id: <20210606092420.85239-1-dev@marvingaube.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dev@marvingaube.de smtp.mailfrom=dev@marvingaube.de
X-Mailman-Approved-At: Sun, 06 Jun 2021 12:37:55 +0000
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

This patch depends on da5095d052860baa7fe2932fb1209628dd3e3813 from udp_tunnel module,
and allows to bind the transport socket to a specific interface.

With this patch, it is possible to use wireguard with VRFs:
The transport uses a separate "WAN" VRF, cleanly isolating Local/VPN and WAN Routing.

The userspace API is designed to transmit the device index of the device to listen on.
Listening on a device does only work if the socketdev_index is set/changed before the socket is brought up.

Signed-off-by: Marvin Gaube <dev@marvingaube.de>
---
 drivers/net/wireguard/device.h  |  1 +
 drivers/net/wireguard/netlink.c |  8 +++++++-
 drivers/net/wireguard/socket.c  | 10 ++++++++++
 include/uapi/linux/wireguard.h  |  3 +++
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireguard/device.h b/drivers/net/wireguard/device.h
index 854bc3d97150..a08f0893f687 100644
--- a/drivers/net/wireguard/device.h
+++ b/drivers/net/wireguard/device.h
@@ -56,6 +56,7 @@ struct wg_device {
 	struct list_head device_list, peer_list;
 	unsigned int num_peers, device_update_gen;
 	u32 fwmark;
+	u32 socketdev_index;
 	u16 incoming_port;
 };
 
diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index d0f3b6d7f408..c594a7063038 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -27,7 +27,8 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 	[WGDEVICE_A_FLAGS]		= { .type = NLA_U32 },
 	[WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
 	[WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
-	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED }
+	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED },
+	[WGDEVICE_A_SOCKETDEV_INDEX]	= { .type = NLA_U32 }
 };
 
 static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
@@ -232,6 +233,7 @@ static int wg_get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
 		if (nla_put_u16(skb, WGDEVICE_A_LISTEN_PORT,
 				wg->incoming_port) ||
 		    nla_put_u32(skb, WGDEVICE_A_FWMARK, wg->fwmark) ||
+		    nla_put_u32(skb, WGDEVICE_A_SOCKETDEV_INDEX, wg->socketdev_index) ||
 		    nla_put_u32(skb, WGDEVICE_A_IFINDEX, wg->dev->ifindex) ||
 		    nla_put_string(skb, WGDEVICE_A_IFNAME, wg->dev->name))
 			goto out;
@@ -538,6 +540,10 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 			goto out;
 	}
 
+	if (info->attrs[WGDEVICE_A_SOCKETDEV_INDEX]) {
+		wg->socketdev_index = nla_get_u32(info->attrs[WGDEVICE_A_SOCKETDEV_INDEX]);
+	}
+
 	if (flags & WGDEVICE_F_REPLACE_PEERS)
 		wg_peer_remove_all(wg);
 
diff --git a/drivers/net/wireguard/socket.c b/drivers/net/wireguard/socket.c
index d9ad850daa79..885d8a890079 100644
--- a/drivers/net/wireguard/socket.c
+++ b/drivers/net/wireguard/socket.c
@@ -370,8 +370,18 @@ int wg_socket_init(struct wg_device *wg, u16 port)
 		.use_udp6_rx_checksums = true,
 		.ipv6_v6only = true
 	};
+	if (wg->socketdev_index > 0) {
+		port6.bind_ifindex = wg->socketdev_index;
+	} else {
+		port6.bind_ifindex = 0;
+	}
 #endif
 
+	if (wg->socketdev_index > 0) {
+		port4.bind_ifindex = wg->socketdev_index;
+	} else {
+		port4.bind_ifindex = 0;
+	}
 	rcu_read_lock();
 	net = rcu_dereference(wg->creating_net);
 	net = net ? maybe_get_net(net) : NULL;
diff --git a/include/uapi/linux/wireguard.h b/include/uapi/linux/wireguard.h
index ae88be14c947..52b1bd422f50 100644
--- a/include/uapi/linux/wireguard.h
+++ b/include/uapi/linux/wireguard.h
@@ -29,6 +29,7 @@
  *    WGDEVICE_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16
  *    WGDEVICE_A_FWMARK: NLA_U32
+ *    WGDEVICE_A_SOCKETDEV_INDEX: NLA_U32
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
  *            WGPEER_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
@@ -83,6 +84,7 @@
  *    WGDEVICE_A_PRIVATE_KEY: len WG_KEY_LEN, all zeros to remove
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16, 0 to choose randomly
  *    WGDEVICE_A_FWMARK: NLA_U32, 0 to disable
+ *    WGDEVICE_A_SOCKETDEV_INDEX: NLA_U32, 0 to disable
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
  *            WGPEER_A_PUBLIC_KEY: len WG_KEY_LEN
@@ -157,6 +159,7 @@ enum wgdevice_attribute {
 	WGDEVICE_A_LISTEN_PORT,
 	WGDEVICE_A_FWMARK,
 	WGDEVICE_A_PEERS,
+	WGDEVICE_A_SOCKETDEV_INDEX,
 	__WGDEVICE_A_LAST
 };
 #define WGDEVICE_A_MAX (__WGDEVICE_A_LAST - 1)
-- 
2.25.1

