Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CDFC3DA6D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 22:15:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36d5b16f;
	Tue, 20 May 2025 19:36:01 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 12c4910a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2024 13:10:24 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-728f337a921so6722407b3a.3
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2024 05:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734527422; x=1735132222; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bXH8tUP/h7NPxTwhkU8DrmHX10k3nPXxIbmClQOEn5A=;
 b=HZXeFKL7kLcYeidgt9uxGS90hvO/N7IonYZet50Iy6aZP1Jp5lcaj+Klbv/IxoO+Tw
 AlWnnSOKQU9t0dqzAmfX6VTvUNxtmNHbW1JLj85UqvEuk1G0ksfv67E1IBcIpaBWYSRI
 hWE3AQlGIdOlfcM8Y3//mDvvqW80CNFtVqOOs6hkrhniTkwZrgiCNHXOK89KNYEtkDGg
 X6ce1iStx0LQyfkDNnlyD5oybutcd/BbDXeQnoTJoZbg2v1O4s5SWb7bOcTnyqlNhfF+
 NAaT02wwiKQPJgLgV0+VAp3fg2d6pwFUapM38w7+u9d2fRKVT/vi3DYd1vLbx2L5NL8v
 ilmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734527422; x=1735132222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bXH8tUP/h7NPxTwhkU8DrmHX10k3nPXxIbmClQOEn5A=;
 b=v0vYEir9mmaKrIzYo7EgflTNAmRCKyb8rEpzu9mblLfKkXXUo+yLxf6gTcnb53C2c1
 a649V6jQnWDfEJGnyLhUZZa/n/T9pheL4FV221E+ZQK6eR/kUIcC0/j8RbifdIqe6voC
 pTwsDPGv/gNqvFyHjElKiSCrReLJOPmkXihDtbFaxVCnmRhPnT0CDhjF285plO6HPHKd
 Fta+FWz6sk7AlXtwJOaySWHHa6MraLzqqkfuLL3C6b94utESi73F7LSRu5P1iXMVCL89
 U71E5O8b7gDLASdKayIgtL7SeWf1U+OBYgdwg4LJlwD8wXqdOefZs++H/JrMWFRTwIAl
 8iFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFD7/MJ9gKkFpBd/FN2mBS0G1/ke39LsKM2mrnQMEVfx66Dw16wn4G8T16o+LpRV8NJDQL/rbRLBs=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Ywf+iL/r5ot+TjJSoBBv7z1isvsFoZIB8S/clBGWXc6IO7bYeo8
 fGbPmolw91kxLAbuIvJTpYN4TMVDuXA25ap8U8DjB/d2lGKrwa3T
X-Gm-Gg: ASbGncunoyfFsVk0g0g6RGEK1q8mN8BQrcE/M7g3RJLOn1rqUBH7bR3zaHk1X3qCwwx
 q04FP5/Oear+89DDGaG5wFl8PndmqniLkax6+Q3NMfTHzFXBiRoIw17TQ3608R4Cq096eZ5zELB
 tbhPUiiEK3crj9elbUrBajLLRY0XZ8QUA9p9hPy1/882Y8baoN4ODQaKfHJq1ukUt/fCctVYBGQ
 WhtO9Tw74mm8nrlOIriBmW/dzjhEQmc8PYvaBMMvoKv4IE=
X-Google-Smtp-Source: AGHT+IGLrMJpewCg9a6Mvczs3iBMMwjIWUW57/cgClFku2ou3JPxqZ6yK8d+Q9sS8i4XncDR+dfRig==
X-Received: by 2002:a05:6a20:12c6:b0:1e1:bee3:50ea with SMTP id
 adf61e73a8af0-1e5b47f94bcmr5116348637.11.1734527422239; 
 Wed, 18 Dec 2024 05:10:22 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5c0f59asm7434754a12.67.2024.12.18.05.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 05:10:21 -0800 (PST)
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
Subject: [PATCH net-next v6 07/11] net: xfrm: Use link netns in newlink() of
 rtnl_link_ops
Date: Wed, 18 Dec 2024 21:09:05 +0800
Message-ID: <20241218130909.2173-8-shaw.leon@gmail.com>
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
 net/xfrm/xfrm_interface_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/xfrm/xfrm_interface_core.c b/net/xfrm/xfrm_interface_core.c
index 77d50d4af4a1..d1198c63dd23 100644
--- a/net/xfrm/xfrm_interface_core.c
+++ b/net/xfrm/xfrm_interface_core.c
@@ -242,10 +242,9 @@ static void xfrmi_dev_free(struct net_device *dev)
 	gro_cells_destroy(&xi->gro_cells);
 }
 
-static int xfrmi_create(struct net_device *dev)
+static int xfrmi_create(struct net *net, struct net_device *dev)
 {
 	struct xfrm_if *xi = netdev_priv(dev);
-	struct net *net = dev_net(dev);
 	struct xfrmi_net *xfrmn = net_generic(net, xfrmi_net_id);
 	int err;
 
@@ -819,11 +818,12 @@ static int xfrmi_newlink(struct rtnl_newlink_params *params)
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
-	struct net *net = dev_net(dev);
 	struct xfrm_if_parms p = {};
 	struct xfrm_if *xi;
+	struct net *net;
 	int err;
 
+	net = params->link_net ? : dev_net(dev);
 	xfrmi_netlink_parms(data, &p);
 	if (p.collect_md) {
 		struct xfrmi_net *xfrmn = net_generic(net, xfrmi_net_id);
@@ -852,7 +852,7 @@ static int xfrmi_newlink(struct rtnl_newlink_params *params)
 	xi->net = net;
 	xi->dev = dev;
 
-	err = xfrmi_create(dev);
+	err = xfrmi_create(net, dev);
 	return err;
 }
 
-- 
2.47.1

