Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6E1C8302D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Jun 2025 17:54:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f55ab868;
	Mon, 30 Jun 2025 17:54:07 +0000 (UTC)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [2607:f8b0:4864:20::52f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b813d6c7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jun 2025 17:54:06 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-7fd581c2bf4so2166174a12.3
 for <wireguard@lists.zx2c4.com>; Mon, 30 Jun 2025 10:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751306044; x=1751910844; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+FvQdARxOE0AE0TkBrCFtqU1k4cnh7ikYsee8BD0XuE=;
 b=ajJpbJRKmZ9S6hZMfUVvfGLz+J0sgVaCv9q058qRDXNPXLWTSRJtdFJ5oE3c3PUtt8
 jkmeM7sT+szOSjvVtojs/7I2OGwL/4XZnRts+Acu9R/B3qJDfbVPItEc+p61gSgmwOdW
 MmUQSOujYrVSacae1LIh44+zL3mUuQudM3zHDQEHiYi1IK4N8tgd9ZPn+xdwPVWeVBdk
 xRzCjJeVobjYF7euVUO2NIhlADpgPWTpOUjBSJN1ZmyNYM+PzEEftGa0Uon2m6Gw/TR2
 CKxj4BfFvP1hayvi7W34XHzFAvq1XCo6olNi/dOFfjHZcVcsPbj7BwI5c2P7mCrQChbc
 mhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751306044; x=1751910844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+FvQdARxOE0AE0TkBrCFtqU1k4cnh7ikYsee8BD0XuE=;
 b=itTXXPLWvE35etYJHqWpqStF4+cdur1q+admVsjqUNur2MW1YpWn3hR+vBjncwrkcT
 Sc+p93MfIM6DjcJLNzhlCvKtY7+hjeMe9bLpohJO7A7yDJFx4p67Dml7ed/88QMu9DZ+
 qDZhVWWYbrIfL1NZkhrNywg3Ryyek/xx7OtIrHCrBmPUlwQ0KFbtvFtcqjGt5C1X13dx
 9C8h9HowzrTOOYkJ3dCCEHqfp0dyFIZBApQ3DXVpCPfRLFfkh0b5JYi5UV68r+d/cHJL
 bShxYWcYbFy0JD41hJeDYPcW2M4eZSmC9LLB/Ztdw042AzwSoM6hdE2O7ZGEPhhpfhG8
 Z5ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4xEBiojPDl7YA+jWITrWdgeZMfSf3xTPOKgSbQZJkqDtysQ6UibOijQMn2sjU5K87iD8HRqcTfMk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yz1pvEByDyLRovpSWydmjGQ3otTLPPQFsihNqCt8sZW0H8ZzCYA
 iRux9osSI/1EVLJ0ddMDXMp6/Mggu671+BeVbhrDFdg0TJ4EFa54RiI1
X-Gm-Gg: ASbGncs4dWAEAu4mV9LjPu1CmRm44hpo/Jb6zLx55hgtev1GPxeyGr6xp6SLeMvrHD0
 Bdm2CX2gN4zfr5jnhWnHQjvTqgkY/iKKjJEV7rUZurKfxWvoAFukbzmJnqvpAguwqKSLfkBXl2o
 pqcTLVMTEZJo/KNE9u3o0pW3pOWmWBy1HyB3TppgKGGG2IL5VmqGOSq7XbQT+FakFCCeYTAtKJy
 zB2+AXUPTFYf1DNVs3VfwvbVdtdzzm8gdYIz/lklb6/wd+BwgOzN7Mnokf9nt0YkHVAAtyQRIkI
 3LlICgVSiS5YuHstBhJLhNBCA4QIG/TZRaucHZMbZVhjMGuZVelQ8LEuj9i3PA==
X-Google-Smtp-Source: AGHT+IGsSgosU0EFvN9ZODyenvi/+IbvPw/aAApH7JP0y41FfCRiPa0g42ZE4CsDkX1cZblqgDiC/A==
X-Received: by 2002:a17:90b:4b50:b0:311:ea13:2e61 with SMTP id
 98e67ed59e1d1-318c92839camr17182631a91.34.1751306044382; 
 Mon, 30 Jun 2025 10:54:04 -0700 (PDT)
Received: from localhost ([216.228.127.130]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c1392096sm9637470a91.8.2025.06.30.10.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 10:54:03 -0700 (PDT)
Date: Mon, 30 Jun 2025 13:54:01 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wireguard: queueing: simplify wg_cpumask_next_online()
Message-ID: <aGLPOWUQeCxTPDix@yury>
References: <20250619145501.351951-1-yury.norov@gmail.com>
 <aGLIUZXHyBTG4zjm@zx2c4.com> <aGLKcbR6QmrQ7HE8@yury>
 <aGLLepPzC0kp9Ou1@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGLLepPzC0kp9Ou1@zx2c4.com>
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

On Mon, Jun 30, 2025 at 07:38:02PM +0200, Jason A. Donenfeld wrote:
> On Mon, Jun 30, 2025 at 01:33:37PM -0400, Yury Norov wrote:
> > On Mon, Jun 30, 2025 at 07:24:33PM +0200, Jason A. Donenfeld wrote:
> > > On Thu, Jun 19, 2025 at 10:54:59AM -0400, Yury Norov wrote:
> > > > From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > > > 
> > > > wg_cpumask_choose_online() opencodes cpumask_nth(). Use it and make the
> > > > function significantly simpler. While there, fix opencoded cpu_online()
> > > > too.
> > > > 
> > > > Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > > > ---
> > > > v1: https://lore.kernel.org/all/20250604233656.41896-1-yury.norov@gmail.com/
> > > > v2:
> > > >  - fix 'cpu' undeclared;
> > > >  - change subject (Jason);
> > > >  - keep the original function structure (Jason);
> > > > 
> > > >  drivers/net/wireguard/queueing.h | 13 ++++---------
> > > >  1 file changed, 4 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
> > > > index 7eb76724b3ed..56314f98b6ba 100644
> > > > --- a/drivers/net/wireguard/queueing.h
> > > > +++ b/drivers/net/wireguard/queueing.h
> > > > @@ -104,16 +104,11 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
> > > >  
> > > >  static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
> > > >  {
> > > > -	unsigned int cpu = *stored_cpu, cpu_index, i;
> > > > +	unsigned int cpu = *stored_cpu;
> > > > +
> > > > +	if (unlikely(cpu >= nr_cpu_ids || !cpu_online(cpu)))
> > > > +		cpu = *stored_cpu = cpumask_nth(id % num_online_cpus(), cpu_online_mask);
> > > 
> > > I was about to apply this but then it occurred to me: what happens if
> > > cpu_online_mask changes (shrinks) after num_online_cpus() is evaluated?
> > > cpumask_nth() will then return nr_cpu_ids?
> > 
> > It will return >= nd_cpu_ids. The original version based a for-loop
> > does the same, so I decided that the caller is safe against it.
> 
> Good point. I just checked... This goes into queue_work_on() which
> eventually hits:
> 
>         /* pwq which will be used unless @work is executing elsewhere */
>         if (req_cpu == WORK_CPU_UNBOUND) {
> 
> And it turns out WORK_CPU_UNBOUND is the same as nr_cpu_ids. So I guess
> that's a fine failure mode.

Actually, cpumask_nth_cpu may return >= nr_cpu_ids because of
small_cpumask_nbits optimization. So it's safer to relax the
condition. 

Can you consider applying the following patch for that?

Thanks,
Yury


From fbdce972342437fb12703cae0c3a4f8f9e218a1b Mon Sep 17 00:00:00 2001
From: Yury Norov (NVIDIA) <yury.norov@gmail.com>
Date: Mon, 30 Jun 2025 13:47:49 -0400
Subject: [PATCH] workqueue: relax condition in __queue_work()

Some cpumask search functions may return a number greater than
nr_cpu_ids when nothing is found. Adjust __queue_work() to it.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 kernel/workqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 9f9148075828..abacfe157fe6 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2261,7 +2261,7 @@ static void __queue_work(int cpu, struct workqueue_struct *wq,
 	rcu_read_lock();
 retry:
 	/* pwq which will be used unless @work is executing elsewhere */
-	if (req_cpu == WORK_CPU_UNBOUND) {
+	if (req_cpu >= WORK_CPU_UNBOUND) {
 		if (wq->flags & WQ_UNBOUND)
 			cpu = wq_select_unbound_cpu(raw_smp_processor_id());
 		else
-- 
2.43.0

