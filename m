Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90161C54E93
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 21:22:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f13a023;
	Tue, 20 May 2025 19:35:55 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 51c6ba4d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2024 13:10:07 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7242f559a9fso8248067b3a.1
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2024 05:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734527406; x=1735132206; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duDRQNaydM9MnygAgym8Q8/9ko+la+IiXsEzlSyfpMg=;
 b=ASiAdHNHiLmdRtKtFjYguc6+/J3L/b6jqhB4wPAoS1Hw43u+VOlld4bvNFBvM3pwx2
 ULZSjVnZi8My7nRbbuKAeJJwNwq4RJ0Rw93AvqaDkbujZXusAdTXr4Ss/QixfGWpKf8c
 l/gnJhcSWjOS7UEVZXwK4oV/JBV5ma6NNJ73DooaeEPS2C86cBTZShpyzHs58uysyE/Y
 3msQewN8FzMuppCVNqfZ9qWTo7zKSTUfK5Bi/LY/Ko3DY6SFkHwlbG/qznTsHddSixcZ
 rKVZ5Sw+mw4iNgLEdKXI5GxRkctn6IFkpueKjjW5+o2xfSichQSbbg3X44Bzo6BWAdJY
 /Cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734527406; x=1735132206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=duDRQNaydM9MnygAgym8Q8/9ko+la+IiXsEzlSyfpMg=;
 b=EuUrF/gOzOsFCjMSPLAvxSu75jn93GIEdHnHrqKLlzZoEQDtE6tjtcA8eGEs9d2UNX
 BvI9aqNPzAaBr5w05/L6rAZ/tKuQnKtbtH0WqXMFHHOGo98jBNRrccZI7/eI68CFMEsv
 ceJpQyA/x+iUb9ULxJDgeG6cIjIUw0fK0Tl2pmCNXV5yn4GRjTMFr0NKhMO6h/W+eVjy
 Kqj3vMq+YJXYF5TR63jIYOmbgenN3D7ixa2bho6JVfFVAYIpqe77SawltvkFxF3vgC0p
 Jos0vbPszqmWVtZc/rVxXcO0cxdy4BSUKNQwK/z1K32e7hgrTbtVfOmS7p6s2GFIdaXP
 3v2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjrw2j3NAY93ZcVvEjgMPNRlGbdQLKmm0admY5VeEp7qqdRiCNJeIWEUYGxNDwdg1/cPlu/A0yGnk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwTNAHEFy0bll2+s9PnSOt5R/kzPvvafCJKqgqk201cObdos3LB
 mWsMUu8Xz6Pq0K/cXsxQzwl3rbT8Q4AaCAJUfDNdUymy+kL4CrpE
X-Gm-Gg: ASbGnctAjCHvpSVP3lAAaMlLToLgnsBSmtl2hYZU7H7KLKuEZVMj41Q/xcoWPwNXR9A
 MUoO7h8TWYV/WqT+RuF1Ablbk9fjXDBwLoYboA8Et9MFuYB0DbuLz3HhTbOuENElzOnGupNP7cm
 SFKVK9qjnelvonVSeNpwbRDJarN3sd4+OXJN53L4rrYBU4/CslqrCnuAlKWsBm1sehSkdxzBBO9
 gJhl/S4RIexHd3ChyFVkTil7CkI+V80GHoRXwP29X+2Wsk=
X-Google-Smtp-Source: AGHT+IHjAWByhkuRCvJpT02c4DgXI4s1gEBDobTpc14t8liBEMaFpl/IXfL3hYD82aWPv+sYgjfNgQ==
X-Received: by 2002:a05:6a21:c94:b0:1e1:a647:8a3f with SMTP id
 adf61e73a8af0-1e5b4824307mr5763308637.22.1734527405806; 
 Wed, 18 Dec 2024 05:10:05 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5c0f59asm7434754a12.67.2024.12.18.05.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 05:10:05 -0800 (PST)
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
Subject: [PATCH net-next v6 05/11] net: ip_tunnel: Use link netns in newlink()
 of rtnl_link_ops
Date: Wed, 18 Dec 2024 21:09:03 +0800
Message-ID: <20241218130909.2173-6-shaw.leon@gmail.com>
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

Convert common ip_tunnel_newlink() to accept an extra link netns
argument. Don't overwrite ip_tunnel.net in ip_tunnel_init().

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 include/net/ip_tunnels.h |  5 +++--
 net/ipv4/ip_gre.c        |  8 +++++---
 net/ipv4/ip_tunnel.c     | 10 ++++++----
 net/ipv4/ip_vti.c        |  3 ++-
 net/ipv4/ipip.c          |  3 ++-
 5 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/include/net/ip_tunnels.h b/include/net/ip_tunnels.h
index 1aa31bdb2b31..ae1f2dda4533 100644
--- a/include/net/ip_tunnels.h
+++ b/include/net/ip_tunnels.h
@@ -406,8 +406,9 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 		  bool log_ecn_error);
 int ip_tunnel_changelink(struct net_device *dev, struct nlattr *tb[],
 			 struct ip_tunnel_parm_kern *p, __u32 fwmark);
-int ip_tunnel_newlink(struct net_device *dev, struct nlattr *tb[],
-		      struct ip_tunnel_parm_kern *p, __u32 fwmark);
+int ip_tunnel_newlink(struct net *net, struct net_device *dev,
+		      struct nlattr *tb[], struct ip_tunnel_parm_kern *p,
+		      __u32 fwmark);
 void ip_tunnel_setup(struct net_device *dev, unsigned int net_id);
 
 bool ip_tunnel_netlink_encap_parms(struct nlattr *data[],
diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index ecad1d88dd26..bae80bb7839a 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -1405,7 +1405,8 @@ static int ipgre_newlink(struct rtnl_newlink_params *params)
 	err = ipgre_netlink_parms(dev, data, tb, &p, &fwmark);
 	if (err < 0)
 		return err;
-	return ip_tunnel_newlink(dev, tb, &p, fwmark);
+	return ip_tunnel_newlink(params->link_net ? : dev_net(dev), dev, tb, &p,
+				 fwmark);
 }
 
 static int erspan_newlink(struct rtnl_newlink_params *params)
@@ -1424,7 +1425,8 @@ static int erspan_newlink(struct rtnl_newlink_params *params)
 	err = erspan_netlink_parms(dev, data, tb, &p, &fwmark);
 	if (err)
 		return err;
-	return ip_tunnel_newlink(dev, tb, &p, fwmark);
+	return ip_tunnel_newlink(params->link_net ? : dev_net(dev), dev, tb, &p,
+				 fwmark);
 }
 
 static int ipgre_changelink(struct net_device *dev, struct nlattr *tb[],
@@ -1698,7 +1700,7 @@ struct net_device *gretap_fb_dev_create(struct net *net, const char *name,
 	struct ip_tunnel *t;
 	int err;
 	struct rtnl_newlink_params params = {
-		.net = net,
+		.src_net = net,
 		.tb = tb,
 	};
 
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 25505f9b724c..952d2241c9b1 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -1213,11 +1213,11 @@ void ip_tunnel_delete_nets(struct list_head *net_list, unsigned int id,
 }
 EXPORT_SYMBOL_GPL(ip_tunnel_delete_nets);
 
-int ip_tunnel_newlink(struct net_device *dev, struct nlattr *tb[],
-		      struct ip_tunnel_parm_kern *p, __u32 fwmark)
+int ip_tunnel_newlink(struct net *net, struct net_device *dev,
+		      struct nlattr *tb[], struct ip_tunnel_parm_kern *p,
+		      __u32 fwmark)
 {
 	struct ip_tunnel *nt;
-	struct net *net = dev_net(dev);
 	struct ip_tunnel_net *itn;
 	int mtu;
 	int err;
@@ -1326,7 +1326,9 @@ int ip_tunnel_init(struct net_device *dev)
 	}
 
 	tunnel->dev = dev;
-	tunnel->net = dev_net(dev);
+	if (!tunnel->net)
+		tunnel->net = dev_net(dev);
+
 	strscpy(tunnel->parms.name, dev->name);
 	iph->version		= 4;
 	iph->ihl		= 5;
diff --git a/net/ipv4/ip_vti.c b/net/ipv4/ip_vti.c
index 12ccbf34fb6c..98752b4d28ad 100644
--- a/net/ipv4/ip_vti.c
+++ b/net/ipv4/ip_vti.c
@@ -584,7 +584,8 @@ static int vti_newlink(struct rtnl_newlink_params *params)
 	__u32 fwmark = 0;
 
 	vti_netlink_parms(data, &parms, &fwmark);
-	return ip_tunnel_newlink(dev, tb, &parms, fwmark);
+	return ip_tunnel_newlink(params->link_net ? : dev_net(dev), dev, tb,
+				 &parms, fwmark);
 }
 
 static int vti_changelink(struct net_device *dev, struct nlattr *tb[],
diff --git a/net/ipv4/ipip.c b/net/ipv4/ipip.c
index 3a737ea3c2e5..c65c8b0e838f 100644
--- a/net/ipv4/ipip.c
+++ b/net/ipv4/ipip.c
@@ -456,7 +456,8 @@ static int ipip_newlink(struct rtnl_newlink_params *params)
 	}
 
 	ipip_netlink_parms(data, &p, &t->collect_md, &fwmark);
-	return ip_tunnel_newlink(dev, tb, &p, fwmark);
+	return ip_tunnel_newlink(params->link_net ? : dev_net(dev), dev, tb, &p,
+				 fwmark);
 }
 
 static int ipip_changelink(struct net_device *dev, struct nlattr *tb[],
-- 
2.47.1

