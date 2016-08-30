Return-Path: dave.taht@gmail.com
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
 [209.85.214.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63d06823
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Aug 2016 00:18:06 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id n75so12564298ith.0
 for <wireguard@lists.zx2c4.com>; Mon, 29 Aug 2016 17:24:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pLBK44L1VzBA2tPsYKsu4YWXNvtXyZBWDDfp+F7qcYuA@mail.gmail.com>
References: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
 <CAHmME9pLBK44L1VzBA2tPsYKsu4YWXNvtXyZBWDDfp+F7qcYuA@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Mon, 29 Aug 2016 17:24:54 -0700
Message-ID: <CAA93jw6rgkNB6ieGE6cmH4=2d3frSgEj=-SQYdahoJUeHK59zQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

:whew:

On Mon, Aug 29, 2016 at 10:16 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
> Hey Dave,
>
> You're exactly the sort of person I've been hoping would appear during th=
e
> last several months.

The bufferbloat project has had a lot of people randomly show up at
the party to make a contribution, getting a little PR in the right
places always helps. Glad to have shown up,
am sorry to be so scattered today and not reviewing detailed code.

>> A) does wireguard handle ecn encapsulation/decapsulation?
>>
>> https://tools.ietf.org/html/draft-ietf-tsvwg-ecn-encap-guidelines-07
>>
>> Doing ecn "right" through vpn with a bottleneck router with a fq_codel
>> enabled qdisc allows for zero induced packet loss and good congestion
>> control.
>
> At the moment I don't do anything special with DSCP or ECN. I set a high
> priority DSCP for the handshake messages, but for the actual transport
> packets, I leave it at zero:
>
> https://git.zx2c4.com/WireGuard/tree/src/send.c#n137
>
> This has been a TODO item for quite some time; it's on wireguard.io/roadm=
ap
> too. The reason I've left it at zero, thus far, is that I didn't want to
> infoleak anything about the underlying data. Is there a case to be made,
> however, that ECN doesn't leak data like DSCP does, and so I'd be okay ju=
st
> copying those top bits? I'll read the IETF draft you sent and see if I ca=
n
> come up with something. It does have an important utility; you're right.

The ietf consensus was that a 2 bit covert channel wasn't useful and
that being able to expose congestion control information was ok.

>> B) I see that "noqueue" is the default qdisc for wireguard. What is
>> the maximum outstanding queue depth held internally? How is it
>> configured? I imagine it is a strict fifo queue, and that wireguard
>> bottlenecks on the crypto step and drops on reads... eventually.
>> Managing the queue length looks to be helpful especially in the
>> openwrt/lede case.
>>
>> (we have managed to successfully apply something fq_codel-like within
>> the mac80211 layer, see various blog entries of mine and the ongoing
>> work on the make-wifi-fast mailing list)
>>
>> So managing the inbound queue for wireguard well, to hold induced
>> latencies down to bare minimums when going from 1Gbit to XMbit, and
>> it's bottlenecked on wireguard, rather than an external router, is on
>> my mind. Got a pretty nice hammer in the fq_codel code, not sure why
>> you have noqueue as the default.
>
> There are a couple reasons. Originally I used multiqueue and had a separa=
te
> subqueue for each peer. I then abused starting and stopping these subqueu=
es as
> the various peers negotiated handshakes. This worked, but it was quite
> limiting for a number of reasons, leading me to ultimately switch to noqu=
eue.
>
> Using noqueue gives me a couple benefits. First, packet transmission call=
s my
> xmit function directly, which means I can trivially check for routing loo=
ps
> using dev_recursion_level(). Second, it allows me to return things like
> `-ENOKEY` from the xmit function, which gets directly passed up to usersp=
ace,
> giving more interesting error messages than ICMP handles (though I also
> support ICMP). But the main reason is because it fits the current queuing
> design of WireGuard. I'll explain:
>
> A WireGuard device has multiple peers. Either there's an active session f=
or a
> peer, in which case the packet can be encrypted and sent, or there isn't,=
 in
> which case it's queued up until a session is established. If a peer doesn=
't
> have a session, after queuing up that packet, the session handshake occur=
s,
> and immediately following, the queue is released and the packet is sent. =
This
> has the effect of making WireGuard appear "stateless" to userspace. The
> administrator set up all the peer details, and then typed `ping peer`, an=
d
> then it just worked. Where did the connection happen? That's what happens
> behind scenes in WireGuard. So each peer has its own queue. I limit each =
queue
> to 1024 packets, somewhat arbitrarily. As the queue exceeds 1024, the old=
est
> packets are dropped first.

OK, well, 1024 packets is quite a lot. Assuming TSO is in use, running
at  10Mbit for the sake of example, that's a worst case latency of ~85
*seconds* at that speed, and 98,304,000 bytes of buffering.

Even 1024 packets is a lot at a gbit, when TSO/GRO are in use, 850ms.
Devices that use soft GRO can also accumulate up to 64K packets,
although the spec is 24k, several devices violate it.

Thankfully TSO and GRO are not always invoked and that our use of fq,
tends to start reducing the maximally sized burst at the endpoints to
reasonable values - like 2 superpackets.

But, even if you only have 1024 normal sized packets, that's a worst
case delay of 1.5 seconds...

Now, there is no "right number" for buffering, but various rules of
thumb. What we like about the new AQM designs (codel and pie) is that
they try to establish a minimal "standing queue", measured in time
(which is a proxy for bytes), not packets - 5ms in the case of codel,
16 in the case of pie.

and they do it dynamically, based on induced latency. A typical figure
for codel's standing queue at 10 mbit is *2* full size packets,
moderated a bit by whatever BQL sets, which is 2-3k bytes.

There's several great papers/presentations on codel in acm queue, and
I'm pretty fond of Van's, my and stephen hemmingers talks on the
subject, linked to off of here:

https://www.bufferbloat.net/projects/cerowrt/wiki/Bloat-videos/

Anyway, having a shared queue for  all peers would more more sensible,
and limiting it by bytes
rather than packets (as cake does), helpful. Trying to come up with a
better initial estimate for how big the queue should be based on what
outgoing interfaces are available (e.g. is a gigE interface available?
10GigE), and then be moderated by the aqm.

>
> There's another hitch: Linux supports "super packets" for GSO. Essentiall=
y,
> the kernel will hand off a massive TCP packet -- 65k -- to the device dri=
ver,
> if requested, expecting the device driver to then segment this into MTU-s=
ized
> bites. This was designed for hardware that has built-in TCP segmentation =
and
> such. I found it was very performant to do the same with WireGuard. The r=
eason
> is that everytime a final encrypted packet is transmitted, it has to trav=
erse
> the big complicated Linux networking stack. In order to reduce cache miss=
es, I
> prefer to transmit a bunch of packets at once.

Well, we also break up superpackets in cake, but we do it with the
express intent of allowing other flows through. Staying with my 10Mbit
example, a single 64k superpacket would 54ms to transmit, which blows
the jitter budget on a competing voip call.

I'm painfully aware that this costs cpu, but having shorter queues in
the first place helps, and we have experimented with breaking up
superpackets less based on the workload and bandwidth, in cake, but
haven't settled on a scheme to do so.

> Please read this LKML post
> where I detail this a bit more (Ctrl+F for "It makes use of a few tricks"=
),
> and then return to this email:
>
> http://lkml.iu.edu/hypermail/linux/kernel/1606.3/02833.html
>
> The next thing is that I support parallel encryption, which means encrypt=
ing
> these bundles of packets is asynchronous.

All packets in the broken up superpacket are handed to be encrypted in
parallel? cool.

Can I encourage you to try the rrul test and think about encrypting
different flows in parallel also? :)

real network traffic, particularly over a network to network oriented
vpn is *never* a single bulk flow.

> All these requirements would lead you to think that this is all super
> complicated and horrible, but I actually managed to put this together in =
a
> decently simple way. There's the queuing algorithm all together:
> https://git.zx2c4.com/WireGuard/tree/src/device.c#n101
>
> 1. user sends a packet. xmit() in device.c is called.
> 2. look up to which peer we're sending this packet.
> 3. if we have >1024 packets in that peer's queue, remove the oldest ones.

More than 200 is really a crazy number for a fixed length fifo at 1gbit or =
less.

> 4. segment the super packet into normal MTU-sized packets, and queue thos=
e
>    up. note that this may allow the queue to temporarily exceed 1024 pack=
ets,
>    which is fine.
> 5. try to encrypt&send the entire queue.
>
> There's what step 5 looks like, found in packet_send_queue() in send.c:
> https://git.zx2c4.com/WireGuard/tree/src/send.c#n159
>
> 1. immediately empty the entire queue, putting it into a local temp queue=
.
> 2. if the queue is empty, return. if the queue only has one packet that's
>    less than or equal to 256 bytes, don't parallelize it.
> 3. for each packet in the queue, send it off to the asynchronous encrypti=
on
>    a. if that returns '-ENOKEY', it means we don't have a valid session, =
so
>       we should initiate one, and then do (b) too.
>    b. if that returns '-ENOKEY' or '-EBUSY' (workqueue is at kernel limit=
),
>       we put that packet and all the ones after it from the local queue b=
ack
>       into the peer's queue.
>    c. if we fail for any other reason, we drop that packet, and then keep
>       processing the rest of the queue.
> 4. we tell userspace "ok! sent!"
> 5. when the packets that were successfully submitted finish encrypting
>    (asynchronously), we transmit the encrypted packets in a tight loop
>    to reduce cache misses in the networking stack.
>
> That's it! It's pretty basic. I do wonder if this has some problems, and =
if
> you have some suggestions on how to improve it, or what to replace it wit=
h.
> I'm open to all suggestions here.

Well the idea of fq_codel is to break things up into 1024 different
flows. The code base is now generalized so that it can be used by the
fq_codel qdisc and the new stuff for mac80211.

But! The concept of those flows is still serialized in the end in this
codebase, you need to keep pulling stuff out of it until you are
done... using merely the idea of fq_codel and explicitly parallizing
enqueuing would let you defer nexthop lookup and handle multiple flows
in parallel on multiple cpus.

> One thing, for example, that I haven't yet worked out is better schedulin=
g for
> submitting packets to different threads for encryption. Right now I just =
evenly
> distribute them, one by one, and then wait until they're finished. Clearl=
y
> better performance could be achieved by chunking them somehow.

Better crypto performance, not network performance. :) The war between
bulking up stuff to save cpu and breaking things back down again into
packets so packet theory actually works, is ongoing.

>> C) One flaw of fq_codel , is that multiplexing multiple outbound flows
>> over a single connection endpoint degrades that aggregate flow to
>> codel's behavior, and the vpn "flow" competes evenly with all other
>> flows. A classic pure aqm solution would be more fair to vpn
>> encapsulated flows than fq_codel is.
>>
>> An answer to that would be to expose "fq" properties to the underlying
>> vpn protocol. For example, being able to specify an endpoint
>> identifier of 2001:db8:1234::1/118:udp_port would allow for a one to
>> one mapping for external fq_codel queues to internal vpn queues, and
>> thus vpn traffic would compete equally with non-vpn traffic at the
>> router. While this does expose more per flow information, the
>> corresponding decrease for e2e latency under load, especially for
>> "sparse" flows, like voip and dns, strikes me as a potential major win
>> (and one way to use up a bunch of ipv6 addresses in a good cause).
>> Doing that "right" however probably involves negotiating perfect
>> forward secrecy for a ton of mostly idle channels (with a separate
>> seqno base for each), (but I could live with merely having a /123 on
>> the task)
>
> Do you mean to suggest that there be a separate wireguard session for eac=
h
> 4-tuple?

Sorta. Instead, you can share a IV seqno among these these queues so
long as your replay protection buffer is big enough relative to the
buffering and RTT, no need to negotiate a separate connection for
each. Then you are semi-serializing the seqno access/increment, but
that's not a big issue.

There are issues with hole punching on this, regardless, and I wasn't
suggesting even trying for ipv4! But we have a deployment window for
ipv6 where we could have fun using up tons of addresses for a noble
purpose (0 latency for sparse flows!), and routing a set of 1024
addresses into a vpn's endpoint design is possible with your
architecture. Linode gives me a 4096 to play with - comcast, a /60 or
/56....

Have you seen the mosh-multipath paper?, which sort of ties into your
design as well, except that as you are creating a routable device,
makes listening on a ton of ip addresses a snap....

https://arxiv.org/pdf/1502.02402.pdf

>> C1) (does the current codebase work with ipv6?)
>
> Yes, very well, out of the box, from day 1. You can do v6-in-v6, v4-in-v4=
,
> v4-in-v6, and v6-in-v4.

I tried to get it going yesterday, ipv6 to ipv6, but failed with 4 tx
errors on one side and 3 on the other, reported by ifconfig, no error
messages. I'll try harder once I come down from fixing up the fq_codel
wifi code....

>> D) my end goal would be to somehow replicate the meshy characteristics
>> of tinc, and choosing good paths through multiple potential
>> connections, leveraging source specific routing and another layer 3
>> routing protocol like babel, but I do grok that doing that right would
>> take a ton more work...
>
> That'd be great. I'm trying to find a chance to sit down with the fella b=
ehind
> Babel one of these days. I'd love to get these working well together.

Juliusz hangs out on #babel on freenode, paris time.

batman-adv is also a good choice, and bmx7 has some nice
characteristics. I'm mostly familiar with babel - can you carry ipv6
link layer multicast? (if not, we've been nagging julius to add a
unicast only mode)

One common use case for babel IS to manage a set of gre tunnels, for
which wireguard could be a drop in replacement for. You set up 30
tunnels to everywhere that can all route to everywhere, and let babel
figure out the right one. It should be reasonably robust in the face
of nuclear holocost, a zombie invasion, or the upcoming US election.

https://tools.ietf.org/html/draft-jonglez-babel-rtt-extension-01

BTW:

To what extent would source specific routing help solve your oif issue?

https://arxiv.org/pdf/1403.0445.pdf

we use that extensively to do things that we used to do with policy
routing, and it's a snap to use... and nearly all device's we've
played with are built with IPv6 subtrees.

but it's an ipv6 only feature, getting that into ipv4 would be nice.

>
>> Anyway, I'll go off and read some more docs and code to see if I can
>> answer a few of these questions myself. I am impressed by what little
>> I understand so far.
>
> Great! Let me know what you find. Feel free to find me in IRC (zx2c4 in
> #wireguard on freenode) if you'd like to chat about this all in realtime.
>
> Regards,
> Jason



--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
