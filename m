Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5242DC54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 21:22:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24e9113f;
	Tue, 20 May 2025 19:41:25 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 58491270
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2025 12:51:32 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-220ecbdb4c2so2357895ad.3
 for <wireguard@lists.zx2c4.com>; Wed, 19 Feb 2025 04:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739969490; x=1740574290; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=so6ixpN3+kGL2R8Euj1cLc9vRqq6Wkcgz/xNsuJc6Sk=;
 b=Hv7W59SUTomazm8VyEVErxJJd4TlM+hIq+RhLGbxx3uSH008kRfjIkEU6Q2vUk8vBe
 yghsn3Y1SWrT/Ox0o82oP1nnuWg+zod9ZRnim4fvM4L0tfJORHUugc4gzuV+okoVtLIY
 fAx3Jws/UBsCAYr8L5ZqFPp2BYksytVon43HDdF3LHMrIAwin280JLat57ETxXHTjznk
 uq/TQiPUf9WiSva6TqjxdaOf2smMyHsx6QjeRsGrqwS0yrp08TI1AXJV3D467RX3/SHp
 sOD44cMgEiooGYg720soeoR8PEXbGEdvDbMOBgpYzHJ68XQlv9gTM6Cl7MIoSoygGfVn
 v0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969490; x=1740574290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=so6ixpN3+kGL2R8Euj1cLc9vRqq6Wkcgz/xNsuJc6Sk=;
 b=T4xMKCHH8TmeCSJf259doJjUjywFicNBsLYjrTNwsG7QFsz2R5OM5GrBYj7/sJebvD
 AZWJVYdf28gU6ms4dNjlRS7jCIVhsDCzC+1XXzrHSPrPSoew58lPWDe37ie03CZKTL/j
 WIzZxRsj2/IttrZpHGeUbvXVgEv8xhaduVtw7wAkxZdflN2Qn0nRlTmZ7DER7VmoICJR
 VWozB8aP4HCVQJvYtCG8fy3AZlK+JOB57f4U77iBxlX2Ptq08q4bvS56d8zBSyQ86SZq
 DQtpIijHiAVjP6VD7ICJXRY7Q0P8N1dOgsCgywdRn/VD0Mogga7UUbn2d3ef3MrKWJpK
 bh9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZbkr4u8slOTft3kd0+7WGFVVxe9QLfw58JiE2JK2dusax0Vee0rcGrs6HuegLsa0UKVwal0Dl6Bo=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yyo8JMdY7VhIDRdcWdpyOzaeesOvqWCZDScYeeAnwu5XYmErrl/
 wfsnjzoYcghIohScibLqWOyQSlZ67QhQ2J/Zolu6kzERvQ7Xg37eruEuxUMiddo=
X-Gm-Gg: ASbGncuYxX8VIIHxo7qy1WzArzlaXji/8De+rKeMDHQj39CA4ghiKhnMZ8wnKihfLfH
 OdIBVpW6kcz8HfY/HssYI5yTqhpuX9fgJKG738Vv6Krv1vO3Jjy9KxxYBSyNxjwK2E23WFl9xiw
 Tge9oiGNECXm566qgcVlIwxixeI3KIn7wLWXUgMy3uVSL7cdztpp31Z7fr5SRTEi9ZltILHo/If
 4t/+ANQZnjFiONalgg1Am0k1d81Y2QmbeZxrsnxUS7tY76yFghYtPod6zXYoUq01TZQsqvGE1rA
 L2XE3g==
X-Google-Smtp-Source: AGHT+IEqkCyGg/QTxep/fqv5CqcRvswNVHWV96b7TSvHtcfDnyWeYpeOAf5Az1bAxRJk7mW/W72uWQ==
X-Received: by 2002:a17:902:ce0d:b0:215:a179:14ca with SMTP id
 d9443c01a7336-22103ef5861mr278510175ad.2.1739969490317; 
 Wed, 19 Feb 2025 04:51:30 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d536436fsm103427175ad.64.2025.02.19.04.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:51:29 -0800 (PST)
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
Subject: [PATCH net-next v10 04/13] ieee802154: 6lowpan: Validate link netns
 in newlink() of rtnl_link_ops
Date: Wed, 19 Feb 2025 20:50:30 +0800
Message-ID: <20250219125039.18024-5-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219125039.18024-1-shaw.leon@gmail.com>
References: <20250219125039.18024-1-shaw.leon@gmail.com>
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

Device denoted by IFLA_LINK is in link_net (IFLA_LINK_NETNSID) or
source netns by design, but 6lowpan uses dev_net.

Note dev->netns_local is set to true and currently link_net is
implemented via a netns change. These together effectively reject
IFLA_LINK_NETNSID.

This patch adds a validation to ensure link_net is either NULL or
identical to dev_net. Thus it would be fine to continue using dev_net
when rtnetlink core begins to create devices directly in target netns.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>
---
 net/ieee802154/6lowpan/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ieee802154/6lowpan/core.c b/net/ieee802154/6lowpan/core.c
index 704bf9e3f097..ee318d46817d 100644
--- a/net/ieee802154/6lowpan/core.c
+++ b/net/ieee802154/6lowpan/core.c
@@ -143,6 +143,8 @@ static int lowpan_newlink(struct net_device *ldev,
 
 	if (!tb[IFLA_LINK])
 		return -EINVAL;
+	if (params->link_net && !net_eq(params->link_net, dev_net(ldev)))
+		return -EINVAL;
 	/* find and hold wpan device */
 	wdev = dev_get_by_index(dev_net(ldev), nla_get_u32(tb[IFLA_LINK]));
 	if (!wdev)
-- 
2.48.1

