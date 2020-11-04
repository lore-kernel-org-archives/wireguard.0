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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F56C2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:01:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86BA42067C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:01:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gfkh6YfC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86BA42067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64b90790;
	Mon, 9 Nov 2020 22:40:32 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 319f7192
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 14:28:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s9so22254109wro.8
 for <wireguard@lists.zx2c4.com>; Wed, 04 Nov 2020 06:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K0xwbWgfzNb+siGOnTIoHV8a22y8LDX4Jm2bW67sNRs=;
 b=Gfkh6YfCE72+ydlSJ/wl7fWmXAUOkTbF24ca29DtpQjcRnzH2tuzCLv3xTT37WI3E1
 ADY32e7KnYdz09JC2n7Ffr6URAzF0HDjz3MxA71JqOiTjEJKepuLYN7K9nZmvk90RRF5
 bZvEQXcMAZxU5w4Fq/D2ZYzLxto9L/ffmiYoUHwmxRx3xQJCsnyQm0R1J82N+6Qv96lg
 4L6uz/yaCUq28ORAzFXzKYqwYUAI4KFP3Xe+fN5bYN+SO0YZxbxQqMmXL0vXA4KoP5PA
 iu5k47/kJGsNgbsFX6Pl/x+Ll9JjfG9MKhHtPAPufCLMKlT9HNlOfqHZVL1eALx65NZ8
 TmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K0xwbWgfzNb+siGOnTIoHV8a22y8LDX4Jm2bW67sNRs=;
 b=LXZWWFhxUwJx/NBmDf8Vnhha0oM/OxxALK9wguxtwDBVqhHPAZ09CdIbAWvyQW4IBR
 R8GEQa3TvE+ZpYqrRxayJUtddpU+8kNgOoAZSA3Xbw2H18VOZb6yVzpRtqIV9dLKUSOP
 tPbtBgO0G/slwv4oaBZMqEKEuRoHvMGbGWlCXMW6J+czprCDYLC51myCkd51TtNmM6b1
 DBd2PNbLoBaM78oDNomOqap8elLM1PVZcgVXINWMlhrNddiyh3GvKxHUnARhaxjvHGoC
 s7ldTLan/YHfOwDX4T/Af6v6kzTlkQlF5k2JLXS0UHY2qnCiDK912U3HbhyGm+TmYD3Z
 FWHA==
X-Gm-Message-State: AOAM531LWEzVDilfcB5L6dVKAi/EFnSjDpVHsChH4JlmJBqBrkSh7jTe
 yWdOsAfMLa2oGucB37fvUgI=
X-Google-Smtp-Source: ABdhPJwl5X8jvdS+mUXZcO0Nb3rEd3NCzr93XMi5XApyMil2tE6bG73j3OHe5qt6fBIyVpvdh0u7gw==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr5595878wrs.100.1604500307652; 
 Wed, 04 Nov 2020 06:31:47 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:d177:63da:d01d:cf70?
 (p200300ea8f232800d17763dad01dcf70.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:d177:63da:d01d:cf70])
 by smtp.googlemail.com with ESMTPSA id k84sm2508318wmf.42.2020.11.04.06.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 06:31:47 -0800 (PST)
Subject: [PATCH net-next v2 10/10] net: remove ip_tunnel_get_stats64
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
Message-ID: <1d40c040-7b4b-9531-2cb0-0e8e3f954e25@gmail.com>
Date: Wed, 4 Nov 2020 15:31:02 +0100
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

After having migrated all users remove ip_tunnel_get_stats64().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/net/ip_tunnels.h  | 2 --
 net/ipv4/ip_tunnel_core.c | 9 ---------
 2 files changed, 11 deletions(-)

diff --git a/include/net/ip_tunnels.h b/include/net/ip_tunnels.h
index 02ccd3254..1b7905eb7 100644
--- a/include/net/ip_tunnels.h
+++ b/include/net/ip_tunnels.h
@@ -274,8 +274,6 @@ int ip_tunnel_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd);
 int __ip_tunnel_change_mtu(struct net_device *dev, int new_mtu, bool strict);
 int ip_tunnel_change_mtu(struct net_device *dev, int new_mtu);
 
-void ip_tunnel_get_stats64(struct net_device *dev,
-			   struct rtnl_link_stats64 *tot);
 struct ip_tunnel *ip_tunnel_lookup(struct ip_tunnel_net *itn,
 				   int link, __be16 flags,
 				   __be32 remote, __be32 local,
diff --git a/net/ipv4/ip_tunnel_core.c b/net/ipv4/ip_tunnel_core.c
index 25f1caf5a..923a9fa2e 100644
--- a/net/ipv4/ip_tunnel_core.c
+++ b/net/ipv4/ip_tunnel_core.c
@@ -429,15 +429,6 @@ int skb_tunnel_check_pmtu(struct sk_buff *skb, struct dst_entry *encap_dst,
 }
 EXPORT_SYMBOL(skb_tunnel_check_pmtu);
 
-/* Often modified stats are per cpu, other are shared (netdev->stats) */
-void ip_tunnel_get_stats64(struct net_device *dev,
-			   struct rtnl_link_stats64 *tot)
-{
-	netdev_stats_to_stats64(tot, &dev->stats);
-	dev_fetch_sw_netstats(tot, dev->tstats);
-}
-EXPORT_SYMBOL_GPL(ip_tunnel_get_stats64);
-
 static const struct nla_policy ip_tun_policy[LWTUNNEL_IP_MAX + 1] = {
 	[LWTUNNEL_IP_UNSPEC]	= { .strict_start_type = LWTUNNEL_IP_OPTS },
 	[LWTUNNEL_IP_ID]	= { .type = NLA_U64 },
-- 
2.29.2


