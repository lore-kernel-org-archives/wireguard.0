Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11C3C27C79
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jun 2024 16:31:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c27b5ef9;
	Mon, 17 Jun 2024 16:31:00 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62a25043
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jun 2024 16:30:58 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ec1ac1aed2so32111221fa.3
 for <wireguard@lists.zx2c4.com>; Mon, 17 Jun 2024 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718641858; x=1719246658; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P18NXjBrMly2kaNOMkzQiyWW0KiEt9TV5gbmtLRhdnE=;
 b=Dzj4P5bmxjsTiJiWP9H6rUqNovZa9JaGALc+l4quv2ykpX6G1TZzd8sOmD7O3fAGwm
 swkb4XJVRwq9IHmB05+RGsrXUpLjF0RPfGdmkJ4PYVb5HXEDN9WhP1BdkvQ/UwI55eKN
 nvfQwi+FLv9EcZpWoosZM2/T6qrDOquHW1lX/6a6CZTNH2jUmxyHTTkVXhkgLCHdOth+
 qLn2nKSXI7Dn+hNHP7q1ODV7erDFK6DCePBRCdz9leY0OsocJFwR1di5gK2b2t4aB6DR
 DWHSxeDOvwn+7LhqvUDcEUpAGatwGVt3hV5rFdPJSp4MZEGrXDY4tz+lZq8n9KL68mXg
 K0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718641858; x=1719246658;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P18NXjBrMly2kaNOMkzQiyWW0KiEt9TV5gbmtLRhdnE=;
 b=KdR2+Y1HNmMnQlvyc5dqYgqmWxZZxellutq5b+dVfKfZGa/cFWDNdeLmDgPvthCXsk
 xit1SfBvKhfyLeWt3MfBYx55MverdEJFq84vZ+X5fA4yHGontWQHvyyFZJbzccWOieDF
 hokjTIyi7Ep83GFfhp5RWI9f1PSAZdgQ/Cil0ZU4MFkBo+VSy65l6p8p+VLdX60zdokJ
 duo02Kc94WMkTWZjte53CEPOPVXu3OVe6ox+4GbakO7R12wsnzIwTvuMTVPUNIsXyVPa
 69+XZ2gVgrGXROwKxy+eVewPzA6D/JctwjR2M0Ixu1yfr6KBeWxVXaG1zeDzQJaa4/7w
 pv0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGp1m43FBibCxoUNNLxhwfBui2j90VGIs/aJbFC4MGuUCO512M2P2g+FNGHLBkd+GtFf3H8uPUbc6NTYnrltnSPA8md6f3QUZh
X-Gm-Message-State: AOJu0Yxe5EXhps0wodzDMDTeLMZ1j31ganwOweFA0hrvYUY1tDwfHV2p
 jPf/7RRST+2q6P9J9uzrmsisCE0USvlQOdmuIxEnw/RMUyQuAnT4
X-Google-Smtp-Source: AGHT+IEPhqe0DMj4rMlaXsMOCbhrl4lbGG1gPjCGb7ivFIirSumn2PP7mfmxsW/9BAzDd49k/bprGA==
X-Received: by 2002:a2e:9cd6:0:b0:2eb:fdd3:8fa2 with SMTP id
 38308e7fff4ca-2ec0e5c5816mr68620871fa.13.1718641857513; 
 Mon, 17 Jun 2024 09:30:57 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com.
 [90.233.216.238]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c78400sm14106751fa.84.2024.06.17.09.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 09:30:57 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 17 Jun 2024 18:30:53 +0200
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jakub Kicinski <kuba@kernel.org>,
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
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnBkvYdbAWILs7qx@pc636>
References: <Zmru7hhz8kPDPsyz@pc636>
 <7efde25f-6af5-4a67-abea-b26732a8aca1@paulmck-laptop>
 <Zmsuswo8OPIhY5KJ@pc636>
 <cb51bc57-47b8-456a-9ac0-f8aa0931b144@paulmck-laptop>
 <ZmszOd5idhf2Cb-v@pc636>
 <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
 <Zmw5FTX752g0vtlD@pc638.lan> <ZmybGZDbXkw7JTjc@zx2c4.com>
 <ZnA_QFvuyABnD3ZA@pc636> <ZnBOkZClsvAUa_5X@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnBOkZClsvAUa_5X@zx2c4.com>
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

On Mon, Jun 17, 2024 at 04:56:17PM +0200, Jason A. Donenfeld wrote:
> On Mon, Jun 17, 2024 at 03:50:56PM +0200, Uladzislau Rezki wrote:
> > On Fri, Jun 14, 2024 at 09:33:45PM +0200, Jason A. Donenfeld wrote:
> > > On Fri, Jun 14, 2024 at 02:35:33PM +0200, Uladzislau Rezki wrote:
> > > > +	/* Should a destroy process be deferred? */
> > > > +	if (s->flags & SLAB_DEFER_DESTROY) {
> > > > +		list_move_tail(&s->list, &slab_caches_defer_destroy);
> > > > +		schedule_delayed_work(&slab_caches_defer_destroy_work, HZ);
> > > > +		goto out_unlock;
> > > > +	}
> > > 
> > > Wouldn't it be smoother to have the actual kmem_cache_free() function
> > > check to see if it's been marked for destruction and the refcount is
> > > zero, rather than polling every one second? I mentioned this approach
> > > in: https://lore.kernel.org/all/Zmo9-YGraiCj5-MI@zx2c4.com/ -
> > > 
> > >     I wonder if the right fix to this would be adding a `should_destroy`
> > >     boolean to kmem_cache, which kmem_cache_destroy() sets to true. And
> > >     then right after it checks `if (number_of_allocations == 0)
> > >     actually_destroy()`, and likewise on each kmem_cache_free(), it
> > >     could check `if (should_destroy && number_of_allocations == 0)
> > >     actually_destroy()`. 
> > > 
> > I do not find pooling as bad way we can go with. But your proposal
> > sounds reasonable to me also. We can combine both "prototypes" to
> > one and offer.
> > 
> > Can you post a prototype here?
> 
> This is untested, but the simplest, shortest possible version would be:
> 
> diff --git a/mm/slab.h b/mm/slab.h
> index 5f8f47c5bee0..907c0ea56c01 100644
> --- a/mm/slab.h
> +++ b/mm/slab.h
> @@ -275,6 +275,7 @@ struct kmem_cache {
>  	unsigned int inuse;		/* Offset to metadata */
>  	unsigned int align;		/* Alignment */
>  	unsigned int red_left_pad;	/* Left redzone padding size */
> +	bool is_destroyed;		/* Destruction happens when no objects */
>  	const char *name;		/* Name (only for display!) */
>  	struct list_head list;		/* List of slab caches */
>  #ifdef CONFIG_SYSFS
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 1560a1546bb1..f700bed066d9 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -494,8 +494,8 @@ void kmem_cache_destroy(struct kmem_cache *s)
>  		goto out_unlock;
> 
>  	err = shutdown_cache(s);
> -	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
> -	     __func__, s->name, (void *)_RET_IP_);
> +	if (err)
> +		s->is_destroyed = true;
>
Here if an "err" is less then "0" means there are still objects
whereas "is_destroyed" is set to "true" which is not correlated
with a comment:

"Destruction happens when no objects"

>  out_unlock:
>  	mutex_unlock(&slab_mutex);
>  	cpus_read_unlock();
> diff --git a/mm/slub.c b/mm/slub.c
> index 1373ac365a46..7db8fe90a323 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -4510,6 +4510,8 @@ void kmem_cache_free(struct kmem_cache *s, void *x)
>  		return;
>  	trace_kmem_cache_free(_RET_IP_, x, s);
>  	slab_free(s, virt_to_slab(x), x, _RET_IP_);
> +	if (s->is_destroyed)
> +		kmem_cache_destroy(s);
>  }
>  EXPORT_SYMBOL(kmem_cache_free);
> 
> @@ -5342,9 +5344,6 @@ static void free_partial(struct kmem_cache *s, struct kmem_cache_node *n)
>  		if (!slab->inuse) {
>  			remove_partial(n, slab);
>  			list_add(&slab->slab_list, &discard);
> -		} else {
> -			list_slab_objects(s, slab,
> -			  "Objects remaining in %s on __kmem_cache_shutdown()");
>  		}
>  	}
>  	spin_unlock_irq(&n->list_lock);
> 
Anyway it looks like it was not welcome to do it in the kmem_cache_free()
function due to performance reason.

--
Uladzislau Rezki
