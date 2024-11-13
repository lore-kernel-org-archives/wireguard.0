Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A161D49237
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 15:42:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ed54b3e;
	Mon, 18 Nov 2024 12:45:31 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 90a5e3f4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Nov 2024 12:58:03 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2e2d1858cdfso5277979a91.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Nov 2024 04:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731502681; x=1732107481; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r30qTLZF8ANhBKyxqq0VyimbMaQgwK/VTM3BE1AEUlA=;
 b=RUd11Vj89hzXCHhmL+BAjO7Xo1XgJvLsphCysc9e76tGx2yGpmkChNuG8hSbKVELOC
 59GY2l6hvav6/TSgTUsnN8cIYJyEPxalRPsH8rMpWv8LSjSAE2zpQ5oaMLMwokvtzlAu
 xq5AtVRV3XQKmDIKwvp9YewMbdYFq2kdRnuF4d1R1Hj9WA/VmIAlpIhczLIYfXQ0xogp
 IcF2iJcqO8dFb+L7zXvtkcMfkAxhmCJ5D66HE+jiEarjQKOO3k+1xbEdHr4Gz6vHIWbW
 j/+sZoisddJe7DUYrkVWNyAb3n5uOEaOUA8C5hoJmTe5d9U6E/cNLpbITWZh5jnEPgdj
 TFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731502681; x=1732107481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r30qTLZF8ANhBKyxqq0VyimbMaQgwK/VTM3BE1AEUlA=;
 b=T5aqRaGHX4XfOXvnImV/ULIvSiBdRbNjSN9Uu0Te2eY19pCW5Kk+654IDJ/thdkr1v
 6D/BDBnFDB4OLenBZB6V0BxwTXiF8b+j2c6PDbNVVJ0ErheHn1/pBGCSmf//it91BYuC
 lwozNnEugpSTd1grNFRleIib755NdRMwcEufbxghd8pQ4u42/1NdicnlHELxvumeYnF8
 86kCFAuLHosgsqcUWgrZyKHIxnHYJozS6CFTydDbSsqPdx0VNqH1EfAhrKR1VkhQc5/N
 egzAfdYiZ5lKsrF4z4PA7u+6mtPtynMYdeKWZLeqy9S+vEB2CAkjAwBecKXJKz9FhnpG
 Xwzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbEF1AxR9d+P1U0tEf7TaknECFnqewgVj1hYKpVz1XRn3aZIhmN4AvpOjJCdCG092O9h/qoWr6pxk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyFzdpTZxGJGUeAePBM0ID9UiQhPPAQ8MLJjWjWM576t6963Plg
 8/3pQ7jusLBxt2IESTcbFag68GIXNC7hnSocxR2CKkPXZux8Eq/Y
X-Google-Smtp-Source: AGHT+IGHbWu6TztKh6tN8Sp6Cv2pF+0T1uVgEKu2tiVbycxbLB+U4mJhCEtmHq5ke3dUIYABcOdsZA==
X-Received: by 2002:a17:90b:3907:b0:2c9:df1c:4a58 with SMTP id
 98e67ed59e1d1-2e9b177fdcdmr24476632a91.23.1731502681391; 
 Wed, 13 Nov 2024 04:58:01 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9f3f8ed0esm1398632a91.40.2024.11.13.04.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 04:58:00 -0800 (PST)
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
Subject: [PATCH net-next v3 3/6] rtnetlink: Lookup device in target netns when
 creating link
Date: Wed, 13 Nov 2024 20:57:12 +0800
Message-ID: <20241113125715.150201-4-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113125715.150201-1-shaw.leon@gmail.com>
References: <20241113125715.150201-1-shaw.leon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:44:56 +0000
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
index 327fa4957929..f573ace60234 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3846,20 +3846,26 @@ static int __rtnl_newlink(struct sk_buff *skb, struct nlmsghdr *nlh,
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
2.47.0

