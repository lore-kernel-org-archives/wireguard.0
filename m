Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759E0C54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 21:22:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a091e03b;
	Tue, 20 May 2025 19:41:36 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3284f3eb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2025 12:51:58 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-220ca204d04so92010055ad.0
 for <wireguard@lists.zx2c4.com>; Wed, 19 Feb 2025 04:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739969517; x=1740574317; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B6bozwwxLUJNxVW5ZYXuCA298+o6a+m5Om77EOnyIyg=;
 b=LRQ9u6fN2rA7XyQ2OVOULQKiVtrh+quzpGFR1CVF0Xa88uBHEAiqOdH8myO72AGa56
 iQEFkTECGYTyi5uM6zEVCe0otSkgc+UVbqy+kWdLSy6Po6Uf5lwvn+ee8e/hVAzYHoVs
 a/j6v8HXSGGMame4m9lJsMEluyts8pUrKh40gkwvTccGKMwtf7I5eQvz6bXrKJt/hX5h
 uhWSrR+PzThSLLRFToFtrvj42tEClaO+Q5quRXctbS1kAlmhDuhz9o+mHyvlU3Zg72kQ
 hzXfI1PuHsg6I2Rii8Y4uGczw6sw7CqHDIXs3zD5LcW2nFgj9A9d4Ts2cSYYp0TZkQfE
 KV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969517; x=1740574317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B6bozwwxLUJNxVW5ZYXuCA298+o6a+m5Om77EOnyIyg=;
 b=jK3TEqBOrgAKip3Wb7Fxd2Ci9VtvPN11NP+HfG+OaSrG/cQlaTERtL62NKHjk/onUT
 4LtYO5TubfVJwW2s0+66MFPKhJgT33NSPKaaiTT4ZMzqsW44hrazeqbwnL/w79sdN/u8
 kiSZ3/ClCDJauK84fb8SqbDKB3r2pKrRTCo221jOdrMbQu/8qcMAPvyrelBMTiF/UfTj
 ZAZQ6VOaX+cwuvlXFDYHYDhtSZdhixWCU7tpiWPEgH2ZN2RlnGXtp6ddt70uFc/VW9+3
 8mYsJn5IDo5RD+QtoyoYEmq4BSQjB5MlaacoNhRH6QPltajt6J6Ok7TIhdftRwPnjcyY
 T/Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrz/URlCL/2SkInHgHswg84FIDQbp18fLeCndIRDePm4vSId3VWfSIthfZmhgHfsh0f7xCYul/h7A=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyU7L8nI7VHGytKp/VkizR9Lvp1xCxVwmw+zOVro0Hvp821WAPX
 sw3PD8dftScH72Fgh7F1PB0MfziSJeTQEj7ZgzIsBvwIlETTJJQc
X-Gm-Gg: ASbGncvhwj9w2JAarVNoeYaWX1+CbjR9HTLsr7hkF7x++9xVOd26JoicD4Q6ryFOcZj
 EAhsoWnOSnl9KazEG5LQX47j7bOK8FaScyhK+z2u0/4n2CXWiKj5mzSyEWpByjNZGnoYuWNqtMw
 5nDETtqF98y/LVJDv1ASKkdMqmpQzWRJ83+dpMrcioTfbLnyOzoGasDKL820mzwJ/OGOTjD+OfO
 O4x8hva+J1hLtvlG7HU5oBwpVtA1UOX4DF1JMvbYAKlalFe63/TAQLnFreDHiG8Y/km64pRhdjO
 qbU8gw==
X-Google-Smtp-Source: AGHT+IGKxW3/SlkXIFQ/R+7OZM2jJGBrIehyvby3inig7425vAO11UDlInuUnZBsT6heGdokKuXecQ==
X-Received: by 2002:a17:903:2305:b0:220:fce7:d3b8 with SMTP id
 d9443c01a7336-221709654admr66486875ad.12.1739969517203; 
 Wed, 19 Feb 2025 04:51:57 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d536436fsm103427175ad.64.2025.02.19.04.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:51:56 -0800 (PST)
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
Subject: [PATCH net-next v10 07/13] net: ipv6: Init tunnel link-netns before
 registering dev
Date: Wed, 19 Feb 2025 20:50:33 +0800
Message-ID: <20250219125039.18024-8-shaw.leon@gmail.com>
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

Currently some IPv6 tunnel drivers set tnl->net to dev_net(dev) in
ndo_init(), which is called in register_netdevice(). However, it lacks
the context of link-netns when we enable cross-net tunnels at device
registration time.

Let's move the init of tunnel link-netns before register_netdevice().

ip6_gre has already initialized netns, so just remove the redundant
assignment.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 net/ipv6/ip6_gre.c    | 2 --
 net/ipv6/ip6_tunnel.c | 3 ++-
 net/ipv6/ip6_vti.c    | 3 ++-
 net/ipv6/sit.c        | 8 +++++---
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 863852abe8ea..d9e6b1fd9917 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -1498,7 +1498,6 @@ static int ip6gre_tunnel_init_common(struct net_device *dev)
 	tunnel = netdev_priv(dev);
 
 	tunnel->dev = dev;
-	tunnel->net = dev_net(dev);
 	strcpy(tunnel->parms.name, dev->name);
 
 	ret = dst_cache_init(&tunnel->dst_cache, GFP_KERNEL);
@@ -1882,7 +1881,6 @@ static int ip6erspan_tap_init(struct net_device *dev)
 	tunnel = netdev_priv(dev);
 
 	tunnel->dev = dev;
-	tunnel->net = dev_net(dev);
 	strcpy(tunnel->parms.name, dev->name);
 
 	ret = dst_cache_init(&tunnel->dst_cache, GFP_KERNEL);
diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index 54b843d20870..111a8777c2f7 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -1878,7 +1878,6 @@ ip6_tnl_dev_init_gen(struct net_device *dev)
 	int t_hlen;
 
 	t->dev = dev;
-	t->net = dev_net(dev);
 
 	ret = dst_cache_init(&t->dst_cache, GFP_KERNEL);
 	if (ret)
@@ -1940,6 +1939,7 @@ static int __net_init ip6_fb_tnl_dev_init(struct net_device *dev)
 	struct net *net = dev_net(dev);
 	struct ip6_tnl_net *ip6n = net_generic(net, ip6_tnl_net_id);
 
+	t->net = net;
 	t->parms.proto = IPPROTO_IPV6;
 
 	rcu_assign_pointer(ip6n->tnls_wc[0], t);
@@ -2015,6 +2015,7 @@ static int ip6_tnl_newlink(struct net_device *dev,
 	int err;
 
 	nt = netdev_priv(dev);
+	nt->net = net;
 
 	if (ip_tunnel_netlink_encap_parms(data, &ipencap)) {
 		err = ip6_tnl_encap_setup(nt, &ipencap);
diff --git a/net/ipv6/ip6_vti.c b/net/ipv6/ip6_vti.c
index 993f85aeb882..16e0d74f99dd 100644
--- a/net/ipv6/ip6_vti.c
+++ b/net/ipv6/ip6_vti.c
@@ -925,7 +925,6 @@ static inline int vti6_dev_init_gen(struct net_device *dev)
 	struct ip6_tnl *t = netdev_priv(dev);
 
 	t->dev = dev;
-	t->net = dev_net(dev);
 	netdev_hold(dev, &t->dev_tracker, GFP_KERNEL);
 	netdev_lockdep_set_classes(dev);
 	return 0;
@@ -958,6 +957,7 @@ static int __net_init vti6_fb_tnl_dev_init(struct net_device *dev)
 	struct net *net = dev_net(dev);
 	struct vti6_net *ip6n = net_generic(net, vti6_net_id);
 
+	t->net = net;
 	t->parms.proto = IPPROTO_IPV6;
 
 	rcu_assign_pointer(ip6n->tnls_wc[0], t);
@@ -1009,6 +1009,7 @@ static int vti6_newlink(struct net_device *dev,
 	vti6_netlink_parms(data, &nt->parms);
 
 	nt->parms.proto = IPPROTO_IPV6;
+	nt->net = net;
 
 	if (vti6_locate(net, &nt->parms, 0))
 		return -EEXIST;
diff --git a/net/ipv6/sit.c b/net/ipv6/sit.c
index e2bd52cabdee..20453671ac50 100644
--- a/net/ipv6/sit.c
+++ b/net/ipv6/sit.c
@@ -269,6 +269,7 @@ static struct ip_tunnel *ipip6_tunnel_locate(struct net *net,
 
 	nt = netdev_priv(dev);
 
+	nt->net = net;
 	nt->parms = *parms;
 	if (ipip6_tunnel_create(dev) < 0)
 		goto failed_free;
@@ -1449,7 +1450,6 @@ static int ipip6_tunnel_init(struct net_device *dev)
 	int err;
 
 	tunnel->dev = dev;
-	tunnel->net = dev_net(dev);
 	strcpy(tunnel->parms.name, dev->name);
 
 	ipip6_tunnel_bind_dev(dev);
@@ -1565,6 +1565,7 @@ static int ipip6_newlink(struct net_device *dev,
 	int err;
 
 	nt = netdev_priv(dev);
+	nt->net = net;
 
 	if (ip_tunnel_netlink_encap_parms(data, &ipencap)) {
 		err = ip_tunnel_encap_setup(nt, &ipencap);
@@ -1860,6 +1861,9 @@ static int __net_init sit_init_net(struct net *net)
 	 */
 	sitn->fb_tunnel_dev->netns_local = true;
 
+	t = netdev_priv(sitn->fb_tunnel_dev);
+	t->net = net;
+
 	err = register_netdev(sitn->fb_tunnel_dev);
 	if (err)
 		goto err_reg_dev;
@@ -1867,8 +1871,6 @@ static int __net_init sit_init_net(struct net *net)
 	ipip6_tunnel_clone_6rd(sitn->fb_tunnel_dev, sitn);
 	ipip6_fb_tunnel_init(sitn->fb_tunnel_dev);
 
-	t = netdev_priv(sitn->fb_tunnel_dev);
-
 	strcpy(t->parms.name, sitn->fb_tunnel_dev->name);
 	return 0;
 
-- 
2.48.1

