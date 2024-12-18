Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFFFC54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 10:03:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e10f16a;
	Tue, 20 May 2025 19:36:04 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id aec52d55
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2024 13:10:32 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2164b1f05caso59837395ad.3
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2024 05:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734527430; x=1735132230; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKRdbuSYL7hnJpCbxB6/aqEJFoCo8iX729XZZAsUkqw=;
 b=e4uLH331VdzODPwCREWdloZXup3ZiGJhCkOo0WvId2PRzI+HW+nvw4RxbZyiQAcED2
 QYQXOK2hcI61o536ci2ojhdeag7Lk/XXIRgCwhWtqXMTFpzbWd0pXtgstzBqVLltwXW8
 TY8jzUOQg16+aA/xOExCucrBslZsATL9v9KTMhSg9y8ANAGpRg0ZuwTkwenB37OPlc65
 R3WEUtKnvNZaZRIaN/I5C8Dm0s7Rg0SWqQgxX/C2pe5Tl7nxDZk+l89s1CsHs+iDNwfL
 UYwZRRrzqMJ3Cciq2UGieP7Edo86o3xeSDDkk5EQ5VjZfkpS5mwrsnoHoLAgb838Jbsz
 54Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734527430; x=1735132230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKRdbuSYL7hnJpCbxB6/aqEJFoCo8iX729XZZAsUkqw=;
 b=kjD72J/n7z5IS7AE4j6kV2qnxDnuygTb9p7ayTPBYRXjuR6HUAYs+71xqPpJipCxoG
 BxpR5EZBD03Abzrhs7tYGDluEz0SW0n+E3nA4KWo91tFPirVMsJ/DtJdIpro41aUN8Yl
 LxDNdjeBP+8o5n/aMl6mFTJEtyvPcg4uKDuXSRZWNRvNxKZVwjDXOXFDfBvf3YXzK52y
 jycAKER+TAt4m+LZSMTaswATU3wMMqU1atZAjX993fNprbg/mEKZD4mwVmFVDwH/BjiO
 KFzVzg1i8aNK7ZbCX/Q2ZDKxslgAnV9y50Ih9Xb+wpCm0HuQtxDqsYdgWZ1dGpBM0Tpc
 LkBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7M2CbhFIMaTysaf8J0qGyMwjXMqpx/CcMjb44pwqMuTItRao7XCvIU49iE/MSec43GWUxLMieXuw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyYvrrrYsofFDrz/KdQZyfLcEvpqXw62N6hmvso549a3929T2/j
 hVIkD8qaQGqBVKGfeNYzcGFJWBEJDI4COhTGVJxSXC4yUTFMaIjl
X-Gm-Gg: ASbGncvT9b6Ev/A4P4kxqr1ydY5yxP1w39ZIrnKxLyYUcng6BHs2NVP03sCQD3LYzyJ
 XrMDwC4/3edYWRr6fRC70BDXtXs4G+EkluGgRbF3VyI3cBN/BnSuiiGhWcdywFyYFKEN9Zy38Qj
 I6pfYLid7rwfEhEy1IhlGpLQIlbfBxadgK7zWJv9ets9LAHpKpehhz1OkPYvocwwqDDDjlMOrm4
 XYs48afVaEBpcJP3Axmlzujbc7t8a+vMVDwtmEdA/s+8jg=
X-Google-Smtp-Source: AGHT+IG5uNon7/+5tavnAU1+6ODsDyulZAAiwNo5sldF4FHk8kNssZ4/V0oQpI2qOsRTRp3qJQ4m2Q==
X-Received: by 2002:a17:902:db01:b0:216:5867:976a with SMTP id
 d9443c01a7336-218d725b7aamr38087595ad.45.1734527430302; 
 Wed, 18 Dec 2024 05:10:30 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5c0f59asm7434754a12.67.2024.12.18.05.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 05:10:29 -0800 (PST)
From: Xiao Liang <shaw.leon@gmail.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Hangbin Liu <liuhangbin@gmail.com>, linux-rdma@vger.kernel.org,
 linux-can@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org,
 bpf@vger.kernel.org, linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v6 08/11] rtnetlink: Remove "net" from newlink params
Date: Wed, 18 Dec 2024 21:09:06 +0800
Message-ID: <20241218130909.2173-9-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218130909.2173-1-shaw.leon@gmail.com>
References: <20241218130909.2173-1-shaw.leon@gmail.com>
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
index f7c176a2f1a0..e33ef8a0a6d6 100644
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

