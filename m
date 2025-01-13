Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0151AC54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 805286f5;
	Tue, 20 May 2025 19:39:06 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3ec18417
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jan 2025 14:38:57 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2164b662090so72494635ad.1
 for <wireguard@lists.zx2c4.com>; Mon, 13 Jan 2025 06:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736779136; x=1737383936; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3RwrUezkHV4Bxso8Lan3H8PNeHkallTCdG4JVNGo1S0=;
 b=X8x9gnXhyGzyvRFt55ks6g1R65mCk7hTK1oFCUh829OKlgpKt/yWFHaNncZR0mCOwh
 IBpoX6k1wyx3eRgnEldEQcYc9hLXLFybjXJfzF6iIHCnGAHxtxl+5/Agm8HHUKm/MTTW
 4ueRm7bSvNM8TGCfynEEB0+UdplaGpRjy7FEj8wJ8mzAkLgt7Hlty1vHjQLF6G8wGoRe
 ZETrPonABriOse2mAnkDWiD0zHvvGaAe2GMT+JP7P+q/G32zMq9bktzS6YCx8rCXBGZq
 xDaRtxPhGp90S9RMZCiYNMOdX06ccDGgdjJnTerthTmHPvk5Cl5CT7P/XXknmLckNEVE
 WGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736779136; x=1737383936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3RwrUezkHV4Bxso8Lan3H8PNeHkallTCdG4JVNGo1S0=;
 b=SM4Qccvo5taZZOz4dsCHJBMVM0/O/VR2kf57OusD1uL5YKOuzAmI6AisKItGSHj80/
 U3YHybhSOGWhpt8CarqkGjtNZMP4oKmPayxi+bQQpxXMqlLFIcLaWTxNAbV+wMP1ID8I
 utsh4KsIXyWg98st/Z3okMIfOiKgp4DVJG7BjjuKZoqqeTTAxlDM8TO9XUnDgQTQWJrN
 aq0LT3ObHL8F7dS+tKOAe6dRPhmN3zmG1OsBwHsIhMXhGIeU6HEFizBxrf3S3hcVKvtb
 fC1SFv2s/KepXKjTP9jwv0iEviBWldPKhPzVBDdhVWRccZ8fSVBsgMLPBtrwnkeUG9c8
 Qx7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwsY7tJgollwDgRlNpTwOClqWzYpjAQOpkFGTJAFTeqPwQ+cgFC2548JIYEdNArI64mrnv6WMQOxI=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyumvFoJl219r1WnI0HU/7c2X/Vl6nlFWbwVontfc5WEA1pD78I
 SRp5HjT27GCZNu0D3bA27FTlpCsWTtjaTqzjiv9aRlSc8Ez+Er0b
X-Gm-Gg: ASbGncua1/UUMHvx9fxEdQ+b0jZK+iXqv86i3CMkI8eVYKeGkMBIdhPLGOEcOPIum3e
 JQa0evowdv6zxVDnzMfq5R3tmLrV6KiQtMqPZMemLWZa6uzf1BqeIkbd7i9M9+DOAkb76sB8aP3
 efUWu54XuRFabw6h3q1h6vBwxT0GkvqTPNkaxtzGal0XOhVZ0sOlYU3JvpA3yERPwT2eGgETka0
 mlp28YUDfyjr41UyPZiw9QRRzPS9X8XMfzH3I0pSGYlOBs=
X-Google-Smtp-Source: AGHT+IHt1nCTDh10fBQS9NHgK/oOky2VtiRHLWbePcQNxSAsFYQfmLDkyg61R0c+C95BGg+IP2F6xw==
X-Received: by 2002:a17:903:18a:b0:216:4a06:e87a with SMTP id
 d9443c01a7336-21a83fc7640mr358427785ad.40.1736779135888; 
 Mon, 13 Jan 2025 06:38:55 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f155e00sm54328715ad.103.2025.01.13.06.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 06:38:55 -0800 (PST)
From: Xiao Liang <shaw.leon@gmail.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-rdma@vger.kernel.org,
 linux-can@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org,
 bpf@vger.kernel.org, linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v8 09/11] rtnetlink: Create link directly in target
 net namespace
Date: Mon, 13 Jan 2025 22:37:17 +0800
Message-ID: <20250113143719.7948-10-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113143719.7948-1-shaw.leon@gmail.com>
References: <20250113143719.7948-1-shaw.leon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Make rtnl_newlink_create() create device in target namespace directly.
Avoid extra netns change when link netns is provided.

Device drivers has been converted to be aware of link netns, that is not
assuming device netns is and link netns is the same when ops->newlink()
is called.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 net/core/rtnetlink.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index cce5bcd1f257..65f09ab616b5 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3784,8 +3784,8 @@ static int rtnl_newlink_create(struct sk_buff *skb, struct ifinfomsg *ifm,
 		name_assign_type = NET_NAME_ENUM;
 	}
 
-	dev = rtnl_create_link(link_net ? : tgt_net, ifname,
-			       name_assign_type, ops, tb, extack);
+	dev = rtnl_create_link(tgt_net, ifname, name_assign_type, ops, tb,
+			       extack);
 	if (IS_ERR(dev)) {
 		err = PTR_ERR(dev);
 		goto out;
@@ -3805,11 +3805,6 @@ static int rtnl_newlink_create(struct sk_buff *skb, struct ifinfomsg *ifm,
 	err = rtnl_configure_link(dev, ifm, portid, nlh);
 	if (err < 0)
 		goto out_unregister;
-	if (link_net) {
-		err = dev_change_net_namespace(dev, tgt_net, ifname);
-		if (err < 0)
-			goto out_unregister;
-	}
 	if (tb[IFLA_MASTER]) {
 		err = do_set_master(dev, nla_get_u32(tb[IFLA_MASTER]), extack);
 		if (err)
-- 
2.47.1

