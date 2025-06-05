Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2E2C5B543
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Jun 2025 11:33:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9306eb2;
	Thu, 5 Jun 2025 11:33:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id db0c4027
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jun 2025 11:33:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 753F4614B8;
 Thu,  5 Jun 2025 11:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4287DC4CEE7;
 Thu,  5 Jun 2025 11:33:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="a2znoELQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1749123207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ogn73FjG8sYoj02NOLkqeGhrcdp1XGtgrdO25c6aItU=;
 b=a2znoELQo1HQAUNHvAbcuJ6T15FNvxNtwueIdblf4DEGwJLLZ9/O44lwK22wyf0S+sLTQP
 jbyJKzsm3o4p74yK9ffhXomoOwZrNh2DQsAO46JZsSreJ5tD3CpYyWTIg0XinyF62upx2z
 nUVVjxfB2yPlwPwcjN0QA189ah43Iv8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2e6ed023
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 5 Jun 2025 11:33:26 +0000 (UTC)
Date: Thu, 5 Jun 2025 13:33:19 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wireguard/queueing: simplify wg_cpumask_next_online()
Message-ID: <aEGAfy80UcB_UMYs@zx2c4.com>
References: <20250604233656.41896-1-yury.norov@gmail.com>
 <aEEbwQzSoVQAPqLq@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aEEbwQzSoVQAPqLq@yury>
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

On Thu, Jun 05, 2025 at 12:23:29AM -0400, Yury Norov wrote:
> On Wed, Jun 04, 2025 at 07:36:55PM -0400, Yury Norov wrote:
> > wg_cpumask_choose_online() opencodes cpumask_nth(). Use it and make the
> > function significantly simpler. While there, fix opencoded cpu_online()
> > too. 
> > 
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > ---
> >  drivers/net/wireguard/queueing.h | 14 ++++----------
> >  1 file changed, 4 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
> > index 7eb76724b3ed..3bfe16f71af0 100644
> > --- a/drivers/net/wireguard/queueing.h
> > +++ b/drivers/net/wireguard/queueing.h
> > @@ -104,17 +104,11 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
> >  
> >  static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
> >  {
> > -	unsigned int cpu = *stored_cpu, cpu_index, i;
> > +	if (likely(*stored_cpu < nr_cpu_ids && cpu_online(*stored_cpu)))
> > +		return cpu;
> 
> Oops... This should be 
>                 return *stored_cpu;

Maybe it's best to structure the function something like:

unsigned int cpu = *stored_cpu;
if (unlikely(cpu >= nr_cpu_ids || !cpu_online(cpu))) {
	cpu = *stored_cpu = cpumask_nth(id % num_online_cpus(),	cpu_online_mask);
return cpu;
