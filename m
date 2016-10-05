Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd277edd
 for <wireguard@lists.zx2c4.com>; Wed, 5 Oct 2016 12:27:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7197c82c
 for <wireguard@lists.zx2c4.com>; Wed, 5 Oct 2016 12:27:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 06685237
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 5 Oct 2016 12:27:56 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id l131so210128947lfl.2
 for <wireguard@lists.zx2c4.com>; Wed, 05 Oct 2016 05:39:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87eg3zf0my.fsf@toke.dk>
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
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 5 Oct 2016 14:39:14 +0200
Message-ID: <CAHmME9oUctBYA1xxquJqH2-2=2nVpOmgwqWhL6yojSyxaoPGEw@mail.gmail.com>
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

On Sun, Oct 2, 2016 at 1:31 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> You don't need a timer. You already have a signal for when more queue
> space is available in the encryption step: When a packet finishes
> encryption. All you need to do is try to enqueue another one at this
> point.

Oh, silly me. Yes of course. Voila:
https://git.zx2c4.com/WireGuard/commit/?id=3Da0ad61c1a0e25a376e145f07ca27c6=
05d3852bc4

> Also, I've completely ignored your existing bunching of packets after
> encryption. I think you could still do that (i.e. wait to send things in
> encryption_done() until you have a bunch of packets), as long as you
> call schedule() for each packet that finishes encryption.

But, in fact, I wait until all packets are done and sent to call schedule()=
.
The reason is that sometimes schedule() does not queue, but rather immediat=
ely
encrypts and sends the packet if it's small and if there's only one. Waitin=
g
until they're all sent out ensures packet ordering. It also allows the next
batch of packets to be bundled up better, which provides much better
throughput. While it seems like this would contribute unneccessary latency,
the only times that packets are actually bundled in large quantities is whe=
n
doing some sort of bulk TCP data transfer, where the kernel has access to a
huge buffer and can form GSO superpackets. In these cases, latency is rarel=
y
the concern, since it's bulk transfer.

> Almost: We're not adding delay, we're trying to get rid of it ;)
>
> Basically, what CoDel does is look at the time the packet spent in the
> queue. If this time grows above 5 ms for an extended period of time,
> CoDel will drop a packet. This signals the TCP sender to slow down,
> which will hopefully drain the queue. If it doesn't help for long
> enough, CoDel will drop another packet; and so on, dropping at an
> increasing rate until the queue is drained.
>
> The basic mechanism of occasionally dropping a packet has been known for
> decades; it's the same good old RED does. What CoDel brings to the table
> is basing the drop on the actual measured time the packets spend in the
> queue. This nicely avoids having to tell the algorithm how many packets
> are too many.

Ahh, of course. That makes sense.

>
> Basically, putting all of the above together, I'd suggest a flow like
> this (expressed in C-like pseudocode):
>
> function enqueue(pkt) { /* this is basically your existing xmit() */
>   peer =3D get_peer(pkt);
>   timestamp(pkt);
>   fq_enqueue(peer, pkt);
>   list_add_end(peer, active_peers);
>   schedule();
> }
>
> function schedule() {
>   while (!full(encryption queue)) {
>     peer =3D list_first(active_peers);
>     if (!peer) /* no active peers */
>       break;
>
>     pkt =3D fq_dequeue(peer); /* Option 1: This runs CoDel */
>     if (!pkt) { /* peer queue empty */
>       list_remove(peer, active_peers);
>       continue;
>     }
>
>     start_encryption(pkt);
>     list_move_end(peer, active_peers); /* rotate list */
>   }
> }
>
> function encryption_done(pkt) {
>   codel(pkt); /* Option 2: Run CoDel here; may drop the packet */
>   if (pkt)
>     send(pkt);
>   schedule();
> }
>
>
> This basically gets you a round-robin scheduler between stations (in
> schedule()), and an FQ structure for each peer that will do per-flow
> fairness and sparse flow prioritisation. You could also do a 'sparse
> peer' optimisation in schedule(), but it's not strictly necessary.
>
> I'd suggest you use the dynamic queue length stuff to check whether the
> encryption queue is full. I.e. the function I called full() would
> actually be a call to dql_avail() - and you'd need to add the companion
> calls to dql_queued() and dql_completed() in appropriate places, of
> course (for which I'd suggest you use bytes rather than number of
> packets). This should keep just the right number of packets in the
> encryption queue to keep things busy, but not more (which would just add
> latency).
>
> As you can see I marked to possible places you could apply CoDel in the
> above. I'm not actually sure which one works best. On the one hand,
> option 2 means CoDel will get a chance to react to the encryption
> latency, which is good. But on the other hand, because there is fairness
> queueing, there can be reordering, so you'll get some packets with very
> low latency intermixed with those that have been queued for longer.
> Which will basically turn CoDel off. So for this reason, I think having
> CoDel in the fq_dequeue() step would be better; in this case, there are
> a separate set of state vars for each flow, so the TCP elephant flows
> can get packets dropped while the others won't. This is what we do in
> mac80211.
>
> Actually with this setup, things are analogous to a regular network
> interface, where the encryption queue takes the place of the hardware.
> So we want to keep the hardware (encryption) busy, but not have more
> packets queued up there than is necessary to achieve this.

That's a nice design you've outlined. One issue, however, with option 2 is
that now I'm dropping packets after they're already been encrypted. This se=
ems
like it's a bit of a waste. Option 1 avoids this, but then it doesn't take
into account the encryption latency, which is the main source of bufferbloa=
t.
Is there a hybrid option? Specifically, is there an API or a pattern to the
tune of:

struct fq_codel_stats fqc;

xmit(struct sk_buff *skb) {
    fq_hash_t flow_hash =3D fq_compute_flow_hash(iphdr(skb), ...);
    codel_time_t time =3D codel_get_time_or_drop(&fqc, flow_hash);
    if (!time) {
        kfree_skb(skb);
        return;
    }

    skb->cb.time =3D time;
    skb->cb.flow_hash =3D flow_hash;

    put_packet_in_encryption_queue(skb);
}

encryption_finished(struct sk_buff *skb) {
    fq_codel_register_packet_dequeued(&fqc, skb->cb.time, skb->cb.flow_hash=
);
    send_to_udp_socket(skb);
}

The idea here would be that the fqc structure would keep track of the vario=
us
statistics required for fq_codel to do its things. Packets would be registe=
red
coming into the queue and registered coming out of the queue. However, *bef=
ore*
being added to the queue, codel would say whether or not to drop the packet
based on its flow. It seems like this setup would be much simpler, and fulf=
ill
all the requirements, including sparse flows. The hash computation function
would be in the place with the most information, and could work per-peer,
per-flow.

Have I misunderstood something, or is this kind of simplification a real
possibility?

Jason
