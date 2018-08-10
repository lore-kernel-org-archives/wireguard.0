Return-Path: ahanins@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83635d1f
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 07:55:06 +0000 (UTC)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dff43c6
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 07:55:05 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id l15-v6so6493969lji.6
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 01:06:26 -0700 (PDT)
Return-Path: <ahanins@gmail.com>
From: Andrejs Hanins <ahanins@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/1] Calculate inner checksums for all L4 protocols (was for
 TCP/UDP only).
Date: Fri, 10 Aug 2018 11:06:17 +0300
Message-Id: <20180810080617.20283-2-ahanins@gmail.com>
In-Reply-To: <20180810080617.20283-1-ahanins@gmail.com>
References: <20180810080617.20283-1-ahanins@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

- skb_checksum_setup can only handle TCP/UDP protocols under top level
IP header, packets with other protocols (like GRE) are sent out by
Wireguard with unfinished partial checksums which causes problems on
receiving side (bad checksums).

- skb_encrypt gets skb prepared by network stack, so there is no need to
setup the checksum from scratch, but just perform hw checksum offload
using software helper skb_checksum_help for packet which explicitly
require it as denoted by CHECKSUM_PARTIAL.

Signed-off-by: Andrejs Hanins <ahanins@gmail.com>
---
 src/send.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/send.c b/src/send.c
index 3af7ef3..1d021ae 100644
--- a/src/send.c
+++ b/src/send.c
@@ -151,9 +151,9 @@ static inline bool skb_encrypt(struct sk_buff *skb, struct noise_keypair *keypai
 	if (unlikely(skb_cow_head(skb, DATA_PACKET_HEAD_ROOM) < 0))
 		return false;
 
-	/* We have to remember to add the checksum to the innerpacket, in case the receiver forwards it. */
-	if (likely(!skb_checksum_setup(skb, true)))
-		skb_checksum_help(skb);
+	/* Finalize checksum calculation for the inner packet, if required. */
+	if (skb->ip_summed == CHECKSUM_PARTIAL && skb_checksum_help(skb))
+		return false;
 
 	/* Only after checksumming can we safely add on the padding at the end and the header. */
 	skb_set_inner_network_header(skb, 0);
-- 
2.17.1
