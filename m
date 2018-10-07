Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59877C65C33
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE53120882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOC2/iIB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE53120882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1f0e6ed;
	Sun, 7 Oct 2018 14:11:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bcac7602
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:26 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f9e3e94
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id r63-v6so5721186wma.4
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 07:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NzT5x9Daoh+HtEzR19r71SuE5R0z8OXWYCiTx+XBo3s=;
 b=gOC2/iIBgghR++eA6pueIG4RCi61uQfP2lKOHjab5Zq1t8j0NEQEvuXIBKo2EWuaZn
 WvkwWf+chUSwxI+4MTrQ1GXfWDNK23XH51dkteZjnEPsi2UJVffsAREaTzw74wN4nhmd
 HwZkw6s0c6wCdjBbx3U/d5wgj9NjbKqzvN3xJEKwou2qSg4koKjJ5dwhzztaWXPdnDl0
 qui0tyQw/Hxh/HX5eRLug8+EMkU9Py2p96t+B3TteAb46SmRPgKlBlkaP03GjCfRuXNZ
 taGAhHiUaBsbMFRiXtp4l7asMahl3MnygMOniCzNd+zAWk1EFjZHO4czsV4hv2f0qU+F
 a6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NzT5x9Daoh+HtEzR19r71SuE5R0z8OXWYCiTx+XBo3s=;
 b=EhTUNjDuZeXv7wxKPFIKABXC/MlLHfWhhLPC8B7J0jA9HOS9Uv8uCtM2qsimjE3Syi
 noUR2j4Cb/LnOmR1IIIBMtuHHNhl/DPNymjJpoTQO+BGXI4h91NrELmx1iyDmyymOBW/
 k280Hs7jJRm48qfvvhQkRHzxIQku2Dm/QYp8UhHX/eRuiCK2WzPgt+wPSu93X5B7y0NR
 pIrJyChvWJwKGIjZwVc9uh2D6MKSbb0gXdd4LRmsJN7QyP3Larn3xotgnPAY8VDB9ohV
 nxpyR7jrep7NUHKGm6ukYp08xeLAVn68UxqQrJByjVP8Ij1gUMlztCG55uRvdXcsevLt
 NZJA==
X-Gm-Message-State: ABuFfoiQ9+S6Q1HmjgB7mhYqP8hxJpcdBx+w1nn+CUv9XmIjLuUxdEU6
 PUe8D6ifMdQ6I+ekaYiyrH0xhOEP
X-Google-Smtp-Source: ACcGV60ym6neoo//3/m2ZA38jASzk8/0r2T7qBpDKc2w22xB+CpqQzg+KQkZhoIIek+vAuS/YbWggg==
X-Received: by 2002:a1c:7f93:: with SMTP id
 a141-v6mr12501253wmd.45.1538921516193; 
 Sun, 07 Oct 2018 07:11:56 -0700 (PDT)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id w72-v6sm28940116wrc.52.2018.10.07.07.11.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Oct 2018 07:11:55 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v4 05/12] device: rename creating_net to transit_net
Date: Sun,  7 Oct 2018 16:11:32 +0200
Message-Id: <20181007141139.26310-6-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181007141139.26310-1-ju.orth@gmail.com>
References: <20181007141139.26310-1-ju.orth@gmail.com>
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
index 49f9634..ebcd79c 100644
--- a/src/device.c
+++ b/src/device.c
@@ -243,8 +243,8 @@ static void destruct(struct net_device *dev)
 	skb_queue_purge(&wg->incoming_handshakes);
 	free_percpu(dev->tstats);
 	free_percpu(wg->incoming_handshakes_worker);
-	if (wg->have_creating_net_ref)
-		put_net(wg->creating_net);
+	if (wg->have_transit_net_ref)
+		put_net(wg->transit_net);
 	mutex_unlock(&wg->device_update_lock);
 
 	pr_debug("%s: Interface deleted\n", dev->name);
@@ -296,7 +296,7 @@ static int newlink(struct net *src_net, struct net_device *dev,
 	int ret = -ENOMEM;
 	struct wireguard_device *wg = netdev_priv(dev);
 
-	wg->creating_net = src_net;
+	wg->transit_net = src_net;
 	init_rwsem(&wg->static_identity.lock);
 	mutex_init(&wg->socket_update_lock);
 	mutex_init(&wg->device_update_lock);
@@ -397,13 +397,13 @@ static int netdevice_notification(struct notifier_block *nb,
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
index 2bd1429..e919789 100644
--- a/src/device.h
+++ b/src/device.h
@@ -40,7 +40,7 @@ struct wireguard_device {
 	struct net_device *dev;
 	struct crypt_queue encrypt_queue, decrypt_queue;
 	struct sock __rcu *sock4, *sock6;
-	struct net *creating_net;
+	struct net *transit_net;
 	struct noise_static_identity static_identity;
 	struct workqueue_struct *handshake_receive_wq, *handshake_send_wq;
 	struct workqueue_struct *packet_crypt_wq;
@@ -56,7 +56,7 @@ struct wireguard_device {
 	unsigned int num_peers, device_update_gen;
 	u32 fwmark;
 	u16 incoming_port;
-	bool have_creating_net_ref;
+	bool have_transit_net_ref;
 };
 
 int wg_device_init(void);
diff --git a/src/netlink.c b/src/netlink.c
index 4cba5ab..50cbd66 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -264,7 +264,7 @@ static int get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
 	genl_dump_check_consistent(cb, hdr);
 
 	if (!last_peer_cursor) {
-		if (test_socket_net_capable(wg->creating_net) == 0) {
+		if (test_socket_net_capable(wg->transit_net) == 0) {
 			if (nla_put_u16(skb, WGDEVICE_A_LISTEN_PORT,
 						wg->incoming_port))
 				goto out;
@@ -358,7 +358,7 @@ static int set_port(struct wireguard_device *wg, u16 port)
 	struct wireguard_peer *peer;
 	int ret;
 
-	ret = test_socket_net_capable(wg->creating_net);
+	ret = test_socket_net_capable(wg->transit_net);
 	if (ret)
 		return ret;
 	if (wg->incoming_port == port)
diff --git a/src/socket.c b/src/socket.c
index 8e9adfd..eb5d429 100644
--- a/src/socket.c
+++ b/src/socket.c
@@ -381,18 +381,18 @@ int wg_socket_init(struct wireguard_device *wg, u16 port)
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
@@ -402,7 +402,7 @@ retry:
 			return ret;
 		}
 		set_sock_opts(new6);
-		setup_udp_tunnel_sock(wg->creating_net, new6, &cfg);
+		setup_udp_tunnel_sock(wg->transit_net, new6, &cfg);
 	}
 #endif
 
-- 
2.19.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
