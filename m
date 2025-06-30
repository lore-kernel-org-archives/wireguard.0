Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36A4C8302D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Jun 2025 17:25:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b942d81e;
	Mon, 30 Jun 2025 17:25:04 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 794aadd9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jun 2025 17:25:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C8EB2A53437;
 Mon, 30 Jun 2025 17:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5EEC4CEE3;
 Mon, 30 Jun 2025 17:24:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="YETbN4qM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1751304298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mmwZNE2u/jLWQ97nyzsa8bOnYBvTHITQRZ6hjwPm9kM=;
 b=YETbN4qM+f1cBb669m1/hT7Q4hRI2+0z525cA9bYYlRfOYah39n5n+zgwzsVs0gbBi9NIU
 M0yaSxKCDBssANSv6sXIfguOLhdf2+vNn3N+VpC3WaXidp2KGUdR6N0dutVq2bSHWVo22D
 ft0Ay9OF7nLQl4y180ov5VQDK1aOpS8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 21b57f64
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 30 Jun 2025 17:24:57 +0000 (UTC)
Date: Mon, 30 Jun 2025 19:24:33 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wireguard: queueing: simplify wg_cpumask_next_online()
Message-ID: <aGLIUZXHyBTG4zjm@zx2c4.com>
References: <20250619145501.351951-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619145501.351951-1-yury.norov@gmail.com>
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

On Thu, Jun 19, 2025 at 10:54:59AM -0400, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> wg_cpumask_choose_online() opencodes cpumask_nth(). Use it and make the
> function significantly simpler. While there, fix opencoded cpu_online()
> too.
> 
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> ---
> v1: https://lore.kernel.org/all/20250604233656.41896-1-yury.norov@gmail.com/
> v2:
>  - fix 'cpu' undeclared;
>  - change subject (Jason);
>  - keep the original function structure (Jason);
> 
>  drivers/net/wireguard/queueing.h | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
> index 7eb76724b3ed..56314f98b6ba 100644
> --- a/drivers/net/wireguard/queueing.h
> +++ b/drivers/net/wireguard/queueing.h
> @@ -104,16 +104,11 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
>  
>  static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
>  {
> -	unsigned int cpu = *stored_cpu, cpu_index, i;
> +	unsigned int cpu = *stored_cpu;
> +
> +	if (unlikely(cpu >= nr_cpu_ids || !cpu_online(cpu)))
> +		cpu = *stored_cpu = cpumask_nth(id % num_online_cpus(), cpu_online_mask);

I was about to apply this but then it occurred to me: what happens if
cpu_online_mask changes (shrinks) after num_online_cpus() is evaluated?
cpumask_nth() will then return nr_cpu_ids?

Jason
