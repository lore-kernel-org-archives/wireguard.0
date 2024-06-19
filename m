Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B308CC27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Jun 2024 09:53:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb97dcac;
	Wed, 19 Jun 2024 09:52:06 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8c884cc8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Jun 2024 09:52:03 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so83161391fa.2
 for <wireguard@lists.zx2c4.com>; Wed, 19 Jun 2024 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718790723; x=1719395523; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TY+TzI4NVOZe+bVmXFpZLf0ZfiG9DoMpTrEztVoxeCc=;
 b=NOJQsiWJ7FQGV+QQCpTYXNxqabJhEfkIfhHITuUHZfgi5+9RABNqMVZhkMHchUnNFX
 0MiwCH6XHEOyBnspLuEqJDxCH48ZhRYAnWewclNBKaTKTJfHFoT4Yytwf9/IuA4DMzC5
 fyr8fZhvcx3o1rSVOBa7xthiVu8PuIIDlBEXapfaxSz8o0YYEg71W4maSNKM8Ueyv7/N
 nTJTcs78yWfW7Mi61faqFfIIMZCpBlHWzI08YvZY8nagfiq7ccHRcejoMcGfHMrcai6H
 rUEkJQzvZOXeHl5mP33vEmtBTgI5IhX0fU2rC+luIT0pw28SyRbDKeEIoKICBRi1PsV6
 EK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718790723; x=1719395523;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TY+TzI4NVOZe+bVmXFpZLf0ZfiG9DoMpTrEztVoxeCc=;
 b=poqAybaP6OxeVc4fUAS2NkUvKvdK4gHThQ6KomtUUz4grRlzVqNXCYt9vHA8QSBzs7
 Xut4yDW0H4do3EDg819lWb64fFywlbVy4I8bPxJRYglyOxH04gaAVhLqcEWmBsCHjPl4
 7xdbbbsL2xsX138XC/s3RPGz95X1q0wBKfAPvJLMcsJtIYBlkX6INp7mD6g+iRzNsPxB
 5a67Od3HpYRiofhyJEzjdJkyMgaNpFWxoqh5vzExegSscOmyS0vSp/Efmz/peXgAUKe4
 JE8/IdWEtwKGK+ZHDv3/vyJ6LSL6qMYnFaRxZPjD0CUY7MvZRNnxwxanHLT0zNNYB1iG
 xpZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ6rG4SkHB9DjvQbJ/tBnyGnfluTkW6I95E89rcK3L8h4QXpmf+3ytGZAaYGsAC1k3l50F2xbtYA1V/hw9BmxatujNZntc8KiY
X-Gm-Message-State: AOJu0YyKGt9fDIUdcAEq16nRdJY3ewXMRWU6wYQuryo2hI9RTGrCwn7k
 Sr9atY6/A0R0ONEjJEZfezVBF/hxLQ2xkGhXQcPerfzYzw6K4UaJ
X-Google-Smtp-Source: AGHT+IH2q3ZanpQKJz2uH0N6Dyx/XhlIdcK364i+Te6PyIoIECi/nqcQmDGItl1tQkSP50785isBNw==
X-Received: by 2002:a2e:9cc6:0:b0:2eb:e365:f191 with SMTP id
 38308e7fff4ca-2ec3ce93f99mr14054151fa.15.1718790722749; 
 Wed, 19 Jun 2024 02:52:02 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com.
 [90.233.216.238]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c06068sm19506721fa.35.2024.06.19.02.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:52:02 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 19 Jun 2024 11:51:58 +0200
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
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 kasan-dev <kasan-dev@googlegroups.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnKqPqlPD3Rl04DZ@pc636>
References: <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <Zmrkkel0Fo4_g75a@zx2c4.com>
 <e926e3c6-05ce-4ba6-9e2e-e5f3b37bcc23@suse.cz>
 <3b6fe525-626c-41fb-8625-3925ca820d8e@paulmck-laptop>
 <6711935d-20b5-41c1-8864-db3fc7d7823d@suse.cz>
 <ZnCDgdg1EH6V7w5d@pc636>
 <36c60acd-543e-48c5-8bd2-6ed509972d28@suse.cz>
 <ZnFT1Czb8oRb0SE7@pc636>
 <5c8b2883-962f-431f-b2d3-3632755de3b0@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c8b2883-962f-431f-b2d3-3632755de3b0@paulmck-laptop>
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

On Tue, Jun 18, 2024 at 09:48:49AM -0700, Paul E. McKenney wrote:
> On Tue, Jun 18, 2024 at 11:31:00AM +0200, Uladzislau Rezki wrote:
> > > On 6/17/24 8:42 PM, Uladzislau Rezki wrote:
> > > >> +
> > > >> +	s = container_of(work, struct kmem_cache, async_destroy_work);
> > > >> +
> > > >> +	// XXX use the real kmem_cache_free_barrier() or similar thing here
> > > > It implies that we need to introduce kfree_rcu_barrier(), a new API, which i
> > > > wanted to avoid initially.
> > > 
> > > I wanted to avoid new API or flags for kfree_rcu() users and this would
> > > be achieved. The barrier is used internally so I don't consider that an
> > > API to avoid. How difficult is the implementation is another question,
> > > depending on how the current batching works. Once (if) we have sheaves
> > > proven to work and move kfree_rcu() fully into SLUB, the barrier might
> > > also look different and hopefully easier. So maybe it's not worth to
> > > invest too much into that barrier and just go for the potentially
> > > longer, but easier to implement?
> > > 
> > Right. I agree here. If the cache is not empty, OK, we just defer the
> > work, even we can use a big 21 seconds delay, after that we just "warn"
> > if it is still not empty and leave it as it is, i.e. emit a warning and
> > we are done.
> > 
> > Destroying the cache is not something that must happen right away. 
> 
> OK, I have to ask...
> 
> Suppose that the cache is created and destroyed by a module and
> init/cleanup time, respectively.  Suppose that this module is rmmod'ed
> then very quickly insmod'ed.
> 
> Do we need to fail the insmod if the kmem_cache has not yet been fully
> cleaned up?  If not, do we have two versions of the same kmem_cache in
> /proc during the overlap time?
> 
No fail :) If same cache is created several times, its s->refcount gets
increased, so, it does not create two entries in the "slabinfo". But i
agree that your point is good! We need to be carefully with removing and
simultaneous creating.

From the first glance, there is a refcounter and a global "slab_mutex"
which is used to protect a critical section. Destroying is almost fully
protected(as noted above, by a global mutex) with one exception, it is:

static void kmem_cache_release(struct kmem_cache *s)
{
	if (slab_state >= FULL) {
		sysfs_slab_unlink(s);
		sysfs_slab_release(s);
	} else {
		slab_kmem_cache_release(s);
	}
}

this one can race, IMO.

--
Uladzislau Rezki
