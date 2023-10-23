Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E35CDB474
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Oct 2023 13:08:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8a99497;
	Mon, 23 Oct 2023 13:06:33 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e99c3fa2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Oct 2023 13:06:30 +0000 (UTC)
Received: janet.servers.dxld.at; Mon, 23 Oct 2023 15:06:26 +0200
From: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
Subject: [PATCH] wireguard: Fix leaking sockets in wg_socket_init error paths
Date: Mon, 23 Oct 2023 15:06:09 +0200
Message-Id: <20231023130609.595122-1-dxld@darkboxed.org>
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

This doesn't seem to be reachable normally, but while working on a patch
for the address binding code I ended up triggering this leak and had to
reboot to get rid of the leaking wg sockets.
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

