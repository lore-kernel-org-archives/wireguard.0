Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B16CC5AE59
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Jun 2025 14:24:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ae0e513;
	Thu, 5 Jun 2025 14:24:37 +0000 (UTC)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1e6a92bb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jun 2025 14:24:35 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e7dc89108bfso929645276.3
 for <wireguard@lists.zx2c4.com>; Thu, 05 Jun 2025 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749133474; x=1749738274; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7KW1JY7Y7VtpEznLuWv0WBuU55G2LknK2IpQRvG4+iU=;
 b=UCfhvhGpk6VcnOZBo2DH0FOrSdJpMJ5b6+ktYNaITK4JohbRNBn1frVyeg+W5tcK6l
 psLVNL9sVQGd2WLGcie40S79v7djrka4iXxyO6qH8q7jwL+28e25Co3932HgtQ7JsH/B
 6nO3hDUGx2Aqhg3a5opIXoXQJbuyIEKsYj0Ey6fGw9sWKnnuksRfWWQiJCcgAgFElJff
 ycs0pMfhr5jQkSIE6skm+Pf9wGaAAZhJyYJPWxyV+rCGzT6ZrK66jpwUEYcLT3H7oaZK
 GrYnOMBDDONZhx4DE1WeWVVywke5CJe7bGz6XVfMbo6bMgFRx9LQSTvT1eF2ZtsopKVN
 8tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749133474; x=1749738274;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7KW1JY7Y7VtpEznLuWv0WBuU55G2LknK2IpQRvG4+iU=;
 b=j30jrd2ZcmZtRtoEGMVwCak4k8lhgH/sgRQoqLKbrDeqHdLZXmCjusCN/FfV6g+jTz
 8dd5nDl6FnSxA7eSz+LJMCaHOU+arv1Vcddi+FQzH1tLJuVK3Rpt6vf3kPzR1W0+6H6E
 wMpOxcJhQOArxGg4uUIDPjZKaG+S8N+Ny0vR3oBvcz02vSj515wSPFKziVS/4gLRjgYi
 FmWlLS8oxTyZL5Wj/zqvjuMh3EcKy6J0JsFU77kelE6O65OxVut4FPy2e7rnIm/1a5RR
 potiVyehZLTjwe5cZrW5LbCu6E0eWOfbXxZ8jYP2BbfET3Zqzpi0wYt8FAsHIkhHiQyF
 uL0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvdTJ47SnneIj5e7s+iB/tagLuLu9ieWxK0Jn75eVTHfONGiGqrRmCV3QKb+qU6H3xLgou+mb6OcU=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwjlQSg+PU9cwJ29Ah8t4CP9l2divnUgsuGhvsLZkUbpuMHEijc
 Jntos+djht+coDyi+E11tspWu7BCTJ5XklIHMe/y0m5qmx8O/TzBN1p9
X-Gm-Gg: ASbGnctK5msKI5iCMvoLe2BAAXoBTofn1T7e3IFIc/+I9X7uKCr5wuYlzTcfKQlioQD
 xkl/gg9qwo2nv9ZthQSMB9zV5j1Cc3eViEuzQtz4s/WSNQePqLEq0yH2bmzTsncc71kkdbguzH4
 B0wlTCSj3vW7rG1mnGRb2/+GwepNHCe0LF7OqmkuA7qu8XbPuw4XNvzPxh0lke0ueTyR+9m1wfn
 6n+prvUb8okgFGaYD5uB9Sd9LLlZMgI/KHdQQLKaWAHjVAL0QgMunrjP2OTf3yGdyxRU+gOAkog
 U6vIW8fHBoOFklxJ5xVv5YmhRU75MQcpDJGC3R4xsH2BGmDggeeH925BaK+s1ObLRtUIyt2nd2H
 KVmzbLL7e+6k=
X-Google-Smtp-Source: AGHT+IGBlYgBpeRt9dQT+JeRalTDoWgn5PgI4JSFuOaHgqh8y6M/jDBUxrrdm73Fqvze9M5qDbxjCg==
X-Received: by 2002:a05:6902:2511:b0:e81:868c:5b with SMTP id
 3f1490d57ef6-e81868c04dcmr6518839276.31.1749133473613; 
 Thu, 05 Jun 2025 07:24:33 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e819ef076a8sm94086276.54.2025.06.05.07.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 07:24:33 -0700 (PDT)
Date: Thu, 5 Jun 2025 10:24:32 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wireguard/queueing: simplify wg_cpumask_next_online()
Message-ID: <aEGooNws-KihCuWh@yury>
References: <20250604233656.41896-1-yury.norov@gmail.com>
 <aEEbwQzSoVQAPqLq@yury> <aEGAfy80UcB_UMYs@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEGAfy80UcB_UMYs@zx2c4.com>
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

On Thu, Jun 05, 2025 at 01:33:19PM +0200, Jason A. Donenfeld wrote:
> On Thu, Jun 05, 2025 at 12:23:29AM -0400, Yury Norov wrote:
> > On Wed, Jun 04, 2025 at 07:36:55PM -0400, Yury Norov wrote:
> > > wg_cpumask_choose_online() opencodes cpumask_nth(). Use it and make the
> > > function significantly simpler. While there, fix opencoded cpu_online()
> > > too. 
> > > 
> > > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > > ---
> > >  drivers/net/wireguard/queueing.h | 14 ++++----------
> > >  1 file changed, 4 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
> > > index 7eb76724b3ed..3bfe16f71af0 100644
> > > --- a/drivers/net/wireguard/queueing.h
> > > +++ b/drivers/net/wireguard/queueing.h
> > > @@ -104,17 +104,11 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
> > >  
> > >  static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
> > >  {
> > > -	unsigned int cpu = *stored_cpu, cpu_index, i;
> > > +	if (likely(*stored_cpu < nr_cpu_ids && cpu_online(*stored_cpu)))
> > > +		return cpu;
> > 
> > Oops... This should be 
> >                 return *stored_cpu;
> 
> Maybe it's best to structure the function something like:
> 
> unsigned int cpu = *stored_cpu;
> if (unlikely(cpu >= nr_cpu_ids || !cpu_online(cpu))) {
> 	cpu = *stored_cpu = cpumask_nth(id % num_online_cpus(),	cpu_online_mask);
> return cpu;

If you prefer. I'll send v2 shortly
