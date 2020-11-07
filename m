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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228B4C5517A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:05:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7772620789
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:05:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9SDmQWk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7772620789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d01aa1f;
	Mon, 9 Nov 2020 22:40:36 +0000 (UTC)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0102c747
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Nov 2020 20:52:42 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t67so135824wmt.5
 for <wireguard@lists.zx2c4.com>; Sat, 07 Nov 2020 12:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=DYRIQMTMgtclfC11ma0PcCZtnRPkZKmVXTdnNGEHpbU=;
 b=R9SDmQWkuWHnfgtqv7Ufkk2HRy0GaLhEEYkHaTvRjlowbgX0La+ML68VcuQOHxhjNN
 PcX5tkZKLnlrWLIN6Q6IcrTUrWcOyWc60GQNr4LVonFEBgs1nDaNFHJ9pIIeJRb5vS5+
 pc1oWRBO4ZPnGcw+xeRIXW8hCRBqVEMvp/nPFe3p1S0H5nknnXRVx1aMl+B6SMeU5zUS
 r79fPNCRov3Y10SRZt9msJhE1PeaPBSHnGb33PZK3RosLrWEOK0XMP8sMac68OtNHIJV
 PxcNkv+P4097VC9S2B4s0j93aTrSv7sliC1kuodARUkD9K0dfgR76eWjlsKAysUYcbXn
 EL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=DYRIQMTMgtclfC11ma0PcCZtnRPkZKmVXTdnNGEHpbU=;
 b=hVugycYOWNM2iz+GDIBpeW5kP2QIvpFWbChW+NkaIOutI20Qs+S1jaaG+n2bUO66Xs
 KbG6QnIzZ2zQjtkKBlD6eqglGgxTVj5xAqr0kFlsvlucHtIKdsBwGRuJglaZDW2ryvkv
 ro6LU3qJJNhXeHKQ9TwNT6yKDnFcD/XnX6xzL47naoDuRJEw7c9mXZAzql6IAF19+fPp
 Ra4DHGkmBh6n+We2IwNtbmlBVrPrSW53qzFBddwEKK0DFXRo/KgOWx0OmeG9BZQh3P8I
 6I9cxs4ImnVNvNjYGIQjr31DMYwLj1ThIUxUGTDgRBe9xKEs+13N2j9K7s5ME0EBtbeM
 gYtA==
X-Gm-Message-State: AOAM530SXqcEi7WGuz6NsXVRKKGqW0035a/ivgS/OpP2oi7681o2oHh4
 mFhjlmj4+GPSF+9tDrzpJ7A=
X-Google-Smtp-Source: ABdhPJwZYHop1A1l8S0GAY1Ccs9RLvW4wC3U+CFi/wgoe1MRqwMrnejznW8okpPfxgKH5UbwYcLWOw==
X-Received: by 2002:a1c:6284:: with SMTP id w126mr6532465wmb.145.1604782563027; 
 Sat, 07 Nov 2020 12:56:03 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:7051:31d:251f:edd6?
 (p200300ea8f2328007051031d251fedd6.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:7051:31d:251f:edd6])
 by smtp.googlemail.com with ESMTPSA id p4sm7611551wrm.51.2020.11.07.12.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 12:56:02 -0800 (PST)
Subject: [PATCH net-next v3 01/10] net: core: add dev_get_tstats64 as a
 ndo_get_stats64 implementation
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
Message-ID: <484218db-e035-dba4-dfb7-93c2cf177cec@gmail.com>
Date: Sat, 7 Nov 2020 21:49:07 +0100
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

It's a frequent pattern to use netdev->stats for the less frequently
accessed counters and per-cpu counters for the frequently accessed
counters (rx/tx bytes/packets). Add a default ndo_get_stats64()
implementation for this use case.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/linux/netdevice.h |  1 +
 net/core/dev.c            | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index a53ed2d1e..7ce648a56 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -4527,6 +4527,7 @@ void netdev_stats_to_stats64(struct rtnl_link_stats64 *stats64,
 			     const struct net_device_stats *netdev_stats);
 void dev_fetch_sw_netstats(struct rtnl_link_stats64 *s,
 			   const struct pcpu_sw_netstats __percpu *netstats);
+void dev_get_tstats64(struct net_device *dev, struct rtnl_link_stats64 *s);
 
 extern int		netdev_max_backlog;
 extern int		netdev_tstamp_prequeue;
diff --git a/net/core/dev.c b/net/core/dev.c
index bd6100da6..60d325bda 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10366,6 +10366,21 @@ void dev_fetch_sw_netstats(struct rtnl_link_stats64 *s,
 }
 EXPORT_SYMBOL_GPL(dev_fetch_sw_netstats);
 
+/**
+ *	dev_get_tstats64 - ndo_get_stats64 implementation
+ *	@dev: device to get statistics from
+ *	@s: place to store stats
+ *
+ *	Populate @s from dev->stats and dev->tstats. Can be used as
+ *	ndo_get_stats64() callback.
+ */
+void dev_get_tstats64(struct net_device *dev, struct rtnl_link_stats64 *s)
+{
+	netdev_stats_to_stats64(s, &dev->stats);
+	dev_fetch_sw_netstats(s, dev->tstats);
+}
+EXPORT_SYMBOL_GPL(dev_get_tstats64);
+
 struct netdev_queue *dev_ingress_queue_create(struct net_device *dev)
 {
 	struct netdev_queue *queue = dev_ingress_queue(dev);
-- 
2.29.2


