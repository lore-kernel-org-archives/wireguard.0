Return-Path: dave.taht@gmail.com
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
 [209.85.216.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10d89680
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 19:07:27 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id m5so293733qtb.3
 for <wireguard@lists.zx2c4.com>; Fri, 30 Sep 2016 12:18:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pT3wYc=zCm7XcBcgnsT2pDrNWQZpS95+d=GoPPQLa5VQ@mail.gmail.com>
References: <CAHmME9pT3wYc=zCm7XcBcgnsT2pDrNWQZpS95+d=GoPPQLa5VQ@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Fri, 30 Sep 2016 12:18:11 -0700
Message-ID: <CAA93jw4BXgjTgEAUyBnDE05PgdsNp0FOUNxvi3sUhM5F-6KRdQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, cake@lists.bufferbloat.net,
 make-wifi-fast@lists.bufferbloat.net
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard Queuing, Bufferbloat, Performance, Latency,
	and related issues
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Dear Jason:

Let me cross post, with a little background, for those not paying
attention on the other lists.

All: I've always dreamed of a vpn that could fq and - when it was
bottlenecking on cpu - throw away packets intelligently. Wireguard,
which is what jason & co are working on, is a really simple, elegant
set of newer vpn ideas that currently has a queuing model designed to
optimize for multi-cpu encryption, and not, so much, for managing
worst case network behaviors, or fairness, or working on lower end
hardware. There's a lede port for it that
topped out at (I think) about 16Mbits on weak hardware.

http://wireguard.io/ is really easy to compile and setup. I wrote a
bit about it in my blog as well (
http://blog.cerowrt.org/post/wireguard/ ) - and the fact that I spent
any time on it at all is symptomatic of my overall ADHD (and at the
time I was about to add a few more servers to the flent network and
didn't want to use tinc anymore).

But - As it turns out, the structure/basic concepts in the mac80211
implementation - the retry queue, the global fq_codel queue with per
station hash collision detection - seemed to match much of wireguard's
internal model, and I'd tweaked jason's interest.

Do do a git clone of the code, and take a look... somewhere on the
wireguard list, or privately, jason'd pointed me at the relevant bits
of the queuing model.

On Fri, Sep 30, 2016 at 11:41 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
> Hey Dave,
>
> I've been comparing graphs and bandwidth and so forth with flent's
> rrul and iperf3, trying to figure out what's going on.

A quick note on iperf3 - please see
http://burntchrome.blogspot.com/2016/09/iperf3-and-microbursts.html

There's a lesson here in this, and in pacing in general, sending a
giant burst out of
your retry queue, after you finish negotiating the link, is a bad
idea, and some sort of pacing mechanism might help. And rather than
pre-commenting here, I'll just include your last mail to these new
lists:

> Here's my
> present understanding of the queuing buffering issues. I sort of
> suspect these are issues that might not translate entirely well to the
> work you've been doing, but maybe I'm wrong. Here goes...
>
> 1. For each peer, there is a separate queue, called peer_queue. Each
> peer corresponds to a specific UDP endpoint, which means that a peer
> is a "flow".
> 2. When certain crypto handshake requirements haven't yet been met,
> packets pile up in peer_queue. Then when a handshake completes, all
> the packets that piled up are released. Because handshakes might take
> a while, peer_queue is quite big -- 1024 packets (dropping the oldest
> packets when full). In this context, that's not huge buffer bloat, but
> rather that's just a queue of packets for while the setup operation is
> occurring.
> 3. WireGuard is a net_device interface, which means it transmits
> packets from userspace in softirq. It's advertised as accepting GSO
> "super packets", so sometimes it is asked to transmit a packet that is
> 65k in length. When this happens, it splits those packets up into
> MTU-sized packets, puts them in the queue, and then processes the
> entire queue at once, immediately after.
>
> If that were the totality of things, I believe it would work quite
> well. If the description stopped there, it means packets would be
> encrypted and sent immediately in the softirq device transmit handler,
> just like how the mac80211 stack does things. The above existence of
> peer_queue wouldn't equate to any form of buffer bloat or latency
> issues, because it would just act as a simple data structure for
> immediately transmitting packets. Similarly, when receiving a packet
> from the UDP socket, we _could_ simply just decrypt in softirq, again
> like mac80211, as the packet comes in. This makes all the expensive
> crypto operations blocking to the initiator of the operation -- the
> userspace application calling send() or the udp socket receiving an
> encrypted packet. All is well.
>
> However, things get complicated and ugly when we add multi-core
> encryption and decryption. We add on to the above as follows:
>
> 4. The kernel has a library called padata (kernel/padata.c). You
> submit asynchronous jobs, which are then sent off to various CPUs in
> parallel, and then you're notified when the jobs are done, with the
> nice feature that you get these notifications in the same order that
> you submitted the jobs, so that packets don't get reordered. padata
> has a hard coded maximum of in-progress operations of 1000. We can
> artificially make this lower, if we want (currently we don't), but we
> can't make it higher.
> 5. We continue from the above described peer_queue, only this time
> instead of encrypting immediately in softirq, we simply send all of
> peer_queue off to padata. Since the actual work happens
> asynchronously, we return immediately, not spending cycles in softirq.
> When that batch of encryption jobs completes, we transmit the
> resultant encrypted packets. When we send those jobs off, it's
> possible padata already has 1000 operations in progress, in which case
> we get "-EBUSY", and can take one of two options: (a) put that packet
> back at the top of peer_queue, return from sending, and try again to
> send all of peer_queue the next time the user submits a packet, or (b)
> discard that packet, and keep trying to queue up the ones after.
> Currently we go with behavior (a).
> 6. Likewise, when receiving an encrypted packet from a UDP socket, we
> decrypt it asynchronously using padata. If there are already 1000
> operations in place, we drop the packet.
>
> If I change the length of peer_queue from 1024 to something small like
> 16, it makes some effect when combined with choice (a) as opposed to
> choice (b), but I think this nob isn't so important, and I can leave
> it at 1024. However, if I change the length of padata's maximum from
> 1000 to something small like 16, I immediately get much lower latency.
> However, bandwidth suffers greatly, no matter choice (a) or choice
> (b). Padata's maximum seems to be the relevant nob. But I'm not sure
> the best way to tune it, nor am I sure the best way to interact with
> everything else here.
>
> I'm open to all suggestions, as at the moment I'm a bit in the dark on
> how to proceed. Simply saying "just throw fq_codel at it!" or "change
> your buffer lengths!" doesn't really help me much, as I believe the
> design is a bit more nuanced.
>
> Thanks,
> Jason



--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
