Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2F5C43612
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460DC206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9cYA3T1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 460DC206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3c9e1aa;
	Sat, 15 Dec 2018 16:56:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e1e5684
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:30 +0000 (UTC)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ebf4275
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:29 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id g19so807937edy.8
 for <wireguard@lists.zx2c4.com>; Sat, 15 Dec 2018 08:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CMqQzdip9UBEVyuUzMD9kQ1e9eR0/iDRYK+HiZ9mBOY=;
 b=S9cYA3T12l7vg3cZgAG7HpcebVBbOlSeojfPRHeCKFVupfKyWCpJygze31iHEDsb3I
 qFWvX4tvZIZ89qSO7HTiTGdHRGkdaXDTHHJP/JFo3FUFeoYCv5Ey9xvvEQlvA9btLYHH
 yiUOvo4YArbiKMb23G+t5yIYHxLBkz0t0wnC7MPDoaCVix8KVXUeeTTgSE0JCw9hjRRl
 cyRaQDo8U8zADMkuk5rlRkDzQ6KAimrLZkglS51eXDWN9z2P8AsrOYSyZr/VDHKXLHts
 xNq8Q0QZx/BU8m6/mltmnxvPB+9z/qDMzL9XyQFgMz9BYj9adkuvR7bs+Lq0Iy2kYAVT
 amAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CMqQzdip9UBEVyuUzMD9kQ1e9eR0/iDRYK+HiZ9mBOY=;
 b=kaVRqmt1zdHSy9CarIS9mXA+o5TyJ6FoQa0hgpq3vgoaphdH7K5UbtNA9xrFennQE+
 msiw3VlnsvnDqp67t7XDlstESMK4j6W/o/ZHu5LJUdmVmBWFtGFbe1RHPFkHYvt5Xw+Q
 8cFHakSsp5Lk4gXH7C7u5Z6wu+QBATYEs++owxONGh6M2tvI+7ElNoeDkGZm3lRf2+Xr
 yOpFgsGOaRZNQ9olpiGnPzUM1/RpXZB+cTeSJ4yCm3O7qttOb9FNBj49zUNp64pJCZxY
 luU4rMss5Oko1vbRi3Z1fJNEAeZIdwaK7vISJIzn/v8Q3AcmOE1EhpeXdQQHLZg+AiiT
 1jSA==
X-Gm-Message-State: AA+aEWaqaXBOczeY5szsk7Jt6C+F/rBqZ0KX3Jr9D7e7ki2WtfrXQ85b
 tOddWfei1VYB/SdAzYO723pipG7P
X-Google-Smtp-Source: AFSGD/VWfGBYzBB/zj4tzGL5gYeqEaNGHYBtvPao2Kt+jO/xh/NtHNGIqgkrLa7ouE9ifCr7Y5Jwzg==
X-Received: by 2002:a50:8b41:: with SMTP id l59mr7023556edl.44.1544892994338; 
 Sat, 15 Dec 2018 08:56:34 -0800 (PST)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id q50sm2356015edd.66.2018.12.15.08.56.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Dec 2018 08:56:33 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v5 06/11] socket: allow modification of transit_net
Date: Sat, 15 Dec 2018 17:56:08 +0100
Message-Id: <20181215165613.5486-7-ju.orth@gmail.com>
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
 src/device.c  |  6 +++---
 src/netlink.c |  2 +-
 src/socket.c  | 18 ++++++++++--------
 src/socket.h  |  6 +++---
 4 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/src/device.c b/src/device.c
index 0c0c17b..18b4587 100644
--- a/src/device.c
+++ b/src/device.c
@@ -53,7 +53,7 @@ static int wg_open(struct net_device *dev)
 #endif
 #endif
 
-	ret = wg_socket_init(wg, wg->incoming_port);
+	ret = wg_socket_init(wg, wg->transit_net, wg->incoming_port);
 	if (ret < 0)
 		return ret;
 	mutex_lock(&wg->device_update_lock);
@@ -118,7 +118,7 @@ static int wg_stop(struct net_device *dev)
 	}
 	mutex_unlock(&wg->device_update_lock);
 	skb_queue_purge(&wg->incoming_handshakes);
-	wg_socket_reinit(wg, NULL, NULL);
+	wg_socket_reinit(wg, NULL, NULL, NULL);
 	return 0;
 }
 
@@ -236,7 +236,7 @@ static void wg_destruct(struct net_device *dev)
 	rtnl_unlock();
 	mutex_lock(&wg->device_update_lock);
 	wg->incoming_port = 0;
-	wg_socket_reinit(wg, NULL, NULL);
+	wg_socket_reinit(wg, NULL, NULL, NULL);
 	wg_allowedips_free(&wg->peer_allowedips, &wg->device_update_lock);
 	/* The final references are cleared in the below calls to destroy_workqueue. */
 	wg_peer_remove_all(wg);
diff --git a/src/netlink.c b/src/netlink.c
index 8d22230..e0f3632 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -362,7 +362,7 @@ static int set_port(struct wg_device *wg, u16 port)
 		wg->incoming_port = port;
 		return 0;
 	}
-	return wg_socket_init(wg, port);
+	return wg_socket_init(wg, wg->transit_net, port);
 }
 
 static int set_allowedip(struct wg_peer *peer, struct nlattr **attrs)
diff --git a/src/socket.c b/src/socket.c
index 75e4114..1ac065f 100644
--- a/src/socket.c
+++ b/src/socket.c
@@ -352,7 +352,7 @@ static void set_sock_opts(struct socket *sock)
 	sk_set_memalloc(sock->sk);
 }
 
-int wg_socket_init(struct wg_device *wg, u16 port)
+int wg_socket_init(struct wg_device *wg, struct net *net, u16 port)
 {
 	int ret;
 	struct udp_tunnel_sock_cfg cfg = {
@@ -382,18 +382,18 @@ int wg_socket_init(struct wg_device *wg, u16 port)
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
@@ -403,16 +403,16 @@ retry:
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
 
-void wg_socket_reinit(struct wg_device *wg, struct sock *new4,
-		      struct sock *new6)
+void wg_socket_reinit(struct wg_device *wg, struct net *net,
+		      struct sock *new4, struct sock *new6)
 {
 	struct sock *old4, *old6;
 
@@ -425,6 +425,8 @@ void wg_socket_reinit(struct wg_device *wg, struct sock *new4,
 	rcu_assign_pointer(wg->sock6, new6);
 	if (new4)
 		wg->incoming_port = ntohs(inet_sk(new4)->inet_sport);
+	if (net && wg->transit_net != net)
+		wg_device_set_nets(wg, wg->dev_net, net);
 	mutex_unlock(&wg->socket_update_lock);
 	synchronize_rcu_bh();
 	synchronize_net();
diff --git a/src/socket.h b/src/socket.h
index 9d3e8e1..2db1f86 100644
--- a/src/socket.h
+++ b/src/socket.h
@@ -11,9 +11,9 @@
 #include <linux/if_vlan.h>
 #include <linux/if_ether.h>
 
-int wg_socket_init(struct wg_device *wg, u16 port);
-void wg_socket_reinit(struct wg_device *wg, struct sock *new4,
-		      struct sock *new6);
+int wg_socket_init(struct wg_device *wg, struct net *net, u16 port);
+void wg_socket_reinit(struct wg_device *wg, struct net *net,
+		      struct sock *new4, struct sock *new6);
 int wg_socket_send_buffer_to_peer(struct wg_peer *peer, void *data,
 				  size_t len, u8 ds);
 int wg_socket_send_skb_to_peer(struct wg_peer *peer, struct sk_buff *skb,
-- 
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
