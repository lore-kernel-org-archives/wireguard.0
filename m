Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513AEC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Mar 2022 07:24:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c5c5edb9;
	Mon, 21 Mar 2022 07:24:53 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3dcf36b1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Mar 2022 07:24:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35D77B80F03
 for <wireguard@lists.zx2c4.com>; Mon, 21 Mar 2022 07:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74807C340EE
 for <wireguard@lists.zx2c4.com>; Mon, 21 Mar 2022 07:24:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="S3uVJJbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1647847487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hjy2cXg/pR6wbxhMZdE53B/Vc38fQptNwL09bkg78qo=;
 b=S3uVJJbDryWtlzUDiGAQDHNe8oA/NmTp1UcZiMPLwAMwWrfVGPMnOHPNB1FmzE5oNb9Yyq
 0yAIvt5dgaOJYvPDgroUFr15Mb05P0f17nuEVsTiRx4se//no2y2QeoxB/yywDiJW9c10S
 RCtuFzcSUFeLeohU37ygphsPB9I2CEI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6911c3f6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Mar 2022 07:24:47 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id f38so26451851ybi.3
 for <wireguard@lists.zx2c4.com>; Mon, 21 Mar 2022 00:24:47 -0700 (PDT)
X-Gm-Message-State: AOAM5319oB+sYowCLjWCxq6JoaTpNKlL5MfJPOIeR6UrPspTCZbwg8ml
 xvGKgfObjtWp0PheZECzQm2F/PB+VHah6zmayjw=
X-Google-Smtp-Source: ABdhPJycLuXbyQLaEH4lExZjUHS1cCBgTz3uBRjUkZk6G0gz1V292sYRdwLi+yxeJKFAXpPowxYqgw5OX3YJXm71mIU=
X-Received: by 2002:a25:b854:0:b0:633:8a00:707a with SMTP id
 b20-20020a25b854000000b006338a00707amr21342066ybm.637.1647847486007; Mon, 21
 Mar 2022 00:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220319004738.1068685-1-Jason@zx2c4.com>
 <YjXGALddYuJeRlDk@linutronix.de>
In-Reply-To: <YjXGALddYuJeRlDk@linutronix.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 21 Mar 2022 01:24:35 -0600
X-Gmail-Original-Message-ID: <CAHmME9rjNCM_2xOEUea1_T4aYJY+xqFL=hrEVBO_FK9eVT4cew@mail.gmail.com>
Message-ID: <CAHmME9rjNCM_2xOEUea1_T4aYJY+xqFL=hrEVBO_FK9eVT4cew@mail.gmail.com>
Subject: Re: [PATCH] net: remove lockdep asserts from ____napi_schedule()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Netdev <netdev@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jakub Kicinski <kuba@kernel.org>, 
 Saeed Mahameed <saeed@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
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

Hi Sebastian,

On Sat, Mar 19, 2022 at 6:01 AM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2022-03-18 18:47:38 [-0600], Jason A. Donenfeld wrote:
> > This reverts commit fbd9a2ceba5c ("net: Add lockdep asserts to
> > ____napi_schedule()."). While good in theory, in practice it causes
> > issues with various drivers, and so it can be revisited earlier in the
> > cycle where those drivers can be adjusted if needed.
>
> Do you plan to address to address the wireguard warning?

It seemed to me like you had a lot of interesting ideas regarding
packet batching and performance and whatnot around when bh is enabled
or not. I'm waiting for a patch from you on this, as I mentioned in my
previous email. There is definitely a lot of interesting potential
performance work here. I am curious to play around with it too, of
course, but it sounded to me like you had very specific ideas. I'm not
really sure how to determine how many packets to batch, except for
through empirical observation or some kind of crazy dql thing. Or
maybe there's some optimal quantity due to the way napi works in the
first place. Anyway, there's some research to do here.

>
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -4277,9 +4277,6 @@ static inline void ____napi_schedule(struct softnet_data *sd,
> >  {
> >       struct task_struct *thread;
> >
> > -     lockdep_assert_softirq_will_run();
> > -     lockdep_assert_irqs_disabled();
>
> Could you please keep that lockdep_assert_irqs_disabled()? That is
> needed regardless of the upper one.

Feel free to send in a more specific revert if you think it's
justifiable. I just sent in the thing that reverted the patch that
caused the regression - the dumb brute approach.

Jason
