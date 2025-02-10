Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCDFC54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 21:22:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81b247f4;
	Tue, 20 May 2025 19:40:34 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6539f15
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Feb 2025 13:31:40 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21f4500a5c3so82771085ad.3
 for <wireguard@lists.zx2c4.com>; Mon, 10 Feb 2025 05:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739194299; x=1739799099; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBYzKh666wM3wi72dCVNRA5e881/bj/k98p0ZebqkRo=;
 b=MJTbdl43uaeN82oQstzxU5/HESu9iduEZn9Pkqt9myTLwm8DYIuREIA/vL2QHBDhL3
 JDnDD9jitoclWut0HdVYf4fMg/pAkaNNGZGntSalBqvUp//4IWk5BR1+HCc+Bu57hRnS
 YFXeOsRyIaEv+9H3VPvTMo+KPKUK6DDQmJwgTf44v/+OySKvnnc5KZQFofpufafPa4w6
 Bx4ZH4/GlFEfde36+/N2h+iOkqRe5sWxiXocyDeiVPCBUiY9qNKQFEmlY2az2k7APM0V
 Vp0bH5Rfg5jIjf5sfZzHDSWtqA5W6M7R0s3O0mh1QUScWb3nm7lUQa1N5MgJCBkzUt1E
 9ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739194299; x=1739799099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBYzKh666wM3wi72dCVNRA5e881/bj/k98p0ZebqkRo=;
 b=SPDpT/xJ6/dYwSSz51AvJ/7J6jpepka2Azk4QyTx/3jhdhdnej4jDUpVpsq/aUwK6n
 IrSx16qD8N2B4MeAo/2uEjrxZ4QqJjgtx/wRWr48IQWMbIkNl0MvbrePC0tWhl1Y7VjB
 GIC282mfdEtnGX5XSSgP9IOQSd3VqhMFOHn6m3YYx2wY4OrrdCczOPxyAkDycSvXVqrD
 xj91KjfxXu44qIn7iG7JctImGRc6Xe1/K2OJ7wSCYGphQl3vSN6s2t67p2XKnpXoiG48
 b6iMhIiYXVH8YhAvB5/FKWBtMh00akXTKFeL6faqj3ZtqjJeE2wqjj0364tklWPZumhf
 tdCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhtBQz0uzNOWpBuJg1xMoK0q3VRKcTy9u4w5cGV8sOxnBe+9bkebwY4MPGeO2O9HARSVCsh5/Chsc=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyMtPzU4u2TpH8X4mzN0LpUQnje9q2bimK5JqU3Cacw89FQmuMT
 CWZs2O1oXCXZm6atjYvHjng2SJOJFPBINJCqPRPCc61JXnTxV1cl
X-Gm-Gg: ASbGncvGW7mbi22fx7J212hy7+1PXd3q4z0VHNwxZyLyoAOSPf1r8U7+CZfT/5hCe6w
 yGIsbx43lVJ22E+LPX/7WJ6pVvx4iV5ppP2F83QENBQ6qCq3aWHHspRGHYLBwhB+2QYpFXba39T
 mgzti2c4PPicW0rZjIYjm2I20WQpPOQctzwQjMDJ8UKasEInw0MWOzVmqalumtRMGpHU8jNbIRB
 9ks88KJ8WkEOrjHxRfP07PqTjyNcCHEgguaqzmIDEAfbjV/3CuTUCfOdhqwRLW41NaWy42v+yOl
 1sLRHg==
X-Google-Smtp-Source: AGHT+IEvqpw8e2KYvbqgEmvCDFUuCXdsu3E3xccl+ty2yNtqbZtpph7stG1AFKdWtDXwqVY0rqWqig==
X-Received: by 2002:a17:902:ce06:b0:20c:6399:d637 with SMTP id
 d9443c01a7336-21f4e78de85mr276877915ad.40.1739194299072; 
 Mon, 10 Feb 2025 05:31:39 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653af3bsm78799445ad.57.2025.02.10.05.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 05:31:38 -0800 (PST)
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
Subject: [PATCH net-next v9 09/11] rtnetlink: Create link directly in target
 net namespace
Date: Mon, 10 Feb 2025 21:30:00 +0800
Message-ID: <20250210133002.883422-10-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210133002.883422-1-shaw.leon@gmail.com>
References: <20250210133002.883422-1-shaw.leon@gmail.com>
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
index e9af0775fa6b..a11b2c1f0985 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3788,8 +3788,8 @@ static int rtnl_newlink_create(struct sk_buff *skb, struct ifinfomsg *ifm,
 		name_assign_type = NET_NAME_ENUM;
 	}
 
-	dev = rtnl_create_link(link_net ? : tgt_net, ifname,
-			       name_assign_type, ops, tb, extack);
+	dev = rtnl_create_link(tgt_net, ifname, name_assign_type, ops, tb,
+			       extack);
 	if (IS_ERR(dev)) {
 		err = PTR_ERR(dev);
 		goto out;
@@ -3809,11 +3809,6 @@ static int rtnl_newlink_create(struct sk_buff *skb, struct ifinfomsg *ifm,
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
2.48.1

