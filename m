Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37397CA5FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:48:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0ab7a076;
	Mon, 5 Oct 2026 06:56:37 +0000 (UTC)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [2607:f8b0:4864:20::32f])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 84bdfa3a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Sep 2026 16:40:28 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7f4df360cc9so1969884a34.1
 for <wireguard@lists.zx2c4.com>; Wed, 16 Sep 2026 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google09082023; t=1789576827; x=1790181627;
 darn=lists.zx2c4.com; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=SjnTPR/EGL67/pMd+T2zbAYFe3UJ3Z05Gc3GQfpLaVg=;
 b=GMgRdS1lheC++YUsAA6xB8NBWrXC8qAbrQ731dRnJmM0B7MB3dDGef//tN8aef2PPm
 6pT0RInCeFu7dhl+6YXBjwNun+sCYnG765kTd+bCOXm8FuVmvlmGO9Y0r2DzEGqeUp7L
 IfTwoQ15TKlxaTRkNRxzVpMuxUb6H8R9svRBNqchYxfD31c0mBMLBkY1alNHWxTwvlc1
 t5CF+xteXhur4fTi6puCLKdWKLv9ugZ2OyEFtTeOJCvKjojdw1tQFBg5l4VtrruPzH7b
 YAuBTLs05NUgqE/LcvSwAScoBDubg9n5CzoCbDt9MsLIcPLdtaGMg96CO/WRiAK1J/GV
 XMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789576827; x=1790181627;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SjnTPR/EGL67/pMd+T2zbAYFe3UJ3Z05Gc3GQfpLaVg=;
 b=2xWFijo/1f0D9/qkSh5OUsfQnb4HUH0l4zdRkeFAfIs0kgtkIgG2Jb0+o1efc/HW6A
 Hb4nEMaf6TyHw0eKa+i5c3wy7UW1SXwSLRY6Dlm6nMPBslovdalI43bgXOvAe4RUXC4u
 1Zs5nnqxOvNj7/74UvUbTm+VKGZC9eY70xNeHTvupnuYySJM9I6e9ytMIwZW4qdlppbQ
 M2kjTKforngqf09WTFkvSKijGZtwuk76PbQehce1QSsE4cqFjQLzBqmZ214SrQhSG2Za
 SHwA27mdFkH885L21oMoV7jM5uoJLVeLZWYFeWRIGHUBmpX6Fta1YtiAFh2lSG6zIAmr
 npAA==
X-Forwarded-Encrypted: i=1;
 AKwUvByXmWtphTNJsL+zMLvdbY0Jam+MtKL/71iKl4BLvzOM1mpUcyg2tj2TXc+0pA7fHUAoFTx9fDH3eak=@lists.zx2c4.com
X-Gm-Message-State: AFuF++m17Q7TLMhBY6+jPpyn2p6k8FgCjyX6tdZJL+hvA0eUKMXrGLXk
 ir0F+Wqdri5YGOBgY/eIB7T+zGH3Dg7v76EHOtAHQ9uP4sH0F5KNN5eGzER4mXkaDRI=
X-Gm-Gg: AYBFou1YyLaktOY6JJO0On6hYMgPTopSi4QIUDF8WCyUOzwYXrUtqnd15rbqwGsSMgB
 L++bQsaFkqopMYwZ79iDtyb75fwjFHBFDPGIPMr+js3pjuLGc5kssxHDHMHpTeSa37s8f2upyy3
 StlYTq6TdLxTXLhPxc1ciZ4t1bakmvSSt23TxKg6pC7I8v2xqpTp9/K0FBXCrcULHluqvzRzhCS
 gQ8sj3XdQMLpOq2ofyfWRYeEa6QLRDDEa5xx8hbtq5To4kEJ50ar7ycZYxflSPOtu+v43pdFV/f
 rEc0EqmeGD7M9AgOEWWoU9C29W+L/7CBxZ89FjCb62Ks9sJCNcJlq/AvvliTUw9ORIIsGJEIPJJ
 hPq/l9cvRvOI2bJII4TCdH0CwOXx96jG8m+PtI0Ijji3S+9CnXIHu2J7nV9GZUxoCKrzmqTWetp
 VzAdnnOaS9SJJWbi9dWbJDWPkjzxujYFewpjxRQMrBuhe91u7Q2li107uf92PZ+w==
X-Received: by 2002:a05:6830:67e4:b0:807:50d:7f3a with SMTP id
 46e09a7af769-80c4e7f7ba1mr199721a34.30.1789576826716; 
 Wed, 16 Sep 2026 09:40:26 -0700 (PDT)
Received: from 20HS2G4 ([2a09:bac6:bf21:96::f:339])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-80c46dbe483sm255445a34.20.2026.09.16.09.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 09:40:26 -0700 (PDT)
Date: Wed, 16 Sep 2026 11:40:24 -0500
From: Chris Arges <carges@cloudflare.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net v2] wireguard: wait for per-peer crypto during removal
Message-ID: <aqrGeOpbu_u-CBes@20HS2G4>
References: <20260913-fix-wg-peer-removal-v2-1-0cade985245a@cloudflare.com>
 <aqpqEIy_h0DIywRy@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqpqEIy_h0DIywRy@zx2c4.com>
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

On 2026-09-16 12:06:08, Jason A. Donenfeld wrote:
> On Sun, Sep 13, 2026 at 07:19:08AM -0500, Chris J Arges wrote:
> > Calling peer_remove_after_dead() currently flushes device-wide packet
> > crypto and handshake workqueues while holding RTNL. This is problematic as
> > unrelated peers can continue adding work to those queues, blocking other
> > tasks that want to take the RTNL lock.
> > 
> > Instead, this patch tracks pending crypto handoffs for each peer using a
> > counter. After marking the peer dead, synchronize_net() prevents new
> > submissions. Next, wait for pending crypto workers to schedule TX work and
> > for RX NAPI to drain the peer's RX queue. Then flush only the peer's TX
> > packet and handshake work.
> > 
> > This scopes teardown synchronization to the removed peer and prevents
> > unrelated peers from extending the RTNL hold time.
> >  struct wg_device;
> > @@ -161,6 +162,7 @@ static inline int wg_queue_enqueue_per_device_and_peer(
> >  	 */
> >  	if (unlikely(!wg_prev_queue_enqueue(peer_queue, skb)))
> >  		return -ENOSPC;
> > +	atomic_inc(&PACKET_PEER(skb)->packet_crypt_pending);
> >  
> >  	/* Then we queue it up in the device queue, which consumes the
> >  	 * packet as soon as it can.
> > @@ -182,6 +184,8 @@ static inline void wg_queue_enqueue_per_peer_tx(struct sk_buff *skb, enum packet
> >  	atomic_set_release(&PACKET_CB(skb)->state, state);
> >  	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
> >  		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
> > +	if (atomic_dec_and_test(&peer->packet_crypt_pending))
> > +		wake_up_var(&peer->packet_crypt_pending);
> >  	wg_peer_put(peer);
> >  }
> >  
> > diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
> > index 824bbefce61c..bb35e3205491 100644
> > --- a/drivers/net/wireguard/receive.c
> > +++ b/drivers/net/wireguard/receive.c
> > @@ -476,9 +476,11 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
> >  
> >  next:
> >  		wg_noise_keypair_put(keypair, false);
> > -		wg_peer_put(peer);
> >  		if (unlikely(free))
> >  			dev_kfree_skb(skb);
> > +		if (atomic_dec_and_test(&peer->packet_crypt_pending))
> > +			wake_up_var(&peer->packet_crypt_pending);
> > +		wg_peer_put(peer);
> 
> This adds two atomic updates to a per-peer counter for every RX packet
> and TX batch. That could introduce contention across crypto workers. I
> suppose it'd be good to see some measurements in if this changes
> anything. Certainly it should change _something_. Question is by how
> much.
> 
> Jason

Thanks, I'll get some numbers here and share. We're testing this on some
production machines now. In addition I'll get numbers from my synthetic testing
and report back.

--chris
