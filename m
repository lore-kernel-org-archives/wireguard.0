Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C50BC83029
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Jun 2025 18:15:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38d1ab95;
	Mon, 30 Jun 2025 18:15:13 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 06519f8c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jun 2025 18:15:12 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-747c2cc3419so4633145b3a.2
 for <wireguard@lists.zx2c4.com>; Mon, 30 Jun 2025 11:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751307310; x=1751912110; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H37e64s3170mpDSPHrCrQe6P7F5mto+begqdDnm3dHc=;
 b=LSI4jhmJevmDpp8tN8DY5Wy5nuAr8A9zBiXXFY2tyt7OoNgrj2dH4XnMj8HnWpAnaF
 eDRRjuQvo0MC43gtApVxLMN4PfgXsaXojJwPkxzn1BQ2iafV2BRqwjrMuokEG44WVsI+
 hr/OJHtXDPIme+uh8zfcEdXLc3dxEcPw2ncUg+fW4NEZMwNPYf2Uv4KFWfYTBaYlxjtj
 6Tx3yjL8BF1f6DGOf7nGn6FnYOK2j/gH4mQs40FdxiUyQAg9dvJ/2VPYY7GlN1B/m3C1
 x2dt+7FGKVvFYo6e8xsfnZTmAQSgP1bBz0iVfo3QaFssNlibp/7G2FTROFV69bA4oLai
 FH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751307310; x=1751912110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H37e64s3170mpDSPHrCrQe6P7F5mto+begqdDnm3dHc=;
 b=wtOoji3BRy251zDwxEV9cRgHn1uVizulB46FfsJknXCLyQ0raWphzeVog1b+UewB+i
 6jDbqtB69WtLsp0yywo43YhSk8B3uJSI05DLNGLXsbzedWpC9AqQ0ZPAtMqOzm56X29G
 hgcIm3qybtf2mDXS0xlVIvX574cFHJZpwQVX7xPWCtULkdKK5L8xriDYeB1L+idRHo6z
 PEDR/bZphJ3L31DDxloyqKmLvjGmNUJqeUB3nIgoK0RQ55fBY4B90hbUSYT3ndqK+SIV
 WG7MhW/tJFfd5gmug80kHeOSR4rdxhSAESIteoHRpXk5um1tywn7jHW1pVizl6Fo6rUX
 LZ5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMl9PW+lJ5PqJ3wLHqW5eo4y0xaa2dOI+NleqDdK2ZcE5MD76oNJVxkg1VMEvaRdOnMeEpsVxRXes=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwphztPEFKAbatdDZSMN5ILP+xqe01ZSnZnw5y3gIRGatVFG0mO
 fErbYCR9BiUUhInCDrRNzGiAV0imU0dw/s0dai/8qY81EzSvcCsap1po
X-Gm-Gg: ASbGncuLEo1PhckPVGTYx7zEBlE2zuPRS7fX4l0mspLlCOE6831wR/KYK+2ShyoOFBp
 pZ6m8uKwNSHShRH6vJ+lVor6t15tZEV+LMBJNMI4oDt1/NFk3QWQuGXQB0zNiX5YrTmvZMs3dMO
 IIOL02pXrvqRBZjbw9FzhcKZVhXXTpghDbKrjf2tr4BEb94VHTuxnljva560lla32dEz9IbnQwp
 OD7c56BGx8i2Lm8LWwREejaYoeGqoEa+omsGd7CSpWktAmLHt9w9Vnoo7mfJaZv/4gbEH7Ih0y7
 a8Az5dBPg6unqaGW3h1Rmgd69OieqP6DsS3YMKTIevteHbgqzkMobEOJWL8kZA==
X-Google-Smtp-Source: AGHT+IGihescccQMP7vCe8xp0GzvZMGE5zbzUaAE5sBZpMnQ9pL1PuoCEq7KCoGc6qCy0cXZODYCfA==
X-Received: by 2002:a05:6a20:d486:b0:201:2834:6c62 with SMTP id
 adf61e73a8af0-220a16b359bmr21990420637.25.1751307310226; 
 Mon, 30 Jun 2025 11:15:10 -0700 (PDT)
Received: from localhost ([216.228.127.130]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af55c5837sm9756966b3a.116.2025.06.30.11.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 11:15:08 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:15:06 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Tejun Heo <tj@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wireguard: queueing: simplify wg_cpumask_next_online()
Message-ID: <aGLUKg8uNvNtimW0@yury>
References: <20250619145501.351951-1-yury.norov@gmail.com>
 <aGLIUZXHyBTG4zjm@zx2c4.com> <aGLKcbR6QmrQ7HE8@yury>
 <aGLLepPzC0kp9Ou1@zx2c4.com> <aGLPOWUQeCxTPDix@yury>
 <CAHmME9rjm3k1hw4yMd8Fe9WHxC48ruqFOGJp68Hm6keuondzuQ@mail.gmail.com>
 <aGLQc5JGGpMdfbln@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGLQc5JGGpMdfbln@yury>
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

> > > From fbdce972342437fb12703cae0c3a4f8f9e218a1b Mon Sep 17 00:00:00 2001
> > > From: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> > > Date: Mon, 30 Jun 2025 13:47:49 -0400
> > > Subject: [PATCH] workqueue: relax condition in __queue_work()
> > >
> > > Some cpumask search functions may return a number greater than
> > > nr_cpu_ids when nothing is found. Adjust __queue_work() to it.
> > >
> > > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> > > ---
> > >  kernel/workqueue.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> > > index 9f9148075828..abacfe157fe6 100644
> > > --- a/kernel/workqueue.c
> > > +++ b/kernel/workqueue.c
> > > @@ -2261,7 +2261,7 @@ static void __queue_work(int cpu, struct workqueue_struct *wq,
> > >         rcu_read_lock();
> > >  retry:
> > >         /* pwq which will be used unless @work is executing elsewhere */
> > > -       if (req_cpu == WORK_CPU_UNBOUND) {
> > > +       if (req_cpu >= WORK_CPU_UNBOUND) {
> > >                 if (wq->flags & WQ_UNBOUND)
> > >                         cpu = wq_select_unbound_cpu(raw_smp_processor_id());
> > >                 else
> > >
> > 
> > Seems reasonable to me... Maybe submit this to Tejun and CC me?
> 
> Sure, no problem.

Hmm... So, actually WORK_CPU_UNBOUND is NR_CPUS, which is not the same
as nr_cpu_ids. For example, on my Ubuntu machine, the CONFIG_NR_CPUS
is 8192, and nr_cpu_ids is 8.

So, for the wg_cpumask_next_online() to work properly, we need to
return the WORK_CPU_UNBOUND in case of nothing is found.

I think I need to send a v3...

Thanks,
Yury

