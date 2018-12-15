Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36751C43613
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5EFA206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkLPuswx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5EFA206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae171321;
	Sat, 15 Dec 2018 16:56:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84f01b12
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:31 +0000 (UTC)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cc5079c
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:30 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f23so7435429edb.3
 for <wireguard@lists.zx2c4.com>; Sat, 15 Dec 2018 08:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pk03Y3BTPz4p9jmjg/mlx2BFD6+aSrDqLHCTR0cxQEo=;
 b=BkLPuswx7/4z/JOAM6Ipp4mZer6D7ApgLpJGKXLmQH/p5jtxD2Cvr5w05T/fd/P6f1
 wLO89TsNN5mwItMhwtR9LaOhP2wHcCKnACaBj5ZIY31ihJgXJ8IVi5t9Sxaq+akhe7KD
 c+f9uoH2Oalh0MuhTMrG+AjDlx4GjYatOLiDzKnYQku0p5MmKW1a22EMM3lt6ylgNpkJ
 GzE8yiLOqpRS9xebe+gTQ2yYPZ6VKlUbcbvvBamgCV5hQkOP7iqDR3/fzhJrsWGAHRZl
 2OJnsEOusXZGZz8yAwPbx9EEW7XtvXa4wmpHCZiNKz1cWByXFIyLBtePlRv7fuBS3uUi
 W7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pk03Y3BTPz4p9jmjg/mlx2BFD6+aSrDqLHCTR0cxQEo=;
 b=C/+JY5MlVm/q/4ZxmsTJum2queEvAxjeo9bFCOVWnPCj6zA1ELWuG297MdxPzArOST
 NLY1CO6erbEeYGNuRcUEjQRSWa/tPxZK0xJAyJUYJW85dq6txxri7a3zCn0ZmPBSRafw
 8EOd0wX2z0otz5V+ugn+kLAg+POHvA0riRwP7EGACU/zId69rCG6LPn+fx6YVR/8an/r
 qtCe6o/T8M07wrvbqH/rPUFtezEG9rgTrXqZJ2CLmuFE9kaiBYph/JqrZ3RTvQO3IIXT
 l5l9N9Yo1RgGVtNg5CNOIgJJGvHSiss13nZdxPyjwsQBjs+y8JYbTEctW/ftOn3fgFXC
 qcXQ==
X-Gm-Message-State: AA+aEWbw8k9XQi3Xojy5qtB4ECwwUAzLzwFNkC1PvgUA9NwS7urJyyQ2
 i2MXxa+ZElcDCHe5du8QEtgpHI6M
X-Google-Smtp-Source: AFSGD/UWwSKK1t79hQLWyFAdlevGZBuE4jwxlTCABAo0G4xdsj5jlCT0vnB2v+3VIH63LHLGhzDMLg==
X-Received: by 2002:a17:906:1155:: with SMTP id
 i21-v6mr5540776eja.110.1544892995292; 
 Sat, 15 Dec 2018 08:56:35 -0800 (PST)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id q50sm2356015edd.66.2018.12.15.08.56.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Dec 2018 08:56:34 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v5 07/11] netlink: allow modification of transit net
Date: Sat, 15 Dec 2018 17:56:09 +0100
Message-Id: <20181215165613.5486-8-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181215165613.5486-1-ju.orth@gmail.com>
References: <20181215165613.5486-1-ju.orth@gmail.com>
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This commit adds two new attributes of which at most one may be
provided:

* WGDEVICE_A_TRANSIT_NETNS_PID: NLA_U32
* WGDEVICE_A_TRANSIT_NETNS_FD: NLA_U32

The transit namespace is then set to this namespace. The caller must
either be in this namespace or have CAP_NET_ADMIN in it.
---
 src/netlink.c        | 48 +++++++++++++++++++++++++++++++-------------
 src/uapi/wireguard.h | 14 +++++++++----
 2 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index e0f3632..f5c3a9e 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -27,6 +27,8 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED },
 	[WGDEVICE_A_DEV_NETNS_PID]	= { .type = NLA_U32 },
 	[WGDEVICE_A_DEV_NETNS_FD]	= { .type = NLA_U32 },
+	[WGDEVICE_A_TRANSIT_NETNS_PID]	= { .type = NLA_U32 },
+	[WGDEVICE_A_TRANSIT_NETNS_FD]	= { .type = NLA_U32 },
 };
 
 static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
@@ -346,23 +348,44 @@ static int wg_get_device_done(struct netlink_callback *cb)
 	return 0;
 }
 
-static int set_port(struct wg_device *wg, u16 port)
+static int set_socket(struct wg_device *wg, struct nlattr **attrs)
 {
 	struct wg_peer *peer;
-	int ret;
+	struct nlattr *port_attr = attrs[WGDEVICE_A_LISTEN_PORT];
+	u16 port;
+	struct net *net = NULL;
+	int ret = 0;
+
+	net = get_attr_net(attrs[WGDEVICE_A_TRANSIT_NETNS_PID],
+			attrs[WGDEVICE_A_TRANSIT_NETNS_FD]);
+	if (IS_ERR(net))
+		return PTR_ERR(net);
+	if (port_attr)
+		port = nla_get_u16(port_attr);
+	else
+		port = wg->incoming_port;
 
-	ret = test_socket_net_capable(wg->transit_net);
+	ret = test_socket_net_capable(net ? : wg->transit_net);
 	if (ret)
-		return ret;
-	if (wg->incoming_port == port)
-		return 0;
+		goto out;
+
+	if (wg->incoming_port == port && (!net || wg->transit_net == net))
+		goto out;
+
 	list_for_each_entry(peer, &wg->peer_list, peer_list)
 		wg_socket_clear_peer_endpoint_src(peer);
 	if (!netif_running(wg->dev)) {
 		wg->incoming_port = port;
-		return 0;
+		if (net)
+			wg_device_set_nets(wg, wg->dev_net, net);
+		goto out;
 	}
-	return wg_socket_init(wg, wg->transit_net, port);
+	ret = wg_socket_init(wg, net ? : wg->transit_net, port);
+
+out:
+	if (net)
+		put_net(net);
+	return ret;
 }
 
 static int set_allowedip(struct wg_peer *peer, struct nlattr **attrs)
@@ -559,12 +582,9 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 			wg_socket_clear_peer_endpoint_src(peer);
 	}
 
-	if (info->attrs[WGDEVICE_A_LISTEN_PORT]) {
-		ret = set_port(wg,
-			nla_get_u16(info->attrs[WGDEVICE_A_LISTEN_PORT]));
-		if (ret)
-			goto out;
-	}
+	ret = set_socket(wg, info->attrs);
+	if (ret)
+		goto out;
 
 	if (info->attrs[WGDEVICE_A_FLAGS] &&
 	    nla_get_u32(info->attrs[WGDEVICE_A_FLAGS]) &
diff --git a/src/uapi/wireguard.h b/src/uapi/wireguard.h
index 8b60ad1..5eabe22 100644
--- a/src/uapi/wireguard.h
+++ b/src/uapi/wireguard.h
@@ -88,16 +88,18 @@
  * May only be called via NLM_F_REQUEST. The command must contain the following
  * tree of nested items. Exactly one of WGDEVICE_A_IFINDEX and WGDEVICE_A_IFNAME
  * must be provided. All other top-level items are optional. At most one of
- * WGDEVICE_A_DEV_NETNS_PID and WGDEVICE_A_DEV_NETNS_FD may be provided.
+ * WGDEVICE_A_TRANSIT_NETNS_PID and WGDEVICE_A_TRANSIT_NETNS_FD may be provided.
+ * At most one of WGDEVICE_A_DEV_NETNS_PID and WGDEVICE_A_DEV_NETNS_FD may be
+ * provided.
  *
  * If WGDEVICE_A_DEV_NETNS_PID/FD is provided, the Wireguard device is looked up
  * in this network namespace. Otherwise it is looked up in the network namespace
  * of the netlink socket. The caller must have CAP_NET_ADMIN in the namespace of
  * the Wireguard device.
  *
- * If WGDEVICE_A_LISTEN_PORT is provided and the calling process is not in the
- * transit namespace, then the calling process must have CAP_NET_ADMIN the
- * transit namespace.
+ * If WGDEVICE_A_TRANSIT_NETNS_PID/FD and/or WGDEVICE_A_LISTEN_PORT are provided
+ * and the calling process is not in the transit namespace, then the calling
+ * process must have CAP_NET_ADMIN the transit namespace.
  *
  *    WGDEVICE_A_IFINDEX: NLA_U32
  *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMESIZ - 1
@@ -107,6 +109,8 @@
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16, 0 to choose randomly
  *    WGDEVICE_A_DEV_NETNS_PID: NLA_U32
  *    WGDEVICE_A_DEV_NETNS_FD: NLA_U32
+ *    WGDEVICE_A_TRANSIT_NETNS_PID: NLA_U32
+ *    WGDEVICE_A_TRANSIT_NETNS_FD: NLA_U32
  *    WGDEVICE_A_FWMARK: NLA_U32, 0 to disable
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
@@ -181,6 +185,8 @@ enum wgdevice_attribute {
 	WGDEVICE_A_PEERS,
 	WGDEVICE_A_DEV_NETNS_PID,
 	WGDEVICE_A_DEV_NETNS_FD,
+	WGDEVICE_A_TRANSIT_NETNS_PID,
+	WGDEVICE_A_TRANSIT_NETNS_FD,
 	__WGDEVICE_A_LAST
 };
 #define WGDEVICE_A_MAX (__WGDEVICE_A_LAST - 1)
-- 
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
