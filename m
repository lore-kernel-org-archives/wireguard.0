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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80735C56201
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:13:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D27AE2074F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRzVwR3V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D27AE2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a9b7b43;
	Mon, 9 Nov 2020 22:40:42 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ad80a61d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Nov 2020 20:52:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d12so3311255wrr.13
 for <wireguard@lists.zx2c4.com>; Sat, 07 Nov 2020 12:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=yvM2zg5ut8RUlOVk41NO5JTWXGYDPLj6ZinwUBXZBNs=;
 b=YRzVwR3VOYv79vPIg8b5EIMmKfgP9mn6DbFAnIRAS1gmfNezyjCF4Gp2ABv/iexY3a
 dKnhzyqA48zVqgBgGCmQei1DZ8f9ASml4KMnqwLfEJpWlOMwSmuP5jOsALlsXJafzAjD
 zuBbbALWsNykrRr2QmM4AzSRGDDjOfmFo1Esj7ImMCkohjQdAJQb379jo0AV7iO2yD3X
 ifDXNDILYUmNb1GJ7t7N2m03O3aIaSTWC1vQewDKZUD6hi9tiN9g4UZ5VBZB9MKcqQu0
 Lv21zMIYq7RAq7ugKnUMH4PYEz7op6bSiqGx1MzWNZTEhIwLuBfAkIA8WMhxK/3r9jFN
 umbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=yvM2zg5ut8RUlOVk41NO5JTWXGYDPLj6ZinwUBXZBNs=;
 b=NhSbRv90ggfrNfTENTvBBB3ur08uA/wGOPnqW4q1DUekA1gatsiszU3rL1zSqgVpm4
 AtDOpl/jJsCFRwW9XHZgdJVi9WyfKC6gfc2Aa01vdnvqdbwzOwzSF4UKTzUa/xgX8SOQ
 wB5kZ0xrzMe3m0DPLbgnr6dJBY1gUVhnuWsOKVkMXfGnsG1eHENje3n9PBgEZ+bSDvfP
 P5ADlL/akotPTkW4IHWg0mSHnMBUK169fT1LiXESmZma1rNeTVzo+qDQkCg9CFeWfYGx
 1bogtf8gI3/tR9C+f+RN5pa4QMu6dzPNOWAge2VoWnbjEN+/03eIaemvXDegJJjoH/xY
 6NDQ==
X-Gm-Message-State: AOAM533P5EQdMdtPwBAp7LkNqkexPbonDxdoRmAqCatOFfKdB/uk6PS0
 ee5Iy1LbddgDGsQRA0VKDXM=
X-Google-Smtp-Source: ABdhPJzPITSO0TWNyqU0r8yAlKSviyXbqz+nk7MVBML4BCNfoFAcyBZ0IWsUQ0/EoAtu4hmMZ4NIvg==
X-Received: by 2002:adf:9069:: with SMTP id h96mr10064659wrh.358.1604782573402; 
 Sat, 07 Nov 2020 12:56:13 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:7051:31d:251f:edd6?
 (p200300ea8f2328007051031d251fedd6.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:7051:31d:251f:edd6])
 by smtp.googlemail.com with ESMTPSA id q7sm7128217wrg.95.2020.11.07.12.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 12:56:12 -0800 (PST)
Subject: [PATCH net-next v3 08/10] vti: switch to dev_get_tstats64
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
Message-ID: <f8d8efd4-1bb7-a37f-1c64-23e06538f66a@gmail.com>
Date: Sat, 7 Nov 2020 21:53:53 +0100
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
index 46d137a69..0225fd694 100644
--- a/net/ipv6/ip6_vti.c
+++ b/net/ipv6/ip6_vti.c
@@ -890,7 +890,7 @@ static const struct net_device_ops vti6_netdev_ops = {
 	.ndo_uninit	= vti6_dev_uninit,
 	.ndo_start_xmit = vti6_tnl_xmit,
 	.ndo_do_ioctl	= vti6_ioctl,
-	.ndo_get_stats64 = ip_tunnel_get_stats64,
+	.ndo_get_stats64 = dev_get_tstats64,
 	.ndo_get_iflink = ip6_tnl_get_iflink,
 };
 
-- 
2.29.2


