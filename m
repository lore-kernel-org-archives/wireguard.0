Return-Path: <SRS0=fgN8=HT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F91C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Feb 2021 22:29:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C7D261494
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Feb 2021 22:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C7D261494
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89b92547;
	Wed, 17 Feb 2021 22:29:01 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5b0f9ebd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Feb 2021 22:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1613600935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Klmplu/AeNnFrhHB25NvynZMapZXm+AYTsWekEexxsM=;
 b=SRDxe/qrJHe7C11qgtnf+wf5BGAlYBG3RymLb3LHajT+T7LIA/BAdfv2z/ONrFlnxVnpm1
 DbgudTtwS9lmUkfNO/h/hNsz1s8DvWP1U/hHoBpn8cbg9VHGvdVx+crKAHdLFYE/RWLx4L
 Hqnmizb17Xi/A6edgWSbfueWoc2/e74=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5d1a3f48
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Feb 2021 22:28:55 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id p186so260526ybg.2
 for <wireguard@lists.zx2c4.com>; Wed, 17 Feb 2021 14:28:55 -0800 (PST)
X-Gm-Message-State: AOAM5339Ov4jZrEU5uGKRn5wKNj3zPSde2cIDUusPB3gf4/aI9Y9qxNl
 RPsrB5dXQGQ9kkEzGF+gHvOhRqnEcszYQrwuiQ0=
X-Google-Smtp-Source: ABdhPJyfu6UGZgBjREDoFfCZ6sJyRKFkDit6RSJcS9Z9ndAiQWTseTMiGOMPypdrG2NlcUwRTw+eMTdsYVTDjDy9gLE=
X-Received: by 2002:a25:80c9:: with SMTP id c9mr2334560ybm.279.1613600934916; 
 Wed, 17 Feb 2021 14:28:54 -0800 (PST)
MIME-Version: 1.0
References: <20210208133816.45333-1-Jason@zx2c4.com> <87czwymtho.fsf@toke.dk>
In-Reply-To: <87czwymtho.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Feb 2021 23:28:43 +0100
X-Gmail-Original-Message-ID: <CAHmME9q98j=vXMJ5gonSg_Eaot08bBP+zXCExDVzPcCmLDb4vQ@mail.gmail.com>
Message-ID: <CAHmME9q98j=vXMJ5gonSg_Eaot08bBP+zXCExDVzPcCmLDb4vQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1] wireguard: queueing: get rid of per-peer ring
 buffers
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Dmitry Vyukov <dvyukov@google.com>
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

On Wed, Feb 17, 2021 at 7:36 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> Are these performance measurements are based on micro-benchmarks of the
> queueing structure, or overall wireguard performance? Do you see any
> measurable difference in the overall performance (i.e., throughput
> drop)?

These are from counting cycles per instruction using perf and seeing
which instructions are hotspots that take a greater or smaller
percentage of the overall time.

> And what about relative to using one of the existing skb queueing
> primitives in the kernel? Including some actual numbers would be nice to
> justify adding yet-another skb queueing scheme to the kernel :)

If you're referring to skb_queue_* and friends, those very much will
not work in any way, shape, or form here. Aside from the fact that the
MPSC nature of it is problematic for performance, those functions use
a doubly linked list. In wireguard's case, there is only one pointer
available (skb->prev), as skb->next is used to create the singly
linked skb_list (see skb_list_walk_safe) of gso frags. And in fact, by
having these two pointers next to each other for the separate lists,
it doesn't need to pull in another cache line. This isn't "yet-another
queueing scheme" in the kernel. This is just a singly linked list
queue.

> I say this also because the actual queueing of the packets has never
> really shown up on any performance radar in the qdisc and mac80211
> layers, which both use traditional spinlock-protected queueing
> structures.

Those are single threaded and the locks aren't really contended much.

> that would be good; also for figuring out if this algorithm might be
> useful in other areas as well (and don't get me wrong, I'm fascinated by
> it!).

If I find the motivation -- and if the mailing list conversations
don't become overly miserable -- I might try to fashion the queueing
mechanism into a general header-only data structure in include/linux/.
But that'd take a bit of work to see if there are actually places
where it matters and where it's useful. WireGuard can get away with it
because of its workqueue design, but other things probably aren't as
lucky like that. So I'm on the fence about generality.


> > -     if (wg_packet_queue_init(&peer->tx_queue, wg_packet_tx_worker, fa=
lse,
> > -                              MAX_QUEUED_PACKETS))
> > -             goto err_2;
> > +     INIT_WORK(&peer->transmit_packet_work, wg_packet_tx_worker);
>
> It's not quite clear to me why changing the queue primitives requires
> adding another work queue?

It doesn't require a new workqueue. It's just that a workqueue was
init'd earlier in the call to "wg_packet_queue_init", which allocated
a ring buffer at the same time. We're not going through that
infrastructure anymore, but I still want the workqueue it used, so I
init it there instead. I truncated the diff in my quoted reply -- take
a look at that quote above and you'll see more clearly what I mean.

> > +#define NEXT(skb) ((skb)->prev)
>
> In particular, please explain this oxymoronic define :)

I can write more about that, sure. But it's what I wrote earlier in
this email -- the next pointer is taken; the prev one is free. So,
this uses the prev one.

> While this is nice and compact it's also really hard to read.

Actually I've already reworked that a bit in master to get the memory
barrier better.

> I don't see anywhere that you're clearing the next pointer (or prev, as
> it were). Which means you'll likely end up passing packets up or down
> the stack with that pointer still set, right? See this commit for a
> previous instance where something like this has lead to issues:
>
> 22f6bbb7bcfc ("net: use skb_list_del_init() to remove from RX sublists")

The prev pointer is never used for anything or initialized to NULL
anywhere. skb_mark_not_on_list concerns skb->next.

Thanks for the review.

Jason
