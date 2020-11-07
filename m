Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E7EC4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:05:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FAD22074F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:05:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuMmBGOZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FAD22074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc4e6763;
	Mon, 9 Nov 2020 22:40:37 +0000 (UTC)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 66bb8693
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Nov 2020 20:52:44 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d142so4651598wmd.4
 for <wireguard@lists.zx2c4.com>; Sat, 07 Nov 2020 12:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=whZpVChbC/Oh3fGf+zAOWeG71Nt5Rog/T1hyV+pag+s=;
 b=HuMmBGOZjUkGiKhtWqwnFVrZogGWKOpl2hx4HGzximEH87j5Cy/XzDpjZy8D7CMGZ9
 DS3v3xjv37n8RnEG1ns3FlJy+YI1S4xn6o0AY66D6JpL6jilQIHe7y+/KK78jS3yWEC0
 exQ4hd2kp3aVPER+QmgccFdFX6na+5LCyg5sddW347hVlopRa08jzeitSVh5OZAKj/np
 W9Ye5AcPA2O5sET5dU2wIbtCD+VWSW8MH7jNJYjbJKKbTaBCkpX/QmhC0bmewk5m+Fxf
 /OU55EYcv+hOBvT9gPKGOYcxDrZa2Um85Oy3puao1Fdm0Ngd/ySwOoYbvE2K65qW00om
 vMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=whZpVChbC/Oh3fGf+zAOWeG71Nt5Rog/T1hyV+pag+s=;
 b=JlhyfGf06yO1n62NEvvF3uveJh2079HbzsRwMsUH5Mym4FGsks4DrREOwqYwYv03t3
 kTYkQNyJNYPMUhtr54qWmWZk3yrBSpoY7QvP+YTg4MTopAbv6m7OHx2N5lYjoc/I2nga
 RMTyVzZHqq0265H3qT3PY8lVLGb88fpB72ZFvYYB9r54LGrISbDPYiiuSCZMyWc/Fk2J
 rYqT6uQAqF4rF4WZY4fss9883HBHH/SW1MaK9RncfFLjQ//HyU99Jr/ExHwK+t/Vjxj9
 bjmvQ/3vWruKnWksL9Uxw/ORMonZInCzQQS4eHSL4pYV6/vUH6NkcmvOHHlWQBUImo9/
 IOCg==
X-Gm-Message-State: AOAM532k4EBDTAjTeRP+qhQhc2fSy8C1oG5X75FLNywTbb0X9np3c4Op
 lkUXUINmXr/dEVdO6R0j6GE=
X-Google-Smtp-Source: ABdhPJxnEfRez/hEbRVq9jtSSBegtRME/vDRC1PdL/NV7oUwXPZ4chY5azs5X3HhST6WqbuflfsJ9w==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr6343037wmj.101.1604782564583; 
 Sat, 07 Nov 2020 12:56:04 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:7051:31d:251f:edd6?
 (p200300ea8f2328007051031d251fedd6.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:7051:31d:251f:edd6])
 by smtp.googlemail.com with ESMTPSA id 90sm7604936wrl.30.2020.11.07.12.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 12:56:04 -0800 (PST)
Subject: [PATCH net-next v3 02/10] net: dsa: use net core stats64 handling
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Harald Welte
 <laforge@gnumonks.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 osmocom-net-gprs@lists.osmocom.org, wireguard@lists.zx2c4.com,
 Steffen Klassert <steffen.klassert@secunet.com>
References: <99273e2f-c218-cd19-916e-9161d8ad8c56@gmail.com>
Message-ID: <74c82e15-c44e-8368-6d60-4f61f6aba92f@gmail.com>
Date: Sat, 7 Nov 2020 21:49:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <99273e2f-c218-cd19-916e-9161d8ad8c56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:40:12 +0100
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

Use netdev->tstats instead of a member of dsa_slave_priv for storing
a pointer to the per-cpu counters. This allows us to use core
functionality for statistics handling.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 net/dsa/dsa.c      |  7 +------
 net/dsa/dsa_priv.h |  2 --
 net/dsa/slave.c    | 29 +++++++----------------------
 3 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 2131bf2b3..a1b1dc8a4 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -201,7 +201,6 @@ static int dsa_switch_rcv(struct sk_buff *skb, struct net_device *dev,
 {
 	struct dsa_port *cpu_dp = dev->dsa_ptr;
 	struct sk_buff *nskb = NULL;
-	struct pcpu_sw_netstats *s;
 	struct dsa_slave_priv *p;
 
 	if (unlikely(!cpu_dp)) {
@@ -234,11 +233,7 @@ static int dsa_switch_rcv(struct sk_buff *skb, struct net_device *dev,
 		skb = nskb;
 	}
 
-	s = this_cpu_ptr(p->stats64);
-	u64_stats_update_begin(&s->syncp);
-	s->rx_packets++;
-	s->rx_bytes += skb->len;
-	u64_stats_update_end(&s->syncp);
+	dev_sw_netstats_rx_add(skb->dev, skb->len);
 
 	if (dsa_skb_defer_rx_timestamp(p, skb))
 		return 0;
diff --git a/net/dsa/dsa_priv.h b/net/dsa/dsa_priv.h
index 12998bf04..7c96aae90 100644
--- a/net/dsa/dsa_priv.h
+++ b/net/dsa/dsa_priv.h
@@ -78,8 +78,6 @@ struct dsa_slave_priv {
 	struct sk_buff *	(*xmit)(struct sk_buff *skb,
 					struct net_device *dev);
 
-	struct pcpu_sw_netstats	__percpu *stats64;
-
 	struct gro_cells	gcells;
 
 	/* DSA port data, such as switch, port index, etc. */
diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index 59c80052e..ff2266d2b 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -575,14 +575,9 @@ static int dsa_realloc_skb(struct sk_buff *skb, struct net_device *dev)
 static netdev_tx_t dsa_slave_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct dsa_slave_priv *p = netdev_priv(dev);
-	struct pcpu_sw_netstats *s;
 	struct sk_buff *nskb;
 
-	s = this_cpu_ptr(p->stats64);
-	u64_stats_update_begin(&s->syncp);
-	s->tx_packets++;
-	s->tx_bytes += skb->len;
-	u64_stats_update_end(&s->syncp);
+	dev_sw_netstats_tx_add(dev, 1, skb->len);
 
 	DSA_SKB_CB(skb)->clone = NULL;
 
@@ -714,7 +709,6 @@ static void dsa_slave_get_ethtool_stats(struct net_device *dev,
 					uint64_t *data)
 {
 	struct dsa_port *dp = dsa_slave_to_port(dev);
-	struct dsa_slave_priv *p = netdev_priv(dev);
 	struct dsa_switch *ds = dp->ds;
 	struct pcpu_sw_netstats *s;
 	unsigned int start;
@@ -723,7 +717,7 @@ static void dsa_slave_get_ethtool_stats(struct net_device *dev,
 	for_each_possible_cpu(i) {
 		u64 tx_packets, tx_bytes, rx_packets, rx_bytes;
 
-		s = per_cpu_ptr(p->stats64, i);
+		s = per_cpu_ptr(dev->tstats, i);
 		do {
 			start = u64_stats_fetch_begin_irq(&s->syncp);
 			tx_packets = s->tx_packets;
@@ -1252,15 +1246,6 @@ static int dsa_slave_setup_tc(struct net_device *dev, enum tc_setup_type type,
 	return ds->ops->port_setup_tc(ds, dp->index, type, type_data);
 }
 
-static void dsa_slave_get_stats64(struct net_device *dev,
-				  struct rtnl_link_stats64 *stats)
-{
-	struct dsa_slave_priv *p = netdev_priv(dev);
-
-	netdev_stats_to_stats64(stats, &dev->stats);
-	dev_fetch_sw_netstats(stats, p->stats64);
-}
-
 static int dsa_slave_get_rxnfc(struct net_device *dev,
 			       struct ethtool_rxnfc *nfc, u32 *rule_locs)
 {
@@ -1636,7 +1621,7 @@ static const struct net_device_ops dsa_slave_netdev_ops = {
 #endif
 	.ndo_get_phys_port_name	= dsa_slave_get_phys_port_name,
 	.ndo_setup_tc		= dsa_slave_setup_tc,
-	.ndo_get_stats64	= dsa_slave_get_stats64,
+	.ndo_get_stats64	= dev_get_tstats64,
 	.ndo_get_port_parent_id	= dsa_slave_get_port_parent_id,
 	.ndo_vlan_rx_add_vid	= dsa_slave_vlan_rx_add_vid,
 	.ndo_vlan_rx_kill_vid	= dsa_slave_vlan_rx_kill_vid,
@@ -1846,8 +1831,8 @@ int dsa_slave_create(struct dsa_port *port)
 	slave_dev->vlan_features = master->vlan_features;
 
 	p = netdev_priv(slave_dev);
-	p->stats64 = netdev_alloc_pcpu_stats(struct pcpu_sw_netstats);
-	if (!p->stats64) {
+	slave_dev->tstats = netdev_alloc_pcpu_stats(struct pcpu_sw_netstats);
+	if (!slave_dev->tstats) {
 		free_netdev(slave_dev);
 		return -ENOMEM;
 	}
@@ -1909,7 +1894,7 @@ int dsa_slave_create(struct dsa_port *port)
 out_gcells:
 	gro_cells_destroy(&p->gcells);
 out_free:
-	free_percpu(p->stats64);
+	free_percpu(slave_dev->tstats);
 	free_netdev(slave_dev);
 	port->slave = NULL;
 	return ret;
@@ -1931,7 +1916,7 @@ void dsa_slave_destroy(struct net_device *slave_dev)
 	dsa_slave_notify(slave_dev, DSA_PORT_UNREGISTER);
 	phylink_destroy(dp->pl);
 	gro_cells_destroy(&p->gcells);
-	free_percpu(p->stats64);
+	free_percpu(slave_dev->tstats);
 	free_netdev(slave_dev);
 }
 
-- 
2.29.2


