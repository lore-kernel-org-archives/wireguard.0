Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24362C27C4F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2024 13:07:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f43b1c81;
	Thu, 13 Jun 2024 13:07:01 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb9b26bb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2024 13:06:59 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ebd95f136bso10801601fa.0
 for <wireguard@lists.zx2c4.com>; Thu, 13 Jun 2024 06:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718284018; x=1718888818; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H4qMOlVAmB1+8562nApjJnNhlZQHZLqU1OXBwVXRF78=;
 b=SatZeN8hSVIlm8Yyr8jNFf5d4ZNQRXAyDacJYs9CTM6TvUtc2C+vl7lGMILLIT18Mm
 DMr0D3ZQbv1eucPPflDBlDin0Jxi0PfahFFJCImQ7e+uxrC0j8irH1QWhBFdi8cx43hB
 IRv8yK1enkJ3hG4OQ4yQXdje2iT9vkgxQWBk3D7FZiIShTNQOfn7GaecXVxbXUyKkp08
 OMY+LyU62OJX1h3ypL9paryShDVvYbqeyxqqQ/7XOXiYU6nSQKY8oswSc8eUvbJJjLeK
 +9V4MBp+2u0g4XGDQI9gHUxpEk6pCQ/FVH0a1QXbdxaNRtLsQYEBAT0vQthbNZn0f8vp
 SX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718284018; x=1718888818;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H4qMOlVAmB1+8562nApjJnNhlZQHZLqU1OXBwVXRF78=;
 b=M9ndr1i12gc+3ei2u4VTe8RRYdzBwDV1/7RrRtGweyyIRgyWEdFC15dT+5/gM0V05/
 cfwJEjRBbqydq8xe3J06Q8uPex2hgmT0cyEmmCQ52Q3KWgasJcyCvBR8O0W2YyP/qMdX
 Za6AB1cIi0P1FDZo6lXuy5pKWno6b1WETiB7olzRY/Hc/RH8/xNupytQflvZSHxbLRm+
 mrrja7WB0s6g1Rz9ECX4qK63Y34Xspj39fYbgykxeByI8RUmXlqvFtlF2x9PRhGPZhJ6
 NYzQTroWIigjH8naM3YP/6ore/5Bv1TQA5PM3g/Qsl5jikYklOZhm2klSJ2eCKnXXF+4
 OW2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqbkKML21V/Nh3R5VnyYsqB5nyCNeIB9Q4Ks0TvVnWw2AsJcr97jLuuaie2daA57xhm+Vs2UuxrmTdTwg+WAcTDg2CAtQWrSzQ
X-Gm-Message-State: AOJu0YzajwHgDYUIonVaFmVk4TkKkkP83nojpH52WmCV7836mXTXczwD
 ZSFXD3NJ/EXj0n+ldL04i7mmHpDOx0atUYD6UCZFyd7UchZmzLO0
X-Google-Smtp-Source: AGHT+IFNjIqLDbiiJvyVQ+CTYUUPuuKLx47d3/3uk6kw1RXtVGPymnVcCEA7pTqKhgYonTHLU10trQ==
X-Received: by 2002:a2e:878f:0:b0:2eb:ecba:444a with SMTP id
 38308e7fff4ca-2ebfc9fac80mr27236611fa.23.1718284018170; 
 Thu, 13 Jun 2024 06:06:58 -0700 (PDT)
Received: from pc636 (host-90-233-218-141.mobileonline.telia.com.
 [90.233.218.141]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c05f56sm2099851fa.42.2024.06.13.06.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 06:06:57 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 13 Jun 2024 15:06:54 +0200
To: "Paul E. McKenney" <paulmck@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-block@vger.kernel.org,
 kernel-janitors@vger.kernel.org, bridge@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org,
 ecryptfs@vger.kernel.org, Neil Brown <neilb@suse.de>,
 Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
 linux-can@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <Zmru7hhz8kPDPsyz@pc636>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <ZmrfA1p2zSVIaYam@zx2c4.com>
 <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
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

On Thu, Jun 13, 2024 at 05:47:08AM -0700, Paul E. McKenney wrote:
> On Thu, Jun 13, 2024 at 01:58:59PM +0200, Jason A. Donenfeld wrote:
> > On Wed, Jun 12, 2024 at 03:37:55PM -0700, Paul E. McKenney wrote:
> > > On Wed, Jun 12, 2024 at 02:33:05PM -0700, Jakub Kicinski wrote:
> > > > On Sun,  9 Jun 2024 10:27:12 +0200 Julia Lawall wrote:
> > > > > Since SLOB was removed, it is not necessary to use call_rcu
> > > > > when the callback only performs kmem_cache_free. Use
> > > > > kfree_rcu() directly.
> > > > > 
> > > > > The changes were done using the following Coccinelle semantic patch.
> > > > > This semantic patch is designed to ignore cases where the callback
> > > > > function is used in another way.
> > > > 
> > > > How does the discussion on:
> > > >   [PATCH] Revert "batman-adv: prefer kfree_rcu() over call_rcu() with free-only callbacks"
> > > >   https://lore.kernel.org/all/20240612133357.2596-1-linus.luessing@c0d3.blue/
> > > > reflect on this series? IIUC we should hold off..
> > > 
> > > We do need to hold off for the ones in kernel modules (such as 07/14)
> > > where the kmem_cache is destroyed during module unload.
> > > 
> > > OK, I might as well go through them...
> > > 
> > > [PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> > > 	Needs to wait, see wg_allowedips_slab_uninit().
> > 
> > Also, notably, this patch needs additionally:
> > 
> > diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> > index e4e1638fce1b..c95f6937c3f1 100644
> > --- a/drivers/net/wireguard/allowedips.c
> > +++ b/drivers/net/wireguard/allowedips.c
> > @@ -377,7 +377,6 @@ int __init wg_allowedips_slab_init(void)
> > 
> >  void wg_allowedips_slab_uninit(void)
> >  {
> > -	rcu_barrier();
> >  	kmem_cache_destroy(node_cache);
> >  }
> > 
> > Once kmem_cache_destroy has been fixed to be deferrable.
> > 
> > I assume the other patches are similar -- an rcu_barrier() can be
> > removed. So some manual meddling of these might be in order.
> 
> Assuming that the deferrable kmem_cache_destroy() is the option chosen,
> agreed.
>
<snip>
void kmem_cache_destroy(struct kmem_cache *s)
{
	int err = -EBUSY;
	bool rcu_set;

	if (unlikely(!s) || !kasan_check_byte(s))
		return;

	cpus_read_lock();
	mutex_lock(&slab_mutex);

	rcu_set = s->flags & SLAB_TYPESAFE_BY_RCU;

	s->refcount--;
	if (s->refcount)
		goto out_unlock;

	err = shutdown_cache(s);
	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
	     __func__, s->name, (void *)_RET_IP_);
...
	cpus_read_unlock();
	if (!err && !rcu_set)
		kmem_cache_release(s);
}
<snip>

so we have SLAB_TYPESAFE_BY_RCU flag that defers freeing slab-pages
and a cache by a grace period. Similar flag can be added, like
SLAB_DESTROY_ONCE_FULLY_FREED, in this case a worker rearm itself
if there are still objects which should be freed.

Any thoughts here?

--
Uladzislau Rezki
