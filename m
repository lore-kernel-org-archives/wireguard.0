Return-Path: agk@godking.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7dcfce41
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Nov 2017 20:54:24 +0000 (UTC)
Received: from godking.net (s18231873.onlinehome-server.info [217.160.179.168])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5608478
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Nov 2017 20:54:24 +0000 (UTC)
From: Alexander Kappner <agk@godking.net>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] address kernel commit 0a833c29d89656025443cb9f0ebff7052dd95ce0
Date: Sat, 25 Nov 2017 12:59:48 -0800
Message-Id: <1511643588-12378-1-git-send-email-agk@godking.net>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

The above-referenced commit in Linus'
tree changed the prototype of genl_dump_check_consistent in netlink.h. This
patch updates netlink.c in WG accordingly so WG builds against the latest
tree.

---
 src/netlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/netlink.c b/src/netlink.c
index 7fa243e..43e5ce0 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -177,7 +177,7 @@ static int get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
 	hdr = genlmsg_put(skb, NETLINK_CB(cb->skb).portid, cb->nlh->nlmsg_seq, &genl_family, NLM_F_MULTI, WG_CMD_GET_DEVICE);
 	if (!hdr)
 		goto out;
-	genl_dump_check_consistent(cb, hdr, &genl_family);
+	genl_dump_check_consistent(cb, hdr);
 
 	if (!last_peer_cursor) {
 		if (nla_put_u16(skb, WGDEVICE_A_LISTEN_PORT, wg->incoming_port) || nla_put_u32(skb, WGDEVICE_A_FWMARK, wg->fwmark) || nla_put_u32(skb, WGDEVICE_A_IFINDEX, wg->dev->ifindex) || nla_put_string(skb, WGDEVICE_A_IFNAME, wg->dev->name))
-- 
2.1.4
