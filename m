Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEC0CA5FFD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:48:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c24b707c;
	Mon, 5 Oct 2026 06:56:39 +0000 (UTC)
Received: from mail-oi2-x10.google.com (mail-oi2-x10.google.com
 [2607:f8b0:4864:32::10])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 97186420
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Sep 2026 20:48:44 +0000 (UTC)
Received: by mail-oi2-x10.google.com with SMTP id
 46e09a7af769-7f4f0d37dc4so715194a34.1
 for <wireguard@lists.zx2c4.com>; Fri, 18 Sep 2026 13:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google09082023; t=1789764522; x=1790369322;
 darn=lists.zx2c4.com; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ppEJDHuTUlQGSUDN/FO8Ik2+PuCaJNFQHPiMwbR7z+4=;
 b=E8znadx79vzV1sG/SBSj0d0WK0RZcbITNVIX1J3iOGapZsMx6XFdOWskg5b4KV6DZA
 0mcQpDLhkh2zWdxJOcN790CTpndvuFfC/ApaxKxiV8Ggy8Yi1FvNSTxKRADHeqc8sEEX
 Npd7q9k7O2ry3tIquK8DCrqMA/IW0OCtkUsiN4r3VNxwAFfK+ENj7AyRrsj+pPfiXzyz
 H9tF7dXnKMb5u3lqVY8nz09cx9zY2gd70g7WLBcjFDoFZxCPQmf8jIuDeTkhiMilq6MB
 H0RUTrNfn2f8+ZWQipV/l/lTfZuyHQwIBlzo0B7VHcNnSxrHwA1ObHTEIDqz2rUm9lxn
 pNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789764522; x=1790369322;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ppEJDHuTUlQGSUDN/FO8Ik2+PuCaJNFQHPiMwbR7z+4=;
 b=1vB1wm2ZF1s9Ux5hWTGI6zWfDrnnL6RQiKp+wQRxxGIucSYvXIkrM0uIkFGpijC38L
 0NvSBQl48vUuKLbOTXRH3UaxjfSgWMK4UaesAUyrnM3p9/U8Diamu18cjjrAA1+4K+rJ
 afmvA98pTxSrNViwaghF4/TvlOaRulZMQASVCOpLBZ2mIT/OPz+MTDeclW463vRkyZa3
 t+pv+v0TP/scp5/Ov13aOxnS3hYWvJb64aLhfAEPErraA6kiEPgvJ1epyODS43L3EzSW
 Lla5WF/QJe/ZbGYzzw95tatf/6SF8rLxPElTiiSDt9mxPBpexrfPGAKA3+Z+AZEJBcfc
 OWNw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzpy0pJYFkfp5mcPJ2chRViIZlUlK+A045Dq/k5Rfw6ZGdeEJmVpIh9gwH5LXoZ9Cjs5ywmEE+cjAI=@lists.zx2c4.com
X-Gm-Message-State: AFuF++nW0b/UWXNPmRk2Br0jHNSsO9kYKZaupzoxhSdc+vWAAeHfBzzD
 MzDNBdZ/iFvTnaG8D5wZoKyXnW0NJnk+tdhuShw+hH/CnlRdvu3bwc47E21VOLimxto=
X-Gm-Gg: AYBFou3S7eKOnbjDSLSP2NeS/wrZ+GDaJXzmLMm4RBHdA/lXTgWRUWjZ/pJFsKcBnir
 Yvzu+pwbJjNydHgxaZmEfmbGSKum580FiyiAgV7zt9OWPH8ECq52V9TXa9HLex+DDpTG1o0pvQZ
 zQ7JtJLKQGvaAbjMI4FASHnoiKHE46H12dFAJhPhZ3FHlJuULhMx9XUhFsXqwMeLtstIdLNwL+7
 ZDxO3/f7/mriSKbhUhiMLkZaR2mrj+x2oNMugGMZOA7YscgmSKcFc2sQc9bkpKdnBl69oloszHv
 CQQQ0CWbAawS5QwkyeOkmeTS8TjP3JdOjgyG7QuRSxZPNvasdO8xX90FbcpXNW9OMoqamgaC0PM
 FKhGY6G2YRLBe0sjQkl/rn8kzCY98wHm/x8Q9LvxRfAFh2YpQcF34o20bEYg+ITrJ37qzkyE6cX
 9WZ7WWjAO3cRk2H09IaggLixRta0K5rF0ydrK98VSuAJMsmTDJQixI6aI=
X-Received: by 2002:a9d:7441:0:b0:806:ab05:c1dd with SMTP id
 46e09a7af769-80ddfd6c11amr3214332a34.4.1789764522401; 
 Fri, 18 Sep 2026 13:48:42 -0700 (PDT)
Received: from 20HS2G4 ([2a09:bac6:bf21:1923::281:62])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8107dd8bc84sm480328a34.9.2026.09.18.13.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 13:48:40 -0700 (PDT)
Date: Fri, 18 Sep 2026 15:48:39 -0500
From: Chris Arges <carges@cloudflare.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net v2] wireguard: wait for per-peer crypto during removal
Message-ID: <aq2jp8lXwSIqihaj@20HS2G4>
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

Jason,

I benchmarked a wg peer on a 2 vCPU and 8 vCPU setup with 1200 byte
UDP payloads. Goal was stressing the path where these atomics are getting
incremented.
- patched 2 vCPU test showed ~1-2% reduction in throughput
- patched 8 vCPU test showed ~6% reduction in throughput (more contention)

My main goal is reducing the amount of time holding rtnl_lock when we remove a
peer. In our systems we frequently get hangs due to workloads bringing up and
tearing down wg peers. So perhaps I'll need to look into another approach
where we're not introducing something like a counter into the hotpath.

Thanks,
--chris
