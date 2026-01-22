Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF15D6CFAA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Jan 2026 23:30:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 994b651c;
	Thu, 22 Jan 2026 23:30:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2972e662
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Jan 2026 23:30:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D7343431CD;
 Thu, 22 Jan 2026 23:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79416C116C6;
 Thu, 22 Jan 2026 23:30:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GcOPTcHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1769124615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TjDgZhcWG4pBk+7Hv/iXiqAAKJEqRhMyQlU63yMOd3k=;
 b=GcOPTcHV6HlkSwIZl57vz0/K9oCDAdd+dCXRK0o/cAc3+ob01Z89V4cqEm8yVUMyttIMC3
 /X8RnhMuOYK4LtK9yksBnYHZpmoUq9hr+9nkkn+2kyfik1J51kpqbCdAuBqChYUziTRO1l
 9+yURla09qJuw7DmhG1dcJfLSe//kaI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cb8bc564
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 22 Jan 2026 23:30:14 +0000 (UTC)
Date: Fri, 23 Jan 2026 00:30:11 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Fushuai Wang <fushuai.wang@linux.dev>, kuba@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 pabeni@redhat.com, vadim.fedorenko@linux.dev, wangfushuai@baidu.com,
 wireguard@lists.zx2c4.com
Subject: Re: [PATCH net-next v3] wireguard: allowedips: Use kfree_rcu()
 instead of call_rcu()
Message-ID: <aXKzA7C39tJLJWzh@zx2c4.com>
References: <20260115033237.1545400-1-kuba@kernel.org>
 <20260115051221.68054-1-fushuai.wang@linux.dev>
 <CANn89iKfuXjqKsn+xB6bpGOaqM7pN4ZcRJ=2KJg4WY76ArYXhQ@mail.gmail.com>
 <CAHmME9quqMVzD5zSEKvOFOYj3QLANAo2iYeqWQ1toV0C7gJXTg@mail.gmail.com>
 <CANn89iKmNSPjsTBwN3166cKyipJbH64ZPE0O6i2AMh7vyKXS=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89iKmNSPjsTBwN3166cKyipJbH64ZPE0O6i2AMh7vyKXS=w@mail.gmail.com>
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

On Thu, Jan 15, 2026 at 03:40:17PM +0100, Eric Dumazet wrote:
> On Thu, Jan 15, 2026 at 3:33 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Hi Eric,
> >
> > On Thu, Jan 15, 2026 at 10:15 AM Eric Dumazet <edumazet@google.com> wrote:
> > > > > The existing cleanup path is:
> > > > >   wg_allowedips_slab_uninit() -> rcu_barrier() -> kmem_cache_destroy()
> > > > >
> > > > > With kfree_rcu(), this sequence could destroy the slab cache while
> > > > > kfree_rcu_work() still has pending frees queued. The proper barrier for
> > > > > kfree_rcu() is kvfree_rcu_barrier() which also calls flush_rcu_work()
> > > > > on all pending batches.
> > > >
> > > > We do not need to add an explict kvfree_rcu_barrier(), becasue the commit
> > > > 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()")
> > > > already does it.
> > >
> > > It was doing it, but got replaced recently with a plain rcu_barrier()
> > >
> > > commit 0f35040de59371ad542b915d7b91176c9910dadc
> > > Author: Harry Yoo <harry.yoo@oracle.com>
> > > Date:   Mon Dec 8 00:41:47 2025 +0900
> > >
> > >     mm/slab: introduce kvfree_rcu_barrier_on_cache() for cache destruction
> > >
> > > We would like explicit +2 from mm _and_ rcu experts on this wireguard patch.
> >
> > I'll take this through the wireguard tree.
> >
> > But just a question on your comment, "It was doing it, but got
> > replaced recently with a plain rcu_barrier()". Are you suggesting I
> > need a kvfree_rcu_barrier() instead? The latest net-next has a
> > kvfree_rcu_barrier_on_cache() called from kmem_cache_destroy()
> > still... But are you suggesting I add this anyway?
> >
> > diff --git a/drivers/net/wireguard/allowedips.c
> > b/drivers/net/wireguard/allowedips.c
> > index 5ece9acad64d..aee39a0303b0 100644
> > --- a/drivers/net/wireguard/allowedips.c
> > +++ b/drivers/net/wireguard/allowedips.c
> > @@ -417,7 +417,7 @@ int __init wg_allowedips_slab_init(void)
> >
> >  void wg_allowedips_slab_uninit(void)
> >  {
> > - rcu_barrier();
> > + kvfree_rcu_barrier();
> 
> It seems kmem_cache_destroy() should take care of needed barriers,
> at least this is what is claimed. An rcu_barrier() or kvfree_rcu_barrier()
> should not be needed in wg_allowedips_slab_uninit() ?
> 
> Probably boring/distracting, I do not expect anyone needing to unload
> this module in a loop and expect this to be ultra fast ?

Okay so I'll take this patch, and perhaps amend to it the _removal_ of
that rcu_barrier()?

Jason
