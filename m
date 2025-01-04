Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C88DC54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 22:04:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b5e5e1e;
	Tue, 20 May 2025 19:36:45 +0000 (UTC)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e6e93595
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Jan 2025 12:57:56 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2eeb4d643a5so18829266a91.3
 for <wireguard@lists.zx2c4.com>; Sat, 04 Jan 2025 04:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735995474; x=1736600274; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0y9nB6XisXA1oDe7UDcZLSsAyAYhl+7T93j9PgZqLs=;
 b=PuGAozmqYcxREYltgGTyzm+KkxdLjmKfs1F/7VzTlsJcwFnygw5fdq7EOWlas2n4DN
 W2MF3INQhCOhlklC9DUOd/whOfAjbVr2fBN7CWnvQy7A4eQj21NSu7hhZdqbozLe3QN2
 Vr4yHpnn1FzR43JicbwPYKy6I9sOp2d/mZVYzKIvYykikmJSu1OeA1Sq78UYK+ohgc0i
 8n7sRXv8eDqBmlZjW/plwuN613JYw5YR8U3lhgSP9RdIYPG/LhewHWxg1stSg+FT3cfd
 0Z2HKzoRndIt61ueTIQqYGEnDGfIZ5fDfLQdxQamy1/R2bl6o0SFXHySixbIrLadrV6I
 gOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735995474; x=1736600274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0y9nB6XisXA1oDe7UDcZLSsAyAYhl+7T93j9PgZqLs=;
 b=RCwlTfIcFMp7F+D6g8H+FGwJVOetLZ7NA1dPTjHz51syjEPlth3Wrr9JsxJDBmbuTA
 xdrlDi466CO9UyXPTFQP7dFxJ6VQvHOWCtk12LJrtD3n9Dlb2+IyZZNwV1CuQUkUX9PW
 7jQhu/PdCimZj2enUm37inJDPXo3H7M8crUZaiSzXvm2fasAQNPnG0AEGCCP+1qYxkcn
 W6vpINpH5yJYucEIu9IiBGXD5BB0y4KqLgTZDsBDksB5vRpGxX+A21j8VLCci5tWYIol
 k8MAMpiwQEPGxzkZN/gs2q5W6tOySVQjSib2MKwrvHCWidg9CDy3D/XVLj8N1ns+p0IV
 ERyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO9HANO/XXJdOWOam92vlzvbJTJZWAeo00sdwlwl280UBFs6sGXsa9eXl92V/7yF6Rezkh7vazL9k=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwrdXgzNldr/7vGfhzsau0F8nIJwJpNZf5DRgazqIikTQBGgGI8
 xi8Qx/oIiIlnBx+b5Bf/HhGpw6hr3Y4Vywa3Onr66JAmqp7mPLOS
X-Gm-Gg: ASbGncsqUpQI/gfArSpRpkWiZ9raglct1US+4sCWO7UGj0W7+KwJp1qk7WagTj6onFr
 9dW7s2QdAfJZo02Qy62sAla3ufhzoIZUkX2Q11A97ONYnJfbbZBV5QrIAsP8q/GHFdxkBFGpz+R
 8gm7ztwJxIVhZq3xKW8eQKPkV8OCSS7iIMvFUHaAE5t5K7drQHwwkK+YcagV0NLnKwGBxM8/NlJ
 OJoqSR2DUy5t+QNq0HAVYYvW6/GNSOdLS4FU7nV9mDsedQ=
X-Google-Smtp-Source: AGHT+IFUA9yMRsjxfnRxzsse9+CSmxwl7XAkA4eYuGkgQjijZt7M7pM04aasIYGaynTW3Vzrs9d/kg==
X-Received: by 2002:a05:6a00:22c2:b0:725:ef4b:de33 with SMTP id
 d2e1a72fcca58-72abdbe4de8mr66912486b3a.0.1735995474274; 
 Sat, 04 Jan 2025 04:57:54 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad830349sm27761344b3a.47.2025.01.04.04.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 04:57:53 -0800 (PST)
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
Subject: [PATCH net-next v7 01/11] rtnetlink: Lookup device in target netns
 when creating link
Date: Sat,  4 Jan 2025 20:57:22 +0800
Message-ID: <20250104125732.17335-2-shaw.leon@gmail.com>
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
index 6b745096809d..f65bd49da541 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3852,20 +3852,26 @@ static int __rtnl_newlink(struct sk_buff *skb, struct nlmsghdr *nlh,
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

