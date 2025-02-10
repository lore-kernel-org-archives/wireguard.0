Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC019C54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 17:28:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18697e6e;
	Tue, 20 May 2025 19:40:14 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ce41f65b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Feb 2025 13:31:13 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-21f49bd087cso54566275ad.0
 for <wireguard@lists.zx2c4.com>; Mon, 10 Feb 2025 05:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739194272; x=1739799072; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qor1B34U3phrXDWeQbB/j8tAelAUjHbXmA4D1BB6HEE=;
 b=HwzFwiBHUORK0did0J3reTRMMCq1c7y4oxKeWGFDNfkDiS/LUF3oBVNjX9FTAG+7pw
 lHE19g9KCSciWKUYrssSwj3HP5ok2TVqztV2GyliBUxYV4E+FalhkpPqjthIgwRLvnZp
 y1vX8lRw9ipUH5qv3qPc9O0ptj323OQCXjzUlMQU1Cz3w77FVmSSsUmk9AGr2wOyWV/8
 67F/DVA/EwXeePrqWy9YrfAjhLqMGaH6Dc+4ePnEqAN9hd7I+6cnDgqqd4VN9GMwlEIn
 GFc4Ah+JS20t1Va611P3kETO9n6Hwvkk9SDkYO5Ho7DATaK3oEKeMvCp4W+JYV1ugIGa
 oGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739194272; x=1739799072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qor1B34U3phrXDWeQbB/j8tAelAUjHbXmA4D1BB6HEE=;
 b=H44XCAFgpJ/HZ49sLlOhbBcNYmD7YuvhMl2bdPxPNkVKHOcPEfPKVDXNMpJAOprO1n
 MFCB81DvWXvlPp7WK4jhtP1WXTjPrxKik4OUh8Vk36J4/YP4kTEchrx6eWDRKor2qK8V
 Odu74/4CktiOkEZfTNeXnD+bsJSDyOUe3emL6g6dkSbXRu8bkLfmlwXAviqQr1mND8/L
 1uZ+8L0MB9WZQthcxub4r3P/LRpY6GEDjUygydSBSJll11WnUzHIpoPoDg7e4epRjGRr
 +scjvHZAiQMOkG6Zh04dDuSlU0/5GE/tfB+ZRgxth8v5qyObE3kbjWjXHaEqanR6ESWj
 YasQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZwWpV9nHyxs5fFVLaBYVjUw/JZviKOgPYErAqyRyg9lX3IPDAS3Jqe2Tcs45eHnOlBSlX6Clskyw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yw6QoF2/VIEtm4pGWkRUOuE7gCkuoi+ymhoSibaxZiP6HUYIPL3
 sun8ByQNbjwDaBEjCtg2K8MlDf6oErkL2Q5uzBzvSJydCHobAleiT6pQ/ElAMAE=
X-Gm-Gg: ASbGncslvG0F+pmk67qDawNmHKXKKsS3JznvzU/b/7tgNUNfqIwQZXeLDh+ykl7N17u
 UUgzpaVWqzjxW/a5H9lPRP1VWrolU9cK5MOR6zRhBS8RspxbwwhdfdeOiTnFzzJbjlwS/agP70l
 ZlvTD6DQDJUrhxskFLI4+03B9Jhulfz8Npw0V2O1Qttjp1CNJ7AvkQKb6/WXq4hQjeh1CDHR/0z
 qZCmtWi1FPPWdOHpHQcoYwfjTaetcO85ej4u9O+FWGkouFqFnjex3ylZW1fra+SG6A1XV7QQ9Od
 8mFsoQ==
X-Google-Smtp-Source: AGHT+IFCFfI6vwnuduAlE62ZWjGMFvRKTwncJUJKPQ14C3FGCNohEq5KLKAyTOyXoZyqMzbv5RHKHA==
X-Received: by 2002:a17:903:1a06:b0:216:6769:9eca with SMTP id
 d9443c01a7336-21f4e73acf5mr177842015ad.37.1739194272042; 
 Mon, 10 Feb 2025 05:31:12 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653af3bsm78799445ad.57.2025.02.10.05.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 05:31:11 -0800 (PST)
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
Subject: [PATCH net-next v9 06/11] net: ipv6: Use link netns in newlink() of
 rtnl_link_ops
Date: Mon, 10 Feb 2025 21:29:57 +0800
Message-ID: <20250210133002.883422-7-shaw.leon@gmail.com>
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

Set correct netns in priv before registering device, and avoid
overwriting it in ndo_init() path.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 net/ipv6/ip6_gre.c    | 20 ++++++++++----------
 net/ipv6/ip6_tunnel.c | 13 ++++++++-----
 net/ipv6/ip6_vti.c    | 10 ++++++----
 net/ipv6/sit.c        | 11 +++++++----
 4 files changed, 31 insertions(+), 23 deletions(-)

diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 863852abe8ea..108600dc716f 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -1498,7 +1498,8 @@ static int ip6gre_tunnel_init_common(struct net_device *dev)
 	tunnel = netdev_priv(dev);
 
 	tunnel->dev = dev;
-	tunnel->net = dev_net(dev);
+	if (!tunnel->net)
+		tunnel->net = dev_net(dev);
 	strcpy(tunnel->parms.name, dev->name);
 
 	ret = dst_cache_init(&tunnel->dst_cache, GFP_KERNEL);
@@ -1882,7 +1883,8 @@ static int ip6erspan_tap_init(struct net_device *dev)
 	tunnel = netdev_priv(dev);
 
 	tunnel->dev = dev;
-	tunnel->net = dev_net(dev);
+	if (!tunnel->net)
+		tunnel->net = dev_net(dev);
 	strcpy(tunnel->parms.name, dev->name);
 
 	ret = dst_cache_init(&tunnel->dst_cache, GFP_KERNEL);
@@ -1971,7 +1973,7 @@ static bool ip6gre_netlink_encap_parms(struct nlattr *data[],
 	return ret;
 }
 
-static int ip6gre_newlink_common(struct net *src_net, struct net_device *dev,
+static int ip6gre_newlink_common(struct net *link_net, struct net_device *dev,
 				 struct nlattr *tb[], struct nlattr *data[],
 				 struct netlink_ext_ack *extack)
 {
@@ -1992,7 +1994,7 @@ static int ip6gre_newlink_common(struct net *src_net, struct net_device *dev,
 		eth_hw_addr_random(dev);
 
 	nt->dev = dev;
-	nt->net = dev_net(dev);
+	nt->net = link_net;
 
 	err = register_netdevice(dev);
 	if (err)
@@ -2009,11 +2011,10 @@ static int ip6gre_newlink(struct net_device *dev,
 			  struct rtnl_newlink_params *params,
 			  struct netlink_ext_ack *extack)
 {
+	struct net *net = params->link_net ? : dev_net(dev);
 	struct ip6_tnl *nt = netdev_priv(dev);
 	struct nlattr **data = params->data;
-	struct net *src_net = params->net;
 	struct nlattr **tb = params->tb;
-	struct net *net = dev_net(dev);
 	struct ip6gre_net *ign;
 	int err;
 
@@ -2028,7 +2029,7 @@ static int ip6gre_newlink(struct net_device *dev,
 			return -EEXIST;
 	}
 
-	err = ip6gre_newlink_common(src_net, dev, tb, data, extack);
+	err = ip6gre_newlink_common(net, dev, tb, data, extack);
 	if (!err) {
 		ip6gre_tnl_link_config(nt, !tb[IFLA_MTU]);
 		ip6gre_tunnel_link_md(ign, nt);
@@ -2248,11 +2249,10 @@ static int ip6erspan_newlink(struct net_device *dev,
 			     struct rtnl_newlink_params *params,
 			     struct netlink_ext_ack *extack)
 {
+	struct net *net = params->link_net ? : dev_net(dev);
 	struct ip6_tnl *nt = netdev_priv(dev);
 	struct nlattr **data = params->data;
-	struct net *src_net = params->net;
 	struct nlattr **tb = params->tb;
-	struct net *net = dev_net(dev);
 	struct ip6gre_net *ign;
 	int err;
 
@@ -2268,7 +2268,7 @@ static int ip6erspan_newlink(struct net_device *dev,
 			return -EEXIST;
 	}
 
-	err = ip6gre_newlink_common(src_net, dev, tb, data, extack);
+	err = ip6gre_newlink_common(net, dev, tb, data, extack);
 	if (!err) {
 		ip6erspan_tnl_link_config(nt, !tb[IFLA_MTU]);
 		ip6erspan_tunnel_link_md(ign, nt);
diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index 54b843d20870..2438dc627e02 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -253,8 +253,7 @@ static void ip6_dev_free(struct net_device *dev)
 static int ip6_tnl_create2(struct net_device *dev)
 {
 	struct ip6_tnl *t = netdev_priv(dev);
-	struct net *net = dev_net(dev);
-	struct ip6_tnl_net *ip6n = net_generic(net, ip6_tnl_net_id);
+	struct ip6_tnl_net *ip6n = net_generic(t->net, ip6_tnl_net_id);
 	int err;
 
 	dev->rtnl_link_ops = &ip6_link_ops;
@@ -1878,7 +1877,8 @@ ip6_tnl_dev_init_gen(struct net_device *dev)
 	int t_hlen;
 
 	t->dev = dev;
-	t->net = dev_net(dev);
+	if (!t->net)
+		t->net = dev_net(dev);
 
 	ret = dst_cache_init(&t->dst_cache, GFP_KERNEL);
 	if (ret)
@@ -2008,13 +2008,16 @@ static int ip6_tnl_newlink(struct net_device *dev,
 {
 	struct nlattr **data = params->data;
 	struct nlattr **tb = params->tb;
-	struct net *net = dev_net(dev);
-	struct ip6_tnl_net *ip6n = net_generic(net, ip6_tnl_net_id);
 	struct ip_tunnel_encap ipencap;
+	struct ip6_tnl_net *ip6n;
 	struct ip6_tnl *nt, *t;
+	struct net *net;
 	int err;
 
+	net = params->link_net ? : dev_net(dev);
+	ip6n = net_generic(net, ip6_tnl_net_id);
 	nt = netdev_priv(dev);
+	nt->net = net;
 
 	if (ip_tunnel_netlink_encap_parms(data, &ipencap)) {
 		err = ip6_tnl_encap_setup(nt, &ipencap);
diff --git a/net/ipv6/ip6_vti.c b/net/ipv6/ip6_vti.c
index 993f85aeb882..4aa1e7821951 100644
--- a/net/ipv6/ip6_vti.c
+++ b/net/ipv6/ip6_vti.c
@@ -177,8 +177,7 @@ vti6_tnl_unlink(struct vti6_net *ip6n, struct ip6_tnl *t)
 static int vti6_tnl_create2(struct net_device *dev)
 {
 	struct ip6_tnl *t = netdev_priv(dev);
-	struct net *net = dev_net(dev);
-	struct vti6_net *ip6n = net_generic(net, vti6_net_id);
+	struct vti6_net *ip6n = net_generic(t->net, vti6_net_id);
 	int err;
 
 	dev->rtnl_link_ops = &vti6_link_ops;
@@ -925,7 +924,8 @@ static inline int vti6_dev_init_gen(struct net_device *dev)
 	struct ip6_tnl *t = netdev_priv(dev);
 
 	t->dev = dev;
-	t->net = dev_net(dev);
+	if (!t->net)
+		t->net = dev_net(dev);
 	netdev_hold(dev, &t->dev_tracker, GFP_KERNEL);
 	netdev_lockdep_set_classes(dev);
 	return 0;
@@ -1002,13 +1002,15 @@ static int vti6_newlink(struct net_device *dev,
 			struct netlink_ext_ack *extack)
 {
 	struct nlattr **data = params->data;
-	struct net *net = dev_net(dev);
 	struct ip6_tnl *nt;
+	struct net *net;
 
+	net = params->link_net ? : dev_net(dev);
 	nt = netdev_priv(dev);
 	vti6_netlink_parms(data, &nt->parms);
 
 	nt->parms.proto = IPPROTO_IPV6;
+	nt->net = net;
 
 	if (vti6_locate(net, &nt->parms, 0))
 		return -EEXIST;
diff --git a/net/ipv6/sit.c b/net/ipv6/sit.c
index e2bd52cabdee..e870271ed04a 100644
--- a/net/ipv6/sit.c
+++ b/net/ipv6/sit.c
@@ -201,8 +201,7 @@ static void ipip6_tunnel_clone_6rd(struct net_device *dev, struct sit_net *sitn)
 static int ipip6_tunnel_create(struct net_device *dev)
 {
 	struct ip_tunnel *t = netdev_priv(dev);
-	struct net *net = dev_net(dev);
-	struct sit_net *sitn = net_generic(net, sit_net_id);
+	struct sit_net *sitn = net_generic(t->net, sit_net_id);
 	int err;
 
 	__dev_addr_set(dev, &t->parms.iph.saddr, 4);
@@ -270,6 +269,7 @@ static struct ip_tunnel *ipip6_tunnel_locate(struct net *net,
 	nt = netdev_priv(dev);
 
 	nt->parms = *parms;
+	nt->net = net;
 	if (ipip6_tunnel_create(dev) < 0)
 		goto failed_free;
 
@@ -1449,7 +1449,8 @@ static int ipip6_tunnel_init(struct net_device *dev)
 	int err;
 
 	tunnel->dev = dev;
-	tunnel->net = dev_net(dev);
+	if (!tunnel->net)
+		tunnel->net = dev_net(dev);
 	strcpy(tunnel->parms.name, dev->name);
 
 	ipip6_tunnel_bind_dev(dev);
@@ -1556,15 +1557,17 @@ static int ipip6_newlink(struct net_device *dev,
 {
 	struct nlattr **data = params->data;
 	struct nlattr **tb = params->tb;
-	struct net *net = dev_net(dev);
 	struct ip_tunnel *nt;
 	struct ip_tunnel_encap ipencap;
 #ifdef CONFIG_IPV6_SIT_6RD
 	struct ip_tunnel_6rd ip6rd;
 #endif
+	struct net *net;
 	int err;
 
+	net = params->link_net ? : dev_net(dev);
 	nt = netdev_priv(dev);
+	nt->net = net;
 
 	if (ip_tunnel_netlink_encap_parms(data, &ipencap)) {
 		err = ip_tunnel_encap_setup(nt, &ipencap);
-- 
2.48.1

