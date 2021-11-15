Return-Path: <SRS0=+2x1=QC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF33C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Nov 2021 16:06:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C998761B95
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Nov 2021 16:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C998761B95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sdn.clinic
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdc62a80;
	Mon, 15 Nov 2021 16:04:32 +0000 (UTC)
Received: from mail.rfc2324.org (mail.rfc2324.org [2a01:a700:4621:867::10])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 80b29d24
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Nov 2021 16:04:31 +0000 (UTC)
Received: from [2a01:a700:4621:a020:1b57:3829:d7fb:af17]
 by mail.rfc2324.org with esmtpsa rfc2324.org Mailserver
 id 1mmeT8-0006US-BA
 for <wireguard@lists.zx2c4.com>; Mon, 15 Nov 2021 17:04:30 +0100
To: wireguard@lists.zx2c4.com
References: <d1c0a3e8-c461-3d70-e23f-fceac21cbd43@sdn.clinic>
From: Maximilian Wilhelm <max@sdn.clinic>
Organization: SDN Clinic
Message-ID: <80d36571-9345-5855-1710-ca5a796e2fe9@sdn.clinic>
Date: Mon, 15 Nov 2021 17:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d1c0a3e8-c461-3d70-e23f-fceac21cbd43@sdn.clinic>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a01:a700:4621:a020:1b57:3829:d7fb:af17
X-SA-Exim-Mail-From: max@sdn.clinic
Subject: [PATCH 1/1] wireguard: Add support to bind socket(s) to device
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.rfc2324.org)
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

From: Maximilian Wilhelm <max@sdn.clinic>

   This introduces support for binding Wireguards UDP socket(s) to a
   given interface allowing to send/receive encapsulated packets via
   a VRF.

Signed-off-by: Maximilian Wilhelm <max@sdn.clinic>
---
  drivers/net/wireguard/device.h  |  1 +
  drivers/net/wireguard/netlink.c |  7 ++++++-
  drivers/net/wireguard/socket.c  | 13 +++++++++++++
  include/uapi/linux/wireguard.h  |  2 ++
  4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireguard/device.h b/drivers/net/wireguard/device.h
index 854bc3d97150..85f9fe687cb8 100644
--- a/drivers/net/wireguard/device.h
+++ b/drivers/net/wireguard/device.h
@@ -56,6 +56,7 @@ struct wg_device {
  	struct list_head device_list, peer_list;
  	unsigned int num_peers, device_update_gen;
  	u32 fwmark;
+	u32 bind_ifindex;
  	u16 incoming_port;
  };

diff --git a/drivers/net/wireguard/netlink.c 
b/drivers/net/wireguard/netlink.c
index d0f3b6d7f408..064402a11eb3 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -27,7 +27,8 @@ static const struct nla_policy 
device_policy[WGDEVICE_A_MAX + 1] = {
  	[WGDEVICE_A_FLAGS]		= { .type = NLA_U32 },
  	[WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
  	[WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
-	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED }
+	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED },
+	[WGDEVICE_A_BIND_IFINDEX]	= { .type = NLA_U32 }
  };

  static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
@@ -232,6 +233,7 @@ static int wg_get_device_dump(struct sk_buff *skb, 
struct netlink_callback *cb)
  		if (nla_put_u16(skb, WGDEVICE_A_LISTEN_PORT,
  				wg->incoming_port) ||
  		    nla_put_u32(skb, WGDEVICE_A_FWMARK, wg->fwmark) ||
+		    nla_put_u32(skb, WGDEVICE_A_BIND_IFINDEX, wg->bind_ifindex) ||
  		    nla_put_u32(skb, WGDEVICE_A_IFINDEX, wg->dev->ifindex) ||
  		    nla_put_string(skb, WGDEVICE_A_IFNAME, wg->dev->name))
  			goto out;
@@ -531,6 +533,9 @@ static int wg_set_device(struct sk_buff *skb, struct 
genl_info *info)
  			wg_socket_clear_peer_endpoint_src(peer);
  	}

+	if (info->attrs[WGDEVICE_A_BIND_IFINDEX])
+		wg->bind_ifindex = nla_get_u32(info->attrs[WGDEVICE_A_BIND_IFINDEX]);
+
  	if (info->attrs[WGDEVICE_A_LISTEN_PORT]) {
  		ret = set_port(wg,
  			nla_get_u16(info->attrs[WGDEVICE_A_LISTEN_PORT]));
diff --git a/drivers/net/wireguard/socket.c b/drivers/net/wireguard/socket.c
index 8c496b747108..d319288a8f3b 100644
--- a/drivers/net/wireguard/socket.c
+++ b/drivers/net/wireguard/socket.c
@@ -35,6 +35,9 @@ static int send4(struct wg_device *wg, struct sk_buff 
*skb,
  	skb->dev = wg->dev;
  	skb->mark = wg->fwmark;

+	if (wg->bind_ifindex)
+		fl.flowi4_oif = wg->bind_ifindex;
+
  	rcu_read_lock_bh();
  	sock = rcu_dereference_bh(wg->sock4);

@@ -115,6 +118,9 @@ static int send6(struct wg_device *wg, struct 
sk_buff *skb,
  	skb->dev = wg->dev;
  	skb->mark = wg->fwmark;

+	if (wg->bind_ifindex)
+		fl.flowi6_oif = wg->bind_ifindex;
+
  	rcu_read_lock_bh();
  	sock = rcu_dereference_bh(wg->sock6);

@@ -379,6 +385,13 @@ int wg_socket_init(struct wg_device *wg, u16 port)
  	if (unlikely(!net))
  		return -ENONET;

+	if (wg->bind_ifindex) {
+		port4.bind_ifindex = wg->bind_ifindex;
+#if IS_ENABLED(CONFIG_IPV6)
+		port6.bind_ifindex = wg->bind_ifindex;
+#endif
+	}
+
  #if IS_ENABLED(CONFIG_IPV6)
  retry:
  #endif
diff --git a/include/uapi/linux/wireguard.h b/include/uapi/linux/wireguard.h
index ae88be14c947..5c49919596b8 100644
--- a/include/uapi/linux/wireguard.h
+++ b/include/uapi/linux/wireguard.h
@@ -114,6 +114,7 @@
   *        0: NLA_NESTED
   *            ...
   *        ...
+ *    WGDEVICE_A_BIND_IFINDEX: NLA_U32
   *
   * It is possible that the amount of configuration data exceeds that of
   * the maximum message length accepted by the kernel. In that case, 
several
@@ -157,6 +158,7 @@ enum wgdevice_attribute {
  	WGDEVICE_A_LISTEN_PORT,
  	WGDEVICE_A_FWMARK,
  	WGDEVICE_A_PEERS,
+	WGDEVICE_A_BIND_IFINDEX,
  	__WGDEVICE_A_LAST
  };
  #define WGDEVICE_A_MAX (__WGDEVICE_A_LAST - 1)
-- 
2.20.1

