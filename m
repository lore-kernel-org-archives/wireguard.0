Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A359CC54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54d92279;
	Tue, 20 May 2025 19:40:24 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9ba71b3e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Feb 2025 13:31:22 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-21f49bd087cso54571875ad.0
 for <wireguard@lists.zx2c4.com>; Mon, 10 Feb 2025 05:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739194281; x=1739799081; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PyZ7Oa5HQm/CyDGlUAOCpKikT+Z0UZAcxIZ482ECX9g=;
 b=YieFjLynD4ewOEh4fWa/u0g108B44XZd2YFmJgZ2TRCZcluluVSRivpqHjj2P7iqEY
 67Iev/WxQHe6rcB1We3KIjjXlHJ9qjkA33D1CcB+1nrx2hDyH6j5BTHUeNmThKLZFWtA
 W7sNNBYgGQZr5m1xI8bhK596ohgUlm8oYzzjmKV2MBCuVpdY0ncm2b6Ll/fksa6Wy4Sj
 YcpGlw40YhTtx6UKuQath5y+kAkn5ZeY+D6H9KvhQL26wEx1l5zZ/fz6NNB47DW4Ub/F
 zKDsvwAO6KCr0DjxLxr/nbjuKgF+PK7gRx9juxi4cH8pyrUOGx5NKC0gF7oq6z0uRm0t
 ryxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739194281; x=1739799081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PyZ7Oa5HQm/CyDGlUAOCpKikT+Z0UZAcxIZ482ECX9g=;
 b=WPSrsQp9qon0wAoJPpl5IuSlXobgmRxuYoxK/aSMZ7WBA7+/8Yb4SBDCeCl/2YF4Y2
 fwVvqs4AprBabEK1MtyPFxAnfnno1UhFiqDePu+S6rRoQSJwriBUlEIF1AvfT9pnurP7
 XpQDHWOOjvVpIHQUy60UtxbKOpAeMXItcIV/OcSsukNlGg/Z4aQiu5pZ3bu7Blr1fVXe
 vmom1U5771OhHKTg03EiXkJIJnJ4NUV4ebrjajAm+kqIjYdGDlTEhOohilfrP1b3KagG
 4GW6XqD6tbVrsPWuZ6wk3Au8cpM7kcsvgoTp1ETwnz5zl9x+2RGaMPtQ1G3rjiuynST/
 7PWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuwneVn+cbdHYJ7IDMjFKQRF8FqqsPlDuEaoPxOFVN5Do/NC+OR8OJxCs+MtGgSKu4cUPJsGxeI7M=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyYrP1jh1jV63lbSJ9m6JTGdKStAwvGofr7SLmNYIx+KBfHCoG0
 UxihX34lNCmzXVEY6/lOLQJin654V12os3V7kIWtk+s7dlPSNspw
X-Gm-Gg: ASbGncuz+Lr36RrHVPnDi3AniP+zwAsBAEQNDXd1mC8zxjvOPPNe+AtwPFYVe8RbkVE
 cpEfqbTU7G0zgTESeTvtLCTVn++dRQ0bk3YBXgajCKPguEs64Yw9Jv6AMp6n5lAaIbUCkXxZ9OQ
 B0+Zibzkqg80Gi3JFYTjuXojHubTNXSNIKTGOSDSZLVP6Gcik653EJmtXhJjsAIekL1D9/4S8j8
 0eBL7CN7GyJVJhQbBSfpgRujgdZ4frMt3YucFvAyuGv7I3abeYdeR5L85Y0eMt+nh4cXjtgb7Sx
 Xn+GpA==
X-Google-Smtp-Source: AGHT+IHeusvrHP8M+FV2U5mrdVgA+KXf+BNwroimzhQyBeA1391Nd6kFx/ISaagEKEOW3Rex1VbPJw==
X-Received: by 2002:a17:902:c94a:b0:21f:8099:72e4 with SMTP id
 d9443c01a7336-21f809974bdmr103657145ad.28.1739194280801; 
 Mon, 10 Feb 2025 05:31:20 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653af3bsm78799445ad.57.2025.02.10.05.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 05:31:20 -0800 (PST)
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
Subject: [PATCH net-next v9 07/11] net: xfrm: Use link netns in newlink() of
 rtnl_link_ops
Date: Mon, 10 Feb 2025 21:29:58 +0800
Message-ID: <20250210133002.883422-8-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210133002.883422-1-shaw.leon@gmail.com>
References: <20250210133002.883422-1-shaw.leon@gmail.com>
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
index 5659a6cadd51..622445f041d3 100644
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
 
@@ -819,11 +818,12 @@ static int xfrmi_newlink(struct net_device *dev,
 			 struct netlink_ext_ack *extack)
 {
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
@@ -852,7 +852,7 @@ static int xfrmi_newlink(struct net_device *dev,
 	xi->net = net;
 	xi->dev = dev;
 
-	err = xfrmi_create(dev);
+	err = xfrmi_create(net, dev);
 	return err;
 }
 
-- 
2.48.1

