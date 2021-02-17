Return-Path: <SRS0=fgN8=HT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F1DC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Feb 2021 23:41:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDA1864D9C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Feb 2021 23:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDA1864D9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bb894d1;
	Wed, 17 Feb 2021 23:41:44 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a673e045
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Feb 2021 23:41:42 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1613605301; bh=oim4lGBaixgtQ935W3QXJeqlK9nzh8rekF2MOrdMiYE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=V27ut+SXVXNkdgmpMyg8W2+n0ffxKN4GZM5OvLeuYgonHlHiVvAODu65LoEkXur2t
 XDIt+w4XuTCkq7BxhvnrjMtE2h4ciVlxReOzhba0qECtjgJM8y5YoAiXnZPO1BwxB/
 Ibdpmh/9BMy/MmaE983LlLO3b+TPEV+cs9lseKnuwS5eVXU9u5uy3TRK2YeJjNKsj5
 B8p1JxK/VnIV3MnUqnYa+uUjW+vsZIuzhpE5ULpqWH0MfCg1vD5jIuN9iVQ4fvbLLQ
 0qtT3Su8LrxqaRfYdwMr3eTcYi0QuffPQBtLB+4l63dwG1Q3P/kp9/9s8f8WYF383Z
 n1yItwQH0ZbxQ==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, Dmitry Vyukov
 <dvyukov@google.com>
Subject: Re: [PATCH RFC v1] wireguard: queueing: get rid of per-peer ring
 buffers
In-Reply-To: <CAHmME9q98j=vXMJ5gonSg_Eaot08bBP+zXCExDVzPcCmLDb4vQ@mail.gmail.com>
References: <20210208133816.45333-1-Jason@zx2c4.com> <87czwymtho.fsf@toke.dk>
 <CAHmME9q98j=vXMJ5gonSg_Eaot08bBP+zXCExDVzPcCmLDb4vQ@mail.gmail.com>
Date: Thu, 18 Feb 2021 00:41:41 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <874kiamfd6.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> On Wed, Feb 17, 2021 at 7:36 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke.dk> wrote:
>> Are these performance measurements are based on micro-benchmarks of the
>> queueing structure, or overall wireguard performance? Do you see any
>> measurable difference in the overall performance (i.e., throughput
>> drop)?
>
> These are from counting cycles per instruction using perf and seeing
> which instructions are hotspots that take a greater or smaller
> percentage of the overall time.

Right. Would still love to see some actual numbers if you have them.
I.e., what kind of overhead is the queueing operations compared to the
rest of the wg data path, and how much of that is the hotspot
operations? Even better if you have a comparison with a spinlock
version, but I do realise that may be asking too much :)

>> And what about relative to using one of the existing skb queueing
>> primitives in the kernel? Including some actual numbers would be nice to
>> justify adding yet-another skb queueing scheme to the kernel :)
>
> If you're referring to skb_queue_* and friends, those very much will
> not work in any way, shape, or form here. Aside from the fact that the
> MPSC nature of it is problematic for performance, those functions use
> a doubly linked list. In wireguard's case, there is only one pointer
> available (skb->prev), as skb->next is used to create the singly
> linked skb_list (see skb_list_walk_safe) of gso frags. And in fact, by
> having these two pointers next to each other for the separate lists,
> it doesn't need to pull in another cache line. This isn't "yet-another
> queueing scheme" in the kernel. This is just a singly linked list
> queue.

Having this clearly articulated in the commit message would be good, and
could prevent others from pushing back against what really does appear
at first glance to be "yet-another queueing scheme"...

I.e., in the version you posted you go "the ring buffer is too much
memory, so here's a new linked-list queueing algoritm", skipping the
"and this is why we can't use any of the existing ones" in-between.

>> I say this also because the actual queueing of the packets has never
>> really shown up on any performance radar in the qdisc and mac80211
>> layers, which both use traditional spinlock-protected queueing
>> structures.
>
> Those are single threaded and the locks aren't really contended much.
>
>> that would be good; also for figuring out if this algorithm might be
>> useful in other areas as well (and don't get me wrong, I'm fascinated by
>> it!).
>
> If I find the motivation -- and if the mailing list conversations
> don't become overly miserable -- I might try to fashion the queueing
> mechanism into a general header-only data structure in include/linux/.
> But that'd take a bit of work to see if there are actually places
> where it matters and where it's useful. WireGuard can get away with it
> because of its workqueue design, but other things probably aren't as
> lucky like that. So I'm on the fence about generality.

Yeah, I can't think of any off the top of my head either. But I'll
definitely keep this in mind if I do run into any. If there's no obvious
contenders, IMO it would be fine to just keep it internal to wg until
such a use case shows up, and then generalise it at that time. Although
that does give it less visibility for other users, it also saves you
some potentially-redundant work :)

>> > -     if (wg_packet_queue_init(&peer->tx_queue, wg_packet_tx_worker, f=
alse,
>> > -                              MAX_QUEUED_PACKETS))
>> > -             goto err_2;
>> > +     INIT_WORK(&peer->transmit_packet_work, wg_packet_tx_worker);
>>
>> It's not quite clear to me why changing the queue primitives requires
>> adding another work queue?
>
> It doesn't require a new workqueue. It's just that a workqueue was
> init'd earlier in the call to "wg_packet_queue_init", which allocated
> a ring buffer at the same time. We're not going through that
> infrastructure anymore, but I still want the workqueue it used, so I
> init it there instead. I truncated the diff in my quoted reply -- take
> a look at that quote above and you'll see more clearly what I mean.

Ah, right, it's moving things from wg_packet_queue_init() - missed that.
Thanks!

>> > +#define NEXT(skb) ((skb)->prev)
>>
>> In particular, please explain this oxymoronic define :)
>
> I can write more about that, sure. But it's what I wrote earlier in
> this email -- the next pointer is taken; the prev one is free. So,
> this uses the prev one.

Yeah, I just meant to duplicate the explanation and references in
comments as well as the commit message, to save the people looking at
the code in the future some head scratching, and to make the origins
of the algorithm clear (credit where credit is due and all that).

>> While this is nice and compact it's also really hard to read.
>
> Actually I've already reworked that a bit in master to get the memory
> barrier better.

That version still hides the possible race inside a nested macro
expansion, though. Not doing your readers any favours.

>> I don't see anywhere that you're clearing the next pointer (or prev, as
>> it were). Which means you'll likely end up passing packets up or down
>> the stack with that pointer still set, right? See this commit for a
>> previous instance where something like this has lead to issues:
>>
>> 22f6bbb7bcfc ("net: use skb_list_del_init() to remove from RX sublists")
>
> The prev pointer is never used for anything or initialized to NULL
> anywhere. skb_mark_not_on_list concerns skb->next.

I was more concerned with stepping on the 'struct list_head' that shares
the space with the next and prev pointers, actually. But if you audited
that there are no other users of the pointer space at all, great! Please
do note this somewhere, though.

> Thanks for the review.

You're welcome - feel free to add my:

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

-Toke
