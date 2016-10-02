Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba0628de
 for <wireguard@lists.zx2c4.com>; Sun, 2 Oct 2016 02:15:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a00fe9f
 for <wireguard@lists.zx2c4.com>; Sun, 2 Oct 2016 02:15:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fc6234c4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Oct 2016 02:15:07 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id o17so9162774lfg.3
 for <wireguard@lists.zx2c4.com>; Sat, 01 Oct 2016 19:26:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87intbfxit.fsf@toke.dk>
References: <CAHmME9oevqa0+pPhSVjNqGFOSZkwctUB2U=19xvebRrxscJFaQ@mail.gmail.com>
 <87twcw9tih.fsf@toke.dk>
 <CAA93jw4MCXRn2zfqw3yuckD5YSsRCRUmLqC9VP88q9ODTLv5ng@mail.gmail.com>
 <87ponk9if1.fsf@toke.dk>
 <CAA93jw4srSUh+qd8hufuPHmiQHNc4hU0At0r=+SvoB3ccCU4sw@mail.gmail.com>
 <87intc9dx2.fsf@toke.dk>
 <CAHmME9oykzhvUB0-9dZ+nLif=4bFDyKz8NL5R9jXGT1oUqy=Bw@mail.gmail.com>
 <87intbfxit.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 2 Oct 2016 04:25:59 +0200
Message-ID: <CAHmME9opprH_0xrXKzrOmh3iQCxXLDrMFU+tT5r1_jxGwf1o8g@mail.gmail.com>
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: text/plain; charset=UTF-8
Cc: cake@lists.bufferbloat.net, make-wifi-fast@lists.bufferbloat.net,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [Cake] WireGuard Queuing, Bufferbloat, Performance,
 Latency, and related issues
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Toke,

On Sun, Oct 2, 2016 at 1:40 AM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> I assumed that there probably was, but was not sure where. Thanks for
> clearing this up. I'll take a step back and try to describe this on the
> conceptual level:

Conceptual overview: exactly what I needed, thanks.

> First, the reason we want better queueing is to deal with the case where
> wireguard is a bottleneck. If it's not a bottleneck, no queue will
> build, so there's no queueing latency to reduce. In this case the
> bottleneck happens when we're waiting for the crypto step to finish,
> i.e. when your queue (2) starts to fill. So we want to limit the time
> packets spent in the total queueing system, i.e. from they enter through
> xmit() and until they are released by send_off_bundle().
>
> The simple way to do this is to just apply CoDel to the whole system.
> I.e. timestamp packets when they appear in xmit() and apply CoDel before
> sending them off in send_off_bundle(). You'd have to make sure the
> timestamp is preserved through the encryption step (keep it in the cb,
> for instance), but other than that it's only a couple of handfuls of LOC
> you need to add to achieve this.

Thank you! Excellent. Okay, that clears things up for me quite a bit. So if=
 my
understanding is correct, the goal of a smart queue is to realize when the
queue is being filled and apply artificial delay to the dequeuing process, =
so
that TCP's rate control algorithm won't suffer from initial bursts. So, the
whole idea is not to do anything fancy with the padata situation, but inste=
ad
record when the packet is submitted to the crypto engine and when it comes
back out of the crypto engine, feed this to CoDel, and let CoDel apply
whatever necessary delays. This should make going back and reading the
wireless code a bit more clear for me.

> However, the FQ part of FQ-CoDel gives substantial benefits on top of
> plain CoDel, namely fairness between (5-tuple) flows, and lower latency
> to sparse flows (because they get priority). Since you have a strict
> FIFO encryption step in the middle (an re-order-sensitivity after
> encryption is completed), it's difficult to apply FQ across all of
> wireguard. However, it can be applied to the peer queues, as I
> mentioned. This would have the benefit that when a peer is backlogged
> and waiting for space on the crypto queue, packets arriving to it will
> get the benefit of the FQ when transmission resumes.

Do you mean that:

   a. I should add another mechanism to the part where I remove items from =
the
      peer queue (queue (1)) and put it in the padata queue (queue (2)) so
      that it fairly chooses packets based on the inner IP header?

      or

   b. When queueing up any packets into the padata queue (queue (2)), I sho=
uld
      somehow apply fairness in deciding which peer's packets get put from
      that peer's queue (1) into the global queue (2)?

> BTW, when reading the code (which is very readable!)

Glad you liked it! If anything turns out to be unreadable or unclear, do le=
t
me know. This sort of thing is somewhat important to me.

> 1. When the crypto queue is full, you stick all the unencrypted packets
>    on the peer queues. What mechanism resumes the transmission of those
>    packets, other than a new packet arriving to the same peer? And what
>    happens if several peers are backlogged at the same time? Will their
>    order they resume transmission depend on which peer happens to get a
>    new packet once the crypto queue has space?

No mechanism. :( Right now nothing happens until the peer has another packe=
t
to send, which is far from ideal. Due to some other interesting aspects of
WireGuard that aren't directly relevant here, if the peer receives data but
hasn't sent any data for roughly 10 seconds, the queue will start up again.
This obviously isn't a satisfactory solution though.

What would you suggest? I try again after 100ms? I try again after some mag=
ic
CoDel-defined timeout? If I set a one-off timer for 100ms after the rejecti=
on,
if several peers all get rejected at the same time, I suppose I'll have
something of a "thundering herd" situation when the timer fires, though I'm
not sure this would necessarily be a bad thing.

> 2. There are several places where you walk the queue with a manual
>    for-loop. Is there any reason why you're not using the
>    skb_queue_walk_* macros? In particular, in some places you are
>    storing the pointer in the beginning of a loop in case it goes away;
>    that seems to be what skb_queue_walk_safe() is meant for?

skb_queues are circularly linked. This requires an extra 16 bytes for the h=
ead
element. Rather than waste that in the cb, I simply use a list of skbs that
terminate with a NULL. This makes traversal a bit different, and more simpl=
e.


Thanks for the guidance here. Very much appreciated.

Regards,
Jason
