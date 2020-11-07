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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26237C55ABD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:13:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54FB22074F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:13:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uA5w57RM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54FB22074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b51abc4;
	Mon, 9 Nov 2020 22:40:41 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 24971814
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Nov 2020 20:52:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x7so4829936wrl.3
 for <wireguard@lists.zx2c4.com>; Sat, 07 Nov 2020 12:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Cwoypn5vRWqLZ2PmtMFZW4bqe7uU2Xj951rJyZK/u3Y=;
 b=uA5w57RM7ywgt18FMf7D07PvnAQtTEODfa2EnI6V8xiVWq1azn63B5H3f/h7JvfmVE
 9kw/Z2MntQAZrHD25To8ecfavAJmdurMwqo7NJoEmbaukXBRbLxE3hEPpOf8P8QI/4Yu
 fCpgIhffGoFGpMpfU93I7DnmpAHrtz7RmrX26q3ORmV6R2soMmTE7KRxgSGOgYBo2ZhG
 PqoFLhKuoaxhmuxXnLefBr2MTi3QfTxyZledB5nAnj5STh9V+YbidbuRITpWn3mCLiBW
 HOCczSjxX20LSmLXwuQuL5cR7SeURMkZC/H1y5sSpLE8IHRDjQLmcj+PgV625rdwzSH3
 9Wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=Cwoypn5vRWqLZ2PmtMFZW4bqe7uU2Xj951rJyZK/u3Y=;
 b=TLUFHLyxz8cHMI50fC2bG24BLCABwxFQKsDaey9a36/y+W25P+gBHLuSEwE6hSioKE
 KDa4RjR/GDbEHfixx6whkuzttnxSal+98ins5equuNytFhrMir4Dlirqa6YmPZBlQ+GN
 OIJC6IJ4nzjfCO/Y9KiRKQfCZcDTRcO9KcnRl4L0rWJAN9IHwwt3WIERuUAvUcyhOren
 6FXZnr+F9I5o8PFoOSZpI1DFwaTX6Ht9OWH7K5u7BZC9PKnlg1cIJpemD19KS0uB6P01
 Q0fvjIGP7igImAqbs1u/Juee+8+M2G3fVWflvqELbPLTsly5CdsXwbgxGMHV2YAsn3Ok
 huZg==
X-Gm-Message-State: AOAM530YFl8/Do4nAYXD5vAgVBEwCPoXWpIU4sAM+8wn/kD+9cMsThf5
 WnGC5CTLl2gD01gbcmlGZniWnjibCgWerQ==
X-Google-Smtp-Source: ABdhPJy+e7yZL/cGFNMAeW5k7SlR5OQlFSoecym4Sj3wK2vqyInV36SGAAig7CT7aCgs0IhJVqxFPw==
X-Received: by 2002:a5d:4c4f:: with SMTP id n15mr9172276wrt.137.1604782570439; 
 Sat, 07 Nov 2020 12:56:10 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:7051:31d:251f:edd6?
 (p200300ea8f2328007051031d251fedd6.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:7051:31d:251f:edd6])
 by smtp.googlemail.com with ESMTPSA id u10sm7901369wrw.36.2020.11.07.12.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 12:56:10 -0800 (PST)
Subject: [PATCH net-next v3 06/10] gtp: switch to dev_get_tstats64
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
Message-ID: <e8b41c0a-e86d-b86a-28fa-4872d3f47a43@gmail.com>
Date: Sat, 7 Nov 2020 21:52:42 +0100
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

Acked-by: Harald Welte <laforge@gnumonks.org>
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


