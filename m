Return-Path: toke@toke.dk
Received: from mail2.tohojo.dk (mail2.tohojo.dk [77.235.48.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5eec8923
 for <wireguard@lists.zx2c4.com>; Sat, 1 Oct 2016 23:30:07 +0000 (UTC)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9oevqa0+pPhSVjNqGFOSZkwctUB2U=19xvebRrxscJFaQ@mail.gmail.com>
 <87twcw9tih.fsf@toke.dk>
 <CAA93jw4MCXRn2zfqw3yuckD5YSsRCRUmLqC9VP88q9ODTLv5ng@mail.gmail.com>
 <87ponk9if1.fsf@toke.dk>
 <CAA93jw4srSUh+qd8hufuPHmiQHNc4hU0At0r=+SvoB3ccCU4sw@mail.gmail.com>
 <87intc9dx2.fsf@toke.dk>
 <CAHmME9oykzhvUB0-9dZ+nLif=4bFDyKz8NL5R9jXGT1oUqy=Bw@mail.gmail.com>
Date: Sun, 02 Oct 2016 01:40:58 +0200
In-Reply-To: <CAHmME9oykzhvUB0-9dZ+nLif=4bFDyKz8NL5R9jXGT1oUqy=Bw@mail.gmail.com>
 (Jason A. Donenfeld's message of "Sun, 2 Oct 2016 00:44:34 +0200")
Message-ID: <87intbfxit.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Thanks a lot for your responses. This is steering me in the right directi=
on (I
> hope!). Responses are inline below.
>
> Regards,
> Jason
>
> On Sat, Oct 1, 2016 at 1:51 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke.dk> wrote:
>> Looking at your queueing structure description, I'd say the reusable FQ
>> stuff is a pretty good fit. There's a lot of conceptual overlap between
>> the mac80211 concept of having a queue per station, and yours of having
>> a queue per peer. Have a look at include/net/fq.h and
>> include/net/fq_impl.h - and see net/mac80211/tx.c for a usage example
>> (grep for 'txq'). This can be further enhanced by using CoDel as the
>> dequeue function (again, see mac80211 for an example).
>
> Thanks, I'll have a look at these. I had skimmed them earlier, and it was=
n't
> immediately clear how this API worked, but I'll give it a deep read.
>
> Part of where I think we're divergent in our understanding is that in
> actuality WireGuard has two queues:

I assumed that there probably was, but was not sure where. Thanks for
clearing this up. I'll take a step back and try to describe this on the
conceptual level:

First, the reason we want better queueing is to deal with the case where
wireguard is a bottleneck. If it's not a bottleneck, no queue will
build, so there's no queueing latency to reduce. In this case the
bottleneck happens when we're waiting for the crypto step to finish,
i.e. when your queue (2) starts to fill. So we want to limit the time
packets spent in the total queueing system, i.e. from they enter through
xmit() and until they are released by send_off_bundle().

The simple way to do this is to just apply CoDel to the whole system.
I.e. timestamp packets when they appear in xmit() and apply CoDel before
sending them off in send_off_bundle(). You'd have to make sure the
timestamp is preserved through the encryption step (keep it in the cb,
for instance), but other than that it's only a couple of handfuls of LOC
you need to add to achieve this.


However, the FQ part of FQ-CoDel gives substantial benefits on top of
plain CoDel, namely fairness between (5-tuple) flows, and lower latency
to sparse flows (because they get priority). Since you have a strict
FIFO encryption step in the middle (an re-order-sensitivity after
encryption is completed), it's difficult to apply FQ across all of
wireguard. However, it can be applied to the peer queues, as I
mentioned. This would have the benefit that when a peer is backlogged
and waiting for space on the crypto queue, packets arriving to it will
get the benefit of the FQ when transmission resumes.


BTW, when reading the code (which is very readable!), I wondered about a
couple of things:

1. When the crypto queue is full, you stick all the unencrypted packets
   on the peer queues. What mechanism resumes the transmission of those
   packets, other than a new packet arriving to the same peer? And what
   happens if several peers are backlogged at the same time? Will their
   order they resume transmission depend on which peer happens to get a
   new packet once the crypto queue has space?

2. There are several places where you walk the queue with a manual
   for-loop. Is there any reason why you're not using the
   skb_queue_walk_* macros? In particular, in some places you are
   storing the pointer in the beginning of a loop in case it goes away;
   that seems to be what skb_queue_walk_safe() is meant for?



-Toke
