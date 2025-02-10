Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF92C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ed86354;
	Tue, 20 May 2025 19:40:06 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d24ca3c2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Feb 2025 13:31:04 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-21f4500a5c3so82742455ad.3
 for <wireguard@lists.zx2c4.com>; Mon, 10 Feb 2025 05:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739194263; x=1739799063; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pJKz1g6voDImT0UUTo/s+cF5fKbKW++euQC6BW/L/6A=;
 b=m2bTuAGhGcc73p0Y1hz93uFGAADp67+92J2peG7jC3rQ6WCxAcMUzclb3q4cXcO+Kf
 SxsBk/hoRSVEEjMxdllWq/uKVUWTTaxS1FVt7geLSy/hLgnm4AF4oE6LRwuz6V7oIs6s
 HJr8kSch02Z3SXZPy+XQygno8ONHa9D4aOq8QiDNDTUy+0HWDqRaQSreWOq/dykwo0KH
 Wx5II/OnCrXpDt/5HVfyk8Hjk7MsE/hP10zZTYY49G3UV4Oc07AY5j/SjBKqUyvFGHLB
 qV79dM+YVVrKq2DgAau7+UozB5tU1JyDWNjTvcrq/m4UhRlq1CwnTtXplunMFf226O81
 PbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739194263; x=1739799063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pJKz1g6voDImT0UUTo/s+cF5fKbKW++euQC6BW/L/6A=;
 b=N9ya4yHUUr+wJ2Ew/EZFKjjh24G/h3UnNsP7LPn6BoQc3E3EYPh9sTOxJFoYYB1Hhq
 W8EM7gxMDnL0UicOBpuHMZcMjRiC56y7ujS5Zc6O8u5y1cXTVZjiCRm4Q6ZrMBbC1Wyo
 I2fxWfdQRXjHknFLz0yl6+HiKAwikWBPPvpdtsNr5Pw2AGn1fK8jp2jXCkPeom5Qz7HZ
 0QajlL9LPZTWR8UYF9DlMoRpNyfCOOOsZSWaIgbkgDiuvDVCv6Utho3XhjN7cOw01WV2
 Dnbj4kL+TULJsquTY1rwyZtrMJ1y1YbQkj3nUiaTZbUaJS5n5p36S+QRLvjJLYu3p9It
 cafQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOf8u92RPHbhZWz82DCS8Gtsp1OHpSePor0rOEx9MniJp4SRXNRfN3I/5J5KwQrOnstjco23V3c1o=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yx4lV7VBx3eW4E6DkUK2EmRxkubr4MXYP/TuPy+50X4t8ZYo8pO
 ZnV+py0yvroGyEIJRxyGVhr8YX+YywofN4R1nrNeIaw+SrIgnV2y
X-Gm-Gg: ASbGncsu6KaR0BohorVhoVBjYE5tz+QxMt136UljeDciEbWuk7klMcoNd+vSGOCeWdK
 ZCXkDQdUM49eO+0eHru+Zn48VDwt9cl3Bq2Nl9jqmqGaG1sv58q5KoaYm2sox4xPwLgFcRjAZaG
 M2dsVG3iEGWXq8I9gq1JNScselBMHx1+VvidrZg59G6uSOhbzv+I1mpt3+Yhbz0uU47I7XvApYu
 8V9vELS09FcGuusrftj/By+YQ6HHyFeOunRvZx65xx62JwYVseSiCuAOcWTOFlMji50ym8lycBh
 9KmkFw==
X-Google-Smtp-Source: AGHT+IGNFjsW8yGSZG6C2tbCv5/JZ09OmB3LKkjVhY7agbUhlCe28tcl+Qcya8rlcfYhnDrE2/S9OQ==
X-Received: by 2002:a17:902:e946:b0:216:7cde:51a with SMTP id
 d9443c01a7336-21f4e72631dmr249984615ad.28.1739194263028; 
 Mon, 10 Feb 2025 05:31:03 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653af3bsm78799445ad.57.2025.02.10.05.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 05:31:02 -0800 (PST)
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
Subject: [PATCH net-next v9 05/11] net: ip_tunnel: Use link netns in newlink()
 of rtnl_link_ops
Date: Mon, 10 Feb 2025 21:29:56 +0800
Message-ID: <20250210133002.883422-6-shaw.leon@gmail.com>
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
index 1fe9b13d351c..26d15f907551 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -1413,7 +1413,8 @@ static int ipgre_newlink(struct net_device *dev,
 	err = ipgre_netlink_parms(dev, data, tb, &p, &fwmark);
 	if (err < 0)
 		return err;
-	return ip_tunnel_newlink(dev, tb, &p, fwmark);
+	return ip_tunnel_newlink(params->link_net ? : dev_net(dev), dev, tb, &p,
+				 fwmark);
 }
 
 static int erspan_newlink(struct net_device *dev,
@@ -1433,7 +1434,8 @@ static int erspan_newlink(struct net_device *dev,
 	err = erspan_netlink_parms(dev, data, tb, &p, &fwmark);
 	if (err)
 		return err;
-	return ip_tunnel_newlink(dev, tb, &p, fwmark);
+	return ip_tunnel_newlink(params->link_net ? : dev_net(dev), dev, tb, &p,
+				 fwmark);
 }
 
 static int ipgre_changelink(struct net_device *dev, struct nlattr *tb[],
@@ -1701,7 +1703,7 @@ static struct rtnl_link_ops erspan_link_ops __read_mostly = {
 struct net_device *gretap_fb_dev_create(struct net *net, const char *name,
 					u8 name_assign_type)
 {
-	struct rtnl_newlink_params params = { .net = net };
+	struct rtnl_newlink_params params = { .src_net = net };
 	struct nlattr *tb[IFLA_MAX + 1];
 	struct net_device *dev;
 	LIST_HEAD(list_kill);
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 09b73acf037a..618a50d5c0c2 100644
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
index b901bee03e6d..159b4473290e 100644
--- a/net/ipv4/ip_vti.c
+++ b/net/ipv4/ip_vti.c
@@ -585,7 +585,8 @@ static int vti_newlink(struct net_device *dev,
 	__u32 fwmark = 0;
 
 	vti_netlink_parms(data, &parms, &fwmark);
-	return ip_tunnel_newlink(dev, tb, &parms, fwmark);
+	return ip_tunnel_newlink(params->link_net ? : dev_net(dev), dev, tb,
+				 &parms, fwmark);
 }
 
 static int vti_changelink(struct net_device *dev, struct nlattr *tb[],
diff --git a/net/ipv4/ipip.c b/net/ipv4/ipip.c
index a8b844bcfc64..bab0bf90c908 100644
--- a/net/ipv4/ipip.c
+++ b/net/ipv4/ipip.c
@@ -455,7 +455,8 @@ static int ipip_newlink(struct net_device *dev,
 	}
 
 	ipip_netlink_parms(data, &p, &t->collect_md, &fwmark);
-	return ip_tunnel_newlink(dev, tb, &p, fwmark);
+	return ip_tunnel_newlink(params->link_net ? : dev_net(dev), dev, tb, &p,
+				 fwmark);
 }
 
 static int ipip_changelink(struct net_device *dev, struct nlattr *tb[],
-- 
2.48.1

