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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6801C4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:15:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DD63206ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvBaZvyl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DD63206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68c6744e;
	Mon, 9 Nov 2020 22:40:43 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9d2aedbf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Nov 2020 20:52:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c17so4815330wrc.11
 for <wireguard@lists.zx2c4.com>; Sat, 07 Nov 2020 12:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=5Jpd8MyUKg1H1iYmLx0Vs/UrPW9/4+4JcaA/CtXlnF0=;
 b=qvBaZvylSLknklKSyf8Tn7UjcNb2NB5NAxI7PZAg0UvBWFhAIXVkXd95VxaT6yTfP5
 upxuR57oFY+fwA51pSrATaS4qIOBJh4D88MoH6fgkTlWA5LUS3dKyYwHocWrdAHoB2UO
 TraKPUlgKWVP8f9bnHigcIk3LXY/Kyrq2t/bjQIV2ntIyTWygDvvpSjlmSYYxMoS+Zx1
 E3EOvS6/t9PkROdqIS9Fi38oLnS/xpOqeJZjwZB7xgiyVcu5k4Y+Jcu0xbzYyELP5Jbw
 +EDgaxnGTlqqhqXznoa83pgJKVD2xBuDY2pODVPb6f+VWV4KehNJAyuUPBKUYEqtKYzV
 ArTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=5Jpd8MyUKg1H1iYmLx0Vs/UrPW9/4+4JcaA/CtXlnF0=;
 b=FVeTGTGUHaDSRwKJ5xARdJkHQ9JnjVA5JcCFwrOfqHY/ZaWK+R9gl+y4sgG/XPGtO8
 7JMzMyT2+CGEZxv3sXnvEaT/9Fp0EXQPghx6T7Cb8Q8dg1N40Z7sRrYf8sgFcc46jR7f
 Yt2AeO7adc2WMwy28jNoRg1XqOL4/5Z77f3mC/s2HpZhnWLRFKbYd5DG4V64NS6ZrKjz
 oqLCU7OnKNe1f9VpQMLAd9msXi4Rud91oHOBNtiKINsGd6FgsY38N7RurI9bSLiN0p5C
 JhP9NfsISWPk12fAXjFHiuadxjmWmwobhLJgnhpngXaMJA+7jw6NvSK7v/EgMOEUCA8Q
 o6Kg==
X-Gm-Message-State: AOAM5333Zc++4bHixewgQB1s6a3sUceIFPB+uKh+l63smvPH9AYQPsg7
 TmaWdLZsR/WUVk61jyzEkaEWWy4LUWiBGg==
X-Google-Smtp-Source: ABdhPJxEXB65Krwh00LfzZlO3I9jG/KtFbZ7Mu9oyAgkhd2gkkr4etad3WlBVMAerho9PYjTH0M2eQ==
X-Received: by 2002:a5d:660a:: with SMTP id n10mr9662367wru.59.1604782574951; 
 Sat, 07 Nov 2020 12:56:14 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:7051:31d:251f:edd6?
 (p200300ea8f2328007051031d251fedd6.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:7051:31d:251f:edd6])
 by smtp.googlemail.com with ESMTPSA id r18sm8636088wrj.50.2020.11.07.12.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 12:56:14 -0800 (PST)
Subject: [PATCH net-next v3 09/10] ipv4/ipv6: switch to dev_get_tstats64
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
Message-ID: <ecb84c1d-985f-08e5-dc1f-c46e55615c50@gmail.com>
Date: Sat, 7 Nov 2020 21:54:33 +0100
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

Replace ip_tunnel_get_stats64() with the new identical core function
dev_get_tstats64().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 net/ipv4/ip_gre.c  | 6 +++---
 net/ipv4/ipip.c    | 2 +-
 net/ipv6/ip6_gre.c | 6 +++---
 net/ipv6/sit.c     | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index e70291748..a68bf4c6f 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -920,7 +920,7 @@ static const struct net_device_ops ipgre_netdev_ops = {
 	.ndo_start_xmit		= ipgre_xmit,
 	.ndo_do_ioctl		= ip_tunnel_ioctl,
 	.ndo_change_mtu		= ip_tunnel_change_mtu,
-	.ndo_get_stats64	= ip_tunnel_get_stats64,
+	.ndo_get_stats64	= dev_get_tstats64,
 	.ndo_get_iflink		= ip_tunnel_get_iflink,
 	.ndo_tunnel_ctl		= ipgre_tunnel_ctl,
 };
@@ -1275,7 +1275,7 @@ static const struct net_device_ops gre_tap_netdev_ops = {
 	.ndo_set_mac_address 	= eth_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_change_mtu		= ip_tunnel_change_mtu,
-	.ndo_get_stats64	= ip_tunnel_get_stats64,
+	.ndo_get_stats64	= dev_get_tstats64,
 	.ndo_get_iflink		= ip_tunnel_get_iflink,
 	.ndo_fill_metadata_dst	= gre_fill_metadata_dst,
 };
@@ -1308,7 +1308,7 @@ static const struct net_device_ops erspan_netdev_ops = {
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_change_mtu		= ip_tunnel_change_mtu,
-	.ndo_get_stats64	= ip_tunnel_get_stats64,
+	.ndo_get_stats64	= dev_get_tstats64,
 	.ndo_get_iflink		= ip_tunnel_get_iflink,
 	.ndo_fill_metadata_dst	= gre_fill_metadata_dst,
 };
diff --git a/net/ipv4/ipip.c b/net/ipv4/ipip.c
index 75d35e76b..d5bfa087c 100644
--- a/net/ipv4/ipip.c
+++ b/net/ipv4/ipip.c
@@ -347,7 +347,7 @@ static const struct net_device_ops ipip_netdev_ops = {
 	.ndo_start_xmit	= ipip_tunnel_xmit,
 	.ndo_do_ioctl	= ip_tunnel_ioctl,
 	.ndo_change_mtu = ip_tunnel_change_mtu,
-	.ndo_get_stats64 = ip_tunnel_get_stats64,
+	.ndo_get_stats64 = dev_get_tstats64,
 	.ndo_get_iflink = ip_tunnel_get_iflink,
 	.ndo_tunnel_ctl	= ipip_tunnel_ctl,
 };
diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 931b186d2..8cf659994 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -1391,7 +1391,7 @@ static const struct net_device_ops ip6gre_netdev_ops = {
 	.ndo_start_xmit		= ip6gre_tunnel_xmit,
 	.ndo_do_ioctl		= ip6gre_tunnel_ioctl,
 	.ndo_change_mtu		= ip6_tnl_change_mtu,
-	.ndo_get_stats64	= ip_tunnel_get_stats64,
+	.ndo_get_stats64	= dev_get_tstats64,
 	.ndo_get_iflink		= ip6_tnl_get_iflink,
 };
 
@@ -1828,7 +1828,7 @@ static const struct net_device_ops ip6gre_tap_netdev_ops = {
 	.ndo_set_mac_address = eth_mac_addr,
 	.ndo_validate_addr = eth_validate_addr,
 	.ndo_change_mtu = ip6_tnl_change_mtu,
-	.ndo_get_stats64 = ip_tunnel_get_stats64,
+	.ndo_get_stats64 = dev_get_tstats64,
 	.ndo_get_iflink = ip6_tnl_get_iflink,
 };
 
@@ -1896,7 +1896,7 @@ static const struct net_device_ops ip6erspan_netdev_ops = {
 	.ndo_set_mac_address =	eth_mac_addr,
 	.ndo_validate_addr =	eth_validate_addr,
 	.ndo_change_mtu =	ip6_tnl_change_mtu,
-	.ndo_get_stats64 =	ip_tunnel_get_stats64,
+	.ndo_get_stats64 =	dev_get_tstats64,
 	.ndo_get_iflink =	ip6_tnl_get_iflink,
 };
 
diff --git a/net/ipv6/sit.c b/net/ipv6/sit.c
index 5e2c34c0a..4dc5f9366 100644
--- a/net/ipv6/sit.c
+++ b/net/ipv6/sit.c
@@ -1396,7 +1396,7 @@ static const struct net_device_ops ipip6_netdev_ops = {
 	.ndo_uninit	= ipip6_tunnel_uninit,
 	.ndo_start_xmit	= sit_tunnel_xmit,
 	.ndo_do_ioctl	= ipip6_tunnel_ioctl,
-	.ndo_get_stats64 = ip_tunnel_get_stats64,
+	.ndo_get_stats64 = dev_get_tstats64,
 	.ndo_get_iflink = ip_tunnel_get_iflink,
 	.ndo_tunnel_ctl = ipip6_tunnel_ctl,
 };
-- 
2.29.2


