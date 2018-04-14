Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1da8e40a
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 02:26:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc1a1b96
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 02:26:10 +0000 (UTC)
Date: Sat, 14 Apr 2018 04:40:21 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Roman Mamedov <rm.wg@romanrm.net>
Subject: Re: Mixed MTU hosts on a network
Message-ID: <20180414024017.GA14470@zx2c4.com>
References: <20180316142547.2ecb70de@natsu>
 <CAHmME9rVba9Zzv65guftwxZcRGWBY0uaP=_GhHVnBz=8+L6Y3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <CAHmME9rVba9Zzv65guftwxZcRGWBY0uaP=_GhHVnBz=8+L6Y3A@mail.gmail.com>
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, Apr 14, 2018 at 03:38:46AM +0200, Jason A. Donenfeld wrote:
> 2) When we pad the packet payload. In this case, we pad it to the
> nearest multiple of 16, but we don't let it exceed the device MTU.
> This is skb_padding in send.c. This behavior seems like the bug in
> your particular case, since what matters here is the route's MTU, not
> the device MTU. For full 1412 size packets, the payload is presumably
> being padded to 1424, since that's still less than the device MTU. In
> order to test this theory, try setting your route MTU, as you've
> described in your first email, to 1408 (which is a multiple of 16). If
> this works, let me know, as it will be good motivation for fixing
> skb_padding. If not, then it means there's a problem elsewhere to
> investigate too.
> 
> I'm CC'ing Luis on this email, as he was working on the MTU code a while back.

I'm still playing with this, but something like the following might fix
the issue, if you're interested in playing a bit.

=~=~=~=~=~=~=

diff --git a/src/device.c b/src/device.c
index 1614d61..3d18368 100644
--- a/src/device.c
+++ b/src/device.c
@@ -120,6 +120,7 @@ static netdev_tx_t xmit(struct sk_buff *skb, struct net_device *dev)
 	struct sk_buff *next;
 	struct sk_buff_head packets;
 	sa_family_t family;
+	u32 mtu;
 	int ret;

 	if (unlikely(skb_examine_untrusted_ip_hdr(skb) != skb->protocol)) {
@@ -142,6 +143,8 @@ static netdev_tx_t xmit(struct sk_buff *skb, struct net_device *dev)
 		goto err_peer;
 	}

+	mtu = dst_mtu(skb_dst(skb)) ?: skb->dev->mtu;
+
 	__skb_queue_head_init(&packets);
 	if (!skb_is_gso(skb))
 		skb->next = NULL;
@@ -168,6 +171,8 @@ static netdev_tx_t xmit(struct sk_buff *skb, struct net_device *dev)
 		 */
 		skb_dst_drop(skb);

+		PACKET_CB(skb)->mtu = mtu;
+
 		__skb_queue_tail(&packets, skb);
 	} while ((skb = next) != NULL);

diff --git a/src/queueing.h b/src/queueing.h
index d5948f3..c507536 100644
--- a/src/queueing.h
+++ b/src/queueing.h
@@ -46,6 +46,7 @@ struct packet_cb {
 	u64 nonce;
 	struct noise_keypair *keypair;
 	atomic_t state;
+	u32 mtu;
 	u8 ds;
 };
 #define PACKET_PEER(skb) (((struct packet_cb *)skb->cb)->keypair->entry.peer)
diff --git a/src/send.c b/src/send.c
index dddcc0b..e3b1ffd 100644
--- a/src/send.c
+++ b/src/send.c
@@ -116,11 +116,11 @@ static inline unsigned int skb_padding(struct sk_buff *skb)
 	 * isn't strictly neccessary, but it's better to be cautious here, especially
 	 * if that code ever changes.
 	 */
-	unsigned int last_unit = skb->len % skb->dev->mtu;
+	unsigned int last_unit = skb->len % PACKET_CB(skb)->mtu;
 	unsigned int padded_size = (last_unit + MESSAGE_PADDING_MULTIPLE - 1) & ~(MESSAGE_PADDING_MULTIPLE - 1);

-	if (padded_size > skb->dev->mtu)
-		padded_size = skb->dev->mtu;
+	if (padded_size > PACKET_CB(skb)->mtu)
+		padded_size = PACKET_CB(skb)->mtu;
 	return padded_size - last_unit;
 }
