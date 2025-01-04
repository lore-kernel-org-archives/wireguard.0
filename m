Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE986C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4354cb80;
	Tue, 20 May 2025 19:37:23 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b1b873c7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Jan 2025 12:58:52 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2166022c5caso161625205ad.2
 for <wireguard@lists.zx2c4.com>; Sat, 04 Jan 2025 04:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735995531; x=1736600331; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ce6VaPIVkPoT/BnqzSEc4rQsuMP37QI18aEevx41SAs=;
 b=Zbor+2qJN1kcCgsRGqpz8RrabhPSaQZ9DHP1GOXl2ZTT0rNKWSdRSHX3sPsL28K/Qd
 RjlVIyRnglu+DPaG2dbXnwNLpfSH3ia23dAbjpFqSPCWqlUQXGCmOaAiSvo2Uv5bU4nT
 Y0/S17LtNFiBuIACykOiHYvzIwn3nnDoeWi8TxQa92+KvGKUJl0ywA6lV0GVkNpVszSH
 uLQZXu1U0H+XhnY5rKDxi74K/XeTCjqSGqx9uORg5FCqHTdtjud210EdCK/C1eH2TsWv
 UjV+7z7t/MtnT1cTgHEEcStiK90f87azAEmOr4Zl8M8nE1WxTb0mKogEty1oQCL5UdiK
 TR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735995531; x=1736600331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ce6VaPIVkPoT/BnqzSEc4rQsuMP37QI18aEevx41SAs=;
 b=kH0nUnl75jiK3k2kngHtMz18OPPjQ8IVrDARqAfrhk1vn5oOz10jBjvC9Xfc4tSCBs
 lh4naCnPqvBFkeB/AbB3V5mgAsnMlVihEcBSsXv4qzKgqS0FJWf5L1E8X72pkSnwRDAF
 70nwCWfn0X3F4URzrTaV+FmsLwUy9GfM+IoTdorZJxQsBjRPHWUuqEFy2dH5Dg5lDbLf
 3CJxS4E297QXEF5SN9/ImtuFGMTvkrIRLzs8s6JIFmekNGdGnwHJAEsVv3QucnllIM87
 C3AodtOHiNxu1b95TwzitajdKfWkqlkMOcGYQy1B6u1BJA8rzUsbnpWWRzN/QHUnd4Vh
 ID7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmuGOjpvS7FJY3L7CWg/D9ZSJ4snJqT+TdpI+oYmd8JP/j1pwBh2KUPMA6A2c+Btbe/V5aetDgDd4=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwLr0c5qzYBc3lRH7NslcRWxhLOi+neTIIF3M+yJ3sp3NWImueH
 sD5iO6SVylHyKM1H0Crw3hxyQNNqrOZwtRZeZgVTXnx8C0ILOUxo
X-Gm-Gg: ASbGncs1x2bhwgQ5CC5TPPYSHw3oGoo26Vbj4pNDmebvvLpV/4q+m8h4p4i+f/lUCwh
 DyG0ndH3jJsOxrKIzgWZ+jmigZAxGslsUWCbUC4HFsB8meV1CpIHuHEG12PZB7PrpgCgZXXxVWj
 A9DkZdfG6XcGmRark9FsrVwAwk8d0KSdjVzdPinFCeON5c5RVZgKaazidaTOqUmOXdjbCbsgiuG
 AYIBvodqLUAMGvMNijJjm9Q3XqXQ9vk/PnWViaoJ9Wrpj0=
X-Google-Smtp-Source: AGHT+IFpOYXqaI1R+HGOEzzxslPytJ/PM+OYSeZsg4xs6ImgmD2P2d6ce4kFlhBJ9qWXqvAf2AhpWw==
X-Received: by 2002:a05:6a20:1596:b0:1e1:9f57:eab4 with SMTP id
 adf61e73a8af0-1e5e04609b4mr80108339637.16.1735995531119; 
 Sat, 04 Jan 2025 04:58:51 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad830349sm27761344b3a.47.2025.01.04.04.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 04:58:50 -0800 (PST)
From: Xiao Liang <shaw.leon@gmail.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Ido Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jiri Pirko <jiri@resnulli.us>, Hangbin Liu <liuhangbin@gmail.com>,
 linux-rdma@vger.kernel.org, linux-can@vger.kernel.org,
 osmocom-net-gprs@lists.osmocom.org, bpf@vger.kernel.org,
 linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v7 08/11] rtnetlink: Remove "net" from newlink params
Date: Sat,  4 Jan 2025 20:57:29 +0800
Message-ID: <20250104125732.17335-9-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104125732.17335-1-shaw.leon@gmail.com>
References: <20250104125732.17335-1-shaw.leon@gmail.com>
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
index ed970b4568d1..04fc0e91af42 100644
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
@@ -82,7 +81,6 @@ static inline int rtnl_msg_family(const struct nlmsghdr *nlh)
  *	@extack: Netlink extended ACK
  */
 struct rtnl_newlink_params {
-	struct net *net;
 	struct net *src_net;
 	struct net *link_net;
 	struct net *peer_net;
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index f902b8a5189f..a2246bbaf2bc 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3758,7 +3758,6 @@ static int rtnl_newlink_create(struct sk_buff *skb, struct ifinfomsg *ifm,
 	char ifname[IFNAMSIZ];
 	int err;
 	struct rtnl_newlink_params params = {
-		.net = net,
 		.src_net = net,
 		.link_net = link_net,
 		.peer_net = peer_net,
@@ -3787,11 +3786,6 @@ static int rtnl_newlink_create(struct sk_buff *skb, struct ifinfomsg *ifm,
 	dev->ifindex = ifm->ifi_index;
 	params.dev = dev;
 
-	if (link_net)
-		params.net = link_net;
-	if (peer_net)
-		params.net = peer_net;
-
 	if (ops->newlink)
 		err = ops->newlink(&params);
 	else
-- 
2.47.1

