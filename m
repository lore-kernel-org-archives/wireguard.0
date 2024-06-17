Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612EBC2BA15
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jun 2024 13:54:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bdb4064;
	Mon, 17 Jun 2024 13:51:03 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f4260395
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jun 2024 13:51:01 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52c9034860dso5472310e87.2
 for <wireguard@lists.zx2c4.com>; Mon, 17 Jun 2024 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718632261; x=1719237061; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7cjNgaPzx0K8Q2oE0VGfsHosS8QVWGPVVkZ0XS7HEDg=;
 b=Dz/GxoqAZLQBXT80b1oJEJU3iyg1FC70qCPvbm7GbsBBp69KyCFb7FP9Nmbib7MvTK
 ZRMTEBBoMtBtFo7W7HqgJgFkOJUcGW80PFR8/tNEVkLb1WRQDyF0QVFPxvVQQubZ/zwy
 ecrjwAXBwYvOHK6JRFOVP/6wZjkPuwDqJ8A99qyORMYgdSE4+CPzUTFvaFcZ5ca3pzzE
 8lJClPNe8U8IgmE3J94tcPdd3wGKMVpE7OUBU/WXNkKYr+9E/eltWI261Ctx/eFpxXtA
 Z0L6T5tyf+aPPFXevwjI6fRQA5QcFbXSdqZRarvW1bqOapTaz880LSI2MOECFfVPF1de
 HaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632261; x=1719237061;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7cjNgaPzx0K8Q2oE0VGfsHosS8QVWGPVVkZ0XS7HEDg=;
 b=pXQGxGjb79ftSNGQdUJ/B22HGzWyaK3zRQDAJjrykKjdRNQnAxc8fgZhPpBOL7+UlL
 2hAAz0GJJxI8SNhbtZksUtYLSQb6OyZUJYdabKP+dApPdc2uWzV8rc/cP93mKVmkMLaL
 BRiGKXR1Z3qGpY3SyjBOI2/Ofg08q4EXCSkyb60iWnm6lL6y0AeDei8j9hgAGTYSwE2U
 9QL6H1DgHjBe7TopKTShm0cQulB77L+LIPqP7SxXKTydAlrw3IxENOtbR7iqAPd3VYBr
 R0hP+aIqYl52Fkro6rb69M9BSXpWzJ7aJAPV+FFqpH2wT+b5FfHZ9yC8ACSi1UL+axps
 2Xqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEgWm0+3Ib5y+jgy5uJFLM6SfF4PxIA6yC5hZ29MQR3Ng6krL/i24nufUIP00ZnkakQL/58WL2LRAE4/5sz5Dh7neUEfCi3wb+
X-Gm-Message-State: AOJu0YyPLpskJVqXmhEl3cfbSaw6A5+Nux8ipquPEdJJLZhLA5HoR8hk
 jSb1mnrUivUMGYyOBGHV8q9mLSU0yjHZNjVqv471b0jVBnhDCoCl
X-Google-Smtp-Source: AGHT+IHJ0CsNfqdOT8NJ8/aEvcd12bZPn1WcmZOT2dLARsLKNTs8V+RbkzjWhHb4g1pZvloY+oCxkw==
X-Received: by 2002:a19:5e15:0:b0:51d:9f10:71b7 with SMTP id
 2adb3069b0e04-52ca6e6812fmr7404820e87.28.1718632260306; 
 Mon, 17 Jun 2024 06:51:00 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com.
 [90.233.216.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2887d56sm1239456e87.263.2024.06.17.06.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:59 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 17 Jun 2024 15:50:56 +0200
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
Message-ID: <ZnA_QFvuyABnD3ZA@pc636>
References: <ZmrfA1p2zSVIaYam@zx2c4.com>
 <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
 <Zmru7hhz8kPDPsyz@pc636>
 <7efde25f-6af5-4a67-abea-b26732a8aca1@paulmck-laptop>
 <Zmsuswo8OPIhY5KJ@pc636>
 <cb51bc57-47b8-456a-9ac0-f8aa0931b144@paulmck-laptop>
 <ZmszOd5idhf2Cb-v@pc636>
 <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
 <Zmw5FTX752g0vtlD@pc638.lan> <ZmybGZDbXkw7JTjc@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmybGZDbXkw7JTjc@zx2c4.com>
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

On Fri, Jun 14, 2024 at 09:33:45PM +0200, Jason A. Donenfeld wrote:
> On Fri, Jun 14, 2024 at 02:35:33PM +0200, Uladzislau Rezki wrote:
> > +	/* Should a destroy process be deferred? */
> > +	if (s->flags & SLAB_DEFER_DESTROY) {
> > +		list_move_tail(&s->list, &slab_caches_defer_destroy);
> > +		schedule_delayed_work(&slab_caches_defer_destroy_work, HZ);
> > +		goto out_unlock;
> > +	}
> 
> Wouldn't it be smoother to have the actual kmem_cache_free() function
> check to see if it's been marked for destruction and the refcount is
> zero, rather than polling every one second? I mentioned this approach
> in: https://lore.kernel.org/all/Zmo9-YGraiCj5-MI@zx2c4.com/ -
> 
>     I wonder if the right fix to this would be adding a `should_destroy`
>     boolean to kmem_cache, which kmem_cache_destroy() sets to true. And
>     then right after it checks `if (number_of_allocations == 0)
>     actually_destroy()`, and likewise on each kmem_cache_free(), it
>     could check `if (should_destroy && number_of_allocations == 0)
>     actually_destroy()`. 
> 
I do not find pooling as bad way we can go with. But your proposal
sounds reasonable to me also. We can combine both "prototypes" to
one and offer.

Can you post a prototype here?

Thanks!

--
Uladzislau Rezki
