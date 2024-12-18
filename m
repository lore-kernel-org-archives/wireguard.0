Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB3C54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 23:11:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 368e4db1;
	Tue, 20 May 2025 19:35:43 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 63ce681e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2024 13:09:34 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2ee67e9287fso5823376a91.0
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2024 05:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734527373; x=1735132173; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rqBeWHkwlk4K5tQfUbZueoC1cX5zOkU9dpB02VEAE+k=;
 b=Cx97xOLxP74jpEz9PoLnHinEcgQ8C6GwsLoXmoc0NEUaXC8LmYdDc3rwHCr4sBHEQ0
 x6NoLq3evNd41TjBtbga2eLEEyBasIwo57l406OuNl5NkC09y3VaQr96a0qj4GqBohj2
 cpDcsdZHIW77FeQ7KhGpB10FbnhBBLIIvCdvdINt0q8QStSdgrMP4337s7IKDBaEGoGs
 fEjFXv4ugPkzwaNmKRsHRyXp3UZZvuMZ9Z9pFSlt1vz6jFRkBrw8+kXxLz5kRbBvmZCU
 9oFuaR0Ed0KiKrqushTED4/EPGmz3+9FzhN7JRiWwqWLs1xamelYNy+G8C4WmyjZkNt4
 gNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734527373; x=1735132173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqBeWHkwlk4K5tQfUbZueoC1cX5zOkU9dpB02VEAE+k=;
 b=DB6SuiBFCJOqY4gH1i13QJHmfcpDI50BBwJEMj8p6QZb9nbwL5dJjD2bBR/TPyFG+9
 2iPyZ3vFZdJd9eMu8VJn/+xAJTJuw61TGib/yyE8/LddcAb7BJ1COYcG9x+cTRoDDkgh
 6TXjnoDDPIfz03QVHSHFboN/YKwDfadHpV1hXrnPL/9uizBD1Lpena/ZZ/expfF5eyyy
 cnrJe3S7DZp2TEU9SUZoojKPh43vOR1CcSieiiuG5CwaDVLs/WhGna5Y/HbRjxJbfMR1
 Mn6dB2thUqMaoagpvcfw/Bo6DrEbqm4szNVx9wnZDR+A/pL9K+7Lb0wqS+0sXtL8XLlN
 vOqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5IzEQaZkOqY0q1aTkv27Vv7HBSOqXPQoHF2Quvbq3JQnUITB08yWub+LN7m/90kNr6QSa7L2EtHU=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyXHbfu4RUexlKh+H2DMi7wE/9QToTUKXTwD3L/hPLcno3Yhlcn
 rj8EU6Yftx5dR9GAqFuFIFLrvYATHJDvwWLJCtiImcFTfkKC9SRf
X-Gm-Gg: ASbGncsSHUKfKO0nk4/Rs48uHKoH7NgeUZs9cnHGQKRlAL3lLLthhn4X98AmMmw9A3V
 MtpKSIy487ki5dUkL3zQ7lRe5gqw8NArD5WjltEb9c7VP53eKjkfnGKsWZsJz6Px5PnVDpBuUUF
 mvuq2SqaG7LoJhXT84HL8lzjHIQYffw3vdWD3PSkxLAYFXthZkzIzhWaxwdFdRINvCLQM4cNTMO
 8gZmdeXuzIOKJRHnmm63ddcsvH1GT7YgBCpCSi50cIN7GY=
X-Google-Smtp-Source: AGHT+IGwupxRC65MgCyutia2fH86BtEscvZ3hC19otgxhx9O+M/gNgTyzVuSwrO7sHgcHk/UbitTJA==
X-Received: by 2002:a17:90b:5490:b0:2ee:48bf:7dc9 with SMTP id
 98e67ed59e1d1-2f2e91f1112mr4682540a91.15.1734527372952; 
 Wed, 18 Dec 2024 05:09:32 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5c0f59asm7434754a12.67.2024.12.18.05.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 05:09:32 -0800 (PST)
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
Subject: [PATCH net-next v6 01/11] rtnetlink: Lookup device in target netns
 when creating link
Date: Wed, 18 Dec 2024 21:08:59 +0800
Message-ID: <20241218130909.2173-2-shaw.leon@gmail.com>
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

When creating link, lookup for existing device in target net namespace
instead of current one.
For example, two links created by:

  # ip link add dummy1 type dummy
  # ip link add netns ns1 dummy1 type dummy

should have no conflict since they are in different namespaces.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 net/core/rtnetlink.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index d9e363d9fa31..6a2fa030c8e0 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3851,20 +3851,26 @@ static int __rtnl_newlink(struct sk_buff *skb, struct nlmsghdr *nlh,
 {
 	struct nlattr ** const tb = tbs->tb;
 	struct net *net = sock_net(skb->sk);
+	struct net *device_net;
 	struct net_device *dev;
 	struct ifinfomsg *ifm;
 	bool link_specified;
 
+	/* When creating, lookup for existing device in target net namespace */
+	device_net = (nlh->nlmsg_flags & NLM_F_CREATE) &&
+		     (nlh->nlmsg_flags & NLM_F_EXCL) ?
+		     tgt_net : net;
+
 	ifm = nlmsg_data(nlh);
 	if (ifm->ifi_index > 0) {
 		link_specified = true;
-		dev = __dev_get_by_index(net, ifm->ifi_index);
+		dev = __dev_get_by_index(device_net, ifm->ifi_index);
 	} else if (ifm->ifi_index < 0) {
 		NL_SET_ERR_MSG(extack, "ifindex can't be negative");
 		return -EINVAL;
 	} else if (tb[IFLA_IFNAME] || tb[IFLA_ALT_IFNAME]) {
 		link_specified = true;
-		dev = rtnl_dev_get(net, tb);
+		dev = rtnl_dev_get(device_net, tb);
 	} else {
 		link_specified = false;
 		dev = NULL;
-- 
2.47.1

