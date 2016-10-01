Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8822627f
 for <wireguard@lists.zx2c4.com>; Sat, 1 Oct 2016 22:33:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 964345dc
 for <wireguard@lists.zx2c4.com>; Sat, 1 Oct 2016 22:33:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2cef3e98
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 1 Oct 2016 22:33:44 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id o17so7751453lfg.3
 for <wireguard@lists.zx2c4.com>; Sat, 01 Oct 2016 15:44:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87intc9dx2.fsf@toke.dk>
References: <CAHmME9oevqa0+pPhSVjNqGFOSZkwctUB2U=19xvebRrxscJFaQ@mail.gmail.com>
 <87twcw9tih.fsf@toke.dk>
 <CAA93jw4MCXRn2zfqw3yuckD5YSsRCRUmLqC9VP88q9ODTLv5ng@mail.gmail.com>
 <87ponk9if1.fsf@toke.dk>
 <CAA93jw4srSUh+qd8hufuPHmiQHNc4hU0At0r=+SvoB3ccCU4sw@mail.gmail.com>
 <87intc9dx2.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 2 Oct 2016 00:44:34 +0200
Message-ID: <CAHmME9oykzhvUB0-9dZ+nLif=4bFDyKz8NL5R9jXGT1oUqy=Bw@mail.gmail.com>
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

Hey Toke & Dave,

Thanks a lot for your responses. This is steering me in the right direction=
 (I
hope!). Responses are inline below.

Regards,
Jason

On Sat, Oct 1, 2016 at 1:51 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> Looking at your queueing structure description, I'd say the reusable FQ
> stuff is a pretty good fit. There's a lot of conceptual overlap between
> the mac80211 concept of having a queue per station, and yours of having
> a queue per peer. Have a look at include/net/fq.h and
> include/net/fq_impl.h - and see net/mac80211/tx.c for a usage example
> (grep for 'txq'). This can be further enhanced by using CoDel as the
> dequeue function (again, see mac80211 for an example).

Thanks, I'll have a look at these. I had skimmed them earlier, and it wasn'=
t
immediately clear how this API worked, but I'll give it a deep read.

Part of where I think we're divergent in our understanding is that in
actuality WireGuard has two queues:

    1. A per-peer (per-flow) queue. When a packet, or bundle of packets (vi=
a
    super packets) is asked to be transmitted, I put these packets in this
    per-peer queue. This is the one with a 1024 size at the moment. In the
    same function that these packets are enqueued, they're immediately afte=
r
    dequeued -- two or three lines of code later. The only reason that ther=
e's
    a queue at all is to give WireGuard time to do the crypto thing. I don'=
t
    think this per-peer queue in its current inception is relevant to our
    discussion here, except for one factor:

        1.a. When queue (2), described next, is full, the packet that could=
n't
        fit in queue (2) and all subsequent packets are requeued in the
        per-peer queue (1), and are then dequeued the next time a packet is
        enqueued and then immediately dequeued as above.

    2. A global queue for all of the WireGuard device. After packets from
    queue (1) are dequeued, they're immediately (and instantaneously in an
    unblocking manner) enqueued in this global queue (2). This queue actual=
ly
    lives inside of kernel/padata.c, and its size is limited to 1000 items.
    Items are dequeued on various kthreads that do the expensive crypto wor=
k,
    and their completion is serialized in the order that they were submitte=
d
    to work around the nonce and packet order issue. This queue is global; =
it
    is not per-peer (per-flow). Items are dequeued in the order that they w=
ere
    enqueued. The reason this can be global is that the CPU doesn't care wh=
o
    the packet is destined for when it's doing the expensive crypto operati=
on.

So the big questions are -- how do I deal with queue (2), the global one, t=
o
use fq_codel? In fact, don't I actually just want codel, not fq_codel, sinc=
e
flow isn't really relevant for a global thread worker queue system? Or, in
fact, should it remain relevant somehow? So, the semantics behind queue (2)
need to be intelligently tweaked. However, this does not have anything to d=
o
with queue (1). At the most, there's room for changing the behavior of poin=
t
(1.a), but that's about it.

Does this help clarify things for the continuation of the conversation?

>
> Basically, what this gives you is a set of per-flow queues that you can
> use to do fairness queueing between flows. These queues can then be
> partitioned into a number of 'tins', which in your use case would
> correspond to peers. This saves you from allocating a big set of queues
> for each peer, but you can still get flow-based FQ to that peer
> (including the nice latency prioritisation for sparse flows that
> FQ-CoDel also has).

Ahh interesting, so you believe I should in fact use flow classification (p=
eer
classification) on the global thread pool? So that each peer has a fair
latency?

> I think you could probably use the FQ structure as a drop-in replacement
> for the queue you have already in peer->tx_packet_queue. That would give
> you fairness between flows going to a peer, prioritisation of sparse
> flows to that peer, and CoDel to push back on flows when the VPN is the
> bottleneck.

Are you sure? peer->tx_packet_queue is the queue (1) above. Does it make se=
nse
to use the FQ structure there? Wouldn't it make more sense to somehow glue =
it
over queue (2)? Or would behavior (1.a) tie them together in such a way tha=
t
adding FQ to queue (1) would translate to the fairness we desire, even thou=
gh
its queue (2) that's actually doing the CPU intensive work.

Since your mention of peer->tx_packet_queue indicates you've looked at the
code, I'll point out that this is queue (1) as discussed above, and queue (=
2)
lives in the various invocations of padata_do_parallel() in data.c, which f=
or
encryption is found via the call to packet_create_data in send.c.

> As far as the encryption step goes, I see two obvious ways of doing it:
>
> 1. Do what you are doing now, basically, i.e. just pull packets off the
>    FQ, encrypt then, and send them out. This has the drawback of
>    (potentially) being bursty, and it adds latency after the point where
>    it can be controlled by CoDel.

I'm not sure I understand the last point. Where does CoDel's control kick i=
n
during this in the first place?

>
> 2. Perform encryption on enqueue. Basically, submit a packet to
>    encryption as soon as you get it, and when it finishes, stick it on
>    the peer queue. Then move the dequeue operation to a separate step
>    that just pulls from the queue. This would get you the benefit of
>    having FQ and CoDel operate at the point right before the packets hit
>    the wire.

What happens when the encryption queue -- queue (2) -- is full? Just drop t=
he
packet? Encryption is asynchronous, so the submission returns immediately, =
and
then that queue gets filled up (padata's limit is 1000). This also isn't
possible because I need to add unencrypted packets to the peer queue, since
the whole reason it exists is to buffer packets while waiting for a handsha=
ke.

And in any case, packets *are* submitted for encryption as soon as they're
received. They go in queue (1) for a second, but then are immediately deque=
ued
for encryption -- and enqueued in queue (2) for that -- right away.

> Option 2 is a bit more complicated in that it would need to deal with
> the case where no session is established. In this case, you could

Right.

> probably just stick the non-encrypted packets on the queue, then when
> the session is established, pull everything off the queue, encrypt it,
> and put it back. A flag somewhere could then keep track of whether
> packets on the queue are encrypted or not. You'd also need to deal with
> the fact that the FQ hashing doesn't work for encrypted packets.

FQ hashing is over the src/dst/dport/sport tuple, right? In that case I'd b=
e
using the outer IP header anyway, which isn't encrypted, so it seems like i=
t'd
be okay.

> Probably this can be dealt with by hashing the packet before it is
> encrypted and storing the hash in an appropriate field somewhere
> (skb->cb?); then changing fq_impl.h to take a function pointer to
> override fq_flow_classify().

The general suggestion here of adding a flag for the unencrypted
packets sheds light on the misunderstanding. Queue (1) already is this queu=
e
for the unencrypted packets. It's queue (2) -- the padata one -- that is
handling the encryption, to which packets from queue (1) are immediately
submitted.


> Another thing that ties into the above which I couldn't find in your
> description is how you schedule between peers? Is there a round-robin
> scheduler somewhere or something?

Queue (2) is a FIFO. It seralizes everything coming out of it so that even
though it's asynchronous multi-core operations occurring, they still appear=
 to
complete in the save order they are submitted.

On Sat, Oct 1, 2016 at 5:40 PM, Dave Taht <dave.taht@gmail.com> wrote:
> My thought - given that at least on some platforms - encrypting 1000
> packets at a time is a bad idea - would be something regulating the
> amount of data being crypted at a time, an equivalent to byte queue
> limits - BQL - BCL? byte crypto limits - to keep no more than, say,
> 1ms of data in that part of the subsystem.

That might be a decent idea, since it obviously takes longer to encrypt a b=
ig
packet than a small one.

>
> ... also pulling stuff out of order from an already encrypted thing
> leads to the same IV problems we had in mac80211.

padata handles the ordering issues rather nicely.


On Sat, Oct 1, 2016 at 5:51 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> Dave Taht <dave.taht@gmail.com> writes:
> Well, the dynamic queue limit stuff is reusable (in
> include/linux/dynamic_queue_limits.h). The netdev BQL stuff just uses
> these functions with the packet byte sizes; so adapting it to use in
> wireguard should be fairly straight forward :)
>
>> ... also pulling stuff out of order from an already encrypted thing
>> leads to the same IV problems we had in mac80211.
>
> Yeah, but who needs IVs, really? ;)

Sequential nonces, in my case. :P


On Sat, Oct 1, 2016 at 7:19 PM, Dave Taht <dave.taht@gmail.com> wrote:
> Having one global queue for all of wireguard makes a lot of sense,
> one that gets divvied up as per the amount of traffic for each destinatio=
n,
> and regulated "fairly".

Okay, so that's sort of what I already have now, except there's no fair
regulation happening.

> The present model - of one fixed size one per endpoint can run you out
> of memory right quick.

This problem goes away if I change behavior (1.a) to drop the packet instea=
d
of requeuing it. Does that point make sense? If not, please let me know, an=
d
I'll try better to explain it, as this seems like an important crux.

> Well, in wireguard's case, it does not  (yay!) have
> a-must-deliver-packet-in-IV-order mechanism like 802.11 requires. It
> will merely throw away things that are outside the replay window (2k
> packets). So you could *encrypt* first, deliver later, if you wanted.

Yes, it does have a backtrack mechanism to deal with networks reordering
packets, but things work out *much* better if they're sent in order. PLEASE
see the documentation for padata. Its API makes items appear to complete in
the order that they're submitted.


> If you flood the thing - you get a big queue in two places - one at
> the interface qdisc where we struggle to throw already encrypted
> things away (eventually), and another
> inside the vpn code where we are encrypting as fast as we can get stuff i=
n.

For what it's worth, the interface itself is marked as IFF_NO_QUEUE, so tha=
t
userspace's send() pretty much correlates to a direct call (or calls) to
xmit(), with a few exceptions for curious softirq magic.

> As a side note, another crazy daydream of mine is to use up an entire
> /64 for the vpn endpoint identifier, and pre-negotiate a "spread
> spectrum" style of sending packets there. This would eliminate needing
> to bundle the IV in the packet, it would be obvious (to each side)
> which IV matched what IP address, we'd save 8 bytes on every packet.

Sticking nonces in a v6 address -- that's a neat idea.

On Sat, Oct 1, 2016 at 7:28 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> You'd get that with the FQ structure I described earlier. Then apply the
> dql stuff to limit (globally) the number of packets (or bytes) currently
> being encrypted, and you should have something fairly reasonable.

Hm?
