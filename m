Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A35C83029
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Jun 2025 18:08:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3be703b1;
	Mon, 30 Jun 2025 17:59:21 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a9a9a22b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jun 2025 17:59:19 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-313a001d781so1672640a91.3
 for <wireguard@lists.zx2c4.com>; Mon, 30 Jun 2025 10:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751306358; x=1751911158; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2J25bGVpgh8pIy8pe8vQjyoRwObkYDh4mB+hDfyBtpw=;
 b=euoDUMRb/WnCu7i6DH7KIXD0slFcHqnhc6tFk3KzXCofQ/IktHT6yeBLiO9UqPX+GM
 gJCLR6p7vFFVwjclxZHx3cy4c03t8n8zZU8vcbB6VTt/zb4JLnJADj/A/iaSaWtb12B5
 w8Je0lfb1ObWuEguVjg98UYGxVsFpfji8K3qOtdoHcLjW0z5D9lHSs8aOn6VKwId9xzf
 sdz2/MM3YL0U2rVi0+eKJXFJbw6cvR7J8u5XEDYNT7cCqPsHaFJHhZkt2sKCxjCrSwkK
 hxD8EDeKd/cLr/Y1VcgUE8bPIhlwzHgYb91A/kbbhsqMsKHPP8K9BT9pL7mfycN1grLB
 g7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751306358; x=1751911158;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2J25bGVpgh8pIy8pe8vQjyoRwObkYDh4mB+hDfyBtpw=;
 b=sT6Hsu9FOD1UV+2j9FXrl1c8xDGr7BMg4e+A4KP9e1WZJhe8QQj/pYSEwATNu8E5Wf
 7CNIFYHnRWqow8yJAxoBtT3K9V+PE/XKnphStTuPDtrYTcE3bI2jBhIZn7lgxT/E3OPn
 ORsTEulTE6wcvoy1quFOkKhuLNoeeLxZrB1HHQFm9jh2+SzT6zFI7749Ljh53TG46Il+
 mvv2TvZxaFW2C9BAWVKP29mAv52CqdyFoSGd+IXPJIYNCtRTYCESmmb3iKXwMOBuc+Ui
 3L+y4sHcHujaITmVBVQDhU+E/L2fN16lziqnUwwhk1KmG2+Oj4lxCgd/ecmtSS35n7Fs
 hY1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuqnayQrDobmhY6a7F6IxHnsXXWIkSqr7WJ6uKVeHRSYidgcKHoYDSn+EwiOXRZuLckuZ5fsLmTp4=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwBt/n9QKaoOI9u2Pr7e1dInvxdQ1Cs7dAB/KUO9YiysumPJepb
 jJng+KRDqogPPBCJPw1hiDjOtQHu6+xK7TALJLkt/NVx0rTMoq6DrMyf
X-Gm-Gg: ASbGncs/9kkDbO/j4xblEOpFKlR5ESXSbWzOkPb5ltHV8vVXTKl4F0MR3xdpIyXkNY2
 2TakOvxFI6YnkxSKmTOdMNAhPhmbcQj5B7GWJ/U2NkhPPrRkK7wrF3RTSqkkHetJt2GafNnCb8s
 g1jtHrWI0OX0NcV+36KlyYnNONQkfwOyuf0HnlCEQ1/2vSrdCjCnei549VE29eXwRGyc9zRU1tD
 AOfB9esQx+J+Tvv7WgQeT3JCwQVElJPGf23xWikh7JNw0e+Bmr+xp8v1hVnLD1rmBdcl4bEw6sZ
 9+NU8zwe/apvvtSyyep4JjQrJG19QxhtdPopuUNCo+VKIhwl3AElPp1E+ht89w==
X-Google-Smtp-Source: AGHT+IHX83Rt64kyzEC0NV7DLNV4TZApXaBUaUDQJdOBRv6/Vil7f6N2l0bfOYrH1+W4YetdGwHEAQ==
X-Received: by 2002:a17:90b:1dc4:b0:311:e8cc:4264 with SMTP id
 98e67ed59e1d1-318c922ef55mr26316071a91.12.1751306357856; 
 Mon, 30 Jun 2025 10:59:17 -0700 (PDT)
Received: from localhost ([216.228.127.130]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e1be4sm86304915ad.24.2025.06.30.10.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 10:59:17 -0700 (PDT)
Date: Mon, 30 Jun 2025 13:59:15 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Tejun Heo <tj@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wireguard: queueing: simplify wg_cpumask_next_online()
Message-ID: <aGLQc5JGGpMdfbln@yury>
References: <20250619145501.351951-1-yury.norov@gmail.com>
 <aGLIUZXHyBTG4zjm@zx2c4.com> <aGLKcbR6QmrQ7HE8@yury>
 <aGLLepPzC0kp9Ou1@zx2c4.com> <aGLPOWUQeCxTPDix@yury>
 <CAHmME9rjm3k1hw4yMd8Fe9WHxC48ruqFOGJp68Hm6keuondzuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9rjm3k1hw4yMd8Fe9WHxC48ruqFOGJp68Hm6keuondzuQ@mail.gmail.com>
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

On Mon, Jun 30, 2025 at 07:55:49PM +0200, Jason A. Donenfeld wrote:
> Hi Yury,
> 
> > > > > > diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
> > > > > > index 7eb76724b3ed..56314f98b6ba 100644
> > > > > > --- a/drivers/net/wireguard/queueing.h
> > > > > > +++ b/drivers/net/wireguard/queueing.h
> > > > > > @@ -104,16 +104,11 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
> > > > > >
> > > > > >  static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
> > > > > >  {
> > > > > > -       unsigned int cpu = *stored_cpu, cpu_index, i;
> > > > > > +       unsigned int cpu = *stored_cpu;
> > > > > > +
> > > > > > +       if (unlikely(cpu >= nr_cpu_ids || !cpu_online(cpu)))
> > > > > > +               cpu = *stored_cpu = cpumask_nth(id % num_online_cpus(), cpu_online_mask);
> > > > >
> > > > > I was about to apply this but then it occurred to me: what happens if
> > > > > cpu_online_mask changes (shrinks) after num_online_cpus() is evaluated?
> > > > > cpumask_nth() will then return nr_cpu_ids?
> > > >
> > > > It will return >= nd_cpu_ids. The original version based a for-loop
> > > > does the same, so I decided that the caller is safe against it.
> > >
> > > Good point. I just checked... This goes into queue_work_on() which
> > > eventually hits:
> > >
> > >         /* pwq which will be used unless @work is executing elsewhere */
> > >         if (req_cpu == WORK_CPU_UNBOUND) {
> > >
> > > And it turns out WORK_CPU_UNBOUND is the same as nr_cpu_ids. So I guess
> > > that's a fine failure mode.
> >
> > Actually, cpumask_nth_cpu may return >= nr_cpu_ids because of
> > small_cpumask_nbits optimization. So it's safer to relax the
> > condition.
> >
> > Can you consider applying the following patch for that?
> >
> > Thanks,
> > Yury
> >
> >
> > From fbdce972342437fb12703cae0c3a4f8f9e218a1b Mon Sep 17 00:00:00 2001
> > From: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> > Date: Mon, 30 Jun 2025 13:47:49 -0400
> > Subject: [PATCH] workqueue: relax condition in __queue_work()
> >
> > Some cpumask search functions may return a number greater than
> > nr_cpu_ids when nothing is found. Adjust __queue_work() to it.
> >
> > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> > ---
> >  kernel/workqueue.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> > index 9f9148075828..abacfe157fe6 100644
> > --- a/kernel/workqueue.c
> > +++ b/kernel/workqueue.c
> > @@ -2261,7 +2261,7 @@ static void __queue_work(int cpu, struct workqueue_struct *wq,
> >         rcu_read_lock();
> >  retry:
> >         /* pwq which will be used unless @work is executing elsewhere */
> > -       if (req_cpu == WORK_CPU_UNBOUND) {
> > +       if (req_cpu >= WORK_CPU_UNBOUND) {
> >                 if (wq->flags & WQ_UNBOUND)
> >                         cpu = wq_select_unbound_cpu(raw_smp_processor_id());
> >                 else
> >
> 
> Seems reasonable to me... Maybe submit this to Tejun and CC me?

Sure, no problem.
