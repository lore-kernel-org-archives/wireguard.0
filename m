Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5206C27C6E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2024 17:39:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04c7e9f6;
	Thu, 13 Jun 2024 17:39:07 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b746cc46
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2024 17:39:04 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52bc035a7ccso1560848e87.2
 for <wireguard@lists.zx2c4.com>; Thu, 13 Jun 2024 10:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718300344; x=1718905144; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=956BT+Uq9SD+emo8+jCK8z5I39sZ4FeCbRyFqSAHxWc=;
 b=cscyh7x8H/hPJUzXl5uNrxfRdtCNDeOeJClvuezsdriYTs+8i5JfKVrFLWFgZtXMpS
 h4pm7ETTuhtO/aF0qDUrLj1BjL0NZSNeR+/wJZrpDYKcjWKsiOHCZeqjIwcT5pl3QJQW
 qmtRZ/R0CWcnkev6fWjiQIONmgLmYsXqq6nSCTvzd4KObmTRzj0b1NjLJk8lUmQZ4UG2
 iE4W5VVtyb1nIyz5Xjex1vT5PRAGzM+9283W3TatUPGjo4fGCaWcXqypoYtG1a5+cXwt
 J1IRIMEYNPY4AZ0bU6RAQZOrc8c0b2E0kU69rTCuh81img2pqTPCZCs+nYVj2oM7isWP
 /NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718300344; x=1718905144;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=956BT+Uq9SD+emo8+jCK8z5I39sZ4FeCbRyFqSAHxWc=;
 b=TBAVADXepy980iqxxGoJ1Ygh3Dkjxt9FMaT5bTSxFA5CRxH11jc7qd33smZzR4NGsX
 v6j13SIbNcWzpD4N77OSzC2+y22pF/2MDyB6AQNIQxSJE/BuYm3/2HJ/WT6AdCjdD6MO
 s+afTY97OAHQ0HZp6eea9nggv8sh1w+yEK7O9E3YzJomuKAdt3d0MKlBtbgWqzTY/Xg8
 HqWCbcmfFlwIsSU4kIyXe6JSP3wa8jXkCSaQNshcEz6mpHPFQKTEG1rM/xLOzzXSzS7b
 Wx9XSP+e7xdp8qGhCmSqYvYGwJ1+eJ2PeS32QzFXZF474nl9lRdQSe8ll55HSMXVEF4U
 pkUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX24dWbbuOqL5H07L8Y86WFHTJWW26JSp4ibQqB63IumydubnP/yQ7shkC1e7Vv+2a4PMIgEoEJHsI/zVWTi3C9/z092MHEQj33
X-Gm-Message-State: AOJu0Yxj1myjqMcfFyZjHPn2pCJh3qbEmojl1sLKF2KFw7HCsSRLiK2W
 7nK5xLEc3Z4Frb31XvIUlOK6bpv8p9BlB2ZINyNCawv6rFRRrzKo
X-Google-Smtp-Source: AGHT+IEqfg03O6T4CVRhNhuT1kToVJHsIj8GcfpqCCRbVlEQmwf5k9Sqz/b5zlxpaNyn2BuI8Okyaw==
X-Received: by 2002:a05:6512:517:b0:52b:796e:66a5 with SMTP id
 2adb3069b0e04-52ca6e9954cmr243776e87.66.1718300343767; 
 Thu, 13 Jun 2024 10:39:03 -0700 (PDT)
Received: from pc636 (host-90-233-218-141.mobileonline.telia.com.
 [90.233.218.141]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca288cd87sm299099e87.304.2024.06.13.10.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 10:39:03 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 13 Jun 2024 19:38:59 +0200
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
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
Message-ID: <Zmsuswo8OPIhY5KJ@pc636>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <ZmrfA1p2zSVIaYam@zx2c4.com>
 <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
 <Zmru7hhz8kPDPsyz@pc636>
 <7efde25f-6af5-4a67-abea-b26732a8aca1@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7efde25f-6af5-4a67-abea-b26732a8aca1@paulmck-laptop>
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

On Thu, Jun 13, 2024 at 08:06:30AM -0700, Paul E. McKenney wrote:
> On Thu, Jun 13, 2024 at 03:06:54PM +0200, Uladzislau Rezki wrote:
> > On Thu, Jun 13, 2024 at 05:47:08AM -0700, Paul E. McKenney wrote:
> > > On Thu, Jun 13, 2024 at 01:58:59PM +0200, Jason A. Donenfeld wrote:
> > > > On Wed, Jun 12, 2024 at 03:37:55PM -0700, Paul E. McKenney wrote:
> > > > > On Wed, Jun 12, 2024 at 02:33:05PM -0700, Jakub Kicinski wrote:
> > > > > > On Sun,  9 Jun 2024 10:27:12 +0200 Julia Lawall wrote:
> > > > > > > Since SLOB was removed, it is not necessary to use call_rcu
> > > > > > > when the callback only performs kmem_cache_free. Use
> > > > > > > kfree_rcu() directly.
> > > > > > > 
> > > > > > > The changes were done using the following Coccinelle semantic patch.
> > > > > > > This semantic patch is designed to ignore cases where the callback
> > > > > > > function is used in another way.
> > > > > > 
> > > > > > How does the discussion on:
> > > > > >   [PATCH] Revert "batman-adv: prefer kfree_rcu() over call_rcu() with free-only callbacks"
> > > > > >   https://lore.kernel.org/all/20240612133357.2596-1-linus.luessing@c0d3.blue/
> > > > > > reflect on this series? IIUC we should hold off..
> > > > > 
> > > > > We do need to hold off for the ones in kernel modules (such as 07/14)
> > > > > where the kmem_cache is destroyed during module unload.
> > > > > 
> > > > > OK, I might as well go through them...
> > > > > 
> > > > > [PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> > > > > 	Needs to wait, see wg_allowedips_slab_uninit().
> > > > 
> > > > Also, notably, this patch needs additionally:
> > > > 
> > > > diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> > > > index e4e1638fce1b..c95f6937c3f1 100644
> > > > --- a/drivers/net/wireguard/allowedips.c
> > > > +++ b/drivers/net/wireguard/allowedips.c
> > > > @@ -377,7 +377,6 @@ int __init wg_allowedips_slab_init(void)
> > > > 
> > > >  void wg_allowedips_slab_uninit(void)
> > > >  {
> > > > -	rcu_barrier();
> > > >  	kmem_cache_destroy(node_cache);
> > > >  }
> > > > 
> > > > Once kmem_cache_destroy has been fixed to be deferrable.
> > > > 
> > > > I assume the other patches are similar -- an rcu_barrier() can be
> > > > removed. So some manual meddling of these might be in order.
> > > 
> > > Assuming that the deferrable kmem_cache_destroy() is the option chosen,
> > > agreed.
> > >
> > <snip>
> > void kmem_cache_destroy(struct kmem_cache *s)
> > {
> > 	int err = -EBUSY;
> > 	bool rcu_set;
> > 
> > 	if (unlikely(!s) || !kasan_check_byte(s))
> > 		return;
> > 
> > 	cpus_read_lock();
> > 	mutex_lock(&slab_mutex);
> > 
> > 	rcu_set = s->flags & SLAB_TYPESAFE_BY_RCU;
> > 
> > 	s->refcount--;
> > 	if (s->refcount)
> > 		goto out_unlock;
> > 
> > 	err = shutdown_cache(s);
> > 	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
> > 	     __func__, s->name, (void *)_RET_IP_);
> > ...
> > 	cpus_read_unlock();
> > 	if (!err && !rcu_set)
> > 		kmem_cache_release(s);
> > }
> > <snip>
> > 
> > so we have SLAB_TYPESAFE_BY_RCU flag that defers freeing slab-pages
> > and a cache by a grace period. Similar flag can be added, like
> > SLAB_DESTROY_ONCE_FULLY_FREED, in this case a worker rearm itself
> > if there are still objects which should be freed.
> > 
> > Any thoughts here?
> 
> Wouldn't we also need some additional code to later check for all objects
> being freed to the slab, whether or not that code is  initiated from
> kmem_cache_destroy()?
>
Same away as SLAB_TYPESAFE_BY_RCU is handled from the kmem_cache_destroy() function.
It checks that flag and if it is true and extra worker is scheduled to perform a
deferred(instead of right away) destroy after rcu_barrier() finishes.

--
Uladzislau Rezki
