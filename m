Return-Path: toke@toke.dk
Received: from mail2.tohojo.dk (mail2.tohojo.dk [77.235.48.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ec3b15e
 for <wireguard@lists.zx2c4.com>; Wed, 5 Oct 2016 13:48:41 +0000 (UTC)
Sender: toke@toke.dk
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
 <87eg3zf0my.fsf@toke.dk>
 <CAHmME9oUctBYA1xxquJqH2-2=2nVpOmgwqWhL6yojSyxaoPGEw@mail.gmail.com>
Date: Wed, 05 Oct 2016 15:59:57 +0200
In-Reply-To: <CAHmME9oUctBYA1xxquJqH2-2=2nVpOmgwqWhL6yojSyxaoPGEw@mail.gmail.com>
 (Jason A. Donenfeld's message of "Wed, 5 Oct 2016 14:39:14 +0200")
Message-ID: <87oa2y6gma.fsf@toke.dk>
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

> On Sun, Oct 2, 2016 at 1:31 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke.dk> wrote:
>> You don't need a timer. You already have a signal for when more queue
>> space is available in the encryption step: When a packet finishes
>> encryption. All you need to do is try to enqueue another one at this
>> point.
>
> Oh, silly me. Yes of course. Voila:
> https://git.zx2c4.com/WireGuard/commit/?id=3Da0ad61c1a0e25a376e145f07ca27=
c605d3852bc4

Yup, that seems like the way to go about it :)

>> Also, I've completely ignored your existing bunching of packets after
>> encryption. I think you could still do that (i.e. wait to send things in
>> encryption_done() until you have a bunch of packets), as long as you
>> call schedule() for each packet that finishes encryption.
>
> But, in fact, I wait until all packets are done and sent to call
> schedule(). The reason is that sometimes schedule() does not queue,
> but rather immediately encrypts and sends the packet if it's small and
> if there's only one. Waiting until they're all sent out ensures packet
> ordering. It also allows the next batch of packets to be bundled up
> better, which provides much better throughput. While it seems like
> this would contribute unneccessary latency, the only times that
> packets are actually bundled in large quantities is when doing some
> sort of bulk TCP data transfer, where the kernel has access to a huge
> buffer and can form GSO superpackets. In these cases, latency is
> rarely the concern, since it's bulk transfer.

But you can have a bulk transfer and a latency sensitive flow going
through the same interface which would cause the latency sensitive flow
to be queued behind the bulk flow; exactly what we want to avoid.

A way to fix the reordering issue was to make schedule() check if there
is already something queued up ahead of it and only do the 'send
immediately' optimisation if the queue is empty. This is similar to what
the qdisc layer does: If the qdisc is empty, just skip the whole thing
and transmit the packet immediately.

[..snip..]

>> Actually with this setup, things are analogous to a regular network
>> interface, where the encryption queue takes the place of the hardware.
>> So we want to keep the hardware (encryption) busy, but not have more
>> packets queued up there than is necessary to achieve this.
>
> That's a nice design you've outlined. One issue, however, with option
> 2 is that now I'm dropping packets after they're already been
> encrypted. This seems like it's a bit of a waste.

I wouldn't worry too much about the inefficiencies here. CoDel doesn't
really drop that many packets (most people seem to have wrong intuitions
about this). With normal TCP traffic, you'll only see on the order of
dozens of packet drops per *minute*. UDP floods are a concern, of
course, but CoDel doesn't deal well with those at all, so you'd probably
want a different mechanism for that.

> Option 1 avoids this, but then it doesn't take into account the
> encryption latency, which is the main source of bufferbloat.

I'm not sure this is actually correct. Or rather, it doesn't have to be.
If you use the DQL interface to limit the number of packets you submit
to encryption to the lowest number possible that keeps the CPU busy, you
should be able to reduce the latency of the actual encryption step to a
constant, and keep the queue in the FQ structure where it can be managed
by CoDel.

> Is there a hybrid option? Specifically, is there an API or a pattern
> to the tune of:
>
> struct fq_codel_stats fqc;
>
> xmit(struct sk_buff *skb) {
>     fq_hash_t flow_hash =3D fq_compute_flow_hash(iphdr(skb), ...);
>     codel_time_t time =3D codel_get_time_or_drop(&fqc, flow_hash);
>     if (!time) {
>         kfree_skb(skb);
>         return;
>     }
>
>     skb->cb.time =3D time;
>     skb->cb.flow_hash =3D flow_hash;
>
>     put_packet_in_encryption_queue(skb);
> }
>
> encryption_finished(struct sk_buff *skb) {
>     fq_codel_register_packet_dequeued(&fqc, skb->cb.time, skb->cb.flow_ha=
sh);
>     send_to_udp_socket(skb);
> }
>
> The idea here would be that the fqc structure would keep track of the
> various statistics required for fq_codel to do its things. Packets
> would be registered coming into the queue and registered coming out of
> the queue. However, *before* being added to the queue, codel would say
> whether or not to drop the packet based on its flow. It seems like
> this setup would be much simpler, and fulfill all the requirements,
> including sparse flows. The hash computation function would be in the
> place with the most information, and could work per-peer, per-flow.
>
> Have I misunderstood something, or is this kind of simplification a real
> possibility?

There's currently no API to do what you're describing with CoDel. You'd
basically want the control law to use the packet hash from the last
packet of the flow that was done with the encryption step. That might
work, I suppose, but it would require reworking the API somewhat.

However, the architecture you're describing (storing the packet hash in
the CB and using it after the encryption step) could be a way to get rid
of the problem with reordered packets causing CoDel to turn off that I
described earlier. With that architecture you could retain the CoDel
state variables per flow, which means different flows with different
queue lengths wouldn't confuse CoDel.


A suggestion might be to try implementing this, but retaining the drop
at the end (i.e. after encryption); then see how well this works,
including how many encrypted packets you are actually throwing away. And
if this does turn out to be a significant number, then start looking at
optimisations that moves the drop to before the encryption step? I'm a
big fan of measuring before optimising in general :)

-Toke
