Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127D3D44C59
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Jan 2026 14:44:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84e28762;
	Thu, 15 Jan 2026 14:40:32 +0000 (UTC)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [2607:f8b0:4864:20::82e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 90f2d2c5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Jan 2026 14:40:30 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-5018ec2ae21so9351561cf.0
 for <wireguard@lists.zx2c4.com>; Thu, 15 Jan 2026 06:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768488029; x=1769092829; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W67l+qWJf4i/uzrZs13/VAgBMKdkcy4ybsbPGITcYBU=;
 b=rWreTfvjL4puWMR0fS8KN+M+GqSDmOgu+GDJKwJ2y0aOPyN1BltKgEpWJfIZRJXUKL
 1mHu+KrXwisVSZur0i11nvJs6DzBq3B5mH8QVshP/HCIW3hDipQiGsLAGkubeD8JXBmg
 QewqNsg39au7DL0AUSQGvu7BJnHxbXuAEw/kKO98VuC+nVJajTGkqETa+ubF7lq0NG5u
 Kqp8watx9Zguf3rjaYC7opD+k8lYnJYfbZS8FCSiufyx6qB5CK6P9vMSU8jWUWIDSXam
 cwltJT/bxykWacfxyHgPKuvwNueLiOywzF5D19RNqZ07PhfJO4V/Sp0SmSBoncave94k
 8IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768488029; x=1769092829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W67l+qWJf4i/uzrZs13/VAgBMKdkcy4ybsbPGITcYBU=;
 b=fTGrs8TDGCzhvgEW+8MtztVzb/1lfCU+ErEENb7FvaAzwhsU4H9FQHSBl7DW/MH8n1
 NlwqZPrMjBV7mPPij/czWNGRXGAyIpTmlwhc6p5aDdgc7b7II3M7f9Xo/0qD6Sws2oJk
 Ay5bPowadoUfmfMLdK52jXBz51SfVrEDx+kRWi0Q5XHFZwUrUXiH5p6tEfX3IV+wjytF
 ySDvqqAqtYQVVZVSCievaPqPPZ3ZvqHGwhkxwJWt/NUN4E12ChRHuPMJlTyEZH6rYEMe
 RA3EZcOZuYxmAbDeVc0gPV1Bga8yWrC22qzbyYGjBHKgr/+WIrV974vYCviNS92p9RXI
 Ljdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsEWHQ1TByf541ppQUNyOttFeEZyaayPEzSwmiDmx9DGusZytQizR4Jd4gIwlR6eW2bzkZaYOenpE=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwE1H6aTLK+nPZkou9RH4EsfkEjn6mcQh1UgjhFnrYnku7uqqVq
 mFq+12gSwivaUZNbA7d2n57ZJcUvBbB/+t4X2Hz55j413FWfmfEMK6GRuDjuqlgh/TO+HGQ6okw
 1bOHhjKLEmQLqzn5TwBuyWnuamL/vZUn55CfM4G8V
X-Gm-Gg: AY/fxX6DIEvevdqtyCAdRJLw41BTl+iGWNf9cg13EoXdg0NdWFPPYi7srmEx1T2fbIi
 WK2lRMN3oHYGPOELH4uIYBaQnfOg0UMNaORv1HSlfB05iQYsb84i+9Ijl6bLVJG/PfCXnJ04m8a
 jj2u4h0r4Vtczouwn/jR0rFibMhj8ORZ4OuxVOoEI1fCzX7ws70uLnP51fsZsn7tRhwnGqEcysj
 1fVQKJb10oHjIzYpi3rQrnvVag9E3lA8hgPEk9/3oJcP4WnXbIrWMBq3NGixpSYNytQfcnRqNMr
 X3dysQ==
X-Received: by 2002:ac8:74c9:0:b0:501:50c4:a9fb with SMTP id
 d75a77b69052e-50150c4ac4bmr47283611cf.80.1768488028278; Thu, 15 Jan 2026
 06:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20260115033237.1545400-1-kuba@kernel.org>
 <20260115051221.68054-1-fushuai.wang@linux.dev>
 <CANn89iKfuXjqKsn+xB6bpGOaqM7pN4ZcRJ=2KJg4WY76ArYXhQ@mail.gmail.com>
 <CAHmME9quqMVzD5zSEKvOFOYj3QLANAo2iYeqWQ1toV0C7gJXTg@mail.gmail.com>
In-Reply-To: <CAHmME9quqMVzD5zSEKvOFOYj3QLANAo2iYeqWQ1toV0C7gJXTg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 15 Jan 2026 15:40:17 +0100
X-Gm-Features: AZwV_QhUjToNAgS38h20mRwxrxdb2GylWDqbb5JI3WCn-MPbxbSmB7DRusOwq7M
Message-ID: <CANn89iKmNSPjsTBwN3166cKyipJbH64ZPE0O6i2AMh7vyKXS=w@mail.gmail.com>
Subject: Re: [PATCH net-next v3] wireguard: allowedips: Use kfree_rcu()
 instead of call_rcu()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Fushuai Wang <fushuai.wang@linux.dev>, kuba@kernel.org,
 andrew+netdev@lunn.ch, 
 davem@davemloft.net, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 pabeni@redhat.com, vadim.fedorenko@linux.dev, wangfushuai@baidu.com, 
 wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jan 15, 2026 at 3:33=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> Hi Eric,
>
> On Thu, Jan 15, 2026 at 10:15=E2=80=AFAM Eric Dumazet <edumazet@google.co=
m> wrote:
> > > > The existing cleanup path is:
> > > >   wg_allowedips_slab_uninit() -> rcu_barrier() -> kmem_cache_destro=
y()
> > > >
> > > > With kfree_rcu(), this sequence could destroy the slab cache while
> > > > kfree_rcu_work() still has pending frees queued. The proper barrier=
 for
> > > > kfree_rcu() is kvfree_rcu_barrier() which also calls flush_rcu_work=
()
> > > > on all pending batches.
> > >
> > > We do not need to add an explict kvfree_rcu_barrier(), becasue the co=
mmit
> > > 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_de=
stroy()")
> > > already does it.
> >
> > It was doing it, but got replaced recently with a plain rcu_barrier()
> >
> > commit 0f35040de59371ad542b915d7b91176c9910dadc
> > Author: Harry Yoo <harry.yoo@oracle.com>
> > Date:   Mon Dec 8 00:41:47 2025 +0900
> >
> >     mm/slab: introduce kvfree_rcu_barrier_on_cache() for cache destruct=
ion
> >
> > We would like explicit +2 from mm _and_ rcu experts on this wireguard p=
atch.
>
> I'll take this through the wireguard tree.
>
> But just a question on your comment, "It was doing it, but got
> replaced recently with a plain rcu_barrier()". Are you suggesting I
> need a kvfree_rcu_barrier() instead? The latest net-next has a
> kvfree_rcu_barrier_on_cache() called from kmem_cache_destroy()
> still... But are you suggesting I add this anyway?
>
> diff --git a/drivers/net/wireguard/allowedips.c
> b/drivers/net/wireguard/allowedips.c
> index 5ece9acad64d..aee39a0303b0 100644
> --- a/drivers/net/wireguard/allowedips.c
> +++ b/drivers/net/wireguard/allowedips.c
> @@ -417,7 +417,7 @@ int __init wg_allowedips_slab_init(void)
>
>  void wg_allowedips_slab_uninit(void)
>  {
> - rcu_barrier();
> + kvfree_rcu_barrier();

It seems kmem_cache_destroy() should take care of needed barriers,
at least this is what is claimed. An rcu_barrier() or kvfree_rcu_barrier()
should not be needed in wg_allowedips_slab_uninit() ?

Probably boring/distracting, I do not expect anyone needing to unload
this module in a loop and expect this to be ultra fast ?

>   kmem_cache_destroy(node_cache);
>  }
>
> Let me know.
>
> Thanks,
> Jason
