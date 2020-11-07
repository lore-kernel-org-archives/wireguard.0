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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520A3C4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:13:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 886E1206ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:13:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJEhCtHm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 886E1206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 616ca1bd;
	Mon, 9 Nov 2020 22:40:40 +0000 (UTC)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 47c3cc77
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Nov 2020 20:52:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p22so4654227wmg.3
 for <wireguard@lists.zx2c4.com>; Sat, 07 Nov 2020 12:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=9u7gkvbf7OAMj3VbHYAxPHRbbiyrawvYfgWlZZDK0zE=;
 b=fJEhCtHmlnLGk1K+M8mWEvAED1FqUFenR/e+JruBYbUZ+Ky5AnTDD3+ZidHthDuGjb
 Vo/SxgBXLRzxL/hEu974GnftkbsgbK5pqXtxcpH1wsSVLMb9n/5xxj+BcgOvxsneoSM1
 WD7KO8UypAPuCLDsweZsKXSJYY5xSKSDf4EOA29lYUoLfSms1H7FUL/WkH7OyvomMn0U
 +PqquUNlMeOsYY0AyT4YHUBeBZ3nMur06FSzkosUv8frTTjHImfhVQUnLFNaCHAWLzS3
 D7uErdJijTD9+q75MaHjg5QQuSbjcAvvBhC64U5bwqJBEovDmt1CiCEAg/TNC5nBoq8w
 EnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=9u7gkvbf7OAMj3VbHYAxPHRbbiyrawvYfgWlZZDK0zE=;
 b=p6Gz83tnIFdvoXAbyn5zKJQFIlbfk4vsIJpHpmgju2bKZqZpBviTRiX83LGvWSJiHA
 NEvX1VkHUuFNJDNkPRRkvpJJ26ZnCjcrNPZPwyBGFVI6eJGmDWSrUhFY9QoNtIQ7aEIW
 AyjV97vLk5muqNMLR1bSVlLlA6rRTlDRGSSBrbqV9Tty7iSicmfn8MfOEe5asXkFCd0L
 4Vv+k0/SHAL4dkvbb3LNYGfL3QKslW5pU0OWX8WnW7R/78b8HzozMNOierHu7LuQn5ln
 lMSvj0eqkrJnxVbz0u5mw+BPYowebSP18i39pnNabSoYD+1i/TyMcwdsT6lL/8oOKkZ3
 DJJw==
X-Gm-Message-State: AOAM530KMJ+1Y68uhC8PmM5yBz+AHmWKUtXe2F2+22kMGKTCRkk0MySp
 VXODLsG0oO/vyHJGB8O6SKM=
X-Google-Smtp-Source: ABdhPJwEwwyfYVztu4FFL23KSdp10USFTuqtpP6crdBu6ZsT0zxjx2DhnceuzpR9h8nB60bGHAbyFg==
X-Received: by 2002:a7b:c8c9:: with SMTP id f9mr6112537wml.3.1604782568997;
 Sat, 07 Nov 2020 12:56:08 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:7051:31d:251f:edd6?
 (p200300ea8f2328007051031d251fedd6.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:7051:31d:251f:edd6])
 by smtp.googlemail.com with ESMTPSA id t2sm8347163wrq.56.2020.11.07.12.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 12:56:08 -0800 (PST)
Subject: [PATCH net-next v3 05/10] net: switch to dev_get_tstats64
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
Message-ID: <0f7cd95e-896d-2313-88e8-e0af23d011bb@gmail.com>
Date: Sat, 7 Nov 2020 21:52:06 +0100
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
 drivers/net/bareudp.c | 2 +-
 drivers/net/geneve.c  | 2 +-
 drivers/net/vxlan.c   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/bareudp.c b/drivers/net/bareudp.c
index ff0bea155..28257bcce 100644
--- a/drivers/net/bareudp.c
+++ b/drivers/net/bareudp.c
@@ -510,7 +510,7 @@ static const struct net_device_ops bareudp_netdev_ops = {
 	.ndo_open               = bareudp_open,
 	.ndo_stop               = bareudp_stop,
 	.ndo_start_xmit         = bareudp_xmit,
-	.ndo_get_stats64        = ip_tunnel_get_stats64,
+	.ndo_get_stats64        = dev_get_tstats64,
 	.ndo_fill_metadata_dst  = bareudp_fill_metadata_dst,
 };
 
diff --git a/drivers/net/geneve.c b/drivers/net/geneve.c
index d07008a81..a3c8ce6de 100644
--- a/drivers/net/geneve.c
+++ b/drivers/net/geneve.c
@@ -1138,7 +1138,7 @@ static const struct net_device_ops geneve_netdev_ops = {
 	.ndo_open		= geneve_open,
 	.ndo_stop		= geneve_stop,
 	.ndo_start_xmit		= geneve_xmit,
-	.ndo_get_stats64	= ip_tunnel_get_stats64,
+	.ndo_get_stats64	= dev_get_tstats64,
 	.ndo_change_mtu		= geneve_change_mtu,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address	= eth_mac_addr,
diff --git a/drivers/net/vxlan.c b/drivers/net/vxlan.c
index 876679af6..0de912729 100644
--- a/drivers/net/vxlan.c
+++ b/drivers/net/vxlan.c
@@ -3211,7 +3211,7 @@ static const struct net_device_ops vxlan_netdev_ether_ops = {
 	.ndo_open		= vxlan_open,
 	.ndo_stop		= vxlan_stop,
 	.ndo_start_xmit		= vxlan_xmit,
-	.ndo_get_stats64	= ip_tunnel_get_stats64,
+	.ndo_get_stats64	= dev_get_tstats64,
 	.ndo_set_rx_mode	= vxlan_set_multicast_list,
 	.ndo_change_mtu		= vxlan_change_mtu,
 	.ndo_validate_addr	= eth_validate_addr,
@@ -3230,7 +3230,7 @@ static const struct net_device_ops vxlan_netdev_raw_ops = {
 	.ndo_open		= vxlan_open,
 	.ndo_stop		= vxlan_stop,
 	.ndo_start_xmit		= vxlan_xmit,
-	.ndo_get_stats64	= ip_tunnel_get_stats64,
+	.ndo_get_stats64	= dev_get_tstats64,
 	.ndo_change_mtu		= vxlan_change_mtu,
 	.ndo_fill_metadata_dst	= vxlan_fill_metadata_dst,
 };
-- 
2.29.2


