Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCA5606A886
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 16:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=NjXWYsqU
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 68e49663;
	Tue, 10 Nov 2026 16:34:05 +0000 (UTC)
Received: from mail-pg1-x566.google.com (mail-pg1-x566.google.com
 [2607:f8b0:4864:20::566])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id bcf19159
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 16:34:03 +0000 (UTC)
Received: by mail-pg1-x566.google.com with SMTP id
 41be03b00d2f7-cdb2893531bso1296974a12.1
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 08:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794328441; x=1794933241;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:dkim-signature
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=xYEq8HbwUXEbqfAYqiylUR/1VTWi5Y1t3UUmnG8Hobw=;
 b=ZSRP/fzIeLO4hDIKU4strpsX4rE4ySsDabAqhHmriHn+ubk5efO+rSa3ybmslPwCTX
 6j8KesY2K3ZdBzIDUSCt9/febEqjJ45ba1VD1LyCMVT3bOcalEcEtAMMR50g5povW9JR
 Jnz1q1edAf0HV+aVbUBsp5IW6xVf0FvN6r7hOEqOl5THwNt9WcBuT3m2S1BERw2z86EE
 qlFJNbJGCijXNnDV3n3HmqmQnceVjcz72BAYYk+K8C1e9RLd2A6kmUrggUiBWQ1yABIB
 4yDGDiKLp23qEHWMqPfGCv/idAa9y7G0C//xjZFUW6/yQo3AjJz2zDfwEiT8sn4Gp3b9
 5zxA==
X-Forwarded-Encrypted: i=1;
 AL+hErERM+XYis5irliZDAYH48YgR1NzNbtO87oA5PWElkfGt4hWU99HyjM7+/zdbOxrKGc/zA7GVTerfM0=@lists.zx2c4.com
X-Gm-Message-State: APuU4Z/+Y5IX3hCRilDdWA3i/f/mS9oUnUgD1d+5QRt0WHLkynXGehw4
 F3YLShgKM2LzXxKRvJgpdurky4nCSNVv5ZOzhItT/zyeoOppFLVESKLiJQRb085VObkaL/p5eJY
 OKYvtTiBhjVhk25h4bxMHW+7O50TJYMYNj797FWDIrg==
X-Gm-Gg: AYBFou2EipAfW3C0VTUccao+yOq+RRcxwmyYC0SWjtf8WJZ9itWHfPC71Lzkp0d02F1
 6LEDT9cIBblaDZlIr7+gVbbyePOug8yhKITlKQMc94RM55H7riq2nlPoATwNonO3xfImE/ocIrT
 txyN1EMVPvJCDVIEUL561RdYqtZsP3YjAXh1ay9lkB7Y5EBBAZP8jCMOpPS5YSmv08bmjf+QnSK
 BqO6LtP9ykgpUIZPsM20E/4SfQ+xQPFAUGK6fC6hCUHK1VvBLEQD45L3IlHbQpPN7g1Z59c28mw
 vez1M6Kwv1s+wAUIyS4TnsYx2JtA7cQT8VBuOImLTmTOLA+1f8QMnJBIbYJ3co0IPHo3sVCEiZ6
 PYw==
X-Received: by 2002:a17:90b:2b86:b0:39d:84af:a0b3 with SMTP id
 98e67ed59e1d1-3b166cc1492mr3132138a91.18.1794328441135; 
 Tue, 10 Nov 2026 08:34:01 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3b17db39f76sm230466a91.3.2026.11.10.08.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 08:34:01 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1794328438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xYEq8HbwUXEbqfAYqiylUR/1VTWi5Y1t3UUmnG8Hobw=;
 b=NjXWYsqUesUoBb2Op846E0r3AyPiJ/nASZJaxW4MJZHcJSVe63eNzfVRxBodLtwKIO07fZ
 OGHokAm3OieWlB++q3OW7jcowp6Dlns0Su0gH8549/u85RwDnDxeVlOZ4JlL4h+hudRPpS
 YQ89M7sHVvCPkUqKhlM6t/YdSVJgrAY=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id d39f359f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 10 Nov 2026 16:33:58 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:33:56 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Chris Arges <carges@cloudflare.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net v2] wireguard: wait for per-peer crypto during removal
Message-ID: <avNHdEw2zHGyBe_U@zx2c4.com>
References: <20260913-fix-wg-peer-removal-v2-1-0cade985245a@cloudflare.com>
 <aqpqEIy_h0DIywRy@zx2c4.com> <aq2jp8lXwSIqihaj@20HS2G4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aq2jp8lXwSIqihaj@20HS2G4>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Sep 18, 2026 at 03:48:39PM -0500, Chris Arges wrote:
> On 2026-09-16 12:06:08, Jason A. Donenfeld wrote:
> > On Sun, Sep 13, 2026 at 07:19:08AM -0500, Chris J Arges wrote:
> > > Calling peer_remove_after_dead() currently flushes device-wide packet
> > > crypto and handshake workqueues while holding RTNL. This is problematic as
> > > unrelated peers can continue adding work to those queues, blocking other
> > > tasks that want to take the RTNL lock.
> > > 
> > > Instead, this patch tracks pending crypto handoffs for each peer using a
> > > counter. After marking the peer dead, synchronize_net() prevents new
> > > submissions. Next, wait for pending crypto workers to schedule TX work and
> > > for RX NAPI to drain the peer's RX queue. Then flush only the peer's TX
> > > packet and handshake work.
> > > 
> > > This scopes teardown synchronization to the removed peer and prevents
> > > unrelated peers from extending the RTNL hold time.
> > >  struct wg_device;
> > > @@ -161,6 +162,7 @@ static inline int wg_queue_enqueue_per_device_and_peer(
> > >  	 */
> > >  	if (unlikely(!wg_prev_queue_enqueue(peer_queue, skb)))
> > >  		return -ENOSPC;
> > > +	atomic_inc(&PACKET_PEER(skb)->packet_crypt_pending);
> > >  
> > >  	/* Then we queue it up in the device queue, which consumes the
> > >  	 * packet as soon as it can.
> > > @@ -182,6 +184,8 @@ static inline void wg_queue_enqueue_per_peer_tx(struct sk_buff *skb, enum packet
> > >  	atomic_set_release(&PACKET_CB(skb)->state, state);
> > >  	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
> > >  		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
> > > +	if (atomic_dec_and_test(&peer->packet_crypt_pending))
> > > +		wake_up_var(&peer->packet_crypt_pending);
> > >  	wg_peer_put(peer);
> > >  }
> > >  
> > > diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
> > > index 824bbefce61c..bb35e3205491 100644
> > > --- a/drivers/net/wireguard/receive.c
> > > +++ b/drivers/net/wireguard/receive.c
> > > @@ -476,9 +476,11 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
> > >  
> > >  next:
> > >  		wg_noise_keypair_put(keypair, false);
> > > -		wg_peer_put(peer);
> > >  		if (unlikely(free))
> > >  			dev_kfree_skb(skb);
> > > +		if (atomic_dec_and_test(&peer->packet_crypt_pending))
> > > +			wake_up_var(&peer->packet_crypt_pending);
> > > +		wg_peer_put(peer);
> > 
> > This adds two atomic updates to a per-peer counter for every RX packet
> > and TX batch. That could introduce contention across crypto workers. I
> > suppose it'd be good to see some measurements in if this changes
> > anything. Certainly it should change _something_. Question is by how
> > much.
> > 
> > Jason
> 
> Jason,
> 
> I benchmarked a wg peer on a 2 vCPU and 8 vCPU setup with 1200 byte
> UDP payloads. Goal was stressing the path where these atomics are getting
> incremented.
> - patched 2 vCPU test showed ~1-2% reduction in throughput
> - patched 8 vCPU test showed ~6% reduction in throughput (more contention)
> 
> My main goal is reducing the amount of time holding rtnl_lock when we remove a
> peer. In our systems we frequently get hangs due to workloads bringing up and
> tearing down wg peers. So perhaps I'll need to look into another approach
> where we're not introducing something like a counter into the hotpath.

Did you have any luck with other approaches? I'm still interested in
this.

Thanks,
Jason
