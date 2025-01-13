Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D16C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:59:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05cc0e90;
	Tue, 20 May 2025 19:38:50 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 850d16b5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jan 2025 14:38:14 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-219f8263ae0so71032605ad.0
 for <wireguard@lists.zx2c4.com>; Mon, 13 Jan 2025 06:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736779093; x=1737383893; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MlOA56xQJRVfhoUOrNRPIk7EOBdTk/e52r4/wRWgOdc=;
 b=goS7XRRAE8Fnd4OGTFP3ESu/mudTEen2jW/SfvTdUCm77ltb0RGs/KPF612fvPIJ6s
 fsBo5s8w/8p1mMKhI5iJbfWfh1ecQk5DMEY1k92kBvvjnJ291KrY08QzBXz1juZuBcAT
 /N5n48jguVOVPfgo3/J4hd1DNjxmHnfHlrbXDNndDa40EOyiwpZpcXxwror1yr5gvTzu
 1TkwXXc3pKX8MmHBBU6um75ABspjPiIWhu0kjqVTaRgCrLwjTXpgXIQSJHVfnEWPrI55
 qgb68pLGrm5Gc3+S9yaWd29/1JRhVBB4NEL2CnWz83aoicUPIH66W6j84B8rK8Q1XK4g
 IwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736779093; x=1737383893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MlOA56xQJRVfhoUOrNRPIk7EOBdTk/e52r4/wRWgOdc=;
 b=G4nKVa9O0qJ8o5JV33ReBuusA+XAmam2lZa0WHIuTdOYLTj5a6yZHH+jKFWBL65f5g
 wfwSYIPQpszwur04oeiG4BHBBdajE0dSjk0EiVcfGIaXQlUsF9b7bOYtqVy3Glcnirb9
 zbOl+FShCkesQdL277P+0XnNmdpvL4yThiINjIvydcG8Pdx3WOjzgy/t9KE5uf7MWZwx
 P8JByOag2zT5SEyq4XHsAafS7p0rte4HaJ4e/Doj4HKzAARmrXnmggTHvpUMpB/Nj3iv
 mqgMbrBE/Zq73ldpGWZSAI3uRDgCboYYYud6XvEoZYcSS8yYcCeIlO8lR7DkPkCqWR2e
 I4uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFcFLd9mxB1K/cBFThtbXkqYIaRduyiavLmARZOVxhvic0mqgLPvYiQegkvDEdMC9dYyeqtKVR3+w=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxUZ24aIGHxNrmAoy1UiQVgIqFtMQUDrxo1+/YB1KKLK4OJ/JHc
 1zWYviyFssbCY8LUbq7NnCk4KsCZN87HlzX2Xtf7b4dCGqoqUJCk
X-Gm-Gg: ASbGncsgccBlJqBDElwxqinHraWdYOMnPLiu26xcaxRv8iU7o2RXUjn9rAcFCS18zPq
 IvJaesCD0ClPIEJzUoS6wF6H1F9jAoU2GHh394pPPh+EzNJesUSMoOhaZjsXVriJPvXGsGW3JZl
 1mA+k3tXK7L3g38DYmoTMfkR3qO4xrEZ97Vc9YH00i0YRGwzT5TcCUb6PuLDOIvNrfcDfHOzwzm
 WMwHvEWRRxCDWmz6iaJNLYMi26fsj4GkauvLh1I76SMXZo=
X-Google-Smtp-Source: AGHT+IETQgOg7AunUSIVLfQXCmw6Miexgpzxtq5jBXEGmuKIo/a/YyzF3Hf0c0R30+3xPOc3lWG52w==
X-Received: by 2002:a17:902:bb8f:b0:21a:8d4c:a9b5 with SMTP id
 d9443c01a7336-21a8d4cab74mr209427215ad.12.1736779093022; 
 Mon, 13 Jan 2025 06:38:13 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f155e00sm54328715ad.103.2025.01.13.06.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 06:38:12 -0800 (PST)
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
Subject: [PATCH net-next v8 04/11] ieee802154: 6lowpan: Validate link netns in
 newlink() of rtnl_link_ops
Date: Mon, 13 Jan 2025 22:37:12 +0800
Message-ID: <20250113143719.7948-5-shaw.leon@gmail.com>
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

Device denoted by IFLA_LINK is in link_net (IFLA_LINK_NETNSID) or
source netns by design, but 6lowpan uses dev_net.

Note dev->netns_local is set to true and currently link_net is
implemented via a netns change. These together effectively reject
IFLA_LINK_NETNSID.

This patch adds a validation to ensure link_net is either NULL or
identical to dev_net. Thus it would be fine to continue using dev_net
when rtnetlink core begins to create devices directly in target netns.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
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
2.47.1

