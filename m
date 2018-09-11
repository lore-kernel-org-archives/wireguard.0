Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6597302a
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:36 +0000 (UTC)
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com
 [IPv6:2a00:1450:400c:c09::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22fee0b3
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:35 +0000 (UTC)
Received: by mail-wm0-x22d.google.com with SMTP id q8-v6so2131376wmq.4
 for <wireguard@lists.zx2c4.com>; Tue, 11 Sep 2018 12:13:28 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v3 01/12] device: protect socket_init with device_update_lock
Date: Tue, 11 Sep 2018 21:13:00 +0200
Message-Id: <20180911191311.25373-2-ju.orth@gmail.com>
In-Reply-To: <20180911191311.25373-1-ju.orth@gmail.com>
References: <20180911191311.25373-1-ju.orth@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

`set_port` in netlink.c races with `open` in device.c. This can cause
the following code flow:

* thread 1: set_port: device is not up
* thread 2: device is opened
* thread 2: open: called and calls socket_init with the original port
* thread 1: set_port: sets incoming_port to the new port and returns

incoming_port is then inconsistent. While this is not particularly
critical, it will become more critial when ste_port also sets the
transit namespace.
---
 src/device.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/src/device.c b/src/device.c
index 255ad49..88c228b 100644
--- a/src/device.c
+++ b/src/device.c
@@ -53,17 +53,18 @@ static int open(struct net_device *dev)
 #endif
 #endif
 
+	mutex_lock(&wg->device_update_lock);
 	ret = socket_init(wg, wg->incoming_port);
 	if (ret < 0)
-		return ret;
-	mutex_lock(&wg->device_update_lock);
+		goto out;
 	list_for_each_entry (peer, &wg->peer_list, peer_list) {
 		packet_send_staged_packets(peer);
 		if (peer->persistent_keepalive_interval)
 			packet_send_keepalive(peer);
 	}
+out:
 	mutex_unlock(&wg->device_update_lock);
-	return 0;
+	return ret;
 }
 
 #if defined(CONFIG_PM_SLEEP) && !defined(CONFIG_ANDROID)
-- 
2.18.0
