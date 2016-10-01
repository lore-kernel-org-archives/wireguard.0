Return-Path: toke@toke.dk
Received: from mail2.tohojo.dk (mail2.tohojo.dk [77.235.48.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87120303
 for <wireguard@lists.zx2c4.com>; Sat, 1 Oct 2016 11:41:03 +0000 (UTC)
Sender: toke@toke.dk
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9oevqa0+pPhSVjNqGFOSZkwctUB2U=19xvebRrxscJFaQ@mail.gmail.com>
Date: Sat, 01 Oct 2016 13:51:50 +0200
In-Reply-To: <CAHmME9oevqa0+pPhSVjNqGFOSZkwctUB2U=19xvebRrxscJFaQ@mail.gmail.com>
 (Jason A. Donenfeld's message of "Sat, 1 Oct 2016 01:21:04 +0200")
Message-ID: <87twcw9tih.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
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

> Hi all,
>
> On Fri, Sep 30, 2016 at 9:18 PM, Dave Taht <dave.taht@gmail.com> wrote:
>> All: I've always dreamed of a vpn that could fq and - when it was
>> bottlenecking on cpu - throw away packets intelligently. Wireguard,
>> which is what jason & co are working on, is a really simple, elegant
>> set of newer vpn ideas that currently has a queuing model designed to
>> optimize for multi-cpu encryption, and not, so much, for managing
>> worst case network behaviors, or fairness, or working on lower end
>> hardware.
>
> Would love any feedback and support for working on the queuing model
> with WireGuard. I hear the bufferbloat folks are geniuses at that...


Looking at your queueing structure description, I'd say the reusable FQ
stuff is a pretty good fit. There's a lot of conceptual overlap between
the mac80211 concept of having a queue per station, and yours of having
a queue per peer. Have a look at include/net/fq.h and
include/net/fq_impl.h - and see net/mac80211/tx.c for a usage example
(grep for 'txq'). This can be further enhanced by using CoDel as the
dequeue function (again, see mac80211 for an example).

Basically, what this gives you is a set of per-flow queues that you can
use to do fairness queueing between flows. These queues can then be
partitioned into a number of 'tins', which in your use case would
correspond to peers. This saves you from allocating a big set of queues
for each peer, but you can still get flow-based FQ to that peer
(including the nice latency prioritisation for sparse flows that
FQ-CoDel also has).

I think you could probably use the FQ structure as a drop-in replacement
for the queue you have already in peer->tx_packet_queue. That would give
you fairness between flows going to a peer, prioritisation of sparse
flows to that peer, and CoDel to push back on flows when the VPN is the
bottleneck.


As far as the encryption step goes, I see two obvious ways of doing it:

1. Do what you are doing now, basically, i.e. just pull packets off the
   FQ, encrypt then, and send them out. This has the drawback of
   (potentially) being bursty, and it adds latency after the point where
   it can be controlled by CoDel.

2. Perform encryption on enqueue. Basically, submit a packet to
   encryption as soon as you get it, and when it finishes, stick it on
   the peer queue. Then move the dequeue operation to a separate step
   that just pulls from the queue. This would get you the benefit of
   having FQ and CoDel operate at the point right before the packets hit
   the wire.

Option 2 is a bit more complicated in that it would need to deal with
the case where no session is established. In this case, you could
probably just stick the non-encrypted packets on the queue, then when
the session is established, pull everything off the queue, encrypt it,
and put it back. A flag somewhere could then keep track of whether
packets on the queue are encrypted or not. You'd also need to deal with
the fact that the FQ hashing doesn't work for encrypted packets.
Probably this can be dealt with by hashing the packet before it is
encrypted and storing the hash in an appropriate field somewhere
(skb->cb?); then changing fq_impl.h to take a function pointer to
override fq_flow_classify().


Another thing that ties into the above which I couldn't find in your
description is how you schedule between peers? Is there a round-robin
scheduler somewhere or something?

-Toke
