Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3274C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 23:42:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A72621556
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 23:42:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="qgt9LCWR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A72621556
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2df25583;
	Wed, 17 Jun 2020 23:24:26 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 17a16ecc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 23:24:22 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b625272e;
 Wed, 17 Jun 2020 20:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:references:mime-version:content-type
 :content-transfer-encoding:in-reply-to; s=mail; bh=CmcO/S6a8o5VV
 qaoSHaFCi5JewM=; b=qgt9LCWRdA9CyxiqPTi6xa2NZJexGWg4POSWTcvqU8s0x
 phlXhIqz5oa+eMmAE2mnag7x0QAt8OAf8EJLjyTRzfgbt8b5+Gmufa3y+ZzVwZVu
 uHS/YYOUQK8N6GXUvmQ4HhGQbnWBngPbriDGWbW0GrVkExW82GCa9IpRklkkWjdP
 Hf3qQMc33wi0KfvkSl73tHVn7f66gfRSG83E7Y8RJCTryxxzWG/VjmZOhMaPvTBO
 jD+ApdC7kB61RPte1Bz9t++kJlnHPVZRBQEnXHxH5kvieSdx3CFuhbbNi8yz9JJ5
 s3TUmCW0D52gT074PI2KBCBRAys6v5GTTXjlwW4xg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e8b718bc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 17 Jun 2020 20:36:36 +0000 (UTC)
Date: Wed, 17 Jun 2020 14:54:43 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Rui Salvaterra <rsalvaterra@gmail.com>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>,
 wireguard@lists.zx2c4.com
Subject: Re: wireguard: unknown relocation: 102 [ARMv7 Thumb-2]
Message-ID: <20200617205443.GA403252@zx2c4.com>
References: <CALjTZvbpu1Lw0j9dtXZPmVS+i-OnopUo+zuqtoQLnABQGw-SqQ@mail.gmail.com>
 <CAHmME9r3nPwmUoYYrj0PnUStd1ACSmdFAO4Qv2cZtmiLspOW1g@mail.gmail.com>
 <CALjTZvbtjVwpyV+AMX4htssTbwTHV45mQeokUr952D_GbtFPvw@mail.gmail.com>
 <CALjTZvZRerzWqaqhY2U=m44n5taLEsY99uEt2=ZNCe27=LYbLA@mail.gmail.com>
 <CAHmME9otC1mOqR2tLB55BVQQpNPvCMUGa1E4jfMYYXNp6_31BA@mail.gmail.com>
 <CALjTZvZ4wqZZ7_Fk-YHaxT9uuWnS4n9dLm4ZXSy1UM3riv+NuQ@mail.gmail.com>
 <CAHmME9qWrBTCsBr7s6oLD0zuBMzZUD2OV3s-tgDwV0W7bb9Utw@mail.gmail.com>
 <CAHmME9p51XvLEZ7QbDreEXym34S4XZZaRotAv4aRiT5D4Pz3XA@mail.gmail.com>
 <20200617204510.GA396261@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617204510.GA396261@zx2c4.com>
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

On Wed, Jun 17, 2020 at 02:45:12PM -0600, Jason A. Donenfeld wrote:
> Looks like my explanation there wasn't 100% accurate, but it does seem
> like the issue occurs when gcc sees a clear tail call that it can
> optimize into a B instruction instead of a BL instruction.
> 
> The below patch avoids that, and thus fixes your issue, using a pretty
> bad trick that's not really suitable for being committed anywhere, but
> it is perhaps leading us in the right direction:
> 
> diff --git a/src/send.c b/src/send.c
> index 828b086a..4bb6911f 100644
> --- a/src/send.c
> +++ b/src/send.c
> @@ -221,6 +221,8 @@ static bool encrypt_packet(struct sk_buff *skb, struct noise_keypair *keypair,
>      simd_context);
>  }
>  
> +volatile char dummy;
> +
>  void wg_packet_send_keepalive(struct wg_peer *peer)
>  {
>   struct sk_buff *skb;
> @@ -240,6 +242,7 @@ void wg_packet_send_keepalive(struct wg_peer *peer)
>   }
>  
>   wg_packet_send_staged_packets(peer);
> + dummy = -1;
>  }
>  
>  static void wg_packet_create_data_done(struct sk_buff *first,

A better fix with more explanation: it looks like the issue doesn't have
to do with the multifile thing I pointed out before, but just that gcc
sees it can optimize the tail call into a B instruction, which seems to
have a ±2KB range, whereas BL has a ±4MB range. The solution is to just
move the location of the function in that file to be closer to the
destination of the tail call. I'm not a big fan of that and I'm slightly
worried davem will nack it because it makes backporting harder for a
fairly speculative gain (at least, I haven't yet taken measurements,
though I suppose I could). There's also the question of - why are we
doing goofy reordering things to the code to work around a toolchain
bug? Shouldn't we fix the toolchain? So, I'll keep thinking...

diff --git a/src/send.c b/src/send.c
index 828b086a..f44aff8d 100644
--- a/src/send.c
+++ b/src/send.c
@@ -221,27 +221,6 @@ static bool encrypt_packet(struct sk_buff *skb, struct noise_keypair *keypair,
 						   simd_context);
 }

-void wg_packet_send_keepalive(struct wg_peer *peer)
-{
-	struct sk_buff *skb;
-
-	if (skb_queue_empty(&peer->staged_packet_queue)) {
-		skb = alloc_skb(DATA_PACKET_HEAD_ROOM + MESSAGE_MINIMUM_LENGTH,
-				GFP_ATOMIC);
-		if (unlikely(!skb))
-			return;
-		skb_reserve(skb, DATA_PACKET_HEAD_ROOM);
-		skb->dev = peer->device->dev;
-		PACKET_CB(skb)->mtu = skb->dev->mtu;
-		skb_queue_tail(&peer->staged_packet_queue, skb);
-		net_dbg_ratelimited("%s: Sending keepalive packet to peer %llu (%pISpfsc)\n",
-				    peer->device->dev->name, peer->internal_id,
-				    &peer->endpoint.addr);
-	}
-
-	wg_packet_send_staged_packets(peer);
-}
-
 static void wg_packet_create_data_done(struct sk_buff *first,
 				       struct wg_peer *peer)
 {
@@ -346,6 +325,27 @@ err:
 	kfree_skb_list(first);
 }

+void wg_packet_send_keepalive(struct wg_peer *peer)
+{
+	struct sk_buff *skb;
+
+	if (skb_queue_empty(&peer->staged_packet_queue)) {
+		skb = alloc_skb(DATA_PACKET_HEAD_ROOM + MESSAGE_MINIMUM_LENGTH,
+				GFP_ATOMIC);
+		if (unlikely(!skb))
+			return;
+		skb_reserve(skb, DATA_PACKET_HEAD_ROOM);
+		skb->dev = peer->device->dev;
+		PACKET_CB(skb)->mtu = skb->dev->mtu;
+		skb_queue_tail(&peer->staged_packet_queue, skb);
+		net_dbg_ratelimited("%s: Sending keepalive packet to peer %llu (%pISpfsc)\n",
+				    peer->device->dev->name, peer->internal_id,
+				    &peer->endpoint.addr);
+	}
+
+	wg_packet_send_staged_packets(peer);
+}
+
 void wg_packet_purge_staged_packets(struct wg_peer *peer)
 {
 	spin_lock_bh(&peer->staged_packet_queue.lock);

