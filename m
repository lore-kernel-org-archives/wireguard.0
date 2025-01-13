Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1301CC2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 12:39:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53b6d70f;
	Tue, 20 May 2025 19:38:59 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1044cb06
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jan 2025 14:38:40 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso73478885ad.3
 for <wireguard@lists.zx2c4.com>; Mon, 13 Jan 2025 06:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736779119; x=1737383919; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n79rk6b+8xqMmWjuAyko0er+FR6QjAQIxOU32J9enis=;
 b=ZeoLjXQgWRhHLjNtD7fJ0AWafTLo3lwrGnwX69TepcjgHRhV88xcaZgGcow+aDou/R
 BbmY9RyRVqjSYUqr9b1K7Vkw7HzMHcXEqUG4Fv8BJC9y7unMmS1WvqSlGJyGKbsOWfI1
 pW9Aos240h4a1tr8CAJ1I8th+sWOpjqq2L7Izl9n3Wy2uPC2MAMkGNy/wHnsM+wr7WIV
 xOBxuqjgu1SKax/Uw3e0/gghHPgZ4OCnMRRJt+Z3g8sH/vpE6ir9sLe7AnYdv8rfl46s
 rNFNBi+lLug0sHz0K2KSjjw6Ca6k/lbRCnVWcM2YWSTiCIaiRrdGiTCijFDScIJNUSpj
 WGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736779119; x=1737383919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n79rk6b+8xqMmWjuAyko0er+FR6QjAQIxOU32J9enis=;
 b=YNBmvCtQ5aLivYBK6WtlCeCCw0f5eykWktxrFH2C/3U7JbDx5Y0yht6TK3JfMrjD2J
 yUNQcANQPs1Nt8DUMhRSwozno9C2nYRrRlDi6uu4gAKS+wrY6s4S2XFVqTHUWoB2K7/x
 STc9HyfVv3PKki+P07JwGdMGZKrUojivKWUfi0BLIp82CVhTxRX+Uz0/Zw7O0Tah12s8
 yQyfLFV3f2LEwCNFPfSuSzMwI9B+8sThrO5KgJA2zax5EfGn7T33xRdlF5ybRVdkjjM9
 9HbzBNOlx1ZhP9olSp2noHYXvfy25LpUci0+hT80rNE1SoI6HmyvTcTRu2hKXqJ77Hc9
 Ah0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUceahXC7oIXtFR1o7YOT6aebpjlF7HaE27lo6hgUXp9hTHC/8c0b8SMSxmbAU8ghNjBPW4BLiiCCw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwpGUBy9iNsZqnuKIDfgNFnOE4dT66momt3ti/6KQLTsqqMW8en
 g97Qty1AWHF7qVvHoaTOFn2SdMhrxsFlWDdn67LpF1np5saSBMw3
X-Gm-Gg: ASbGnct5N/hcTZOz/h6Kmpn25VLqd04eqUkjkyfA5QrPEpzUfI3rJppyHf/rbsR4aqO
 DRZl6hLZnV3Q1lCkwhaaiA7DR70Iz9le5tLrksze4QV449dOuWTT7gXCWhkEU5dNgHKjbSyDkPR
 0uvf5YK/73RTaCC8lPBYCU+oNybVH6gIEmvbbDuK32jbJ5Y9FyOrvYLk0o5IHHZ/RBFpYQ9We7/
 tIizecjdUU88B52R5uRmEvORTkIkoaAvZ1Zol6iCAKtJ9A=
X-Google-Smtp-Source: AGHT+IGazeu03SiYco1yjo+DeQUEtizAzSGgMZznFsd/ItXTJBGhLqoPfMkABloEPy5ZTJeLHULJqw==
X-Received: by 2002:a17:902:cecd:b0:215:6995:1ef3 with SMTP id
 d9443c01a7336-21a83f3469cmr286693405ad.3.1736779118671; 
 Mon, 13 Jan 2025 06:38:38 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f155e00sm54328715ad.103.2025.01.13.06.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 06:38:38 -0800 (PST)
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
Subject: [PATCH net-next v8 07/11] net: xfrm: Use link netns in newlink() of
 rtnl_link_ops
Date: Mon, 13 Jan 2025 22:37:15 +0800
Message-ID: <20250113143719.7948-8-shaw.leon@gmail.com>
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

When link_net is set, use it as link netns instead of dev_net(). This
prepares for rtnetlink core to create device in target netns directly,
in which case the two namespaces may be different.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 net/xfrm/xfrm_interface_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/xfrm/xfrm_interface_core.c b/net/xfrm/xfrm_interface_core.c
index b7ac558025d5..b87a5c950833 100644
--- a/net/xfrm/xfrm_interface_core.c
+++ b/net/xfrm/xfrm_interface_core.c
@@ -242,10 +242,9 @@ static void xfrmi_dev_free(struct net_device *dev)
 	gro_cells_destroy(&xi->gro_cells);
 }
 
-static int xfrmi_create(struct net_device *dev)
+static int xfrmi_create(struct net *net, struct net_device *dev)
 {
 	struct xfrm_if *xi = netdev_priv(dev);
-	struct net *net = dev_net(dev);
 	struct xfrmi_net *xfrmn = net_generic(net, xfrmi_net_id);
 	int err;
 
@@ -819,11 +818,12 @@ static int xfrmi_newlink(struct net_device *dev,
 			 struct netlink_ext_ack *extack)
 {
 	struct nlattr **data = params->data;
-	struct net *net = dev_net(dev);
 	struct xfrm_if_parms p = {};
 	struct xfrm_if *xi;
+	struct net *net;
 	int err;
 
+	net = params->link_net ? : dev_net(dev);
 	xfrmi_netlink_parms(data, &p);
 	if (p.collect_md) {
 		struct xfrmi_net *xfrmn = net_generic(net, xfrmi_net_id);
@@ -852,7 +852,7 @@ static int xfrmi_newlink(struct net_device *dev,
 	xi->net = net;
 	xi->dev = dev;
 
-	err = xfrmi_create(dev);
+	err = xfrmi_create(net, dev);
 	return err;
 }
 
-- 
2.47.1

