Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A531C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382CA206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjGuV2tP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 382CA206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43ee504e;
	Sat, 15 Dec 2018 16:56:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d288e90
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:28 +0000 (UTC)
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09a1e46d
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:27 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h50so7422709ede.5
 for <wireguard@lists.zx2c4.com>; Sat, 15 Dec 2018 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mFGfgxBr9awvDPzOHx8KZt8JQbyk0D8p1e7OVUMVRHo=;
 b=RjGuV2tPFlnB2VbPu9C3Rewj0zTOLZZvosvbXW4oDnq0TQ8lew1Yax7trkOH6wHJrl
 dWgOMGxudGTgkgMTDm3FQAoiDSn8tOjX75iWLmv6ktA3oH6IvSwX9Z7zUsQClgRR5oZX
 zc3nJHH+CwlrgleQ5WP+ufeGZf7B18Ss9bH5rWu5hXqQ49RvQKsl2MXHddfc7SQPS8EJ
 bHZAphKRGDpxjX61m3hwLDZkQLi0JgKxstXV67qZquwcKre99l2bW8zicz3CgS+HI5NQ
 Vc4Vy2lN02ksGL7v4gGotBkqwj2by3zkAhIJNxNGvQBb6tkcrp7+bFqfYdwEBV94k1bt
 OTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mFGfgxBr9awvDPzOHx8KZt8JQbyk0D8p1e7OVUMVRHo=;
 b=lM1zD60CmmOtH67sPJqNSE41U45yzVjMQ4QQJOn6rLl0Uo5lzAQtnyUjJNNacM+voD
 6uJ3/buhCnZwwid2PDMlNQmaludJefwuXa4fI6e+MAWpRmxaxAzLBsG4OL52kap9f4aO
 P6US1+Pc4cKqABbeIQQoKT7LNqL4jyiIDr8ampuSdTOwJkBT9Yy6kEBKMprdUgPadKSH
 xwOsG4D5mNXvcbiySfmTQ4Z/hTMVQ6zZyO9Z+5UM/Tx5LbIxkZmhgvkMOfgmmHzt/oED
 1a32QEIgFpdQd3KM4NjGbvUf/GeYyAEL2HkjQAoq/XGZOsKtupNjs1Y+TYqgGNxRZoje
 Kr3w==
X-Gm-Message-State: AA+aEWagn4kKIl6pwR96ULeumi0orjG3vMFQqkJ8M6eIM9OuvG5sbgzI
 Ebzi/hU0eWMrJJVp0rgZy9c+GlKl
X-Google-Smtp-Source: AFSGD/UYiSz3jT0bEBPpNuVpwOZJqiNoi3P+nwRN9cgtuRKEOKpXXVKneoE+HixBOzIJ0pUTyBTuzQ==
X-Received: by 2002:a50:8a03:: with SMTP id i3mr7075386edi.164.1544892992285; 
 Sat, 15 Dec 2018 08:56:32 -0800 (PST)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id q50sm2356015edd.66.2018.12.15.08.56.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Dec 2018 08:56:31 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v5 04/11] device: rename creating_net to transit_net
Date: Sat, 15 Dec 2018 17:56:06 +0100
Message-Id: <20181215165613.5486-5-ju.orth@gmail.com>
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

---
 src/device.c  | 20 ++++++++++----------
 src/device.h  |  4 ++--
 src/netlink.c |  4 ++--
 src/socket.c  |  8 ++++----
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/src/device.c b/src/device.c
index 877000b..ae4b9ad 100644
--- a/src/device.c
+++ b/src/device.c
@@ -251,8 +251,8 @@ static void wg_destruct(struct net_device *dev)
 	skb_queue_purge(&wg->incoming_handshakes);
 	free_percpu(dev->tstats);
 	free_percpu(wg->incoming_handshakes_worker);
-	if (wg->have_creating_net_ref)
-		put_net(wg->creating_net);
+	if (wg->have_transit_net_ref)
+		put_net(wg->transit_net);
 	mutex_unlock(&wg->device_update_lock);
 
 	pr_debug("%s: Interface deleted\n", dev->name);
@@ -304,7 +304,7 @@ static int wg_newlink(struct net *src_net, struct net_device *dev,
 	struct wg_device *wg = netdev_priv(dev);
 	int ret = -ENOMEM;
 
-	wg->creating_net = src_net;
+	wg->transit_net = src_net;
 	init_rwsem(&wg->static_identity.lock);
 	mutex_init(&wg->socket_update_lock);
 	mutex_init(&wg->device_update_lock);
@@ -406,13 +406,13 @@ static int wg_netdevice_notification(struct notifier_block *nb,
 	if (action != NETDEV_REGISTER || dev->netdev_ops != &netdev_ops)
 		return 0;
 
-	if (dev_net(dev) == wg->creating_net && wg->have_creating_net_ref) {
-		put_net(wg->creating_net);
-		wg->have_creating_net_ref = false;
-	} else if (dev_net(dev) != wg->creating_net &&
-		   !wg->have_creating_net_ref) {
-		wg->have_creating_net_ref = true;
-		get_net(wg->creating_net);
+	if (dev_net(dev) == wg->transit_net && wg->have_transit_net_ref) {
+		put_net(wg->transit_net);
+		wg->have_transit_net_ref = false;
+	} else if (dev_net(dev) != wg->transit_net &&
+		   !wg->have_transit_net_ref) {
+		wg->have_transit_net_ref = true;
+		get_net(wg->transit_net);
 	}
 	return 0;
 }
diff --git a/src/device.h b/src/device.h
index b0cbc78..be54d4a 100644
--- a/src/device.h
+++ b/src/device.h
@@ -40,7 +40,7 @@ struct wg_device {
 	struct net_device *dev;
 	struct crypt_queue encrypt_queue, decrypt_queue;
 	struct sock __rcu *sock4, *sock6;
-	struct net *creating_net;
+	struct net *transit_net;
 	struct noise_static_identity static_identity;
 	struct workqueue_struct *handshake_receive_wq, *handshake_send_wq;
 	struct workqueue_struct *packet_crypt_wq;
@@ -56,7 +56,7 @@ struct wg_device {
 	unsigned int num_peers, device_update_gen;
 	u32 fwmark;
 	u16 incoming_port;
-	bool have_creating_net_ref;
+	bool have_transit_net_ref;
 };
 
 int wg_device_init(void);
diff --git a/src/netlink.c b/src/netlink.c
index e17c3e1..8d22230 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -257,7 +257,7 @@ static int wg_get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
 	genl_dump_check_consistent(cb, hdr);
 
 	if (!last_peer_cursor) {
-		if (test_socket_net_capable(wg->creating_net) == 0) {
+		if (test_socket_net_capable(wg->transit_net) == 0) {
 			if (nla_put_u16(skb, WGDEVICE_A_LISTEN_PORT,
 						wg->incoming_port))
 				goto out;
@@ -351,7 +351,7 @@ static int set_port(struct wg_device *wg, u16 port)
 	struct wg_peer *peer;
 	int ret;
 
-	ret = test_socket_net_capable(wg->creating_net);
+	ret = test_socket_net_capable(wg->transit_net);
 	if (ret)
 		return ret;
 	if (wg->incoming_port == port)
diff --git a/src/socket.c b/src/socket.c
index 2752335..75e4114 100644
--- a/src/socket.c
+++ b/src/socket.c
@@ -382,18 +382,18 @@ int wg_socket_init(struct wg_device *wg, u16 port)
 retry:
 #endif
 
-	ret = udp_sock_create(wg->creating_net, &port4, &new4);
+	ret = udp_sock_create(wg->transit_net, &port4, &new4);
 	if (ret < 0) {
 		pr_err("%s: Could not create IPv4 socket\n", wg->dev->name);
 		return ret;
 	}
 	set_sock_opts(new4);
-	setup_udp_tunnel_sock(wg->creating_net, new4, &cfg);
+	setup_udp_tunnel_sock(wg->transit_net, new4, &cfg);
 
 #if IS_ENABLED(CONFIG_IPV6)
 	if (ipv6_mod_enabled()) {
 		port6.local_udp_port = inet_sk(new4->sk)->inet_sport;
-		ret = udp_sock_create(wg->creating_net, &port6, &new6);
+		ret = udp_sock_create(wg->transit_net, &port6, &new6);
 		if (ret < 0) {
 			udp_tunnel_sock_release(new4);
 			if (ret == -EADDRINUSE && !port && retries++ < 100)
@@ -403,7 +403,7 @@ retry:
 			return ret;
 		}
 		set_sock_opts(new6);
-		setup_udp_tunnel_sock(wg->creating_net, new6, &cfg);
+		setup_udp_tunnel_sock(wg->transit_net, new6, &cfg);
 	}
 #endif
 
-- 
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
