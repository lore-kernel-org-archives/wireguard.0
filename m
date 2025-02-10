Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E24C54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 21:22:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35ae2b81;
	Tue, 20 May 2025 19:40:31 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e36ef21a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Feb 2025 13:31:31 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21f6022c2c3so35479515ad.0
 for <wireguard@lists.zx2c4.com>; Mon, 10 Feb 2025 05:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739194290; x=1739799090; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JIWpuyrhnho0qabV5ShFTJH6UcUC2BreOZhovgVT2xw=;
 b=NO2rY+MEfb9FSUlupG/JtLtfngvSw5EdhznHBeYKsp1j3nAI3woJoHw2o1o7hAqw4q
 jllAx4KYOP/b4p3VxclVSbBOsg7Q2rJdL3STgAqIvDA0AAk0TgADDlIlC+kwkECWW42R
 E0KIGPqFWZHPUOhjJDY1S4aFwDCy8UakoX0ib4f5vyC2z38oPGf5fgeDGXRUnDVf3UAK
 5TNGKKTx13JzQdt7BPVx9XYIzaFGYRyb3Y59K2Hy6p1akOMv8kyljfmVpoOn8H4bnOHd
 oTQxlJU0/xGJwSao+D+WlDLwrL11cZEqyyxAqeI0kGULtWSaw/OO01/kdsJR1Ks/MgLD
 4Q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739194290; x=1739799090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JIWpuyrhnho0qabV5ShFTJH6UcUC2BreOZhovgVT2xw=;
 b=AKXuu2Vpsjn7I/Wk0mFkxy6IIZu1kqJ3pEtu7wnoypqTU3cezZ/Rw9ChNZZRbYts1O
 sofCWF2CYkf1ERoSNAXtaybCoroXrzSgF7sPTplQ35hCe/OOxLbZVpJSmW4YPZ5geJyb
 l/hPAPFniCZL9TkfXlEzCP6CJdFB0pSPCnmZER4CzKgbeWi/s1cs5Ehf5h+zggTtNkHs
 Fxn2+OO7QWgyXUmKyJmL3iPHdbOqUWWvdFcu+EeY+7RLxgg3j+Fi50ugA2Z3VXnm9VeH
 c1lW/6tdDrVWX9HPCmRbnL08+wYNOCpKvrmdEszc5zrYmOXcPIToD1QlNuPE8c3Vs/I0
 I4/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXJQvFlVmqUW2p43B2tqcMGLg5aRZtS/n1Qg4mlPuoyJJPDM8KyW/C3rP80BDMYf8aLwtusROpQww=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyEZuj8G6fMyZ+9QBk1Wcq81tKBI9jai0CQmEWTuu/5SX41XOqn
 8M+ZXsNGAKRWlOcxRFxsy7+L57dK50F+ii7T+fH12TvX+iesi3O1
X-Gm-Gg: ASbGncvMDHXG6LD16n4kNmTyysCKikDzFvIeKb5dkCY5nh7XblMMD67BHjDHzhBIifS
 RAJXf0hJC/xjAwTDNJCe9cCWf7FywzXzLYpQCJ9jmme7qAUWVnA1EwbdrPNmwRXNe16ftenEapy
 xQ35yXqxup1/KNu6j3h1zn90i7mEckxDTmSyTtzpXzp/Fv7/vWohY4PG+NNmF4JsYvQeBob2RPT
 QbiAzbMwghCXy16PsDgJ9GVlcecWw4d7VDKZ+VUbMunbb5RLo3JnV2ML2l01V5uk0q3w7xCqgXa
 jCtIyA==
X-Google-Smtp-Source: AGHT+IELdC20KTjI7AEzrj7SsYJqrzU0cpR4bU0xmzWBFbAdZdANoU6evRtqtyIIyxHfa7kTbn7qJg==
X-Received: by 2002:a17:902:f60f:b0:215:6c5f:d142 with SMTP id
 d9443c01a7336-21f4f7a257fmr230770855ad.20.1739194290046; 
 Mon, 10 Feb 2025 05:31:30 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653af3bsm78799445ad.57.2025.02.10.05.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 05:31:29 -0800 (PST)
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
Subject: [PATCH net-next v9 08/11] rtnetlink: Remove "net" from newlink params
Date: Mon, 10 Feb 2025 21:29:59 +0800
Message-ID: <20250210133002.883422-9-shaw.leon@gmail.com>
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

Now that devices have been converted to use the specific netns instead
of ambiguous "net", let's remove it from newlink parameters.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 include/net/rtnetlink.h | 2 --
 net/core/rtnetlink.c    | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/include/net/rtnetlink.h b/include/net/rtnetlink.h
index 00c086ca0c11..dd51240431b8 100644
--- a/include/net/rtnetlink.h
+++ b/include/net/rtnetlink.h
@@ -72,7 +72,6 @@ static inline int rtnl_msg_family(const struct nlmsghdr *nlh)
 /**
  *	struct rtnl_newlink_params - parameters of rtnl_link_ops::newlink()
  *
- *	@net: Netns of interest
  *	@src_net: Source netns of rtnetlink socket
  *	@link_net: Link netns by IFLA_LINK_NETNSID, NULL if not specified
  *	@peer_net: Peer netns
@@ -80,7 +79,6 @@ static inline int rtnl_msg_family(const struct nlmsghdr *nlh)
  *	@data: IFLA_INFO_DATA attributes
  */
 struct rtnl_newlink_params {
-	struct net *net;
 	struct net *src_net;
 	struct net *link_net;
 	struct net *peer_net;
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 7e98f3cd102b..e9af0775fa6b 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3797,12 +3797,6 @@ static int rtnl_newlink_create(struct sk_buff *skb, struct ifinfomsg *ifm,
 
 	dev->ifindex = ifm->ifi_index;
 
-	params.net = params.src_net;
-	if (link_net)
-		params.net = link_net;
-	if (peer_net)
-		params.net = peer_net;
-
 	if (ops->newlink)
 		err = ops->newlink(dev, &params, extack);
 	else
-- 
2.48.1

