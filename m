Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EC9C88E7F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Sep 2026 10:06:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3aa25a4b;
	Wed, 16 Sep 2026 10:06:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5e7420d3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Sep 2026 10:06:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B01340269;
 Wed, 16 Sep 2026 10:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC481F00898;
 Wed, 16 Sep 2026 10:06:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; dkim=pass (1024-bit key,
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256
 header.s=20210105 header.b=Po3LTUmU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1789553171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Go5E6lD1KeMfcE8aX4HmH/gHqP8C5vaRKCTOcDpjaFg=;
 b=Po3LTUmUaFfLerU6FjjaUNjVt+OjpwrTdpMc0Ox9osT8JhSrCJ7phGr1vyfQ8ZqTwR9Yhq
 G1veJbbdlFw3ryuNkpWiVG1Tef7wYxqAiJaGMm1bsbbakyVkGslTKVV3AEWVUpErhwacO6
 8lxlclShXDXdHWmZ30iH5VcOkdBKtqs=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 035d4129
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 16 Sep 2026 10:06:10 +0000 (UTC)
Date: Wed, 16 Sep 2026 12:06:08 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Chris J Arges <carges@cloudflare.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net v2] wireguard: wait for per-peer crypto during removal
Message-ID: <aqpqEIy_h0DIywRy@zx2c4.com>
References: <20260913-fix-wg-peer-removal-v2-1-0cade985245a@cloudflare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913-fix-wg-peer-removal-v2-1-0cade985245a@cloudflare.com>
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

On Sun, Sep 13, 2026 at 07:19:08AM -0500, Chris J Arges wrote:
> Calling peer_remove_after_dead() currently flushes device-wide packet
> crypto and handshake workqueues while holding RTNL. This is problematic as
> unrelated peers can continue adding work to those queues, blocking other
> tasks that want to take the RTNL lock.
> 
> Instead, this patch tracks pending crypto handoffs for each peer using a
> counter. After marking the peer dead, synchronize_net() prevents new
> submissions. Next, wait for pending crypto workers to schedule TX work and
> for RX NAPI to drain the peer's RX queue. Then flush only the peer's TX
> packet and handshake work.
> 
> This scopes teardown synchronization to the removed peer and prevents
> unrelated peers from extending the RTNL hold time.
>  struct wg_device;
> @@ -161,6 +162,7 @@ static inline int wg_queue_enqueue_per_device_and_peer(
>  	 */
>  	if (unlikely(!wg_prev_queue_enqueue(peer_queue, skb)))
>  		return -ENOSPC;
> +	atomic_inc(&PACKET_PEER(skb)->packet_crypt_pending);
>  
>  	/* Then we queue it up in the device queue, which consumes the
>  	 * packet as soon as it can.
> @@ -182,6 +184,8 @@ static inline void wg_queue_enqueue_per_peer_tx(struct sk_buff *skb, enum packet
>  	atomic_set_release(&PACKET_CB(skb)->state, state);
>  	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
>  		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
> +	if (atomic_dec_and_test(&peer->packet_crypt_pending))
> +		wake_up_var(&peer->packet_crypt_pending);
>  	wg_peer_put(peer);
>  }
>  
> diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
> index 824bbefce61c..bb35e3205491 100644
> --- a/drivers/net/wireguard/receive.c
> +++ b/drivers/net/wireguard/receive.c
> @@ -476,9 +476,11 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
>  
>  next:
>  		wg_noise_keypair_put(keypair, false);
> -		wg_peer_put(peer);
>  		if (unlikely(free))
>  			dev_kfree_skb(skb);
> +		if (atomic_dec_and_test(&peer->packet_crypt_pending))
> +			wake_up_var(&peer->packet_crypt_pending);
> +		wg_peer_put(peer);

This adds two atomic updates to a per-peer counter for every RX packet
and TX batch. That could introduce contention across crypto workers. I
suppose it'd be good to see some measurements in if this changes
anything. Certainly it should change _something_. Question is by how
much.

Jason
