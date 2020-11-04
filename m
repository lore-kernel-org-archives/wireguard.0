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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C215FC4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:52:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 483AD206CB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqc3LELb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 483AD206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 826c2036;
	Mon, 9 Nov 2020 22:40:24 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b8993b23
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 14:28:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x7so22292915wrl.3
 for <wireguard@lists.zx2c4.com>; Wed, 04 Nov 2020 06:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qEB7Z1RjR0G+DQiP2hCHYNQbM1LDy8ydPvZ+5mT8PJY=;
 b=oqc3LELbOHqVlrEwxcr95Uzj3oPBsqK0Nak4vw7gcR4/dVI6RUxZUXW6f5i47wIvsS
 8ArQM6PlzCm2AppC7MMF2DLcku+T4teyS7eGqkcwZS406IFUqnbcqvzlF2TZRgBLx06p
 3HYc641WliszKdF0S62P1MqROLAJa3FB6pmc6Z6egnxCdFZoQ+gEJmkj+mF+t8YmRvhZ
 UfkATTDdmC+MNlVBNBD4awnkkoO726ky7JLrG5VJhFN0yhTTj5usRcgam6icQsKrKG64
 ccw7SUtnjKE4WdBzCfxZAMK/j19148XNTbs/Vf3zjp3xxQlNuTeEQyxxag5Y+szOsP9a
 oByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qEB7Z1RjR0G+DQiP2hCHYNQbM1LDy8ydPvZ+5mT8PJY=;
 b=dAnl0w6IpFDR4/6eSYEFMOPSWcz+r85AUapQVj0ZXi8sGnPL8E+3likUPc4ybKnT/E
 jKGwTMDw8SFpXeZFLXqP+QsZzgCakbMkotE4DV1BkHcgu9UaDWwTUAP9XJTo+WAf1elD
 +VDBfeBLjUhyPL5hn8/mLWVL4UclGVunrzRk2trqxTT8t78leTf1Y1xidFUYc/KerX2h
 4Nm7IgpaR2B5UsHN3wd8UjcAzJ1BTzFZcsKFgq0nvxAnCMf79/K09xSEDXqZnInDzGVJ
 9h9y4EWwhlFtJnmqrtINbNOLFwhwcpr4L8Vz5C02gImk4+/bxqCcY/8h3MkNP5AZv50b
 m5rw==
X-Gm-Message-State: AOAM530+Fm/4cgl3AfjfB6bOlIAR0efVNTqcEVn1vZ0r3PMnSv+KEoXn
 MLCVgZy4lamYZNgyAYDuXDs=
X-Google-Smtp-Source: ABdhPJzroOAM2nk7AMGE88U8txABdnW1WShg9Kwj96gyky21jL4XWyUtijC9VSYFoEfWdADhvSeNQw==
X-Received: by 2002:a5d:5612:: with SMTP id l18mr34275754wrv.372.1604500298030; 
 Wed, 04 Nov 2020 06:31:38 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:d177:63da:d01d:cf70?
 (p200300ea8f232800d17763dad01dcf70.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:d177:63da:d01d:cf70])
 by smtp.googlemail.com with ESMTPSA id a185sm2595233wmf.24.2020.11.04.06.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 06:31:37 -0800 (PST)
Subject: [PATCH net-next v2 04/10] ip6_tunnel: switch to dev_get_tstats64
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
References: <059fcb95-fba8-673e-0cd6-fb26e8ed4861@gmail.com>
Message-ID: <4dc3d9f1-bf5e-1f56-9810-7af29988a5f1@gmail.com>
Date: Wed, 4 Nov 2020 15:26:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <059fcb95-fba8-673e-0cd6-fb26e8ed4861@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:40:11 +0100
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

Switch ip6_tunnel to the standard statistics pattern:
- use dev->stats for the less frequently accessed counters
- use dev->tstats for the frequently accessed counters

An additional benefit is that we now have 64bit statistics also on
32bit systems.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 net/ipv6/ip6_tunnel.c | 32 +-------------------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index 648db3fe5..321d057c5 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -94,36 +94,6 @@ static inline int ip6_tnl_mpls_supported(void)
 	return IS_ENABLED(CONFIG_MPLS);
 }
 
-static struct net_device_stats *ip6_get_stats(struct net_device *dev)
-{
-	struct pcpu_sw_netstats tmp, sum = { 0 };
-	int i;
-
-	for_each_possible_cpu(i) {
-		unsigned int start;
-		const struct pcpu_sw_netstats *tstats =
-						   per_cpu_ptr(dev->tstats, i);
-
-		do {
-			start = u64_stats_fetch_begin_irq(&tstats->syncp);
-			tmp.rx_packets = tstats->rx_packets;
-			tmp.rx_bytes = tstats->rx_bytes;
-			tmp.tx_packets = tstats->tx_packets;
-			tmp.tx_bytes =  tstats->tx_bytes;
-		} while (u64_stats_fetch_retry_irq(&tstats->syncp, start));
-
-		sum.rx_packets += tmp.rx_packets;
-		sum.rx_bytes   += tmp.rx_bytes;
-		sum.tx_packets += tmp.tx_packets;
-		sum.tx_bytes   += tmp.tx_bytes;
-	}
-	dev->stats.rx_packets = sum.rx_packets;
-	dev->stats.rx_bytes   = sum.rx_bytes;
-	dev->stats.tx_packets = sum.tx_packets;
-	dev->stats.tx_bytes   = sum.tx_bytes;
-	return &dev->stats;
-}
-
 #define for_each_ip6_tunnel_rcu(start) \
 	for (t = rcu_dereference(start); t; t = rcu_dereference(t->next))
 
@@ -1835,7 +1805,7 @@ static const struct net_device_ops ip6_tnl_netdev_ops = {
 	.ndo_start_xmit = ip6_tnl_start_xmit,
 	.ndo_do_ioctl	= ip6_tnl_ioctl,
 	.ndo_change_mtu = ip6_tnl_change_mtu,
-	.ndo_get_stats	= ip6_get_stats,
+	.ndo_get_stats64 = dev_get_tstats64,
 	.ndo_get_iflink = ip6_tnl_get_iflink,
 };
 
-- 
2.29.2


