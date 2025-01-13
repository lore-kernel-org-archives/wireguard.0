Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EC2C54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eeae12e7;
	Tue, 20 May 2025 19:38:40 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0020d7b4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jan 2025 14:37:48 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-21661be2c2dso73443115ad.1
 for <wireguard@lists.zx2c4.com>; Mon, 13 Jan 2025 06:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736779066; x=1737383866; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aStnhmnU+u9WzYJvS9wSRsKutCltWxiDBFKzpdLaN7A=;
 b=QaN0688KL6x+Dl3hdkGZOxcHJ4fhnD3w/TylKF0bwDvsBVw9UH5MwEXq0JCOugvuP4
 8itnrIPeWPOxaF9xdN5KAbqaNvkgj5WNow5dI738a4hE/x+3EElXgBm8ZKJu2irNnFCd
 Kdmcs98UVDYIy4BZoi7jeG4KKI0Jc4wy7to3zscAsSP4/MWm+YtxRyjsZ7MOgHKCkwdU
 E9vbRH9TsbrBcHsyqaOdK1xBPaupJT4d77OHNZnalBw7Cg75Q6Z5iyuxfrxicwlEfN5X
 LM3uSffr3vULRQhQ82guAe3HVt4nd8BMOx3CY/TlosEFjZnPY1xZJZetpGFbQLWTPjMW
 NxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736779066; x=1737383866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aStnhmnU+u9WzYJvS9wSRsKutCltWxiDBFKzpdLaN7A=;
 b=PQOdOy37YsmFxiemJUpegAQDS7PxCTu7EkvKhL1QkmqCNSAlCV0tQVS9qWiHDjH7FX
 JmRiVNVq3BurtaqnTJH/ndrl6fqOMVzCAJ5HDcmEUuTDCWRpm+p63G3y9iNZov+saSs0
 gFSZ08FPPyVOFEkB8i5G7IobBPI0Z5rMhWnOL0EjMzDfmbvzqF1a8jFzSwjvg2l9J6GQ
 pTxU/wv7l0e60Qlp6h6qFDJCgZTKn0Oa1MbQQfjNil/8FowVgapjBFc+nOkTHAUI5Lav
 caMK86R6AsrL0plXtld5qMn2nsO3ginko+7hw2TnASAgoK7K669wy3UiSXQjF1VHoNsp
 SBiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAxLexn8wl7dRMeAps4I273LoOqEyOHVXWx5ubOonDAdW2jPznFrfXGSfXdik3SqoagXvU0JFdT+s=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwoCxnpJNddpF2skNAXJzHmlAlMso7yZcrBCbtIvasGQf00+vSM
 iqaOdYEph4B2ppsQfX6tMdbRQUVrfJ61WCrVgTgdoWCJ43c0xrxF
X-Gm-Gg: ASbGnctPtPc8R4tLt7Nh+DGaDLXa+cLS/BA6M6UgJWBDeDzj0Z6vdcZbfz8UNi4cqzG
 /x/U3WkWL8eJDGl1Ud1BkSv8bl/L9LWG3TecYGxWVd8YSqV0aM1pSNuzOkRTLFHn8zv3wIcgzWp
 86eznrsXZVlLqQh6RDb5mu1gHOuhlEwP+BqDev20PT+HUYRUpGGYhBEhGcArywnoqSWj67kcXMT
 Ug/YuX+U2rDsj9w6dBW3/ryEpyV5MjepgmMe2702+ArBrY=
X-Google-Smtp-Source: AGHT+IEEIzRcAyOPsqmoPyg3LqUO10MpSinA1zy4f8+lVawQb15WuSETw63Trl8RPwnuvmvDM8k1Dw==
X-Received: by 2002:a17:902:e74e:b0:215:aee1:7e3e with SMTP id
 d9443c01a7336-21a83f36d48mr318259495ad.5.1736779066532; 
 Mon, 13 Jan 2025 06:37:46 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f155e00sm54328715ad.103.2025.01.13.06.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 06:37:46 -0800 (PST)
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
Subject: [PATCH net-next v8 01/11] rtnetlink: Lookup device in target netns
 when creating link
Date: Mon, 13 Jan 2025 22:37:09 +0800
Message-ID: <20250113143719.7948-2-shaw.leon@gmail.com>
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
index 1f4d4b5570ab..ec98349b9620 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3861,20 +3861,26 @@ static int __rtnl_newlink(struct sk_buff *skb, struct nlmsghdr *nlh,
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

