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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2DAC4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:53:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E957D206CB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:53:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDvTxo3+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E957D206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee450b83;
	Mon, 9 Nov 2020 22:40:25 +0000 (UTC)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 35e68d49
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 14:28:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 205so2515876wma.4
 for <wireguard@lists.zx2c4.com>; Wed, 04 Nov 2020 06:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BnTgwBVz1ZO0k7LKVJSAZVBIqGzXjGz0VSRBSuIyloc=;
 b=dDvTxo3+AsEj/68Cdlgde2+BjLBZtLbTGzssWfAMt7CVcHxDGfCSYr2m2FXQ6zaHTJ
 Ue3bzwa8izCGvHqwNbZpDhBhhQ5w4+ENVUurLKAup8fKMuRCMqH2unqBZQ6774R7au3c
 93AbS4hpboSpLVGPdiQJhi82QknvuotS2nohKFWGZ83ZB5owLORKtYSxLY7EbbOiclTH
 uF2jzRf6GLVyINzmhmHTjt831zyw00Djd6H5sMh76hpc0Vm+yXLkDOiF27nS9hixOPBb
 PSTbMImmgf07tW49LLP0SWTqtr+PZOUvA4XO5MKGeTvihcOP4VUNKJj5g5uoKH6jPA81
 NUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BnTgwBVz1ZO0k7LKVJSAZVBIqGzXjGz0VSRBSuIyloc=;
 b=p6BdzaUmQYROgFofPa+sE1pG+sTlNiF+AK/UbTK1XWnyt2dw2aRClOzqWa7hX3/RJq
 0oHELp6paMorSOyAeRbRQ2XtGSGjE/+VDboE0kq22wJDw+rp55pNxrKW8qQppp0ET10V
 IM8CCltUOl/rZ/fN6iW5Wz2IJTY2ZPE6/pCGBUT1fsH0q6PmLuikAveighq92saKfj8i
 CTfcQ/8pNocFOF9cA09cex6XBdfb/c7DeWeZ2oLTwgCvAcVjSSdGnCFkFhIAGsO8G/XE
 kbS+L6KGyt8iwad72wDoKx+A3Rp9q2ktMRrn8Wj7CtS6TaUsvhmSjwiXy/dsB0qsBzkj
 WX0Q==
X-Gm-Message-State: AOAM532gx2GtZLpBaPal26M4iERkEtMI0ZwVFqwbNE8T7nhHvqhoaGv+
 AxSjMwELEszFmQEfY4A01O4=
X-Google-Smtp-Source: ABdhPJzPGzBMF8LcdUpb79YVk6qku4r3FsMQ57O6u0bisOkeVnWRROLBrmu7Qwyz8Odq+Ndv/P4vMw==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr3544932wmb.175.1604500299569; 
 Wed, 04 Nov 2020 06:31:39 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:d177:63da:d01d:cf70?
 (p200300ea8f232800d17763dad01dcf70.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:d177:63da:d01d:cf70])
 by smtp.googlemail.com with ESMTPSA id t1sm2932329wrs.48.2020.11.04.06.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 06:31:39 -0800 (PST)
Subject: [PATCH net-next v2 05/10] net: switch to dev_get_tstats64
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
Message-ID: <b34e90dd-1297-a43d-a195-a6342abcf159@gmail.com>
Date: Wed, 4 Nov 2020 15:27:12 +0100
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

Replace ip_tunnel_get_stats64() with the new identical core fucntion
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
index 1a557aeba..cb9930595 100644
--- a/drivers/net/vxlan.c
+++ b/drivers/net/vxlan.c
@@ -3210,7 +3210,7 @@ static const struct net_device_ops vxlan_netdev_ether_ops = {
 	.ndo_open		= vxlan_open,
 	.ndo_stop		= vxlan_stop,
 	.ndo_start_xmit		= vxlan_xmit,
-	.ndo_get_stats64	= ip_tunnel_get_stats64,
+	.ndo_get_stats64	= dev_get_tstats64,
 	.ndo_set_rx_mode	= vxlan_set_multicast_list,
 	.ndo_change_mtu		= vxlan_change_mtu,
 	.ndo_validate_addr	= eth_validate_addr,
@@ -3229,7 +3229,7 @@ static const struct net_device_ops vxlan_netdev_raw_ops = {
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


