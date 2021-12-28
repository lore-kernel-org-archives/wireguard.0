Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD95C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Jan 2022 18:31:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 490be4a8;
	Tue, 4 Jan 2022 18:20:47 +0000 (UTC)
Received: from hetz0.host.rs.currently.online (hetz0.host.rs.currently.online
 [2a01:4f8:120:614b::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id de23594f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Dec 2021 23:46:52 +0000 (UTC)
Received: from carbon.srv.schuermann.io (carbon.srv.schuermann.io
 [178.63.44.188])
 by hetz0.host.rs.currently.online (Postfix) with ESMTPS id 2B6583AA0
 for <wireguard@lists.zx2c4.com>; Tue, 28 Dec 2021 23:46:52 +0000 (UTC)
From: leon@is.currently.online
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=is.currently.online;
 s=carbon; t=1640735212;
 bh=EMHWwWh/N20eUvNsbNt0/K81GBSYDRiL2Ck26AoOk+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gjTG/pSdWbk3xr0vVgteedfvJVouL+acNzC81ERxrKmiKg3ItTXwQhTtRVdFTG/G4
 oF4kTpKcqaeu36ibKZuTrnvLpNstYhsHLjvO//wZ8pVpwE7M5bm70FJkZ5z3ZR0w//
 Lg/FSP1B9OFoZqKDhkeX0cOON18uec/t8oEIE9Y4=
To: wireguard@lists.zx2c4.com
Cc: Leon Schuermann <leon@is.currently.online>
Subject: [RFC PATCH 4/4] net/wireguard: add per-peer MTU setting
Date: Wed, 29 Dec 2021 00:45:29 +0100
Message-Id: <20211228234524.633509-5-leon@is.currently.online>
In-Reply-To: <20211228234524.633509-1-leon@is.currently.online>
References: <20211228234524.633509-1-leon@is.currently.online>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 04 Jan 2022 18:20:36 +0000
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

From: Leon Schuermann <leon@is.currently.online>

WireGuard is, as of now, unable to detect an insufficient link MTU and
adjust the MTU of transmitted frames accordingly, as ICMP messages
which would indicate this are unauthenticated. This poses a problem in
an environment where multiple peers connect to a shared endpoint,
through various links with different MTU constraints. A workaround is
to reduce the shared endpoint's MTU to the largest MTU supported by
every peer link. Naturally, this adds additional overhead for all
peers with more relaxed MTU constraints.

Thus this introduces a per-peer MTU setting into WireGuard. This value
can be set statically through the userspace API. It is announced to
the rest of the network stack through the `ndo_lookup_mtu` module,
which is (partially) respected by both IPv4 and IPv6.

While Linux supports setting an MTU metric for specific FIB route
entries and thus allows to lower the MTU for individual peers, this
causes regular path MTU discovery (PMTUD) to be completely disabled on
the entire route. While regular PMTUD does not work over the tunnel
link, it should still be usable on the rest of the route. Furthermore,
keeping an internal per-peer MTU value paves the way for integrating
an in-band PMTUD mechanism, as it does not require modifying the FIB
to reflect new discovered MTU values.

Signed-off-by: Leon Schuermann <leon@is.currently.online>
---
 drivers/net/wireguard/allowedips.c |  2 +-
 drivers/net/wireguard/allowedips.h |  2 +-
 drivers/net/wireguard/device.c     | 20 ++++++++++++++++++--
 drivers/net/wireguard/netlink.c    |  8 ++++++++
 drivers/net/wireguard/peer.c       |  1 +
 drivers/net/wireguard/peer.h       |  1 +
 drivers/net/wireguard/queueing.h   |  2 +-
 include/uapi/linux/wireguard.h     |  5 +++++
 8 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
index 3725e9cd85f4..8870a96b223b 100644
--- a/drivers/net/wireguard/allowedips.c
+++ b/drivers/net/wireguard/allowedips.c
@@ -354,7 +354,7 @@ int wg_allowedips_read_node(struct allowedips_node *node, u8 ip[16], u8 *cidr)
 
 /* Returns a strong reference to a peer */
 struct wg_peer *wg_allowedips_lookup_dst(struct allowedips *table,
-					 struct sk_buff *skb)
+					 const struct sk_buff *skb)
 {
 	if (skb->protocol == htons(ETH_P_IP))
 		return lookup(table->root4, 32, &ip_hdr(skb)->daddr);
diff --git a/drivers/net/wireguard/allowedips.h b/drivers/net/wireguard/allowedips.h
index e5c83cafcef4..366f42c04e25 100644
--- a/drivers/net/wireguard/allowedips.h
+++ b/drivers/net/wireguard/allowedips.h
@@ -48,7 +48,7 @@ int wg_allowedips_read_node(struct allowedips_node *node, u8 ip[16], u8 *cidr);
 
 /* These return a strong reference to a peer: */
 struct wg_peer *wg_allowedips_lookup_dst(struct allowedips *table,
-					 struct sk_buff *skb);
+					 const struct sk_buff *skb);
 struct wg_peer *wg_allowedips_lookup_src(struct allowedips *table,
 					 struct sk_buff *skb);
 
diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index c9f65e96ccb0..52460a04cffb 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -211,11 +211,27 @@ static netdev_tx_t wg_xmit(struct sk_buff *skb, struct net_device *dev)
 	return ret;
 }
 
+static int wg_lookup_mtu(const struct sk_buff *skb, const struct net_device *dev)
+{
+	struct wg_device *wg = netdev_priv(dev);
+	struct wg_peer *peer;
+
+	if (unlikely(!wg_check_packet_protocol(skb)))
+		return -ENODATA;
+
+	peer = wg_allowedips_lookup_dst(&wg->peer_allowedips, skb);
+	if (unlikely(!peer))
+		return -ENODATA;
+
+	return (peer->peer_mtu != 0) ? peer->peer_mtu : -ENODATA;
+}
+
 static const struct net_device_ops netdev_ops = {
 	.ndo_open		= wg_open,
 	.ndo_stop		= wg_stop,
-	.ndo_start_xmit		= wg_xmit,
-	.ndo_get_stats64	= ip_tunnel_get_stats64
+	.ndo_start_xmit	= wg_xmit,
+	.ndo_get_stats64	= ip_tunnel_get_stats64,
+	.ndo_lookup_mtu	= wg_lookup_mtu,
 };
 
 static void wg_destruct(struct net_device *dev)
diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index d0f3b6d7f408..ad636f893027 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -40,6 +40,7 @@ static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
 	[WGPEER_A_RX_BYTES]				= { .type = NLA_U64 },
 	[WGPEER_A_TX_BYTES]				= { .type = NLA_U64 },
 	[WGPEER_A_ALLOWEDIPS]				= { .type = NLA_NESTED },
+	[WGPEER_A_PEER_MTU]				= { .type = NLA_U32 },
 	[WGPEER_A_PROTOCOL_VERSION]			= { .type = NLA_U32 }
 };
 
@@ -142,6 +143,7 @@ get_peer(struct wg_peer *peer, struct sk_buff *skb, struct dump_ctx *ctx)
 				      WGPEER_A_UNSPEC) ||
 		    nla_put_u64_64bit(skb, WGPEER_A_RX_BYTES, peer->rx_bytes,
 				      WGPEER_A_UNSPEC) ||
+		    nla_put_u32(skb, WGPEER_A_PEER_MTU, peer->peer_mtu) ||
 		    nla_put_u32(skb, WGPEER_A_PROTOCOL_VERSION, 1))
 			goto err;
 
@@ -480,6 +482,12 @@ static int set_peer(struct wg_device *wg, struct nlattr **attrs)
 			wg_packet_send_keepalive(peer);
 	}
 
+	if (attrs[WGPEER_A_PEER_MTU]) {
+		const u32 peer_mtu = nla_get_u32(attrs[WGPEER_A_PEER_MTU]);
+
+		peer->peer_mtu = peer_mtu;
+	}
+
 	if (netif_running(wg->dev))
 		wg_packet_send_staged_packets(peer);
 
diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index b3b6370e6b95..c21704176216 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -46,6 +46,7 @@ struct wg_peer *wg_peer_create(struct wg_device *wg,
 		goto err_3;
 
 	peer->internal_id = atomic64_inc_return(&peer_counter);
+	peer->peer_mtu = 0;
 	peer->serial_work_cpu = nr_cpumask_bits;
 	wg_cookie_init(&peer->latest_cookie);
 	wg_timers_init(peer);
diff --git a/drivers/net/wireguard/peer.h b/drivers/net/wireguard/peer.h
index 23af40922997..2ba51f29e3da 100644
--- a/drivers/net/wireguard/peer.h
+++ b/drivers/net/wireguard/peer.h
@@ -64,6 +64,7 @@ struct wg_peer {
 	u64 internal_id;
 	struct napi_struct napi;
 	bool is_dead;
+	u32 peer_mtu;
 };
 
 struct wg_peer *wg_peer_create(struct wg_device *wg,
diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index dfb674e03076..f7fc7a32abf6 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -66,7 +66,7 @@ struct packet_cb {
 #define PACKET_CB(skb) ((struct packet_cb *)((skb)->cb))
 #define PACKET_PEER(skb) (PACKET_CB(skb)->keypair->entry.peer)
 
-static inline bool wg_check_packet_protocol(struct sk_buff *skb)
+static inline bool wg_check_packet_protocol(const struct sk_buff *skb)
 {
 	__be16 real_protocol = ip_tunnel_parse_protocol(skb);
 	return real_protocol && skb->protocol == real_protocol;
diff --git a/include/uapi/linux/wireguard.h b/include/uapi/linux/wireguard.h
index ae88be14c947..b86ab0320fa5 100644
--- a/include/uapi/linux/wireguard.h
+++ b/include/uapi/linux/wireguard.h
@@ -49,6 +49,7 @@
  *                    ...
  *                ...
  *            WGPEER_A_PROTOCOL_VERSION: NLA_U32
+ *            WGPEER_A_PEER_MTU: NLA_U32
  *        0: NLA_NESTED
  *            ...
  *        ...
@@ -111,6 +112,9 @@
  *                                       most recent protocol will be used when
  *                                       this is unset. Otherwise, must be set
  *                                       to 1.
+ *            WGPEER_A_PEER_MTU: per-peer TX MTU (IP header + payload), or 0 to
+ *                                       use the interface MTU. Applies only if
+ *                                       lower than the interface MTU.
  *        0: NLA_NESTED
  *            ...
  *        ...
@@ -180,6 +184,7 @@ enum wgpeer_attribute {
 	WGPEER_A_TX_BYTES,
 	WGPEER_A_ALLOWEDIPS,
 	WGPEER_A_PROTOCOL_VERSION,
+	WGPEER_A_PEER_MTU,
 	__WGPEER_A_LAST
 };
 #define WGPEER_A_MAX (__WGPEER_A_LAST - 1)
-- 
2.33.1

