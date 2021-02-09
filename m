Return-Path: <SRS0=cVUX=HL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D9FC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Feb 2021 15:45:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B5EA64DD9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Feb 2021 15:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B5EA64DD9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64e9beaf;
	Tue, 9 Feb 2021 15:44:59 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5a2d4a30
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Feb 2021 15:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1612885493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gog9xgJOMjV06aHMweQfLW0LpZU3XJcQzotCYWOnAEs=;
 b=QDRXcwShCkj3Gzp9i9OY/dr/Z++wJbsJiuyUx0dTcGKfPp5tDvaVuKxe6ZaBbEZbXNctNV
 r+Cd9GnCktS5DLRMhyDKGT4vvbS1L4YyZ03c7mT09yXe8aOwhAYofzxEKR19B+JT9LNGVX
 +K8r0Gtgajoq3MAZjJsxj5wA/XHHonQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4cb08994
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Feb 2021 15:44:53 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id k4so18604181ybp.6
 for <wireguard@lists.zx2c4.com>; Tue, 09 Feb 2021 07:44:53 -0800 (PST)
X-Gm-Message-State: AOAM531YBgIvbMMcJfc66soFF7jf3NFH39HYnz9IfoEhRU98w/8G6ZMO
 KfPYH/RTywTDzWHP68a0NC4v7C9J5MW8Uh+Zftw=
X-Google-Smtp-Source: ABdhPJyep8yL8e6g88M5oYFA+nv38cVZ+u6ngOxfuot+RZO/j5tTDCi5VylHAr5aCmpdjTnT2SthWrMLUL1KfaFI6/c=
X-Received: by 2002:a25:880a:: with SMTP id c10mr32794615ybl.456.1612885492812; 
 Tue, 09 Feb 2021 07:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20210208133816.45333-1-Jason@zx2c4.com>
 <CACT4Y+ZhwdjNAOhT7zgfe2OtNhtfxAzwcWRxGy8SRe+B4c=q7A@mail.gmail.com>
In-Reply-To: <CACT4Y+ZhwdjNAOhT7zgfe2OtNhtfxAzwcWRxGy8SRe+B4c=q7A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 9 Feb 2021 16:44:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9pc==7a3vw-bv7TTDPv6XXAba_uwOHhBJvvJHZpH7hqAg@mail.gmail.com>
Message-ID: <CAHmME9pc==7a3vw-bv7TTDPv6XXAba_uwOHhBJvvJHZpH7hqAg@mail.gmail.com>
Subject: Re: [PATCH RFC v1] wireguard: queueing: get rid of per-peer ring
 buffers
To: Dmitry Vyukov <dvyukov@google.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Dmitry,

Thanks for the review.

On Tue, Feb 9, 2021 at 9:24 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> Strictly saying, 0.15% is for delaying the newly added item only. This
> is not a problem, we can just consider that push has not finished yet
> in this case. You can get this with any queue. It's just that consumer
> has peeked on producer that it started enqueue but has not finished
> yet. In a mutex-protected queue consumers just don't have the
> opportunity to peek, they just block until enqueue has completed.
> The problem is only when a partially queued item blocks subsequent
> completely queued items. That should be some small fraction of 0.15%.

Ah right. I'll make that clear in the commit message.

> We could try to cheat a bit here.
> We could split the counter into:
>
> atomic_t enqueued;
> unsigned dequeued;
>
> then, consumer will do just dequeued++.
> Producers can do (depending on how precise you want them to be):
>
> if ((int)(atomic_read(&enqueued) - dequeued) >= MAX)
>     return false;
> atomic_add(&enqueued, 1);
>
> or, for more precise counting we could do a CAS loop on enqueued.

I guess the CAS case would look like `if
(!atomic_add_unless(&enqueued, 1, MAX + dequeued))` or similar, though
>= might be safer than ==, so writing out the loop manually wouldn't
be a bad idea.

But... I would probably need smp_load/smp_store helpers around
dequeued, right? Unless we argue some degree of courseness doesn't
matter.

> Or, we could check, opportunistically increment, and then decrement if
> overflow, but that looks the least favorable option.

I had originally done something like that, but I didn't like the idea
of it being able to grow beyond the limit by the number of CPU cores.

The other option, of course, is to just do nothing, and keep the
atomic as-is. There's already ~high overhead from kref_get, so I could
always revisit this after I move from kref.h over to
percpu-refcount.h.

>
> > +struct prev_queue {
> > +       struct sk_buff *head, *tail, *peeked;
> > +       struct { struct sk_buff *next, *prev; } empty;
> > +       atomic_t count;
> >  };
>
>
> This would benefit from a comment explaining that empty needs to match
> sk_buff up to prev (and a corresponding build bug that offset of prev
> match in empty and sk_buff), and why we use prev instead of next (I
> don't know).

That's a good idea. Will do.


> > @@ -197,8 +188,8 @@ static void rcu_release(struct rcu_head *rcu)
> >         struct wg_peer *peer = container_of(rcu, struct wg_peer, rcu);
> >
> >         dst_cache_destroy(&peer->endpoint_cache);
> > -       wg_packet_queue_free(&peer->rx_queue, false);
> > -       wg_packet_queue_free(&peer->tx_queue, false);
> > +       WARN_ON(wg_prev_queue_dequeue(&peer->tx_queue) || peer->tx_queue.peeked);
> > +       WARN_ON(wg_prev_queue_dequeue(&peer->rx_queue) || peer->rx_queue.peeked);
>
> This could use just wg_prev_queue_peek.

Nice catch, thanks.

Jason
