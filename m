Return-Path: toke@toke.dk
Received: from mail2.tohojo.dk (mail2.tohojo.dk [77.235.48.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a654e80
 for <wireguard@lists.zx2c4.com>; Sun, 2 Oct 2016 11:20:24 +0000 (UTC)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9oevqa0+pPhSVjNqGFOSZkwctUB2U=19xvebRrxscJFaQ@mail.gmail.com>
 <87twcw9tih.fsf@toke.dk>
 <CAA93jw4MCXRn2zfqw3yuckD5YSsRCRUmLqC9VP88q9ODTLv5ng@mail.gmail.com>
 <87ponk9if1.fsf@toke.dk>
 <CAA93jw4srSUh+qd8hufuPHmiQHNc4hU0At0r=+SvoB3ccCU4sw@mail.gmail.com>
 <87intc9dx2.fsf@toke.dk>
 <CAHmME9oykzhvUB0-9dZ+nLif=4bFDyKz8NL5R9jXGT1oUqy=Bw@mail.gmail.com>
 <87intbfxit.fsf@toke.dk>
 <CAHmME9opprH_0xrXKzrOmh3iQCxXLDrMFU+tT5r1_jxGwf1o8g@mail.gmail.com>
Date: Sun, 02 Oct 2016 13:31:17 +0200
In-Reply-To: <CAHmME9opprH_0xrXKzrOmh3iQCxXLDrMFU+tT5r1_jxGwf1o8g@mail.gmail.com>
 (Jason A. Donenfeld's message of "Sun, 2 Oct 2016 04:25:59 +0200")
Message-ID: <87eg3zf0my.fsf@toke.dk>
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

> Hey Toke,
>
> On Sun, Oct 2, 2016 at 1:40 AM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke.dk> wrote:
>> I assumed that there probably was, but was not sure where. Thanks for
>> clearing this up. I'll take a step back and try to describe this on the
>> conceptual level:
>
> Conceptual overview: exactly what I needed, thanks.
>
>> First, the reason we want better queueing is to deal with the case where
>> wireguard is a bottleneck. If it's not a bottleneck, no queue will
>> build, so there's no queueing latency to reduce. In this case the
>> bottleneck happens when we're waiting for the crypto step to finish,
>> i.e. when your queue (2) starts to fill. So we want to limit the time
>> packets spent in the total queueing system, i.e. from they enter through
>> xmit() and until they are released by send_off_bundle().
>>
>> The simple way to do this is to just apply CoDel to the whole system.
>> I.e. timestamp packets when they appear in xmit() and apply CoDel before
>> sending them off in send_off_bundle(). You'd have to make sure the
>> timestamp is preserved through the encryption step (keep it in the cb,
>> for instance), but other than that it's only a couple of handfuls of LOC
>> you need to add to achieve this.
>
> Thank you! Excellent. Okay, that clears things up for me quite a bit.
> So if my understanding is correct, the goal of a smart queue is to
> realize when the queue is being filled and apply artificial delay to
> the dequeuing process, so that TCP's rate control algorithm won't
> suffer from initial bursts. So, the whole idea is not to do anything
> fancy with the padata situation, but instead record when the packet is
> submitted to the crypto engine and when it comes back out of the
> crypto engine, feed this to CoDel, and let CoDel apply whatever
> necessary delays. This should make going back and reading the wireless
> code a bit more clear for me.

Almost: We're not adding delay, we're trying to get rid of it ;)

Basically, what CoDel does is look at the time the packet spent in the
queue. If this time grows above 5 ms for an extended period of time,
CoDel will drop a packet. This signals the TCP sender to slow down,
which will hopefully drain the queue. If it doesn't help for long
enough, CoDel will drop another packet; and so on, dropping at an
increasing rate until the queue is drained.

The basic mechanism of occasionally dropping a packet has been known for
decades; it's the same good old RED does. What CoDel brings to the table
is basing the drop on the actual measured time the packets spend in the
queue. This nicely avoids having to tell the algorithm how many packets
are too many.

>> However, the FQ part of FQ-CoDel gives substantial benefits on top of
>> plain CoDel, namely fairness between (5-tuple) flows, and lower latency
>> to sparse flows (because they get priority). Since you have a strict
>> FIFO encryption step in the middle (an re-order-sensitivity after
>> encryption is completed), it's difficult to apply FQ across all of
>> wireguard. However, it can be applied to the peer queues, as I
>> mentioned. This would have the benefit that when a peer is backlogged
>> and waiting for space on the crypto queue, packets arriving to it will
>> get the benefit of the FQ when transmission resumes.
>
> Do you mean that:
>
>    a. I should add another mechanism to the part where I remove items fro=
m the
>       peer queue (queue (1)) and put it in the padata queue (queue (2)) so
>       that it fairly chooses packets based on the inner IP header?
>
>       or
>
>    b. When queueing up any packets into the padata queue (queue (2)), I s=
hould
>       somehow apply fairness in deciding which peer's packets get put from
>       that peer's queue (1) into the global queue (2)?

I'd say both. (a) makes sure that if, e.g., a TCP flow and a sparse flow
(VoIP, ping, etc) both go to the same peer, the sparse flow will get
priority and low latency. (b) makes sure that all peers get their fair
share of the total bandwidth.

>> BTW, when reading the code (which is very readable!)
>
> Glad you liked it! If anything turns out to be unreadable or unclear, do =
let
> me know. This sort of thing is somewhat important to me.
>
>> 1. When the crypto queue is full, you stick all the unencrypted packets
>>    on the peer queues. What mechanism resumes the transmission of those
>>    packets, other than a new packet arriving to the same peer? And what
>>    happens if several peers are backlogged at the same time? Will their
>>    order they resume transmission depend on which peer happens to get a
>>    new packet once the crypto queue has space?
>
> No mechanism. :( Right now nothing happens until the peer has another
> packet to send, which is far from ideal. Due to some other interesting
> aspects of WireGuard that aren't directly relevant here, if the peer
> receives data but hasn't sent any data for roughly 10 seconds, the
> queue will start up again. This obviously isn't a satisfactory
> solution though.

Yes, I found the other timer. Okay, at least I wasn't reading the code
wrong. And I agree that is probably not optimal ;)

> What would you suggest? I try again after 100ms? I try again after
> some magic CoDel-defined timeout? If I set a one-off timer for 100ms
> after the rejection, if several peers all get rejected at the same
> time, I suppose I'll have something of a "thundering herd" situation
> when the timer fires, though I'm not sure this would necessarily be a
> bad thing.

You don't need a timer. You already have a signal for when more queue
space is available in the encryption step: When a packet finishes
encryption. All you need to do is try to enqueue another one at this
point.


Basically, putting all of the above together, I'd suggest a flow like
this (expressed in C-like pseudocode):

function enqueue(pkt) { /* this is basically your existing xmit() */
  peer =3D get_peer(pkt);
  timestamp(pkt);
  fq_enqueue(peer, pkt);
  list_add_end(peer, active_peers);
  schedule();
}

function schedule() {
  while (!full(encryption queue)) {
    peer =3D list_first(active_peers);
    if (!peer) /* no active peers */
      break;
=20=20=20=20=20=20
    pkt =3D fq_dequeue(peer); /* Option 1: This runs CoDel */
    if (!pkt) { /* peer queue empty */
      list_remove(peer, active_peers);
      continue;
    }
=20=20=20=20
    start_encryption(pkt);
    list_move_end(peer, active_peers); /* rotate list */
  }
}

function encryption_done(pkt) {
  codel(pkt); /* Option 2: Run CoDel here; may drop the packet */
  if (pkt)
    send(pkt);
  schedule();
}


This basically gets you a round-robin scheduler between stations (in
schedule()), and an FQ structure for each peer that will do per-flow
fairness and sparse flow prioritisation. You could also do a 'sparse
peer' optimisation in schedule(), but it's not strictly necessary.

I'd suggest you use the dynamic queue length stuff to check whether the
encryption queue is full. I.e. the function I called full() would
actually be a call to dql_avail() - and you'd need to add the companion
calls to dql_queued() and dql_completed() in appropriate places, of
course (for which I'd suggest you use bytes rather than number of
packets). This should keep just the right number of packets in the
encryption queue to keep things busy, but not more (which would just add
latency).

As you can see I marked to possible places you could apply CoDel in the
above. I'm not actually sure which one works best. On the one hand,
option 2 means CoDel will get a chance to react to the encryption
latency, which is good. But on the other hand, because there is fairness
queueing, there can be reordering, so you'll get some packets with very
low latency intermixed with those that have been queued for longer.
Which will basically turn CoDel off. So for this reason, I think having
CoDel in the fq_dequeue() step would be better; in this case, there are
a separate set of state vars for each flow, so the TCP elephant flows
can get packets dropped while the others won't. This is what we do in
mac80211.

Actually with this setup, things are analogous to a regular network
interface, where the encryption queue takes the place of the hardware.
So we want to keep the hardware (encryption) busy, but not have more
packets queued up there than is necessary to achieve this.

Also, I've completely ignored your existing bunching of packets after
encryption. I think you could still do that (i.e. wait to send things in
encryption_done() until you have a bunch of packets), as long as you
call schedule() for each packet that finishes encryption. I'm not sure
how that would affect performance, though; it's probably a tradeoff
between throughput and latency. I'd suggest benchmarking both cases :)

>> 2. There are several places where you walk the queue with a manual
>>    for-loop. Is there any reason why you're not using the
>>    skb_queue_walk_* macros? In particular, in some places you are
>>    storing the pointer in the beginning of a loop in case it goes away;
>>    that seems to be what skb_queue_walk_safe() is meant for?
>
> skb_queues are circularly linked. This requires an extra 16 bytes for
> the head element. Rather than waste that in the cb, I simply use a
> list of skbs that terminate with a NULL. This makes traversal a bit
> different, and more simple.

Ah, I see. Well, if you want to use the queue structures from elsewhere
(i.e. FQ), you'll probably need to use skb_queue, at least in the upper
part.

> Thanks for the guidance here. Very much appreciated.

You're welcome. I'm enjoying the chance to explain these concepts to
someone new :)

-Toke
