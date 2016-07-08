Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5901117
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 12:33:50 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Date: Fri,  8 Jul 2016 14:34:12 +0200
Message-Id: <20160708123412.11412-1-Jason@zx2c4.com>
Subject: [WireGuard] [PATCH] persistent keepalive: start sending immediately
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Rather than only start sending the persistent keepalive packets when the
device first sends data, this changes it to send the packets immediately
on `ip link set up`. This makes things generally seem more stateless,
since the administrator does not have to manually ping the endpoint.

Of course, if you have a lot of peers and all of them have persistent
keepalive enabled, this could cause a lot of unwanted immediate traffic.
On the other hand, if all of those peers are at some point going to be
sending packets, this would happen anyway. I suppose the moral of the
story is that persistent keepalive is a feature really just for clients
behind NAT, not for servers, and it should be used sparingly, which is
why we've set it off by default in the first place.
---

Hi list,

I haven't merged this yet, and I'm debating whether it's something we want.
I'm open to all opinions here, so feed back would be most welcome.

Thanks,
Jason


 src/config.c | 5 ++++-
 src/device.c | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/src/config.c b/src/config.c
index 767d31a..910c31b 100644
--- a/src/config.c
+++ b/src/config.c
@@ -106,8 +106,11 @@ static int set_peer(struct wireguard_device *wg, void __user *user_peer, size_t
 	if (in_peer.persistent_keepalive_interval != (uint16_t)-1) {
 		if (in_peer.persistent_keepalive_interval && (in_peer.persistent_keepalive_interval < 10 || in_peer.persistent_keepalive_interval > 3600))
 			ret = -EINVAL;
-		else
+		else {
+			if (!peer->persistent_keepalive_interval && in_peer.persistent_keepalive_interval && netdev_pub(wg)->flags & IFF_UP)
+				socket_send_buffer_to_peer(peer, NULL, 0, 0);
 			peer->persistent_keepalive_interval = in_peer.persistent_keepalive_interval;
+		}
 	}
 
 	if (netdev_pub(wg)->flags & IFF_UP)
diff --git a/src/device.c b/src/device.c
index 120f8c9..198368f 100644
--- a/src/device.c
+++ b/src/device.c
@@ -40,6 +40,8 @@ static int open_peer(struct wireguard_peer *peer, void *data)
 	socket_set_peer_dst(peer);
 	timers_init_peer(peer);
 	packet_send_queue(peer);
+	if (peer->persistent_keepalive_interval)
+		socket_send_buffer_to_peer(peer, NULL, 0, 0);
 	return 0;
 }
 
-- 
2.9.0
