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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899E6C55ABD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:58:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C09FA2074F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:58:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eE8ak1TB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C09FA2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9a15e1d;
	Mon, 9 Nov 2020 22:40:29 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7191af99
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 14:28:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y12so22263435wrp.6
 for <wireguard@lists.zx2c4.com>; Wed, 04 Nov 2020 06:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ISdFe78IibjR0mRAQ86gBh/OHzTQrxaMboYtkFYsqpE=;
 b=eE8ak1TBDVXreX9muVNGINPPTvKoQUGUD0knZOHr+4cKU7tAK22S3ATaMp2kFxsxRy
 iiMxKWeDrIIOa6dXxEZmheaPMa7hXUAh4/BjqpaQDfLRVHSgPI+YYSvcYhpHfTHoLA5P
 wg2kho8HjLlH0ER5waUhPXWL7UvsSE/j6+h1ICFXEvcwE6nHlhA71k0EPzEyI4BEh8fE
 D9/Dw9aV15WdZbgs+6dF6oHQjVZPrvMdmqR3hbfxTeupHkARuPGWI/STHjm52TLbn2A3
 A3o4CVot3uA6ift59ypoE8kihX6cQlGv+OlXIPXLyF1MrYHykPZPGay7CfdBE1+FMAZc
 IRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ISdFe78IibjR0mRAQ86gBh/OHzTQrxaMboYtkFYsqpE=;
 b=AH/+XseBK4gkNCjlDLQmdd55eqSU329RIloMFwciOIurO5p3T1lRPBojt3utZNFYHX
 sRVZr6+ZIUp6NultkAf1Aqu2tf90iJYlUYEVMFvZneB1H8g8Bb2kjKhKmtC+y8FO/uDM
 18fbWDbN3VPkYOdBkqdLJIV/3JAUy5VTpziPGMdSPnxDgVUxzdc2p1kK6m1jN8WyJVGn
 LuU0ePaLiE9gBmWMXB0huA5mEOBw/k52dn7hYrQB597E7pVkKY4kkqRlAMsgGNFYODe2
 kvGC/kzGdso5L+7ECqk3bFmtMNQJQFizs1T9UbQmTdATDFsGnJOsOLHoHQKVnoJlNjEO
 MkEw==
X-Gm-Message-State: AOAM532TBAw/GA/pU3jjgJZgUKadSgVLMabd6JT+vp86kyX2fp0V8yWV
 /Z2yHivu2OFaKF/DAz7JJYfqN+InBIfGyw==
X-Google-Smtp-Source: ABdhPJyTmgp2E3e/UB8WuI4mAejZD7B4seUjChiV1gJQIko6Xt6GU+2OLu3kC+3iK9h4fWeGCnAcTA==
X-Received: by 2002:adf:fa8a:: with SMTP id h10mr32097178wrr.336.1604500302448; 
 Wed, 04 Nov 2020 06:31:42 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:d177:63da:d01d:cf70?
 (p200300ea8f232800d17763dad01dcf70.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:d177:63da:d01d:cf70])
 by smtp.googlemail.com with ESMTPSA id f17sm2938117wrm.27.2020.11.04.06.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 06:31:42 -0800 (PST)
Subject: [PATCH net-next v2 07/10] wireguard: switch to dev_get_tstats64
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
Message-ID: <4f731535-2a51-a673-5daf-d9ec2536a8f8@gmail.com>
Date: Wed, 4 Nov 2020 15:28:22 +0100
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


