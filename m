Return-Path: <SRS0=cVUX=HL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3CBC433E9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Feb 2021 08:26:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6497464E92
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Feb 2021 08:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6497464E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 985945f9;
	Tue, 9 Feb 2021 08:24:41 +0000 (UTC)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 92c3649f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Feb 2021 08:24:40 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id m144so1408413qke.10
 for <wireguard@lists.zx2c4.com>; Tue, 09 Feb 2021 00:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dgWk2Mf8cfWKliaXWJ45E7zBsACoT61WL7/Tnd2P0Zk=;
 b=M6ahCuMpFst6S3Ow9aPt2MqerLyNyls0E6alEjypaqAefRCLUUAVX3VipIQPOnJ6eO
 DhF26avtrTHZkUoK4ma8i4qLPX92G18FdIojk688bxBftjbK1pGVjHfTYC4z3c4HQErI
 XaosIA5NpZNR3ttMFhbI4cLoCnXmIGUs/MFig0xALQl5fTuy8BvVAEFhgNhf8h4nxoal
 9KdXVcJLCUuozDhglSsH4gu/1YhY21iX1jm2tXzu2COJVx0pjgYriXrTdG/40UVeq4gb
 B7s7W4Qa8PYzOXh2AulYSjiIE4el+6KTUG6Gbxm07NZmHjzaOD09/9DWKaVAwPy0+M+Q
 V2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dgWk2Mf8cfWKliaXWJ45E7zBsACoT61WL7/Tnd2P0Zk=;
 b=CcNwn4diUISqJQQyZjhAtMaCnisl7dbISokwihpkIBpVCCEZOn4k/JrVQRCJnmljwr
 VU2Ln2DFuMts7XCA8sXCCjRuUNwAGN17Q15VMQVNP3CxJTPaIMytRbsKTFl9esKpBLvk
 POO1symj4/2A7T6pp5uPdTaB1wtBvKyQbaqHnPcXSrvpLZjopLvMJfuk1aXXk5PSSwbw
 nFkJiXU3BivvaSb7952CvbTIYA34uP8N3zFR1DV6RflMEuyaJEfx1gHyBEleqj6g/EKO
 HK4KOlEczKxFNsft7Z3pmM6zyPvsIEjSF17B5zFrfXxiAgi6LTfgZzJKNOiq7AwN5X/S
 tIfw==
X-Gm-Message-State: AOAM5338M31S9CyvxkHIdZ5ySrjD8w3bit60LWMfmEcHhJIdkWJWukNK
 Dea/A/BbDjT9nDmUNAD1IbCmPrRduRkYtL6tzc96PglnWRrq7Q==
X-Google-Smtp-Source: ABdhPJw+LtYFYz0/KTQQhZn4pyMtQBxsGwk2E+Wn1zAMIEPjJ0sis+uFOuoXvK2kmXlHcb6Sl2yqnK0p9ocQKMDLoOM=
X-Received: by 2002:a05:620a:49:: with SMTP id
 t9mr22256297qkt.231.1612859078502; 
 Tue, 09 Feb 2021 00:24:38 -0800 (PST)
MIME-Version: 1.0
References: <20210208133816.45333-1-Jason@zx2c4.com>
In-Reply-To: <20210208133816.45333-1-Jason@zx2c4.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 9 Feb 2021 09:24:27 +0100
Message-ID: <CACT4Y+ZhwdjNAOhT7zgfe2OtNhtfxAzwcWRxGy8SRe+B4c=q7A@mail.gmail.com>
Subject: Re: [PATCH RFC v1] wireguard: queueing: get rid of per-peer ring
 buffers
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On Mon, Feb 8, 2021 at 2:38 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Having two ring buffers per-peer means that every peer results in two
> massive ring allocations. On an 8-core x86_64 machine, this commit
> reduces the per-peer allocation from 18,688 bytes to 1,856 bytes, which
> is an 90% reduction. Ninety percent! With some single-machine
> deployments approaching 400,000 peers, we're talking about a reduction
> from 7 gigs of memory down to 700 megs of memory.
>
> In order to get rid of these per-peer allocations, this commit switches
> to using a list-based queueing approach. Currently GSO fragments are
> chained together using the skb->next pointer, so we form the per-peer
> queue around the unused skb->prev pointer, which makes sense because the
> links are pointing backwards. Multiple cores can write into the queue at
> any given time, because its writes occur in the start_xmit path or in
> the udp_recv path. But reads happen in a single workqueue item per-peer,
> amounting to a multi-producer, single-consumer paradigm.
>
> The MPSC queue is implemented locklessly and never blocks. However, it
> is not linearizable (though it is serializable), with a very tight and
> unlikely race on writes, which, when hit (about 0.15% of the time on a
> fully loaded 16-core x86_64 system), causes the queue reader to
> terminate early. However, because every packet sent queues up the same
> workqueue item after it is fully added, the queue resumes again, and
> stopping early isn't actually a problem, since at that point the packet
> wouldn't have yet been added to the encryption queue. These properties
> allow us to avoid disabling interrupts or spinning.

Hi Jason,

Exciting! I reviewed only the queue code itself.

Strictly saying, 0.15% is for delaying the newly added item only. This
is not a problem, we can just consider that push has not finished yet
in this case. You can get this with any queue. It's just that consumer
has peeked on producer that it started enqueue but has not finished
yet. In a mutex-protected queue consumers just don't have the
opportunity to peek, they just block until enqueue has completed.
The problem is only when a partially queued item blocks subsequent
completely queued items. That should be some small fraction of 0.15%.


> Performance-wise, ordinarily list-based queues aren't preferable to
> ringbuffers, because of cache misses when following pointers around.
> However, we *already* have to follow the adjacent pointers when working
> through fragments, so there shouldn't actually be any change there. A
> potential downside is that dequeueing is a bit more complicated, but the
> ptr_ring structure used prior had a spinlock when dequeueing, so all and
> all the difference appears to be a wash.
>
> Actually, from profiling, the biggest performance hit, by far, of this
> commit winds up being atomic_add_unless(count, 1, max) and atomic_
> dec(count), which account for the majority of CPU time, according to
> perf. In that sense, the previous ring buffer was superior in that it
> could check if it was full by head==tail, which the list-based approach
> cannot do.

We could try to cheat a bit here.
We could split the counter into:

atomic_t enqueued;
unsigned dequeued;

then, consumer will do just dequeued++.
Producers can do (depending on how precise you want them to be):

if ((int)(atomic_read(&enqueued) - dequeued) >= MAX)
    return false;
atomic_add(&enqueued, 1);

or, for more precise counting we could do a CAS loop on enqueued.
Since any modifications to dequeued can only lead to reduction of
size, we don't need to double check it before CAS, thus the CAS loop
should provide a precise upper bound on size.
Or, we could check, opportunistically increment, and then decrement if
overflow, but that looks the least favorable option.


> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

The queue logic looks correct to me.
I did not spot any significant algorithmic differences with my algorithm:
https://groups.google.com/g/lock-free/c/Vd9xuHrLggE/m/B9-URa3B37MJ

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
> Hoping to get some feedback here from people running massive deployments
> and running into ram issues, as well as Dmitry on the queueing semantics
> (the mpsc queue is his design), before I send this to Dave for merging.
> These changes are quite invasive, so I don't want to get anything wrong.



> +struct prev_queue {
> +       struct sk_buff *head, *tail, *peeked;
> +       struct { struct sk_buff *next, *prev; } empty;
> +       atomic_t count;
>  };


This would benefit from a comment explaining that empty needs to match
sk_buff up to prev (and a corresponding build bug that offset of prev
match in empty and sk_buff), and why we use prev instead of next (I
don't know).


> +#define NEXT(skb) ((skb)->prev)
> +#define STUB(queue) ((struct sk_buff *)&queue->empty)
> +
> +void wg_prev_queue_init(struct prev_queue *queue)
> +{
> +       NEXT(STUB(queue)) = NULL;
> +       queue->head = queue->tail = STUB(queue);
> +       queue->peeked = NULL;
> +       atomic_set(&queue->count, 0);
> +}
> +
> +static void __wg_prev_queue_enqueue(struct prev_queue *queue, struct sk_buff *skb)
> +{
> +       WRITE_ONCE(NEXT(skb), NULL);
> +       smp_wmb();
> +       WRITE_ONCE(NEXT(xchg_relaxed(&queue->head, skb)), skb);
> +}
> +
> +bool wg_prev_queue_enqueue(struct prev_queue *queue, struct sk_buff *skb)
> +{
> +       if (!atomic_add_unless(&queue->count, 1, MAX_QUEUED_PACKETS))
> +               return false;
> +       __wg_prev_queue_enqueue(queue, skb);
> +       return true;
> +}
> +
> +struct sk_buff *wg_prev_queue_dequeue(struct prev_queue *queue)
> +{
> +       struct sk_buff *tail = queue->tail, *next = smp_load_acquire(&NEXT(tail));
> +
> +       if (tail == STUB(queue)) {
> +               if (!next)
> +                       return NULL;
> +               queue->tail = next;
> +               tail = next;
> +               next = smp_load_acquire(&NEXT(next));
> +       }
> +       if (next) {
> +               queue->tail = next;
> +               atomic_dec(&queue->count);
> +               return tail;
> +       }
> +       if (tail != READ_ONCE(queue->head))
> +               return NULL;
> +       __wg_prev_queue_enqueue(queue, STUB(queue));
> +       next = smp_load_acquire(&NEXT(tail));
> +       if (next) {
> +               queue->tail = next;
> +               atomic_dec(&queue->count);
> +               return tail;
> +       }
> +       return NULL;
> +}
> +
> +#undef NEXT
> +#undef STUB


> +void wg_prev_queue_init(struct prev_queue *queue);
> +
> +/* Multi producer */
> +bool wg_prev_queue_enqueue(struct prev_queue *queue, struct sk_buff *skb);
> +
> +/* Single consumer */
> +struct sk_buff *wg_prev_queue_dequeue(struct prev_queue *queue);
> +
> +/* Single consumer */
> +static inline struct sk_buff *wg_prev_queue_peek(struct prev_queue *queue)
> +{
> +       if (queue->peeked)
> +               return queue->peeked;
> +       queue->peeked = wg_prev_queue_dequeue(queue);
> +       return queue->peeked;
> +}
> +
> +/* Single consumer */
> +static inline void wg_prev_queue_drop_peeked(struct prev_queue *queue)
> +{
> +       queue->peeked = NULL;
> +}


> @@ -197,8 +188,8 @@ static void rcu_release(struct rcu_head *rcu)
>         struct wg_peer *peer = container_of(rcu, struct wg_peer, rcu);
>
>         dst_cache_destroy(&peer->endpoint_cache);
> -       wg_packet_queue_free(&peer->rx_queue, false);
> -       wg_packet_queue_free(&peer->tx_queue, false);
> +       WARN_ON(wg_prev_queue_dequeue(&peer->tx_queue) || peer->tx_queue.peeked);
> +       WARN_ON(wg_prev_queue_dequeue(&peer->rx_queue) || peer->rx_queue.peeked);

This could use just wg_prev_queue_peek.
