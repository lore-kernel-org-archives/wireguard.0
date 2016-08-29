Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70662533
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 17:09:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88e44e45
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 17:09:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 232a37f5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 17:09:19 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id b199so105719772lfe.0
 for <wireguard@lists.zx2c4.com>; Mon, 29 Aug 2016 10:16:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
References: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 29 Aug 2016 19:16:04 +0200
Message-ID: <CAHmME9pLBK44L1VzBA2tPsYKsu4YWXNvtXyZBWDDfp+F7qcYuA@mail.gmail.com>
To: Dave Taht <dave.taht@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] fq, ecn, etc with wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Dave,

You're exactly the sort of person I've been hoping would appear during the
last several months. Indeed there's a lot of interesting queueing things
happening with WireGuard. I'll detail them inline below.

> I have been running a set of tinc based vpns for a long time now, and
> based on the complexity of the codebase, and some general flakyness
> and slowness, I am considering fiddling with wireguard for a
> replacement of it. The review of it over on
> https://plus.google.com/+gregkroahhartman/posts/NoGTVYbBtiP?hl=en was
> pretty inspiring.

Indeed this seems to be a very common use case of WireGuard -- replacing
complex userspace things with something fast and simple. You've come to the
right place. :-P

> My principal work is on queueing algorithms (like fq_codel, and cake),
> and what I'm working on now is primarily adding these algos to wifi,
> but I do need a working vpn, and have longed to improve latency and
> loss recovery on vpns for quite some time now.

Great.

>
> A) does wireguard handle ecn encapsulation/decapsulation?
>
> https://tools.ietf.org/html/draft-ietf-tsvwg-ecn-encap-guidelines-07
>
> Doing ecn "right" through vpn with a bottleneck router with a fq_codel
> enabled qdisc allows for zero induced packet loss and good congestion
> control.

At the moment I don't do anything special with DSCP or ECN. I set a high
priority DSCP for the handshake messages, but for the actual transport
packets, I leave it at zero:

https://git.zx2c4.com/WireGuard/tree/src/send.c#n137

This has been a TODO item for quite some time; it's on wireguard.io/roadmap
too. The reason I've left it at zero, thus far, is that I didn't want to
infoleak anything about the underlying data. Is there a case to be made,
however, that ECN doesn't leak data like DSCP does, and so I'd be okay just
copying those top bits? I'll read the IETF draft you sent and see if I can
come up with something. It does have an important utility; you're right.

> B) I see that "noqueue" is the default qdisc for wireguard. What is
> the maximum outstanding queue depth held internally? How is it
> configured? I imagine it is a strict fifo queue, and that wireguard
> bottlenecks on the crypto step and drops on reads... eventually.
> Managing the queue length looks to be helpful especially in the
> openwrt/lede case.
>
> (we have managed to successfully apply something fq_codel-like within
> the mac80211 layer, see various blog entries of mine and the ongoing
> work on the make-wifi-fast mailing list)
>
> So managing the inbound queue for wireguard well, to hold induced
> latencies down to bare minimums when going from 1Gbit to XMbit, and
> it's bottlenecked on wireguard, rather than an external router, is on
> my mind. Got a pretty nice hammer in the fq_codel code, not sure why
> you have noqueue as the default.

There are a couple reasons. Originally I used multiqueue and had a separate
subqueue for each peer. I then abused starting and stopping these subqueues as
the various peers negotiated handshakes. This worked, but it was quite
limiting for a number of reasons, leading me to ultimately switch to noqueue.

Using noqueue gives me a couple benefits. First, packet transmission calls my
xmit function directly, which means I can trivially check for routing loops
using dev_recursion_level(). Second, it allows me to return things like
`-ENOKEY` from the xmit function, which gets directly passed up to userspace,
giving more interesting error messages than ICMP handles (though I also
support ICMP). But the main reason is because it fits the current queuing
design of WireGuard. I'll explain:

A WireGuard device has multiple peers. Either there's an active session for a
peer, in which case the packet can be encrypted and sent, or there isn't, in
which case it's queued up until a session is established. If a peer doesn't
have a session, after queuing up that packet, the session handshake occurs,
and immediately following, the queue is released and the packet is sent. This
has the effect of making WireGuard appear "stateless" to userspace. The
administrator set up all the peer details, and then typed `ping peer`, and
then it just worked. Where did the connection happen? That's what happens
behind scenes in WireGuard. So each peer has its own queue. I limit each queue
to 1024 packets, somewhat arbitrarily. As the queue exceeds 1024, the oldest
packets are dropped first.

There's another hitch: Linux supports "super packets" for GSO. Essentially,
the kernel will hand off a massive TCP packet -- 65k -- to the device driver,
if requested, expecting the device driver to then segment this into MTU-sized
bites. This was designed for hardware that has built-in TCP segmentation and
such. I found it was very performant to do the same with WireGuard. The reason
is that everytime a final encrypted packet is transmitted, it has to traverse
the big complicated Linux networking stack. In order to reduce cache misses, I
prefer to transmit a bunch of packets at once. Please read this LKML post
where I detail this a bit more (Ctrl+F for "It makes use of a few tricks"),
and then return to this email:

http://lkml.iu.edu/hypermail/linux/kernel/1606.3/02833.html

The next thing is that I support parallel encryption, which means encrypting
these bundles of packets is asynchronous.

All these requirements would lead you to think that this is all super
complicated and horrible, but I actually managed to put this together in a
decently simple way. There's the queuing algorithm all together:
https://git.zx2c4.com/WireGuard/tree/src/device.c#n101

1. user sends a packet. xmit() in device.c is called.
2. look up to which peer we're sending this packet.
3. if we have >1024 packets in that peer's queue, remove the oldest ones.
4. segment the super packet into normal MTU-sized packets, and queue those
   up. note that this may allow the queue to temporarily exceed 1024 packets,
   which is fine.
5. try to encrypt&send the entire queue.

There's what step 5 looks like, found in packet_send_queue() in send.c:
https://git.zx2c4.com/WireGuard/tree/src/send.c#n159

1. immediately empty the entire queue, putting it into a local temp queue.
2. if the queue is empty, return. if the queue only has one packet that's
   less than or equal to 256 bytes, don't parallelize it.
3. for each packet in the queue, send it off to the asynchronous encryption
   a. if that returns '-ENOKEY', it means we don't have a valid session, so
      we should initiate one, and then do (b) too.
   b. if that returns '-ENOKEY' or '-EBUSY' (workqueue is at kernel limit),
      we put that packet and all the ones after it from the local queue back
      into the peer's queue.
   c. if we fail for any other reason, we drop that packet, and then keep
      processing the rest of the queue.
4. we tell userspace "ok! sent!"
5. when the packets that were successfully submitted finish encrypting
   (asynchronously), we transmit the encrypted packets in a tight loop
   to reduce cache misses in the networking stack.

That's it! It's pretty basic. I do wonder if this has some problems, and if
you have some suggestions on how to improve it, or what to replace it with.
I'm open to all suggestions here.

One thing, for example, that I haven't yet worked out is better scheduling for
submitting packets to different threads for encryption. Right now I just evenly
distribute them, one by one, and then wait until they're finished. Clearly
better performance could be achieved by chunking them somehow.

> C) One flaw of fq_codel , is that multiplexing multiple outbound flows
> over a single connection endpoint degrades that aggregate flow to
> codel's behavior, and the vpn "flow" competes evenly with all other
> flows. A classic pure aqm solution would be more fair to vpn
> encapsulated flows than fq_codel is.
>
> An answer to that would be to expose "fq" properties to the underlying
> vpn protocol. For example, being able to specify an endpoint
> identifier of 2001:db8:1234::1/118:udp_port would allow for a one to
> one mapping for external fq_codel queues to internal vpn queues, and
> thus vpn traffic would compete equally with non-vpn traffic at the
> router. While this does expose more per flow information, the
> corresponding decrease for e2e latency under load, especially for
> "sparse" flows, like voip and dns, strikes me as a potential major win
> (and one way to use up a bunch of ipv6 addresses in a good cause).
> Doing that "right" however probably involves negotiating perfect
> forward secrecy for a ton of mostly idle channels (with a separate
> seqno base for each), (but I could live with merely having a /123 on
> the task)

Do you mean to suggest that there be a separate wireguard session for each
4-tuple?

> C1) (does the current codebase work with ipv6?)

Yes, very well, out of the box, from day 1. You can do v6-in-v6, v4-in-v4,
v4-in-v6, and v6-in-v4.

> D) my end goal would be to somehow replicate the meshy characteristics
> of tinc, and choosing good paths through multiple potential
> connections, leveraging source specific routing and another layer 3
> routing protocol like babel, but I do grok that doing that right would
> take a ton more work...

That'd be great. I'm trying to find a chance to sit down with the fella behind
Babel one of these days. I'd love to get these working well together.

> Anyway, I'll go off and read some more docs and code to see if I can
> answer a few of these questions myself. I am impressed by what little
> I understand so far.

Great! Let me know what you find. Feel free to find me in IRC (zx2c4 in
#wireguard on freenode) if you'd like to chat about this all in realtime.

Regards,
Jason
