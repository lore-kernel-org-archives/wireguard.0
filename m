Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576F6C54799
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Aug 2023 20:02:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2ce1c54;
	Thu, 17 Aug 2023 20:02:14 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 35f80889
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Aug 2023 20:02:12 +0000 (UTC)
Received: janet.servers.dxld.at; Thu, 17 Aug 2023 22:02:11 +0200
From: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
To: wireguard@lists.zx2c4.com
Cc: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
Subject: [PATCH] wireguard: Fix leaking sockets in wg_socket_init error paths
Date: Thu, 17 Aug 2023 22:02:02 +0200
Message-Id: <20230817200202.917382-1-dxld@darkboxed.org>
X-Mailer: git-send-email 2.39.2
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

---
 drivers/net/wireguard/socket.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireguard/socket.c b/drivers/net/wireguard/socket.c
index 0414d7a6ce74..c35163f503e7 100644
--- a/drivers/net/wireguard/socket.c
+++ b/drivers/net/wireguard/socket.c
@@ -387,7 +387,7 @@ int wg_socket_init(struct wg_device *wg, u16 port)
 	ret = udp_sock_create(net, &port4, &new4);
 	if (ret < 0) {
 		pr_err("%s: Could not create IPv4 socket\n", wg->dev->name);
-		goto out;
+		goto err;
 	}
 	set_sock_opts(new4);
 	setup_udp_tunnel_sock(net, new4, &cfg);
@@ -402,7 +402,7 @@ int wg_socket_init(struct wg_device *wg, u16 port)
 				goto retry;
 			pr_err("%s: Could not create IPv6 socket\n",
 			       wg->dev->name);
-			goto out;
+			goto err;
 		}
 		set_sock_opts(new6);
 		setup_udp_tunnel_sock(net, new6, &cfg);
@@ -414,6 +414,11 @@ int wg_socket_init(struct wg_device *wg, u16 port)
 out:
 	put_net(net);
 	return ret;
+
+err:
+	sock_free(new4 ? new4->sk : NULL);
+	sock_free(new6 ? new6->sk : NULL);
+	goto out;
 }
 
 void wg_socket_reinit(struct wg_device *wg, struct sock *new4,
-- 
2.39.2

