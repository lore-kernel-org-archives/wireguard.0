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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E298C56201
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:58:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F19120789
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sfcMSso4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F19120789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d48320f6;
	Mon, 9 Nov 2020 22:40:30 +0000 (UTC)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0996ead7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 14:28:49 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h62so2525104wme.3
 for <wireguard@lists.zx2c4.com>; Wed, 04 Nov 2020 06:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4rfiet18ZS0o4KG/dtF63+kbk0+HAV5dp9bIiGOx7/A=;
 b=sfcMSso4ZIjtzw+Jqb8eHi5oFWOCYuHZedzoLVlBFMW/sxgG00Nc+1+kdXJtQ1wFeK
 5AZmIvNBcO6P68XQ9UvidKMYuZImUVIQTLZHHMsyaYUVJ1yikHF5Hd9x9yPrTZfffgTm
 XqLF3s03M6QC1cRYtX716btEvouYkcwrKZZhzTYAYNARPONfVdTiIirM0Gvcj0sdjOXF
 tQQ8Qr7Q/ktvp0DJY50hyPUyPFfa8Esgm9ZqFiVD7j1P69NgsJ7+xlsow/SiOhFmlzkM
 daPqYy5+nrlehTHr520j0YUbEll5KpaLxnjHNCV3AsoYlHpiNv/cHIaLVSmiunqQwDvY
 5C7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4rfiet18ZS0o4KG/dtF63+kbk0+HAV5dp9bIiGOx7/A=;
 b=nHPkkto+IBsOK2d2jQn8/8oTPOXM8iVeyTWM3TELaCPcdUKGDwzt8+fOSPCQaTdCak
 7tOmJqyQvkb2GESl31wiO/4YgAeOmW+H3VuS7hGQRRihfQk/R+BD+DMIlgGk78EbGBvZ
 pNhK5aGZ9op8pP6LYi1qOBXC/9bkJmAfVD31og61IxmtRmdfeoSBRTiMDcBhRJi9IPHh
 J2c2MsirPRNNT/CQWuPqTD7Ds5/wJruItownFfz4o2gTIy+uz8FeX192e0k7i6XGajVL
 7r3JV7uijLXx4LwJHOSvGKSW6n7YAlbCRkt+nHS/ltPZ2w6l6VenvG8ZbxYK5D2xUUTU
 yjRA==
X-Gm-Message-State: AOAM5319doMDv1UHzQOzlg4ULuT7QudhyAlfY+9PsEnm+wgsozHff0Wq
 VADHS/zQc5VQCcZF/et5C8o=
X-Google-Smtp-Source: ABdhPJxI7VpXKJmZPAAzWLeHi6wM4l7xKzxiHLBrCNzzFeW86JBey7HQ+giLzYO7y6Ko67W2NU36yQ==
X-Received: by 2002:a1c:b387:: with SMTP id c129mr5161673wmf.66.1604500304441; 
 Wed, 04 Nov 2020 06:31:44 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:d177:63da:d01d:cf70?
 (p200300ea8f232800d17763dad01dcf70.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:d177:63da:d01d:cf70])
 by smtp.googlemail.com with ESMTPSA id 205sm2493118wme.38.2020.11.04.06.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 06:31:44 -0800 (PST)
Subject: [PATCH net-next v2 08/10] vti: switch to dev_get_tstats64
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
Message-ID: <fa3534fa-6f15-0dd1-c9f9-9598e6d1d0ea@gmail.com>
Date: Wed, 4 Nov 2020 15:28:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <059fcb95-fba8-673e-0cd6-fb26e8ed4861@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Replace ip_tunnel_get_stats64() with the new identical core fucntion
dev_get_tstats64().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 net/ipv4/ip_vti.c  | 2 +-
 net/ipv6/ip6_vti.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ip_vti.c b/net/ipv4/ip_vti.c
index b957cbee2..abc171e79 100644
--- a/net/ipv4/ip_vti.c
+++ b/net/ipv4/ip_vti.c
@@ -404,7 +404,7 @@ static const struct net_device_ops vti_netdev_ops = {
 	.ndo_start_xmit	= vti_tunnel_xmit,
 	.ndo_do_ioctl	= ip_tunnel_ioctl,
 	.ndo_change_mtu	= ip_tunnel_change_mtu,
-	.ndo_get_stats64 = ip_tunnel_get_stats64,
+	.ndo_get_stats64 = dev_get_tstats64,
 	.ndo_get_iflink = ip_tunnel_get_iflink,
 	.ndo_tunnel_ctl	= vti_tunnel_ctl,
 };
diff --git a/net/ipv6/ip6_vti.c b/net/ipv6/ip6_vti.c
index 5f9c4fdc1..b7b2bb27d 100644
--- a/net/ipv6/ip6_vti.c
+++ b/net/ipv6/ip6_vti.c
@@ -889,7 +889,7 @@ static const struct net_device_ops vti6_netdev_ops = {
 	.ndo_uninit	= vti6_dev_uninit,
 	.ndo_start_xmit = vti6_tnl_xmit,
 	.ndo_do_ioctl	= vti6_ioctl,
-	.ndo_get_stats64 = ip_tunnel_get_stats64,
+	.ndo_get_stats64 = dev_get_tstats64,
 	.ndo_get_iflink = ip6_tnl_get_iflink,
 };
 
-- 
2.29.2


