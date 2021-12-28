Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDEBC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Jan 2022 18:26:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c454aa2a;
	Tue, 4 Jan 2022 18:20:45 +0000 (UTC)
Received: from hetz0.host.rs.currently.online (hetz0.host.rs.currently.online
 [178.63.44.182])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9d878a01
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Dec 2021 23:46:30 +0000 (UTC)
Received: from carbon.srv.schuermann.io (carbon.srv.schuermann.io
 [178.63.44.188])
 by hetz0.host.rs.currently.online (Postfix) with ESMTPS id 914D538E8
 for <wireguard@lists.zx2c4.com>; Tue, 28 Dec 2021 23:46:30 +0000 (UTC)
From: leon@is.currently.online
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=is.currently.online;
 s=carbon; t=1640735190;
 bh=BG3lp//Fkv0CyDWfnsZB8iTPBCC1MuilJfYt8BAss1I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iS3AgenS+S7oEogcgpXyAQriLImUDkjkfYNYEOOfPhdoza2jAp8/zGXpAmC33yRKv
 CLTJd8Yymmry4fTTAd5QSltUZTYCRoO4qYH4B0Y4uftd7Rmbj52TqF2HN4fMYI22Or
 dBKi/I+sy3vdgEPGpxFJC3DBBe36SyyPCeDgiXpA=
To: wireguard@lists.zx2c4.com
Cc: Leon Schuermann <leon@is.currently.online>
Subject: [RFC PATCH 2/4] net/ipv4: respect MTU determined by `ndo_lookup_mtu`
Date: Wed, 29 Dec 2021 00:45:25 +0100
Message-Id: <20211228234524.633509-3-leon@is.currently.online>
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

This integrates the newly introduced dynamic MTU lookup mechanism with
the IPv4 stack. It will attempt to query the destination netdevice for
the individual packet MTU and, if not found or the mechanism is not
implemented, fall back to the device MTU.

`ndo_lookup_mtu` will not be queried and respected for every
packet. For instance, flow offloading with netfilter will only take
the device MTU into account.

Signed-off-by: Leon Schuermann <leon@is.currently.online>
---
 include/net/ip.h                   | 34 ++++++++++++++++++++++--------
 net/ipv4/ip_forward.c              |  2 +-
 net/netfilter/nf_flow_table_core.c |  2 +-
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/include/net/ip.h b/include/net/ip.h
index 2d6b985d11cc..5232d0c07dea 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -433,34 +433,50 @@ static inline bool ip_sk_ignore_df(const struct sock *sk)
 }
 
 static inline unsigned int ip_dst_mtu_maybe_forward(const struct dst_entry *dst,
-						    bool forwarding)
+						    bool forwarding,
+						    const struct sk_buff *skb)
 {
-	struct net *net = dev_net(dst->dev);
+	int err;
 	unsigned int mtu;
+	struct net_device *dev = dst->dev;
 
-	if (net->ipv4.sysctl_ip_fwd_use_pmtu ||
-	    ip_mtu_locked(dst) ||
-	    !forwarding)
-		return dst_mtu(dst);
+	err = -ENODATA;
+	if (skb && dev->netdev_ops->ndo_lookup_mtu)
+		err = dev->netdev_ops->ndo_lookup_mtu(skb, dev);
+	mtu = (err >= 0) ? err : READ_ONCE(dst->dev->mtu);
+
+	if (dev_net(dev)->ipv4.sysctl_ip_fwd_use_pmtu ||
+		ip_mtu_locked(dst) ||
+		!forwarding)
+		return min(mtu, dst_mtu(dst));
 
 	/* 'forwarding = true' case should always honour route mtu */
 	mtu = dst_metric_raw(dst, RTAX_MTU);
 	if (mtu)
 		return mtu;
 
-	return min(READ_ONCE(dst->dev->mtu), IP_MAX_MTU);
+	return min(mtu, IP_MAX_MTU);
 }
 
 static inline unsigned int ip_skb_dst_mtu(struct sock *sk,
 					  const struct sk_buff *skb)
 {
+	int err;
+	unsigned int mtu;
+	struct net_device *dev = skb_dst(skb)->dev;
+
 	if (!sk || !sk_fullsock(sk) || ip_sk_use_pmtu(sk)) {
 		bool forwarding = IPCB(skb)->flags & IPSKB_FORWARDED;
 
-		return ip_dst_mtu_maybe_forward(skb_dst(skb), forwarding);
+		return ip_dst_mtu_maybe_forward(skb_dst(skb), forwarding, skb);
 	}
 
-	return min(READ_ONCE(skb_dst(skb)->dev->mtu), IP_MAX_MTU);
+	err = -ENODATA;
+	if (dev->netdev_ops->ndo_lookup_mtu)
+		err = dev->netdev_ops->ndo_lookup_mtu(skb, dev);
+	mtu = (err >= 0) ? err : READ_ONCE(dev->mtu);
+
+	return min(mtu, IP_MAX_MTU);
 }
 
 struct dst_metrics *ip_fib_metrics_init(struct net *net, struct nlattr *fc_mx,
diff --git a/net/ipv4/ip_forward.c b/net/ipv4/ip_forward.c
index 00ec819f949b..7a7ec3643c37 100644
--- a/net/ipv4/ip_forward.c
+++ b/net/ipv4/ip_forward.c
@@ -127,7 +127,7 @@ int ip_forward(struct sk_buff *skb)
 		goto sr_failed;
 
 	IPCB(skb)->flags |= IPSKB_FORWARDED;
-	mtu = ip_dst_mtu_maybe_forward(&rt->dst, true);
+	mtu = ip_dst_mtu_maybe_forward(&rt->dst, true, skb);
 	if (ip_exceeds_mtu(skb, mtu)) {
 		IP_INC_STATS(net, IPSTATS_MIB_FRAGFAILS);
 		icmp_send(skb, ICMP_DEST_UNREACH, ICMP_FRAG_NEEDED,
diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 513f78db3cb2..95bd7a87066a 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -87,7 +87,7 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 
 	switch (flow_tuple->l3proto) {
 	case NFPROTO_IPV4:
-		flow_tuple->mtu = ip_dst_mtu_maybe_forward(dst, true);
+		flow_tuple->mtu = ip_dst_mtu_maybe_forward(dst, true, NULL);
 		break;
 	case NFPROTO_IPV6:
 		flow_tuple->mtu = ip6_dst_mtu_forward(dst);
-- 
2.33.1

