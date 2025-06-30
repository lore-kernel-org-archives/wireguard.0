Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60D7C8302D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Jun 2025 18:08:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32075a90;
	Mon, 30 Jun 2025 17:56:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 761b0df6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jun 2025 17:56:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 170356112C
 for <wireguard@lists.zx2c4.com>; Mon, 30 Jun 2025 17:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8826CC4CEE3
 for <wireguard@lists.zx2c4.com>; Mon, 30 Jun 2025 17:56:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QLe+Ttp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1751306162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nwBUr6/hpjZ7K54vyq+VqyEV+VTbqjGaJcB8+K3Oon0=;
 b=QLe+Ttp2izYGPIop41P9HLJC96x4jbVF7p+H3QNnuPl0RErXc82/f+aoujfEqmqcEb6JiM
 x6Mc2FmP4AuSNm2qd/K9rs8nRhzCHKiY2snUBxLyd77ZDnSGoz9vB4SLIxb8E9sPFlKMyD
 mLRqZI8x1LUC5chM2vnzJga72Dm+dM0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f6bfb8b5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jun 2025 17:56:02 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-60be827f2b7so3235600eaf.0
 for <wireguard@lists.zx2c4.com>; Mon, 30 Jun 2025 10:56:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWWG0kivSIlyI/u84ryldFkQLb8P+M/mZiED7CKc4dSnK7Ev9kkyzBjCrENtwyOrUgExibkl6+ZPag=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwbpWc2LkW51+YCzv9IPq4VeGOe9FC1NiMK0DqdDCy1X7u5K7k4
 gR9l/2tdqPpGJKajuIR3Ep4tzycZuumHxDddpsh+C1+qiZOC5H5+YYwp5vAQQjkma8jogwKO5IG
 6ZeQv+BQW+zaKku0Vum/g8rSbujEuIHU=
X-Google-Smtp-Source: AGHT+IGiA1IfGGfk4FTQn2OadT4RW9yIppC2dL9wgwaw7/VzE2aIJQGH/if2wIOKxTuMAROzb8FWKLG0B0eL49aIrKo=
X-Received: by 2002:a05:6870:2d6:b0:2e9:925b:206f with SMTP id
 586e51a60fabf-2f3c0702e55mr348398fac.17.1751306160741; Mon, 30 Jun 2025
 10:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250619145501.351951-1-yury.norov@gmail.com>
 <aGLIUZXHyBTG4zjm@zx2c4.com>
 <aGLKcbR6QmrQ7HE8@yury> <aGLLepPzC0kp9Ou1@zx2c4.com> <aGLPOWUQeCxTPDix@yury>
In-Reply-To: <aGLPOWUQeCxTPDix@yury>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 30 Jun 2025 19:55:49 +0200
X-Gmail-Original-Message-ID: <CAHmME9rjm3k1hw4yMd8Fe9WHxC48ruqFOGJp68Hm6keuondzuQ@mail.gmail.com>
X-Gm-Features: Ac12FXzU2VLvpZ9jgxLg0CzEQ4mxKHHNJMLyBdppuOVHcoF7JR3J2R_EPxQKMIw
Message-ID: <CAHmME9rjm3k1hw4yMd8Fe9WHxC48ruqFOGJp68Hm6keuondzuQ@mail.gmail.com>
Subject: Re: [PATCH v2] wireguard: queueing: simplify wg_cpumask_next_online()
To: Yury Norov <yury.norov@gmail.com>, Tejun Heo <tj@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Yury,

> > > > > diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
> > > > > index 7eb76724b3ed..56314f98b6ba 100644
> > > > > --- a/drivers/net/wireguard/queueing.h
> > > > > +++ b/drivers/net/wireguard/queueing.h
> > > > > @@ -104,16 +104,11 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
> > > > >
> > > > >  static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
> > > > >  {
> > > > > -       unsigned int cpu = *stored_cpu, cpu_index, i;
> > > > > +       unsigned int cpu = *stored_cpu;
> > > > > +
> > > > > +       if (unlikely(cpu >= nr_cpu_ids || !cpu_online(cpu)))
> > > > > +               cpu = *stored_cpu = cpumask_nth(id % num_online_cpus(), cpu_online_mask);
> > > >
> > > > I was about to apply this but then it occurred to me: what happens if
> > > > cpu_online_mask changes (shrinks) after num_online_cpus() is evaluated?
> > > > cpumask_nth() will then return nr_cpu_ids?
> > >
> > > It will return >= nd_cpu_ids. The original version based a for-loop
> > > does the same, so I decided that the caller is safe against it.
> >
> > Good point. I just checked... This goes into queue_work_on() which
> > eventually hits:
> >
> >         /* pwq which will be used unless @work is executing elsewhere */
> >         if (req_cpu == WORK_CPU_UNBOUND) {
> >
> > And it turns out WORK_CPU_UNBOUND is the same as nr_cpu_ids. So I guess
> > that's a fine failure mode.
>
> Actually, cpumask_nth_cpu may return >= nr_cpu_ids because of
> small_cpumask_nbits optimization. So it's safer to relax the
> condition.
>
> Can you consider applying the following patch for that?
>
> Thanks,
> Yury
>
>
> From fbdce972342437fb12703cae0c3a4f8f9e218a1b Mon Sep 17 00:00:00 2001
> From: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> Date: Mon, 30 Jun 2025 13:47:49 -0400
> Subject: [PATCH] workqueue: relax condition in __queue_work()
>
> Some cpumask search functions may return a number greater than
> nr_cpu_ids when nothing is found. Adjust __queue_work() to it.
>
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>  kernel/workqueue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 9f9148075828..abacfe157fe6 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -2261,7 +2261,7 @@ static void __queue_work(int cpu, struct workqueue_struct *wq,
>         rcu_read_lock();
>  retry:
>         /* pwq which will be used unless @work is executing elsewhere */
> -       if (req_cpu == WORK_CPU_UNBOUND) {
> +       if (req_cpu >= WORK_CPU_UNBOUND) {
>                 if (wq->flags & WQ_UNBOUND)
>                         cpu = wq_select_unbound_cpu(raw_smp_processor_id());
>                 else
>

Seems reasonable to me... Maybe submit this to Tejun and CC me?

Jason
