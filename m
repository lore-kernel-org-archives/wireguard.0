Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CD5C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Jan 2022 18:26:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5eb3cffd;
	Tue, 4 Jan 2022 18:20:46 +0000 (UTC)
Received: from hetz0.host.rs.currently.online (hetz0.host.rs.currently.online
 [178.63.44.182])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7bf479b6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Dec 2021 23:46:36 +0000 (UTC)
Received: from carbon.srv.schuermann.io (carbon.srv.schuermann.io
 [178.63.44.188])
 by hetz0.host.rs.currently.online (Postfix) with ESMTPS id B263138E9
 for <wireguard@lists.zx2c4.com>; Tue, 28 Dec 2021 23:46:36 +0000 (UTC)
From: leon@is.currently.online
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=is.currently.online;
 s=carbon; t=1640735196;
 bh=Ol213LH0ov+DOYqOshGRBZh5itU/ivoIHL6zBlbsGvc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OjS0K0GC3WmotGTU3SQYzb3x/XFzJjGEZtx0uRhGJ8uq4/JZz5ROgRf5ACz7ehwAJ
 Sb2Q/vCQnifh5G48bBmn0I5PrDQ6ZmZkBNlBq9HTAL3khKWttiAFohr0bqpDJEH0WC
 NyHqRWIEUiipcChzuD13YxCn/nqhYXmIdA6EFiVo=
To: wireguard@lists.zx2c4.com
Cc: Leon Schuermann <leon@is.currently.online>
Subject: [RFC PATCH 3/4] net/ipv6: respect MTU determined by `ndo_lookup_mtu`
Date: Wed, 29 Dec 2021 00:45:27 +0100
Message-Id: <20211228234524.633509-4-leon@is.currently.online>
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
the IPv6 stack. It will attempt to query the destination netdevice for
the individual packet MTU and, if not found or the mechanism is not
implemented, fall back to the device MTU.

`ndo_lookup_mtu` will not be queried and respected for every
packet. For instance, flow offloading with netfilter will only take
the device MTU into account.

Signed-off-by: Leon Schuermann <leon@is.currently.online>
---
 include/net/ip6_route.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
index 2a5277758379..97e304291d1f 100644
--- a/include/net/ip6_route.h
+++ b/include/net/ip6_route.h
@@ -264,11 +264,21 @@ int ip6_fragment(struct net *net, struct sock *sk, struct sk_buff *skb,
 
 static inline int ip6_skb_dst_mtu(struct sk_buff *skb)
 {
+	int mtu;
+	int err;
+	struct net_device *dev = skb_dst(skb)->dev;
 	struct ipv6_pinfo *np = skb->sk && !dev_recursion_level() ?
 				inet6_sk(skb->sk) : NULL;
 
-	return (np && np->pmtudisc >= IPV6_PMTUDISC_PROBE) ?
-	       skb_dst(skb)->dev->mtu : dst_mtu(skb_dst(skb));
+	err = -ENODATA;
+	if (dev->netdev_ops->ndo_lookup_mtu)
+		err = dev->netdev_ops->ndo_lookup_mtu(skb, dev);
+	mtu = (err >= 0) ? err : READ_ONCE(dev->mtu);
+
+	if (np && np->pmtudisc < IPV6_PMTUDISC_PROBE)
+		mtu = min_t(int, mtu, dst_mtu(skb_dst(skb)));
+
+	return mtu;
 }
 
 static inline bool ip6_sk_accept_pmtu(const struct sock *sk)
-- 
2.33.1

