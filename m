Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4525C54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 12:39:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60948395;
	Tue, 20 May 2025 19:35:52 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 25851f53
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2024 13:09:59 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-728f1e66418so5660087b3a.2
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2024 05:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734527398; x=1735132198; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWtx/GpPr8Y7UYus5aPINKHxwSB0EzMFBw6o16b+Q3k=;
 b=ZREzdVnjXwTdbKd6t67icFazEFqW8MTm+kEjNnnd94Ea8Um/aDrMw+ZUmLyXbTi7Nj
 lzUGiG/fOjtOXZ1WRvwHkIS19ylD/gf8l1O7UxiyWnDg+2nA1wX0wlFbVVva8R4qkXiL
 CO+vQycWlXQdGunA5CrWIVI2thBXZM/1T5Sy4LJaUiQwlmVD4KMj8kTzKqk2VmXyyAx5
 eZOTNTEw7eVDNm5vHdLbg9wRgJhbijuTvvT+hIOkR2ag5mggzufdn3SRsPldos+C8Mwh
 Y2qhYYH4qUD/vXC+dM3Ae8WSpfkbfqxjEFe3gmVP0OolCr1NeFi+wWVtOHCDteoGlBXv
 IR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734527398; x=1735132198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZWtx/GpPr8Y7UYus5aPINKHxwSB0EzMFBw6o16b+Q3k=;
 b=wzdzOGwfkg18OfGVqbhCAv/7m89DUmEhHotu71cL0DW4IfBZWC7wOOlIxqGTvosmrA
 KtX+sAN4egIxu7QvoY6NeKuxOLEI/s2/0YoLnjfvkdqyx+CQ7N1LjZildaatn57cJNpR
 /Al2+nNn2pOZGVHwX/g2+foK6FFd1d6yVrFuykfZxrIzgV8Tr8dF6+reumxXbA91di02
 Pc4MrUn1D5fPUcij+dnjrGSdZ2iBqTyltfLMKrxWMzhKBxnSdvtSQ0iPAZTuv5rAbljQ
 xr3wex+pvPrKm6PMTWgNR8bw+Iux3H2Xp5iyvlPX8X1Ihm4lboZHUgd3PVu+qh5Ooyiy
 DJxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfcyi/09cs6p97v9tGqGlFxDavl4CKMLxvjk95ZLq3rX7S/VCn/aHTb1VrNTQv+HwB9Q9XJ5qef6s=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Ywll0XpeIoLNrfh1mrWtyowHn7riLv9hRW8cZGOvMoNsKhZz0/W
 NfihtpNYTUYoAK2rIru1ddJ89O33JibE4kJSzLC9P65J2a8Z0xKq
X-Gm-Gg: ASbGncvXukkQYID7BP+LERT3ySJ9bqZ0ViAFjCSGLVTZJgIRpsr6jHTEae88NZ4S5zj
 nUCodQv2bdYbX0XRO/3yOf8Txs+VdmY4/si2IZ3jFb0zfSN+LkuRg7CX5M0Se+WpueBlZwMpMh9
 VcHnB1HfscN74Ks75RlvvHI6h3rtPTZ6o/ECpQZs3jbdNsdeUwfuRbqvpBAb/EJ5mCo7Y5Ui0GD
 S1HWkDUyNrzViKCvMXOSwixA0v9HX2lrPkFjMDGW0TP4EE=
X-Google-Smtp-Source: AGHT+IGmYU6ujKxLBy1JGYsxY/MwVi8oxkRDUmwYNBJP1y7XmPRqmJNLVIgjjMfYAOzzfAymm/3esA==
X-Received: by 2002:a05:6a00:35c3:b0:71e:1722:d019 with SMTP id
 d2e1a72fcca58-72a8d2f0b92mr4132701b3a.22.1734527397729; 
 Wed, 18 Dec 2024 05:09:57 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5c0f59asm7434754a12.67.2024.12.18.05.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 05:09:57 -0800 (PST)
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
Subject: [PATCH net-next v6 04/11] ieee802154: 6lowpan: Use link netns in
 newlink() of rtnl_link_ops
Date: Wed, 18 Dec 2024 21:09:02 +0800
Message-ID: <20241218130909.2173-5-shaw.leon@gmail.com>
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

When link_net is set, use it as link netns instead of dev_net(). This
prepares for rtnetlink core to create device in target netns directly,
in which case the two namespaces may be different.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 net/ieee802154/6lowpan/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ieee802154/6lowpan/core.c b/net/ieee802154/6lowpan/core.c
index c16c14807d87..65a5c61cf38c 100644
--- a/net/ieee802154/6lowpan/core.c
+++ b/net/ieee802154/6lowpan/core.c
@@ -143,7 +143,8 @@ static int lowpan_newlink(struct rtnl_newlink_params *params)
 	if (!tb[IFLA_LINK])
 		return -EINVAL;
 	/* find and hold wpan device */
-	wdev = dev_get_by_index(dev_net(ldev), nla_get_u32(tb[IFLA_LINK]));
+	wdev = dev_get_by_index(params->link_net ? : dev_net(ldev),
+				nla_get_u32(tb[IFLA_LINK]));
 	if (!wdev)
 		return -ENODEV;
 	if (wdev->type != ARPHRD_IEEE802154) {
-- 
2.47.1

