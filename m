Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8B3C54ED1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 14:22:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c532c1a;
	Tue, 20 May 2025 19:49:44 +0000 (UTC)
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com
 [67.231.154.184])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c5ee3658
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Dec 2024 19:39:54 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id D4E5D900071; 
 Tue,  3 Dec 2024 19:39:50 +0000 (UTC)
Received: from ben-dt5.candelatech.com (unknown [50.251.239.81])
 by mail3.candelatech.com (Postfix) with ESMTP id F188713C2B6;
 Tue,  3 Dec 2024 11:39:48 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com F188713C2B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1733254789;
 bh=jst4k0lpwWz/JgrqCgkdYIhbXw0yvHwbQqc+zlYC3PQ=;
 h=From:To:Cc:Subject:Date:From;
 b=c6re080E8gutaQBxvtsLi0qivBQsDaZrDcjH/oxx4rOUYjikZmHYvwD9AbYtCF1wC
 /MnV5tqvil2NfUfbU4FfrjRHuM8m/GbogtIeXImHnjVWc45mQjW+KR0+RMfDRShpoh
 aHMRUp7zLZ6Z975uUs40a0UIlNpX+xwd1SNBYDPc=
From: greearb@candelatech.com
To: netdev@vger.kernel.org
Cc: Jason@zx2c4.com, wireguard@lists.zx2c4.com, dsahern@kernel.org,
 Ben Greear <greearb@candelatech.com>
Subject: [PATCH v2] net: wireguard: Allow binding to specific ifindex
Date: Tue,  3 Dec 2024 11:39:39 -0800
Message-ID: <20241203193939.1953303-1-greearb@candelatech.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MDID: 1733254792-XQiFu4kcUtCa
X-MDID-O: us5; at1; 1733254792; XQiFu4kcUtCa; <greearb@candelatech.com>;
 2cb6a4bd943e67fe8a6fabf2d7a930d0
X-PPE-TRUSTED: V=1;DIR=OUT;
X-Mailman-Approved-At: Tue, 20 May 2025 19:45:56 +0000
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

From: Ben Greear <greearb@candelatech.com>

Which allows us to bind to VRF.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

v2:  Fix bad use of comma, semicolon now used instead.

 drivers/net/wireguard/device.h  |  1 +
 drivers/net/wireguard/netlink.c | 12 +++++++++++-
 drivers/net/wireguard/socket.c  |  8 +++++++-
 include/uapi/linux/wireguard.h  |  3 +++
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireguard/device.h b/drivers/net/wireguard/device.h
index 43c7cebbf50b..9698d9203915 100644
--- a/drivers/net/wireguard/device.h
+++ b/drivers/net/wireguard/device.h
@@ -53,6 +53,7 @@ struct wg_device {
 	atomic_t handshake_queue_len;
 	unsigned int num_peers, device_update_gen;
 	u32 fwmark;
+	int lowerdev; /* ifindex of lower level device to bind UDP transport */
 	u16 incoming_port;
 };
 
diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index f7055180ba4a..5de3d59a17b0 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -27,7 +27,8 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 	[WGDEVICE_A_FLAGS]		= { .type = NLA_U32 },
 	[WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
 	[WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
-	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED }
+	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED },
+	[WGDEVICE_A_LOWERDEV]		= { .type = NLA_U32 },
 };
 
 static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
@@ -232,6 +233,7 @@ static int wg_get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
 		if (nla_put_u16(skb, WGDEVICE_A_LISTEN_PORT,
 				wg->incoming_port) ||
 		    nla_put_u32(skb, WGDEVICE_A_FWMARK, wg->fwmark) ||
+		    nla_put_u32(skb, WGDEVICE_A_LOWERDEV, wg->lowerdev) ||
 		    nla_put_u32(skb, WGDEVICE_A_IFINDEX, wg->dev->ifindex) ||
 		    nla_put_string(skb, WGDEVICE_A_IFNAME, wg->dev->name))
 			goto out;
@@ -530,6 +532,14 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 			wg_socket_clear_peer_endpoint_src(peer);
 	}
 
+	if (info->attrs[WGDEVICE_A_LOWERDEV]) {
+		struct wg_peer *peer;
+
+		wg->lowerdev = nla_get_u32(info->attrs[WGDEVICE_A_LOWERDEV]);
+		list_for_each_entry(peer, &wg->peer_list, peer_list)
+			wg_socket_clear_peer_endpoint_src(peer);
+	}
+
 	if (info->attrs[WGDEVICE_A_LISTEN_PORT]) {
 		ret = set_port(wg,
 			nla_get_u16(info->attrs[WGDEVICE_A_LISTEN_PORT]));
diff --git a/drivers/net/wireguard/socket.c b/drivers/net/wireguard/socket.c
index 0414d7a6ce74..7cef4b27f6ba 100644
--- a/drivers/net/wireguard/socket.c
+++ b/drivers/net/wireguard/socket.c
@@ -25,7 +25,8 @@ static int send4(struct wg_device *wg, struct sk_buff *skb,
 		.daddr = endpoint->addr4.sin_addr.s_addr,
 		.fl4_dport = endpoint->addr4.sin_port,
 		.flowi4_mark = wg->fwmark,
-		.flowi4_proto = IPPROTO_UDP
+		.flowi4_proto = IPPROTO_UDP,
+		.flowi4_oif = wg->lowerdev,
 	};
 	struct rtable *rt = NULL;
 	struct sock *sock;
@@ -111,6 +112,9 @@ static int send6(struct wg_device *wg, struct sk_buff *skb,
 	struct sock *sock;
 	int ret = 0;
 
+	if (wg->lowerdev)
+		fl.flowi6_oif = wg->lowerdev;
+
 	skb_mark_not_on_list(skb);
 	skb->dev = wg->dev;
 	skb->mark = wg->fwmark;
@@ -360,6 +364,7 @@ int wg_socket_init(struct wg_device *wg, u16 port)
 		.family = AF_INET,
 		.local_ip.s_addr = htonl(INADDR_ANY),
 		.local_udp_port = htons(port),
+		.bind_ifindex = wg->lowerdev,
 		.use_udp_checksums = true
 	};
 #if IS_ENABLED(CONFIG_IPV6)
@@ -369,6 +374,7 @@ int wg_socket_init(struct wg_device *wg, u16 port)
 		.local_ip6 = IN6ADDR_ANY_INIT,
 		.use_udp6_tx_checksums = true,
 		.use_udp6_rx_checksums = true,
+		.bind_ifindex = wg->lowerdev,
 		.ipv6_v6only = true
 	};
 #endif
diff --git a/include/uapi/linux/wireguard.h b/include/uapi/linux/wireguard.h
index ae88be14c947..f3784885389a 100644
--- a/include/uapi/linux/wireguard.h
+++ b/include/uapi/linux/wireguard.h
@@ -29,6 +29,7 @@
  *    WGDEVICE_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16
  *    WGDEVICE_A_FWMARK: NLA_U32
+ *    WGDEVICE_A_LOWERDEV: NLA_U32
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
  *            WGPEER_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
@@ -83,6 +84,7 @@
  *    WGDEVICE_A_PRIVATE_KEY: len WG_KEY_LEN, all zeros to remove
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16, 0 to choose randomly
  *    WGDEVICE_A_FWMARK: NLA_U32, 0 to disable
+ *    WGDEVICE_A_LOWERDEV: NLA_U32, ifindex to bind lower transport, 0 to disable
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
  *            WGPEER_A_PUBLIC_KEY: len WG_KEY_LEN
@@ -157,6 +159,7 @@ enum wgdevice_attribute {
 	WGDEVICE_A_LISTEN_PORT,
 	WGDEVICE_A_FWMARK,
 	WGDEVICE_A_PEERS,
+	WGDEVICE_A_LOWERDEV,
 	__WGDEVICE_A_LAST
 };
 #define WGDEVICE_A_MAX (__WGDEVICE_A_LAST - 1)
-- 
2.42.0

