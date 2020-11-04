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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF40C2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:58:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DA2420789
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gydV31gZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DA2420789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c7a35ed;
	Mon, 9 Nov 2020 22:40:28 +0000 (UTC)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 468261b7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 14:28:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p1so3113859wrf.12
 for <wireguard@lists.zx2c4.com>; Wed, 04 Nov 2020 06:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xp6oy8hFijEmY9NkC9fHkoFa4aR3nW13I4ZttL2CY1s=;
 b=gydV31gZS7M+j5E46kP9AIaz8+BM5M32QpZbH/YNlCKoV/ZpmW6d81ZlDl2VCcdXas
 tKYGkBIlQGA4J/CbWlOD8h++H0zwu4ZMdKjneqQBTk6hR54YzL6GFu2A2dc4UAKXFEIU
 BAW+1cFOjFLDoecjZWP9OJcXLKm3C07PCk8C6MmUXxJE+c8pytKWDMQ1VuYizJNkaiKS
 DxOaZ4BIo72zZ0QtJ+JPj5v5eu8sRpTOynCk2lo5W0guQPj9DoTFQom2CXoQBP74e2w6
 4c3ALEpoidWzuDh9nyOiIDPnpPTeDpp+rxcN9yTFS8ajTAUcfCVRP/P5YKsoIWfD2nRS
 ZX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xp6oy8hFijEmY9NkC9fHkoFa4aR3nW13I4ZttL2CY1s=;
 b=MrG4UTsK0Lri8nZdUEso3UR6tKY+fr2Zq53JcRBbrbuVOfxZWHp1OuuOtL3CtHU5Ws
 JCKn5KD0IviEZ5u1nZRnaJtz56WT/HluMpUVbrk4c7dVi14PYhy/lToBBnEvP6hZLW+2
 oQ4Xz032MzNrYeoqLMtYsN+xsim0+73cZmWh3gM75biyxjwcwHA2QMAeRh5zOBxEDe93
 gaO+LAhuA0Isf65IcsVyVrH4Bh5d4nIQ3u+kI12FSiimcddGb700/kHoFdR92lAJM/Gb
 JUN+8zWMny2Bi7R3P4+DEbzOcGNK5fd+vFqSoHKNyL7utLjENlP63eHOjF26yRrWVfD5
 zUCA==
X-Gm-Message-State: AOAM530MhjCNwfZ0+yCmVxJAWQTuHwZX4LMyCPO2wTDl0N4bEe6eopsi
 LGVS601h/zn5QiikDAn21zU=
X-Google-Smtp-Source: ABdhPJyvvhuRWzQmFq7CIZ0Iq/4dBo0VuuTGRZ7iy05CIxTO7DdreWemTSw/gAg+68JIxl2poVPGKA==
X-Received: by 2002:adf:dec1:: with SMTP id i1mr30822590wrn.50.1604500301068; 
 Wed, 04 Nov 2020 06:31:41 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:d177:63da:d01d:cf70?
 (p200300ea8f232800d17763dad01dcf70.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:d177:63da:d01d:cf70])
 by smtp.googlemail.com with ESMTPSA id t12sm2976964wrm.25.2020.11.04.06.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 06:31:40 -0800 (PST)
Subject: [PATCH net-next v2 06/10] gtp: switch to dev_get_tstats64
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
Message-ID: <52d228fe-9ed3-7cd0-eebc-051c38b5e45f@gmail.com>
Date: Wed, 4 Nov 2020 15:27:47 +0100
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
 drivers/net/gtp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index dc668ed28..4c04e271f 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -607,7 +607,7 @@ static const struct net_device_ops gtp_netdev_ops = {
 	.ndo_init		= gtp_dev_init,
 	.ndo_uninit		= gtp_dev_uninit,
 	.ndo_start_xmit		= gtp_dev_xmit,
-	.ndo_get_stats64	= ip_tunnel_get_stats64,
+	.ndo_get_stats64	= dev_get_tstats64,
 };
 
 static void gtp_link_setup(struct net_device *dev)
-- 
2.29.2


