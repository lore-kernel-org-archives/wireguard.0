Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8D3C2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:13:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CAE5206ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o5FYj6Zm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CAE5206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c99c77d4;
	Mon, 9 Nov 2020 22:40:42 +0000 (UTC)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ceda0aa8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Nov 2020 20:52:51 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h2so4658901wmm.0
 for <wireguard@lists.zx2c4.com>; Sat, 07 Nov 2020 12:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=AqDWLm8KXcv4xkeQId6Y5dIQy0TCTVRseOitm1HQ4jk=;
 b=o5FYj6ZmqzBJ/ivWXmw0usJBDgDyyPssyFiWvYojyryyHUVaxlpBIQhvTj0d2Jq46B
 D4l6vk4/QpxizZ6JJIf4O+b9j9HczFpBN9Dp+3gjzE+KhmPmswcwvzRV2ii2pGLFA+EA
 E7G3Dbvisgrnj9ADNpesPuq+eZ2nC2ZGAeyvXy6oYtn4C0/ZFEoQH+TjIZ/l3LwXgLah
 vPICg7OrR0m4VJFzt5Sss0lLh9jYwlhwLyjOM1jdjADV559ro+xLH9PxXGoCCLXXXkgG
 slazgJif12aQ9AHHPTuSTpsKyr7QyeihdsP1HuT+fte/J8U/393MV7tBDF3ETCI5AiD2
 75xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=AqDWLm8KXcv4xkeQId6Y5dIQy0TCTVRseOitm1HQ4jk=;
 b=jgQbQIzurv2g9nsP9r/1xv5nHi6HZNdk2W9ZL5b+28eyz/OOYDTuCNDNEes4GuTheM
 257wJddgy8HbZ0UA1Tv0BBPjwFsCW0pyk2ITMHmOj42PkkKpcRjI/bydZRkouAOZ6Nla
 h4oByn69rGEBNTY/fGtLqrI/euoObmo183eXl1Z83AmQrJxQmOwQSF/Sk48qsGdx90ZR
 6z8AfrjyaVuUGinhaDL5ZRmd2CXiWzlmeCjpe0HZLLxbQviB1Hv5u44L0UGCPFjlbhQc
 kWSL110/fbnxsbHpdtxvVVCrdntjDBDXHnFeyz2Md0MWGw8i+bUhm7fyuQ0I5am9sB00
 c1lA==
X-Gm-Message-State: AOAM530FYgFv+2QubpCXlR0Mj69eRgM1lCZYwZDDCu2ZYSm4Cm5sPBVA
 Xl/x7gxL1Z9nSI2pRIPeXg0=
X-Google-Smtp-Source: ABdhPJxKbOxtoWrYoXQo5USaK5yvt3T+8kM2r5oGGLK/j28grM6DP89KLS6rfO4/loYh1jJmON/rnA==
X-Received: by 2002:a1c:8145:: with SMTP id c66mr6258741wmd.75.1604782571875; 
 Sat, 07 Nov 2020 12:56:11 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:7051:31d:251f:edd6?
 (p200300ea8f2328007051031d251fedd6.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:7051:31d:251f:edd6])
 by smtp.googlemail.com with ESMTPSA id 71sm7973217wrm.20.2020.11.07.12.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 12:56:11 -0800 (PST)
Subject: [PATCH net-next v3 07/10] wireguard: switch to dev_get_tstats64
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
Message-ID: <79e9a040-c097-1d33-8de1-4833f1c68828@gmail.com>
Date: Sat, 7 Nov 2020 21:53:19 +0100
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

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/wireguard/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index c9f65e96c..a3ed49cd9 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -215,7 +215,7 @@ static const struct net_device_ops netdev_ops = {
 	.ndo_open		= wg_open,
 	.ndo_stop		= wg_stop,
 	.ndo_start_xmit		= wg_xmit,
-	.ndo_get_stats64	= ip_tunnel_get_stats64
+	.ndo_get_stats64	= dev_get_tstats64
 };
 
 static void wg_destruct(struct net_device *dev)
-- 
2.29.2


