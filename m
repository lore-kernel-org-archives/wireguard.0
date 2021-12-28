Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2396C43217
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Jan 2022 18:24:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 51958280;
	Tue, 4 Jan 2022 18:20:44 +0000 (UTC)
Received: from hetz0.host.rs.currently.online (hetz0.host.rs.currently.online
 [178.63.44.182])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b280e616
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Dec 2021 23:46:25 +0000 (UTC)
Received: from carbon.srv.schuermann.io (carbon.srv.schuermann.io
 [178.63.44.188])
 by hetz0.host.rs.currently.online (Postfix) with ESMTPS id 11AE83A9F
 for <wireguard@lists.zx2c4.com>; Tue, 28 Dec 2021 23:46:25 +0000 (UTC)
From: leon@is.currently.online
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=is.currently.online;
 s=carbon; t=1640735185;
 bh=kkISvVFVdGVQin+pF6YoVuxo9dTiCSsHePzJpcHu1es=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=0omMmyawVAu5b/8d/rwWe4Nj+5IX0FM6Hlt1xNBp9Hve1/VOUQfyArnlnpxmMLxGz
 GSQiiU3GHYOeRDjAOH9hPjkJ+YwAoPk/YHUzIM/UV4Y51Rmfh4LXJrMRHLjdOJodYw
 PgHLUz2Zk9nN7TXgtgP1Za/1TOqxEXN3vex8LIjA=
To: wireguard@lists.zx2c4.com
Cc: Leon Schuermann <leon@is.currently.online>
Subject: [RFC PATCH 1/4] netdevice: add ndo_lookup_mtu for dynamically
 determining MTU
Date: Wed, 29 Dec 2021 00:45:23 +0100
Message-Id: <20211228234524.633509-2-leon@is.currently.online>
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

Add an optional function `ndo_lookup_mtu` to the `struct
net_device_ops`. This function can be used to allow other parts of the
network stack to let the destination netdevice determine the allowed
packet MTU. This is done on a per-packet basis, providing the `struct
sk_buff` holding the packet contents.

The information obtained through this method may be cached by other
parts of the network stack, such as for instance the path MTU
discovery (PMTUD) mechanism. It is not guaranteed that this function
will be called for every packet, not even that is called on a single
packet of a given flow. When this function is not implemented or when
it returns -ENODATA no statement about the permitted MTU is made and
the networking stack will resort to the device MTU values. These
properties make this mechanism capable of providing a "suggestion" for
a packet's MTU, deviating from the default device MTU.

The device is allowed to announce MTU values lower or higher than the
minimum and maximum device MTU respectively. Whether such MTU values
will be respected is up to the implementation.

Still, even with this being a non-mandatory to implement or respect
mechanism, it has some interesting consequences. Being able to inspect
the entire packet buffer, the destination netdevice implementation can
control MTUs on a flow granularity. For instance, it could be used to
allow two devices on a shared Ethernet segment to communicate with
each other using a large (> 1500 byte) MTU, while using a lower MTU
for other devices.

The immediate motivation for these changes provide another example of
this mechanism being useful: when using WireGuard, peers can reside
behind paths of varying MTU restrictions. PMTUD does not work across
these tunnel links however, as WireGuard cannot accept unauthenticated
ICMP responses. Thus it will continue to send too large packets over
lower-MTU links. With this mechanism WireGuard can, on a per-peer
granularity, reduce the MTU, without limiting the overall device
MTU. Furthermore, it can employ in-band PMTUD mechanisms to resolve
these values automatically. While an MTU metric can be set for
specific FIB routes and thus lower the MTU for individual peers, as a
consequence this completely disables PMTUD on the entire route. While
regular PMTUD does not work over the tunnel link, it should still be
usable on the rest of the route. Furthermore, when employing an
in-band per-peer PMTUD mechanism, modifying the FIB to store the
detected MTU is inelegant at best.

Signed-off-by: Leon Schuermann <leon@is.currently.online>
---
 include/linux/netdevice.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 7c3da0e1ea9d..d9d59b756f57 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1279,6 +1279,16 @@ struct netdev_net_notifier {
  * struct net_device *(*ndo_get_peer_dev)(struct net_device *dev);
  *	If a device is paired with a peer device, return the peer instance.
  *	The caller must be under RCU read context.
+ * int (*ndo_lookup_mtu)(const struct sk_buff *skb,
+ *			 const struct net_device *dev);
+ *	For devices supporting dynamic lookup of the MTU for individual
+ *	skb packets, this function returns the MTU for the passed skb.
+ *	A return value of -ENODATA must be treated as if the device does
+ *	not support this feature. It is not guaranteed that this function will
+ *	be called for every packet presented to the ndo_start_xmit function.
+ *	A device must always accept packets of the announced min/max device MTU.
+ *	This function may be used to potentially allow MTU sizes lower/higher
+ *	than the min/max device MTU respectively.
  */
 struct net_device_ops {
 	int			(*ndo_init)(struct net_device *dev);
@@ -1487,6 +1497,8 @@ struct net_device_ops {
 	int			(*ndo_tunnel_ctl)(struct net_device *dev,
 						  struct ip_tunnel_parm *p, int cmd);
 	struct net_device *	(*ndo_get_peer_dev)(struct net_device *dev);
+	int			(*ndo_lookup_mtu)(const struct sk_buff *skb,
+						  const struct net_device *dev);
 };
 
 /**
-- 
2.33.1

