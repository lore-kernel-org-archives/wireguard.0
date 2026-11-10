Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E7660A2603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 17:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ZPhHY/77
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9f9d7bad;
	Tue, 10 Nov 2026 17:43:53 +0000 (UTC)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c3b1dbd5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 17:43:51 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-846566246e8so2083518a34.1
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 09:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google09082023; t=1794332629; x=1794937429;
 darn=lists.zx2c4.com; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=g1jb+6xFRaxfW+s+GrlDz4VHByKru/fEuJ86nW0oDnk=;
 b=ZPhHY/77GyXIMgzT0kuP2ez4pEup8EhROa2dCmVwRrfEeBOxEuDhJKhNKEgj/rawj3
 1p/zZj+SK58f+X3zzGwwoMAjrAjSP/spEx72St/gd0dXJIWM2Oj1iLr4kwHQMpW8Fdi1
 y1wPMAIBTRAj85Lt16NnrGPnYL5szFMk6YfUB1ctir3Vy+7NkH5BVm+cRUsU2jUgT09y
 OZpR0o14U6Fm2jAVb/9SrwObcrfLI1nO1F11uLwJRMeSAuNWjsvSNxkvX7BnKJEoaRaT
 oHP5dYecJIbUgTVxhp3rbMBcAMO4Ob2PKcwtQ7cDdZNhbGNKjHRnpbREWufZ71insCgW
 +OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794332629; x=1794937429;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=g1jb+6xFRaxfW+s+GrlDz4VHByKru/fEuJ86nW0oDnk=;
 b=A9fzfAe+cI4BEcwcWWiBy23AtY4Hq91JJcrt7I+De8alVod6dEtClt1nrW8SOP6+O/
 ElnwKccJ+ZkC9cOxQRl8egNAKO/C+Yf3rS0I2MYYHHSdisTnObnJtcWFfj84uMpcjqrr
 32gmc2h+JaBtlDQxdL3VBC2xUiVCqM+vB7qrBpR7YfhWlclZus9xcHSRIBjtcrq9I00Q
 X2lyI9firHg+hcLdecJLN8TmFdNm/akZcgX7OSB5yFZ99gUFO3ycUxdwc+DRyE4xoMIV
 FuYsLX0CK7oyWYBYoFLrwa517umo1hv2EIifk3HEhriAWo382TWDBn9eO5B0byCPNKwX
 8yCg==
X-Forwarded-Encrypted: i=1;
 AL+hErEEQJMRarduuvdlzTTo71kmbOYOCafFkvdnoApmFCSn/uIks7YtBacdD0MKmU59LX+pdsCx5GzRD6w=@lists.zx2c4.com
X-Gm-Message-State: APuU4Z92wi4tEdQRnLtZxiNBHjega/hZ/oqyTh8XTye/TIpo3tp78tvG
 OjMYwbZcYctRNd5D8fiRLTwdJ/yDSEIElTBBpCWastIAJXmaP6++ZMQfH3DZebNi7zg=
X-Gm-Gg: AYBFou0li7o/vwnpsZxyBV6KBJspgA/OSh/HM8cb/iXlFm6pNOZVEqHusxV2gLbhPjh
 hsm7ktw4bPbo58SggMyoHWj0zeA9waj9VIp0N/lxf+fgdB3WdBKPaEU+KHGurFQcWH1kTuYD1ND
 Rwot+3U3R7Hh3Y3Jc6jneAQcRJbffrri8jzzLsNmcm9XH+JmfJpXSkojQVtXrMzqaHOPi2n0h/E
 vGe39dQnhppTBV8rKmjedNFgRGezkN6eu9bI4HArBbHwQXAdXhEWpYrT8pYO94rSEVnlNkphRXl
 lVDx2fHXqVzzKwaKuahkxZvmp5yMg3frJD0v9cAqkK0tUc7LixuOqD2m1Nc9txzRfSSpxQxvRB2
 cE5Q3vEXxjSo5sHKpuMn4UrdF7+cbXECH6ASuhE3vi0plHyyblrP16bbEVHah7r+DjphpvnEWuu
 isnuJB2O0Cw3IsVk3dTT5hPOqPOWcTsKRc3L7w8EKs73Li0s409OqLGEk+w3X0ip6P5UbT9h+5J
 hxc/qwx4ofR7LLzucqST0R2W+PuNh7yxlpmErN6HPaOxIUsYTRA15p85kjF7ODhdIu0eqMdErrk
 Ipop0CmHwNcMxY+0Sp7PEwjBbU4no0Xg40Wi
X-Received: by 2002:a05:6830:4429:b0:81c:9abc:974b with SMTP id
 46e09a7af769-860f01d5f35mr119441a34.17.1794332629456; 
 Tue, 10 Nov 2026 09:43:49 -0800 (PST)
Received: from 20HS2G4 ([2a09:bac6:bf21:15d7::22d:12a])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-860dcbfa983sm2478344a34.20.2026.11.10.09.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 09:43:48 -0800 (PST)
Date: Tue, 10 Nov 2026 11:43:46 -0600
From: Chris Arges <carges@cloudflare.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@cloudflare.com
Subject: Re: [PATCH net v2] wireguard: wait for per-peer crypto during removal
Message-ID: <avNXVJX2YVU06T3B@20HS2G4>
References: <20260913-fix-wg-peer-removal-v2-1-0cade985245a@cloudflare.com>
 <aqpqEIy_h0DIywRy@zx2c4.com> <aq2jp8lXwSIqihaj@20HS2G4>
 <avNHdEw2zHGyBe_U@zx2c4.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avNHdEw2zHGyBe_U@zx2c4.com>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-10 17:33:56, Jason A. Donenfeld wrote:
> On Fri, Sep 18, 2026 at 03:48:39PM -0500, Chris Arges wrote:
> > On 2026-09-16 12:06:08, Jason A. Donenfeld wrote:
> > > On Sun, Sep 13, 2026 at 07:19:08AM -0500, Chris J Arges wrote:
> > > > Calling peer_remove_after_dead() currently flushes device-wide packet
> > > > crypto and handshake workqueues while holding RTNL. This is problematic as
> > > > unrelated peers can continue adding work to those queues, blocking other
> > > > tasks that want to take the RTNL lock.
> > > > 
> > > > Instead, this patch tracks pending crypto handoffs for each peer using a
> > > > counter. After marking the peer dead, synchronize_net() prevents new
> > > > submissions. Next, wait for pending crypto workers to schedule TX work and
> > > > for RX NAPI to drain the peer's RX queue. Then flush only the peer's TX
> > > > packet and handshake work.
> > > > 
> > > > This scopes teardown synchronization to the removed peer and prevents
> > > > unrelated peers from extending the RTNL hold time.
> > > >  struct wg_device;
> > > > @@ -161,6 +162,7 @@ static inline int wg_queue_enqueue_per_device_and_peer(
> > > >  	 */
> > > >  	if (unlikely(!wg_prev_queue_enqueue(peer_queue, skb)))
> > > >  		return -ENOSPC;
> > > > +	atomic_inc(&PACKET_PEER(skb)->packet_crypt_pending);
> > > >  
> > > >  	/* Then we queue it up in the device queue, which consumes the
> > > >  	 * packet as soon as it can.
> > > > @@ -182,6 +184,8 @@ static inline void wg_queue_enqueue_per_peer_tx(struct sk_buff *skb, enum packet
> > > >  	atomic_set_release(&PACKET_CB(skb)->state, state);
> > > >  	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
> > > >  		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
> > > > +	if (atomic_dec_and_test(&peer->packet_crypt_pending))
> > > > +		wake_up_var(&peer->packet_crypt_pending);
> > > >  	wg_peer_put(peer);
> > > >  }
> > > >  
> > > > diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
> > > > index 824bbefce61c..bb35e3205491 100644
> > > > --- a/drivers/net/wireguard/receive.c
> > > > +++ b/drivers/net/wireguard/receive.c
> > > > @@ -476,9 +476,11 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
> > > >  
> > > >  next:
> > > >  		wg_noise_keypair_put(keypair, false);
> > > > -		wg_peer_put(peer);
> > > >  		if (unlikely(free))
> > > >  			dev_kfree_skb(skb);
> > > > +		if (atomic_dec_and_test(&peer->packet_crypt_pending))
> > > > +			wake_up_var(&peer->packet_crypt_pending);
> > > > +		wg_peer_put(peer);
> > > 
> > > This adds two atomic updates to a per-peer counter for every RX packet
> > > and TX batch. That could introduce contention across crypto workers. I
> > > suppose it'd be good to see some measurements in if this changes
> > > anything. Certainly it should change _something_. Question is by how
> > > much.
> > > 
> > > Jason
> > 
> > Jason,
> > 
> > I benchmarked a wg peer on a 2 vCPU and 8 vCPU setup with 1200 byte
> > UDP payloads. Goal was stressing the path where these atomics are getting
> > incremented.
> > - patched 2 vCPU test showed ~1-2% reduction in throughput
> > - patched 8 vCPU test showed ~6% reduction in throughput (more contention)
> > 
> > My main goal is reducing the amount of time holding rtnl_lock when we remove a
> > peer. In our systems we frequently get hangs due to workloads bringing up and
> > tearing down wg peers. So perhaps I'll need to look into another approach
> > where we're not introducing something like a counter into the hotpath.
> 
> Did you have any luck with other approaches? I'm still interested in
> this.
> 
> Thanks,
> Jason

Jason,

Yes, I have another approach I'm working on that doesn't require a per-packet
counter. I'll try to post something in the next week or so, this is still on my
list.

--chris
