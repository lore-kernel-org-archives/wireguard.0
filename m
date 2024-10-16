Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88679D10F31
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 03:38:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74fd79cf;
	Mon, 18 Nov 2024 01:38:43 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b16cd26d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2024 11:04:43 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2fb3c3d5513so41794641fa.1
 for <wireguard@lists.zx2c4.com>; Wed, 16 Oct 2024 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729076682; x=1729681482; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NDbDctKYaoGebw4v3E0DI+6dZhiijtiLFfSf+SUecWQ=;
 b=aDsfAW/+JtRfTRNaHzci6lxi62o0XQsB9etvtA+7YexLvpDVJhkO6b2yV2Yk6s9MtT
 zTxQ1uXoTg2KRaEbfe99hOHW00Vc6wbDlEqwvrGSnz46G5I4npuAeBuLjGk13OyQt6OF
 rTPV1C9uzuhabf8cswdfPxD8klB18F6638x2409/5X8nqN+KuTqOJzXSaRQSQndrqL3U
 04Af8nySMNB9tiixphElOPzjUOZJjRAHOXUsd1CotzsgU06aeJS+I/LG06zaVtTskfZM
 Wzfir6RcaHWtQ4qnd1GIrFsfQwKFbV5AcxEkmJ5Uw3OjVe9d7pW2J8faBXfq9kBuLLv8
 vZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729076682; x=1729681482;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDbDctKYaoGebw4v3E0DI+6dZhiijtiLFfSf+SUecWQ=;
 b=U1OjaTsc2CvDoj15g9mfjqbM0Xm+wZd94A5d6mqTOneLzVsPap/RuVFesV05Dn9xgd
 p8yhQnXHHUUHKDUFlizBVOgwu9N4C6B7p8lY4F95PLo5NRM5Ush2Mda7TP9fDXlSgO3w
 B8Sl6q0H8Xug9AllpFX7wB4rWl84ZIEd6UZ1VUJfBdJM/SUrPAV2+Cgeobf1hehfTFL5
 O/lWYJDSNiBTFLfniwqbTf7qW9cEA/Cl13xD0DqW+6zdBy/6uoAgV8giS4FOkqzpEaaf
 Sl37cokPeocHS4p3ql2AVgR873kx4k8ffTWuNrDlVpYhDxZiww7KB6GnwKTXdvSV9Ptm
 L7Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVnowaJbQAP4PdXhJqHg6JmsH3CFtbnBOgFuq/s9hdGYwoFGcfeFUuYicZVyT1WCe0/m3ZPGmPtnI=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwiwU5MA/dJiKyAFQg33Vm3ITMnEKQb3MjPzhBUnE0rwumaIXEA
 UYi7E0hMXb6faGKK3mYSkIoRHFL043qW9xVw3+8W4O4AXjORpNfh
X-Google-Smtp-Source: AGHT+IGfqoIo176A3Xc2Q2xeErsC3HAJJY4ekVVwX4mFx6IEqtAbOxCsr3LqgtbGCH29R44xS0WATQ==
X-Received: by 2002:a2e:a541:0:b0:2fb:5b23:edba with SMTP id
 38308e7fff4ca-2fb5b23f28cmr33996231fa.23.1729076682233; 
 Wed, 16 Oct 2024 04:04:42 -0700 (PDT)
Received: from pc636 (host-95-203-1-67.mobileonline.telia.com. [95.203.1.67])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb5d1a8590sm3863191fa.122.2024.10.16.04.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 04:04:41 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 16 Oct 2024 13:04:39 +0200
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kernel-janitors@vger.kernel.org,
 vbabka@suse.cz, paulmck@kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/17] wireguard: allowedips: replace call_rcu by
 kfree_rcu for simple kmem_cache_free callback
Message-ID: <Zw-dx50JDeenxwCr@pc636>
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
 <20241013201704.49576-2-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013201704.49576-2-Julia.Lawall@inria.fr>
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

On Sun, Oct 13, 2024 at 10:16:48PM +0200, Julia Lawall wrote:
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.
> 
> The changes were made using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/net/wireguard/allowedips.c |    9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> index 4b8528206cc8..175b1ca4f66f 100644
> --- a/drivers/net/wireguard/allowedips.c
> +++ b/drivers/net/wireguard/allowedips.c
> @@ -48,11 +48,6 @@ static void push_rcu(struct allowedips_node **stack,
>  	}
>  }
>  
> -static void node_free_rcu(struct rcu_head *rcu)
> -{
> -	kmem_cache_free(node_cache, container_of(rcu, struct allowedips_node, rcu));
> -}
> -
>  static void root_free_rcu(struct rcu_head *rcu)
>  {
>  	struct allowedips_node *node, *stack[MAX_ALLOWEDIPS_DEPTH] = {
> @@ -330,13 +325,13 @@ void wg_allowedips_remove_by_peer(struct allowedips *table,
>  			child = rcu_dereference_protected(
>  					parent->bit[!(node->parent_bit_packed & 1)],
>  					lockdep_is_held(lock));
> -		call_rcu(&node->rcu, node_free_rcu);
> +		kfree_rcu(node, rcu);
>  		if (!free_parent)
>  			continue;
>  		if (child)
>  			child->parent_bit_packed = parent->parent_bit_packed;
>  		*(struct allowedips_node **)(parent->parent_bit_packed & ~3UL) = child;
> -		call_rcu(&parent->rcu, node_free_rcu);
> +		kfree_rcu(parent, rcu);
>  	}
>  }
>  
> 
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
