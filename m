Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ECDC54E93
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 23:11:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ac381f2;
	Tue, 20 May 2025 19:35:49 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6ed0096
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2024 13:09:51 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7242f559a9fso8247502b3a.1
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2024 05:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734527390; x=1735132190; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6FxJs9/7QYFH33A+3OHee7AY5o5pyw1d0MAaneftBM=;
 b=MphRMKEMoseNmn/IHAdrMW19nWKB55i3q6Bs9u+6G51CfDCj6vP8peZwhzlkYDDUS/
 mOYaP7jJ1VaazMuHf7H8ndFmge0Z2usPMmuHdI4M/BSqACOMo+aGVl8d5wG3nM3oi4Qt
 cx5XZhES1EPJlGpKLmPJuc9iyIsoe4Q/kxVhtzO3d2LCcH9paxpjgNokWEbHfFwfxH8m
 X4NAlsGYSWu08IG4BVuMrTCak8a7kvBZS+fq2rgfAw4g3JYempykyDol92LDYxZhANkK
 RiyrKK2gffM5U3hsCh3zfFUkXUYzEPCiXusX8ZTArPTJpSoUCuuP3dvsCff1jTKdGmuw
 KTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734527390; x=1735132190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6FxJs9/7QYFH33A+3OHee7AY5o5pyw1d0MAaneftBM=;
 b=kPjGNoyHbqeRcjGuNeqZkWnAxsFrLcQ1SVx803XTQQwwaRogbl2K8g73guC1xw47E7
 BZ6pEn0rqZ/OokUPokQ8rajBSc1LSKMYrNJQW4qQGM+yf+s0bxcDQuoiP4/18uKb3ayJ
 NBSsEwNRd3rmFbeRRyJMCFdSfa5livtClt2PBmtlEk8h/Oq1ZC5cfZYIsLYR69cgSYW3
 c4Gz/KrM6qRE38/0mffDQeGuma+MOezTQa3MtXOdoIty0lW9uFHlDzufvMzwINtTYgmu
 j1SgC7T3ZZ0c96RPZBJtog+7iuSGHEV9Efu8EZT/CqQWkc2vwiwNdBdRENidbsPO5YVO
 eFPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3rYr/SmQ0gXcfb0D+2UHTR97bXaDhhl++u6rMsWbGzscz42/McP9HQtBJFKlpvWKN7C8/Gdhjubg=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwRJ5003soY8U12uKXrrEAzEcyKOZj261EH6z/bErgjoBizXzBR
 meukSgAR/I4zzBSWL264Fg+8rqaOumbBLvpMNUWR0G+oKs2Dk83/
X-Gm-Gg: ASbGncsB3RLBfInToBFnnGDVKQwlpTDiPGjSzT1cEfKA9rAie9E9Lla99a6XCYNOmuD
 ddFYxNHiYKVrfBvgAQ4xSqusKM04bX41PT1vcexIZ1selKYsKwaxM3UivHYzj3XV81teyWPvwmh
 F3lQBUkexFXBP1NgxfVODKeowrYlTrvdOr6NbepRl7ThNUuSkyovv+TzZDPD+Uo3tucET2Iv25f
 rYinIY8heuFc3+rVEaTPf6tiY/bWhoxZwxYLS+dFxFzgX8=
X-Google-Smtp-Source: AGHT+IH+tvU5/KiA8X+jx87i+ek803hY16k/2JRAl0mg7VLySak7zxczf+KB71TM0YDQSiaCbWH0pA==
X-Received: by 2002:a05:6a20:9d93:b0:1e1:9fef:e975 with SMTP id
 adf61e73a8af0-1e5b482e23cmr5391801637.26.1734527389573; 
 Wed, 18 Dec 2024 05:09:49 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5c0f59asm7434754a12.67.2024.12.18.05.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 05:09:49 -0800 (PST)
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
Subject: [PATCH net-next v6 03/11] net: Use link netns in newlink() of
 rtnl_link_ops
Date: Wed, 18 Dec 2024 21:09:01 +0800
Message-ID: <20241218130909.2173-4-shaw.leon@gmail.com>
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

These netdevice drivers already uses netns parameter in newlink()
callback. Convert them to use rtnl_newlink_link_net() or
rtnl_newlink_peer_net() for clarity and deprecate params->net.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 drivers/infiniband/ulp/ipoib/ipoib_netlink.c       | 4 ++--
 drivers/net/amt.c                                  | 6 +++---
 drivers/net/bareudp.c                              | 4 ++--
 drivers/net/can/vxcan.c                            | 2 +-
 drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c | 4 ++--
 drivers/net/geneve.c                               | 4 ++--
 drivers/net/gtp.c                                  | 4 ++--
 drivers/net/ipvlan/ipvlan_main.c                   | 4 ++--
 drivers/net/macsec.c                               | 4 ++--
 drivers/net/macvlan.c                              | 5 +++--
 drivers/net/macvtap.c                              | 4 ++--
 drivers/net/netkit.c                               | 2 +-
 drivers/net/pfcp.c                                 | 4 ++--
 drivers/net/ppp/ppp_generic.c                      | 4 ++--
 drivers/net/veth.c                                 | 2 +-
 drivers/net/vxlan/vxlan_core.c                     | 4 ++--
 drivers/net/wireguard/device.c                     | 4 ++--
 drivers/net/wireless/virtual/virt_wifi.c           | 4 ++--
 drivers/net/wwan/wwan_core.c                       | 2 +-
 net/8021q/vlan_netlink.c                           | 4 ++--
 net/hsr/hsr_netlink.c                              | 8 ++++----
 21 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/drivers/infiniband/ulp/ipoib/ipoib_netlink.c b/drivers/infiniband/ulp/ipoib/ipoib_netlink.c
index 61f2457aab77..ac01650b0ac2 100644
--- a/drivers/infiniband/ulp/ipoib/ipoib_netlink.c
+++ b/drivers/infiniband/ulp/ipoib/ipoib_netlink.c
@@ -99,10 +99,10 @@ static int ipoib_changelink(struct net_device *dev, struct nlattr *tb[],
 
 static int ipoib_new_child_link(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
-	struct net *src_net = params->net;
 	struct nlattr **tb = params->tb;
 	struct net_device *pdev;
 	struct ipoib_dev_priv *ppriv;
@@ -112,7 +112,7 @@ static int ipoib_new_child_link(struct rtnl_newlink_params *params)
 	if (!tb[IFLA_LINK])
 		return -EINVAL;
 
-	pdev = __dev_get_by_index(src_net, nla_get_u32(tb[IFLA_LINK]));
+	pdev = __dev_get_by_index(link_net, nla_get_u32(tb[IFLA_LINK]));
 	if (!pdev || pdev->type != ARPHRD_INFINIBAND)
 		return -ENODEV;
 
diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 85878abb51d2..de4ea1a3f3d3 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3163,16 +3163,16 @@ static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
 
 static int amt_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
 	struct nlattr **tb = params->tb;
-	struct net *net = params->net;
 	struct amt_dev *amt;
 	int err = -EINVAL;
 
 	amt = netdev_priv(dev);
-	amt->net = net;
+	amt->net = link_net;
 	amt->mode = nla_get_u32(data[IFLA_AMT_MODE]);
 
 	if (data[IFLA_AMT_MAX_TUNNELS] &&
@@ -3187,7 +3187,7 @@ static int amt_newlink(struct rtnl_newlink_params *params)
 	amt->hash_buckets = AMT_HSIZE;
 	amt->nr_tunnels = 0;
 	get_random_bytes(&amt->hash_seed, sizeof(amt->hash_seed));
-	amt->stream_dev = dev_get_by_index(net,
+	amt->stream_dev = dev_get_by_index(link_net,
 					   nla_get_u32(data[IFLA_AMT_LINK]));
 	if (!amt->stream_dev) {
 		NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_LINK],
diff --git a/drivers/net/bareudp.c b/drivers/net/bareudp.c
index 4c2a50bbf7c0..1fe5dcae38f5 100644
--- a/drivers/net/bareudp.c
+++ b/drivers/net/bareudp.c
@@ -700,11 +700,11 @@ static void bareudp_dellink(struct net_device *dev, struct list_head *head)
 
 static int bareudp_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
 	struct nlattr **tb = params->tb;
-	struct net *net = params->net;
 	struct bareudp_conf conf;
 	int err;
 
@@ -712,7 +712,7 @@ static int bareudp_newlink(struct rtnl_newlink_params *params)
 	if (err)
 		return err;
 
-	err = bareudp_configure(net, dev, &conf, extack);
+	err = bareudp_configure(link_net, dev, &conf, extack);
 	if (err)
 		return err;
 
diff --git a/drivers/net/can/vxcan.c b/drivers/net/can/vxcan.c
index 5d7717c22fab..e3c52c191086 100644
--- a/drivers/net/can/vxcan.c
+++ b/drivers/net/can/vxcan.c
@@ -174,10 +174,10 @@ static struct rtnl_link_ops vxcan_link_ops;
 
 static int vxcan_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *peer_net = rtnl_newlink_peer_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
-	struct net *peer_net = params->net;
 	struct nlattr **tb = params->tb;
 	struct vxcan_priv *priv;
 	struct net_device *peer;
diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
index b4834651c693..7a6b746a3b15 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
@@ -120,10 +120,10 @@ static void rmnet_unregister_bridge(struct rmnet_port *port)
 static int rmnet_newlink(struct rtnl_newlink_params *params)
 {
 	u32 data_format = RMNET_FLAGS_INGRESS_DEAGGREGATION;
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
-	struct net *src_net = params->net;
 	struct nlattr **tb = params->tb;
 	struct net_device *real_dev;
 	int mode = RMNET_EPMODE_VND;
@@ -137,7 +137,7 @@ static int rmnet_newlink(struct rtnl_newlink_params *params)
 		return -EINVAL;
 	}
 
-	real_dev = __dev_get_by_index(src_net, nla_get_u32(tb[IFLA_LINK]));
+	real_dev = __dev_get_by_index(link_net, nla_get_u32(tb[IFLA_LINK]));
 	if (!real_dev) {
 		NL_SET_ERR_MSG_MOD(extack, "link does not exist");
 		return -ENODEV;
diff --git a/drivers/net/geneve.c b/drivers/net/geneve.c
index ea0a98a513ed..3dec3e5aae79 100644
--- a/drivers/net/geneve.c
+++ b/drivers/net/geneve.c
@@ -1616,11 +1616,11 @@ static void geneve_link_config(struct net_device *dev,
 
 static int geneve_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
 	struct nlattr **tb = params->tb;
-	struct net *net = params->net;
 	struct geneve_config cfg = {
 		.df = GENEVE_DF_UNSET,
 		.use_udp6_rx_checksums = false,
@@ -1634,7 +1634,7 @@ static int geneve_newlink(struct rtnl_newlink_params *params)
 	if (err)
 		return err;
 
-	err = geneve_configure(net, dev, extack, &cfg);
+	err = geneve_configure(link_net, dev, extack, &cfg);
 	if (err)
 		return err;
 
diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index 46d5734da7f3..50f8a0cd1d4b 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -1462,9 +1462,9 @@ static int gtp_create_sockets(struct gtp_dev *gtp, const struct nlattr *nla,
 
 static int gtp_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
-	struct net *src_net = params->net;
 	unsigned int role = GTP_ROLE_GGSN;
 	struct gtp_dev *gtp;
 	struct gtp_net *gn;
@@ -1495,7 +1495,7 @@ static int gtp_newlink(struct rtnl_newlink_params *params)
 	gtp->restart_count = nla_get_u8_default(data[IFLA_GTP_RESTART_COUNT],
 						0);
 
-	gtp->net = src_net;
+	gtp->net = link_net;
 
 	err = gtp_hashtable_new(gtp, hashsize);
 	if (err < 0)
diff --git a/drivers/net/ipvlan/ipvlan_main.c b/drivers/net/ipvlan/ipvlan_main.c
index a994fd54ada4..7d19771383c7 100644
--- a/drivers/net/ipvlan/ipvlan_main.c
+++ b/drivers/net/ipvlan/ipvlan_main.c
@@ -534,10 +534,10 @@ static int ipvlan_nl_fillinfo(struct sk_buff *skb,
 
 int ipvlan_link_new(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
-	struct net *src_net = params->net;
 	struct nlattr **tb = params->tb;
 	struct ipvl_dev *ipvlan;
 	struct ipvl_port *port;
@@ -550,7 +550,7 @@ int ipvlan_link_new(struct rtnl_newlink_params *params)
 	if (!tb[IFLA_LINK])
 		return -EINVAL;
 
-	phy_dev = __dev_get_by_index(src_net, nla_get_u32(tb[IFLA_LINK]));
+	phy_dev = __dev_get_by_index(link_net, nla_get_u32(tb[IFLA_LINK]));
 	if (!phy_dev)
 		return -ENODEV;
 
diff --git a/drivers/net/macsec.c b/drivers/net/macsec.c
index 9da111a6629c..ad53a67410dc 100644
--- a/drivers/net/macsec.c
+++ b/drivers/net/macsec.c
@@ -4143,11 +4143,11 @@ static struct lock_class_key macsec_netdev_addr_lock_key;
 
 static int macsec_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
 	struct nlattr **tb = params->tb;
-	struct net *net = params->net;
 	rx_handler_func_t *rx_handler;
 	u8 icv_len = MACSEC_DEFAULT_ICV_LEN;
 	struct net_device *real_dev;
@@ -4159,7 +4159,7 @@ static int macsec_newlink(struct rtnl_newlink_params *params)
 
 	if (!tb[IFLA_LINK])
 		return -EINVAL;
-	real_dev = __dev_get_by_index(net, nla_get_u32(tb[IFLA_LINK]));
+	real_dev = __dev_get_by_index(link_net, nla_get_u32(tb[IFLA_LINK]));
 	if (!real_dev)
 		return -ENODEV;
 	if (real_dev->type != ARPHRD_ETHER)
diff --git a/drivers/net/macvlan.c b/drivers/net/macvlan.c
index 1915f54bd35a..7050a061b2b9 100644
--- a/drivers/net/macvlan.c
+++ b/drivers/net/macvlan.c
@@ -1567,8 +1567,9 @@ EXPORT_SYMBOL_GPL(macvlan_common_newlink);
 
 static int macvlan_newlink(struct rtnl_newlink_params *params)
 {
-	return macvlan_common_newlink(params->net, params->dev, params->tb,
-				      params->data, params->extack);
+	return macvlan_common_newlink(rtnl_newlink_link_net(params),
+				      params->dev, params->tb, params->data,
+				      params->extack);
 }
 
 void macvlan_dellink(struct net_device *dev, struct list_head *head)
diff --git a/drivers/net/macvtap.c b/drivers/net/macvtap.c
index e5fd8a147310..01cf1efbe4c5 100644
--- a/drivers/net/macvtap.c
+++ b/drivers/net/macvtap.c
@@ -105,8 +105,8 @@ static int macvtap_newlink(struct rtnl_newlink_params *params)
 	/* Don't put anything that may fail after macvlan_common_newlink
 	 * because we can't undo what it does.
 	 */
-	err = macvlan_common_newlink(params->net, dev, params->tb, params->data,
-				     params->extack);
+	err = macvlan_common_newlink(rtnl_newlink_link_net(params), dev,
+				     params->tb, params->data, params->extack);
 	if (err) {
 		netdev_rx_handler_unregister(dev);
 		return err;
diff --git a/drivers/net/netkit.c b/drivers/net/netkit.c
index f5527bb533ab..79a2c37990fd 100644
--- a/drivers/net/netkit.c
+++ b/drivers/net/netkit.c
@@ -329,10 +329,10 @@ static struct rtnl_link_ops netkit_link_ops;
 
 static int netkit_new_link(struct rtnl_newlink_params *params)
 {
+	struct net *peer_net = rtnl_newlink_peer_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
-	struct net *peer_net = params->net;
 	struct nlattr **tb = params->tb;
 	struct nlattr *peer_tb[IFLA_MAX + 1], **tbp = tb, *attr;
 	enum netkit_action policy_prim = NETKIT_PASS;
diff --git a/drivers/net/pfcp.c b/drivers/net/pfcp.c
index cb936da99674..e98724a71c22 100644
--- a/drivers/net/pfcp.c
+++ b/drivers/net/pfcp.c
@@ -186,14 +186,14 @@ static int pfcp_add_sock(struct pfcp_dev *pfcp)
 
 static int pfcp_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct net_device *dev = params->dev;
-	struct net *net = params->net;
 	struct pfcp_dev *pfcp;
 	struct pfcp_net *pn;
 	int err;
 
 	pfcp = netdev_priv(dev);
-	pfcp->net = net;
+	pfcp->net = link_net;
 
 	err = pfcp_add_sock(pfcp);
 	if (err) {
diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 5b58e7bb4e7b..316b6d01436b 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1305,9 +1305,9 @@ static int ppp_nl_validate(struct nlattr *tb[], struct nlattr *data[],
 
 static int ppp_nl_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
-	struct net *src_net = params->net;
 	struct nlattr **tb = params->tb;
 	struct ppp_config conf = {
 		.unit = -1,
@@ -1345,7 +1345,7 @@ static int ppp_nl_newlink(struct rtnl_newlink_params *params)
 	if (!tb[IFLA_IFNAME] || !nla_len(tb[IFLA_IFNAME]) || !*(char *)nla_data(tb[IFLA_IFNAME]))
 		conf.ifname_is_set = false;
 
-	err = ppp_dev_configure(src_net, dev, &conf);
+	err = ppp_dev_configure(link_net, dev, &conf);
 
 out_unlock:
 	mutex_unlock(&ppp_mutex);
diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index 04229c07023d..11ee821edcd6 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -1767,10 +1767,10 @@ static int veth_init_queues(struct net_device *dev, struct nlattr *tb[])
 
 static int veth_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *peer_net = rtnl_newlink_peer_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
-	struct net *peer_net = params->net;
 	struct nlattr **tb = params->tb;
 	int err;
 	struct net_device *peer;
diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index b084adb6d319..751da726cf56 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -4395,10 +4395,10 @@ static int vxlan_nl2conf(struct nlattr *tb[], struct nlattr *data[],
 
 static int vxlan_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
-	struct net *src_net = params->net;
 	struct nlattr **tb = params->tb;
 	struct vxlan_config conf;
 	int err;
@@ -4407,7 +4407,7 @@ static int vxlan_newlink(struct rtnl_newlink_params *params)
 	if (err)
 		return err;
 
-	return __vxlan_dev_create(src_net, dev, &conf, extack);
+	return __vxlan_dev_create(link_net, dev, &conf, extack);
 }
 
 static int vxlan_changelink(struct net_device *dev, struct nlattr *tb[],
diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index 92aac080d2b5..b2ba9d9c6ad3 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -309,13 +309,13 @@ static void wg_setup(struct net_device *dev)
 
 static int wg_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct net_device *dev = params->dev;
-	struct net *src_net = params->net;
 	struct wg_device *wg;
 	int ret = -ENOMEM;
 
 	wg = netdev_priv(dev);
-	rcu_assign_pointer(wg->creating_net, src_net);
+	rcu_assign_pointer(wg->creating_net, link_net);
 	init_rwsem(&wg->static_identity.lock);
 	mutex_init(&wg->socket_update_lock);
 	mutex_init(&wg->device_update_lock);
diff --git a/drivers/net/wireless/virtual/virt_wifi.c b/drivers/net/wireless/virtual/virt_wifi.c
index d64eb03e0ac8..5e7c7a1d7d5f 100644
--- a/drivers/net/wireless/virtual/virt_wifi.c
+++ b/drivers/net/wireless/virtual/virt_wifi.c
@@ -521,10 +521,10 @@ static rx_handler_result_t virt_wifi_rx_handler(struct sk_buff **pskb)
 /* Called with rtnl lock held. */
 static int virt_wifi_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct virt_wifi_netdev_priv *priv;
-	struct net *src_net = params->net;
 	struct nlattr **tb = params->tb;
 	int err;
 
@@ -536,7 +536,7 @@ static int virt_wifi_newlink(struct rtnl_newlink_params *params)
 	netif_carrier_off(dev);
 
 	priv->upperdev = dev;
-	priv->lowerdev = __dev_get_by_index(src_net,
+	priv->lowerdev = __dev_get_by_index(link_net,
 					    nla_get_u32(tb[IFLA_LINK]));
 
 	if (!priv->lowerdev)
diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
index 908a3db61477..06a2172d1856 100644
--- a/drivers/net/wwan/wwan_core.c
+++ b/drivers/net/wwan/wwan_core.c
@@ -1070,7 +1070,7 @@ static void wwan_create_default_link(struct wwan_device *wwandev,
 	struct nlmsghdr *nlh;
 	struct sk_buff *msg;
 	struct rtnl_newlink_params params = {
-		.net = &init_net,
+		.src_net = &init_net,
 		.tb = tb,
 		.data = data,
 	};
diff --git a/net/8021q/vlan_netlink.c b/net/8021q/vlan_netlink.c
index 26a0f0a2ce27..0a9930017bba 100644
--- a/net/8021q/vlan_netlink.c
+++ b/net/8021q/vlan_netlink.c
@@ -137,10 +137,10 @@ static int vlan_changelink(struct net_device *dev, struct nlattr *tb[],
 
 static int vlan_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
-	struct net *src_net = params->net;
 	struct nlattr **tb = params->tb;
 	struct net_device *real_dev;
 	struct vlan_dev_priv *vlan;
@@ -160,7 +160,7 @@ static int vlan_newlink(struct rtnl_newlink_params *params)
 		return -EINVAL;
 	}
 
-	real_dev = __dev_get_by_index(src_net, nla_get_u32(tb[IFLA_LINK]));
+	real_dev = __dev_get_by_index(link_net, nla_get_u32(tb[IFLA_LINK]));
 	if (!real_dev) {
 		NL_SET_ERR_MSG_MOD(extack, "link does not exist");
 		return -ENODEV;
diff --git a/net/hsr/hsr_netlink.c b/net/hsr/hsr_netlink.c
index 08d38e2e2962..9bc564e81827 100644
--- a/net/hsr/hsr_netlink.c
+++ b/net/hsr/hsr_netlink.c
@@ -31,10 +31,10 @@ static const struct nla_policy hsr_policy[IFLA_HSR_MAX + 1] = {
  */
 static int hsr_newlink(struct rtnl_newlink_params *params)
 {
+	struct net *link_net = rtnl_newlink_link_net(params);
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
 	struct nlattr **data = params->data;
-	struct net *src_net = params->net;
 	enum hsr_version proto_version;
 	unsigned char multicast_spec;
 	u8 proto = HSR_PROTOCOL_HSR;
@@ -48,7 +48,7 @@ static int hsr_newlink(struct rtnl_newlink_params *params)
 		NL_SET_ERR_MSG_MOD(extack, "Slave1 device not specified");
 		return -EINVAL;
 	}
-	link[0] = __dev_get_by_index(src_net,
+	link[0] = __dev_get_by_index(link_net,
 				     nla_get_u32(data[IFLA_HSR_SLAVE1]));
 	if (!link[0]) {
 		NL_SET_ERR_MSG_MOD(extack, "Slave1 does not exist");
@@ -58,7 +58,7 @@ static int hsr_newlink(struct rtnl_newlink_params *params)
 		NL_SET_ERR_MSG_MOD(extack, "Slave2 device not specified");
 		return -EINVAL;
 	}
-	link[1] = __dev_get_by_index(src_net,
+	link[1] = __dev_get_by_index(link_net,
 				     nla_get_u32(data[IFLA_HSR_SLAVE2]));
 	if (!link[1]) {
 		NL_SET_ERR_MSG_MOD(extack, "Slave2 does not exist");
@@ -71,7 +71,7 @@ static int hsr_newlink(struct rtnl_newlink_params *params)
 	}
 
 	if (data[IFLA_HSR_INTERLINK])
-		interlink = __dev_get_by_index(src_net,
+		interlink = __dev_get_by_index(link_net,
 					       nla_get_u32(data[IFLA_HSR_INTERLINK]));
 
 	if (interlink && interlink == link[0]) {
-- 
2.47.1

