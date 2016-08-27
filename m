Return-Path: dave.taht@gmail.com
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
 [209.85.214.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb24b1ad
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Aug 2016 20:57:23 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id x131so48199159ite.0
 for <wireguard@lists.zx2c4.com>; Sat, 27 Aug 2016 14:03:58 -0700 (PDT)
MIME-Version: 1.0
From: Dave Taht <dave.taht@gmail.com>
Date: Sat, 27 Aug 2016 14:03:56 -0700
Message-ID: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset=UTF-8
Subject: [WireGuard] fq, ecn, etc with wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I have been running a set of tinc based vpns for a long time now, and
based on the complexity of the codebase, and some general flakyness
and slowness, I am considering fiddling with wireguard for a
replacement of it. The review of it over on
https://plus.google.com/+gregkroahhartman/posts/NoGTVYbBtiP?hl=3Den was
pretty inspiring.

My principal work is on queueing algorithms (like fq_codel, and cake),
and what I'm working on now is primarily adding these algos to wifi,
but I do need a working vpn, and have longed to improve latency and
loss recovery on vpns for quite some time now.

A) does wireguard handle ecn encapsulation/decapsulation?

https://tools.ietf.org/html/draft-ietf-tsvwg-ecn-encap-guidelines-07

Doing ecn "right" through vpn with a bottleneck router with a fq_codel
enabled qdisc allows for zero induced packet loss and good congestion
control.

B) I see that "noqueue" is the default qdisc for wireguard. What is
the maximum outstanding queue depth held internally? How is it
configured? I imagine it is a strict fifo queue, and that wireguard
bottlenecks on the crypto step and drops on reads... eventually.
Managing the queue length looks to be helpful especially in the
openwrt/lede case.

(we have managed to successfully apply something fq_codel-like within
the mac80211 layer, see various blog entries of mine and the ongoing
work on the make-wifi-fast mailing list)

So managing the inbound queue for wireguard well, to hold induced
latencies down to bare minimums when going from 1Gbit to XMbit, and
it's bottlenecked on wireguard, rather than an external router, is on
my mind. Got a pretty nice hammer in the fq_codel code, not sure why
you have noqueue as the default.

C) One flaw of fq_codel , is that multiplexing multiple outbound flows
over a single connection endpoint degrades that aggregate flow to
codel's behavior, and the vpn "flow" competes evenly with all other
flows. A classic pure aqm solution would be more fair to vpn
encapsulated flows than fq_codel is.

An answer to that would be to expose "fq" properties to the underlying
vpn protocol. For example, being able to specify an endpoint
identifier of 2001:db8:1234::1/118:udp_port would allow for a one to
one mapping for external fq_codel queues to internal vpn queues, and
thus vpn traffic would compete equally with non-vpn traffic at the
router. While this does expose more per flow information, the
corresponding decrease for e2e latency under load, especially for
"sparse" flows, like voip and dns, strikes me as a potential major win
(and one way to use up a bunch of ipv6 addresses in a good cause).
Doing that "right" however probably involves negotiating perfect
forward secrecy for a ton of mostly idle channels (with a separate
seqno base for each), (but I could live with merely having a /123 on
the task)

C1) (does the current codebase work with ipv6?)

D) my end goal would be to somehow replicate the meshy characteristics
of tinc, and choosing good paths through multiple potential
connections, leveraging source specific routing and another layer 3
routing protocol like babel, but I do grok that doing that right would
take a ton more work...

Anyway, I'll go off and read some more docs and code to see if I can
answer a few of these questions myself. I am impressed by what little
I understand so far.

--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
