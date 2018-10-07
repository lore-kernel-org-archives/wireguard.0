Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4095C676D4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77BA920882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVV8deTL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77BA920882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a47c4c7;
	Sun, 7 Oct 2018 14:11:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64532c7c
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:30 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad60ee73
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:19 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id s12-v6so5725207wmc.0
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 07:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dfjc6uxSOt8astNQggCa58rIQjv5CybsLdXEdhrIMMw=;
 b=SVV8deTLTcJu671M9wbYx4Fuv1SKvVBv+kCASl9zGUZ82r5AaiN2+mHPM8fS8E3iaK
 YFykJF0EVGVTQ2JRqfWY9lHqiHzwvNyDS5+7SOR0JfjmrS8y9rIo9Zm33efGmv/iVBYC
 cK8JIumrvQ3TFz2r80zNi8k0CJ6NeTGpvXmY/OS3uUmxrgceSyESsyrdON8uS20quxcY
 Dhy8vvV02R40BKcxpq7y5qkO/VHiEhhZB8Cq1TYOIhCORRCALP2vmuEag/mh4vJdloSq
 fDOkz3bBiHZQEgyepG16VJP5U+DflBTZMCWwI9BDcfRexMBSbLhBJ/z1G5rX1z355g4x
 uSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dfjc6uxSOt8astNQggCa58rIQjv5CybsLdXEdhrIMMw=;
 b=E5IVqmnLP/t3g/x84jQS9292sCaEVmNfnUbs6hDXEqg+NKwpg3GTUaaU3D75zbd4+/
 9tdoIy9tp9sZOi2rTxvtf8LsJB/woKOvKFTDhFuNHm6Y5+hv7pEHtqDsojlrC+7MIqRX
 72sgyhTu58QLrKdJv7yX0nLVF5OvWP4D5H4sDiM4vBDFE1+6rn3eM4K+BINwr8nYv9aX
 EE46MKIYZwVvLGrGO1d/aObOf0HIc1gWzW2VHn/e4GzjIVnfP3rY4jxlfvUH2c6yfOQc
 WvaHUPggGF45Letvz+jwpHgGb1c2go+6YnH9UGYtlw8Ycf1uCCUbhE+ekQ3ZjXpTAkUB
 TPYw==
X-Gm-Message-State: ABuFfoj0bOKMvrWpLNQrQycK/8DYFgt42uZ01fOVk7VAna25SkCmmPL5
 014XgwxE77vj9101afB4NEDsFtLa
X-Google-Smtp-Source: ACcGV629pDeA9k2TLVKmjBwbF0uzUMeN082S2iGkWx6GvTwW3xYj0xal4vIp4gYbZUlHn2tv0Q1ryg==
X-Received: by 2002:a1c:cfcb:: with SMTP id
 f194-v6mr12024089wmg.98.1538921518227; 
 Sun, 07 Oct 2018 07:11:58 -0700 (PDT)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id w72-v6sm28940116wrc.52.2018.10.07.07.11.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Oct 2018 07:11:57 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v4 07/12] socket: allow modification of transit_net
Date: Sun,  7 Oct 2018 16:11:34 +0200
Message-Id: <20181007141139.26310-8-ju.orth@gmail.com>
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
 src/device.c  |  8 +++++---
 src/netlink.c |  2 +-
 src/socket.c  | 18 ++++++++++--------
 src/socket.h  |  6 +++---
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/src/device.c b/src/device.c
index ddb8fd7..a0b771b 100644
--- a/src/device.c
+++ b/src/device.c
@@ -54,7 +54,7 @@ static int open(struct net_device *dev)
 #endif
 
 	mutex_lock(&wg->device_update_lock);
-	ret = wg_socket_init(wg, wg->incoming_port);
+	ret = wg_socket_init(wg, wg->transit_net, wg->incoming_port);
 	if (ret < 0)
 		goto out;
 	list_for_each_entry (peer, &wg->peer_list, peer_list) {
@@ -112,7 +112,7 @@ static int stop(struct net_device *dev)
 	}
 	mutex_unlock(&wg->device_update_lock);
 	skb_queue_purge(&wg->incoming_handshakes);
-	wg_socket_reinit(wg, NULL, NULL);
+	wg_socket_reinit(wg, NULL, NULL, NULL);
 	return 0;
 }
 
@@ -228,7 +228,7 @@ static void destruct(struct net_device *dev)
 	rtnl_unlock();
 	mutex_lock(&wg->device_update_lock);
 	wg->incoming_port = 0;
-	wg_socket_reinit(wg, NULL, NULL);
+	wg_socket_reinit(wg, NULL, NULL, NULL);
 	wg_allowedips_free(&wg->peer_allowedips, &wg->device_update_lock);
 	/* The final references are cleared in the below calls to destroy_workqueue. */
 	wg_peer_remove_all(wg);
@@ -399,7 +399,9 @@ static int netdevice_notification(struct notifier_block *nb,
 	if (action != NETDEV_REGISTER || dev->netdev_ops != &netdev_ops)
 		return 0;
 
+	mutex_lock(&wg->device_update_lock);
 	wg_device_set_nets(wg, dev_net(dev), wg->transit_net);
+	mutex_unlock(&wg->device_update_lock);
 
 	return 0;
 }
diff --git a/src/netlink.c b/src/netlink.c
index 50cbd66..b6a66dd 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -369,7 +369,7 @@ static int set_port(struct wireguard_device *wg, u16 port)
 		wg->incoming_port = port;
 		return 0;
 	}
-	return wg_socket_init(wg, port);
+	return wg_socket_init(wg, wg->transit_net, port);
 }
 
 static int set_allowedip(struct wireguard_peer *peer, struct nlattr **attrs)
diff --git a/src/socket.c b/src/socket.c
index eb5d429..ee5f59a 100644
--- a/src/socket.c
+++ b/src/socket.c
@@ -351,7 +351,7 @@ static void set_sock_opts(struct socket *sock)
 	sk_set_memalloc(sock->sk);
 }
 
-int wg_socket_init(struct wireguard_device *wg, u16 port)
+int wg_socket_init(struct wireguard_device *wg, struct net *net, u16 port)
 {
 	int ret;
 	struct udp_tunnel_sock_cfg cfg = {
@@ -381,18 +381,18 @@ int wg_socket_init(struct wireguard_device *wg, u16 port)
 retry:
 #endif
 
-	ret = udp_sock_create(wg->transit_net, &port4, &new4);
+	ret = udp_sock_create(net, &port4, &new4);
 	if (ret < 0) {
 		pr_err("%s: Could not create IPv4 socket\n", wg->dev->name);
 		return ret;
 	}
 	set_sock_opts(new4);
-	setup_udp_tunnel_sock(wg->transit_net, new4, &cfg);
+	setup_udp_tunnel_sock(net, new4, &cfg);
 
 #if IS_ENABLED(CONFIG_IPV6)
 	if (ipv6_mod_enabled()) {
 		port6.local_udp_port = inet_sk(new4->sk)->inet_sport;
-		ret = udp_sock_create(wg->transit_net, &port6, &new6);
+		ret = udp_sock_create(net, &port6, &new6);
 		if (ret < 0) {
 			udp_tunnel_sock_release(new4);
 			if (ret == -EADDRINUSE && !port && retries++ < 100)
@@ -402,16 +402,16 @@ retry:
 			return ret;
 		}
 		set_sock_opts(new6);
-		setup_udp_tunnel_sock(wg->transit_net, new6, &cfg);
+		setup_udp_tunnel_sock(net, new6, &cfg);
 	}
 #endif
 
-	wg_socket_reinit(wg, new4 ? new4->sk : NULL, new6 ? new6->sk : NULL);
+	wg_socket_reinit(wg, net, new4 ? new4->sk : NULL, new6 ? new6->sk : NULL);
 	return 0;
 }
 
-void wg_socket_reinit(struct wireguard_device *wg, struct sock *new4,
-		      struct sock *new6)
+void wg_socket_reinit(struct wireguard_device *wg, struct net *net,
+		      struct sock *new4, struct sock *new6)
 {
 	struct sock *old4, *old6;
 
@@ -424,6 +424,8 @@ void wg_socket_reinit(struct wireguard_device *wg, struct sock *new4,
 	rcu_assign_pointer(wg->sock6, new6);
 	if (new4)
 		wg->incoming_port = ntohs(inet_sk(new4)->inet_sport);
+	if (net && wg->transit_net != net)
+		wg_device_set_nets(wg, wg->dev_net, net);
 	mutex_unlock(&wg->socket_update_lock);
 	synchronize_rcu_bh();
 	synchronize_net();
diff --git a/src/socket.h b/src/socket.h
index ee5eb15..56c22ed 100644
--- a/src/socket.h
+++ b/src/socket.h
@@ -11,9 +11,9 @@
 #include <linux/if_vlan.h>
 #include <linux/if_ether.h>
 
-int wg_socket_init(struct wireguard_device *wg, u16 port);
-void wg_socket_reinit(struct wireguard_device *wg, struct sock *new4,
-		      struct sock *new6);
+int wg_socket_init(struct wireguard_device *wg, struct net *net, u16 port);
+void wg_socket_reinit(struct wireguard_device *wg, struct net *net,
+		      struct sock *new4, struct sock *new6);
 int wg_socket_send_buffer_to_peer(struct wireguard_peer *peer, void *data,
 				  size_t len, u8 ds);
 int wg_socket_send_skb_to_peer(struct wireguard_peer *peer, struct sk_buff *skb,
-- 
2.19.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
