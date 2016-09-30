Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f22f2482
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 18:30:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c94392e
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 18:30:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c9cb9ae7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 18:30:54 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id l131so114664757lfl.2
 for <wireguard@lists.zx2c4.com>; Fri, 30 Sep 2016 11:41:39 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 30 Sep 2016 20:41:36 +0200
Message-ID: <CAHmME9pT3wYc=zCm7XcBcgnsT2pDrNWQZpS95+d=GoPPQLa5VQ@mail.gmail.com>
To: Dave Taht <dave.taht@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: [WireGuard] WireGuard Queuing, Bufferbloat, Performance, Latency,
	and related issues
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Dave,

I've been comparing graphs and bandwidth and so forth with flent's
rrul and iperf3, trying to figure out what's going on. Here's my
present understanding of the queuing buffering issues. I sort of
suspect these are issues that might not translate entirely well to the
work you've been doing, but maybe I'm wrong. Here goes...

1. For each peer, there is a separate queue, called peer_queue. Each
peer corresponds to a specific UDP endpoint, which means that a peer
is a "flow".
2. When certain crypto handshake requirements haven't yet been met,
packets pile up in peer_queue. Then when a handshake completes, all
the packets that piled up are released. Because handshakes might take
a while, peer_queue is quite big -- 1024 packets (dropping the oldest
packets when full). In this context, that's not huge buffer bloat, but
rather that's just a queue of packets for while the setup operation is
occurring.
3. WireGuard is a net_device interface, which means it transmits
packets from userspace in softirq. It's advertised as accepting GSO
"super packets", so sometimes it is asked to transmit a packet that is
65k in length. When this happens, it splits those packets up into
MTU-sized packets, puts them in the queue, and then processes the
entire queue at once, immediately after.

If that were the totality of things, I believe it would work quite
well. If the description stopped there, it means packets would be
encrypted and sent immediately in the softirq device transmit handler,
just like how the mac80211 stack does things. The above existence of
peer_queue wouldn't equate to any form of buffer bloat or latency
issues, because it would just act as a simple data structure for
immediately transmitting packets. Similarly, when receiving a packet
from the UDP socket, we _could_ simply just decrypt in softirq, again
like mac80211, as the packet comes in. This makes all the expensive
crypto operations blocking to the initiator of the operation -- the
userspace application calling send() or the udp socket receiving an
encrypted packet. All is well.

However, things get complicated and ugly when we add multi-core
encryption and decryption. We add on to the above as follows:

4. The kernel has a library called padata (kernel/padata.c). You
submit asynchronous jobs, which are then sent off to various CPUs in
parallel, and then you're notified when the jobs are done, with the
nice feature that you get these notifications in the same order that
you submitted the jobs, so that packets don't get reordered. padata
has a hard coded maximum of in-progress operations of 1000. We can
artificially make this lower, if we want (currently we don't), but we
can't make it higher.
5. We continue from the above described peer_queue, only this time
instead of encrypting immediately in softirq, we simply send all of
peer_queue off to padata. Since the actual work happens
asynchronously, we return immediately, not spending cycles in softirq.
When that batch of encryption jobs completes, we transmit the
resultant encrypted packets. When we send those jobs off, it's
possible padata already has 1000 operations in progress, in which case
we get "-EBUSY", and can take one of two options: (a) put that packet
back at the top of peer_queue, return from sending, and try again to
send all of peer_queue the next time the user submits a packet, or (b)
discard that packet, and keep trying to queue up the ones after.
Currently we go with behavior (a).
6. Likewise, when receiving an encrypted packet from a UDP socket, we
decrypt it asynchronously using padata. If there are already 1000
operations in place, we drop the packet.

If I change the length of peer_queue from 1024 to something small like
16, it makes some effect when combined with choice (a) as opposed to
choice (b), but I think this nob isn't so important, and I can leave
it at 1024. However, if I change the length of padata's maximum from
1000 to something small like 16, I immediately get much lower latency.
However, bandwidth suffers greatly, no matter choice (a) or choice
(b). Padata's maximum seems to be the relevant nob. But I'm not sure
the best way to tune it, nor am I sure the best way to interact with
everything else here.

I'm open to all suggestions, as at the moment I'm a bit in the dark on
how to proceed. Simply saying "just throw fq_codel at it!" or "change
your buffer lengths!" doesn't really help me much, as I believe the
design is a bit more nuanced.

Thanks,
Jason
