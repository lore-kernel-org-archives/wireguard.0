Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18b763fe
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Aug 2016 21:31:05 +0000 (UTC)
Received: from [192.168.0.38] (p4FF89D18.dip0.t-ipconnect.de [79.248.157.24])
 by v32412.1blu.de (Postfix) with ESMTPSA id 82FFA223F1
 for <wireguard@lists.zx2c4.com>; Sat, 27 Aug 2016 23:37:39 +0200 (CEST)
To: wireguard@lists.zx2c4.com
References: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
From: jens <jens@viisauksena.de>
Message-ID: <1378fb9e-5583-0fc1-a2b6-66f604786e0f@viisauksena.de>
Date: Sat, 27 Aug 2016 23:33:30 +0200
MIME-Version: 1.0
In-Reply-To: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------86750CE156CD5700C79FB0B7"
Subject: Re: [WireGuard] fq, ecn, etc with wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------86750CE156CD5700C79FB0B7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

we have done some tests with wireguard and on top l2tp_v3 and batman-adv
this way batman adv handles the routing.

on monday we may change from our tinc tunnel to this setup.
in test scenarios we got stable 5-600 Mbit on a 1 Gbit cable. Everthing
seem prety stable.


On 27.08.2016 23:03, Dave Taht wrote:
> I have been running a set of tinc based vpns for a long time now, and
> based on the complexity of the codebase, and some general flakyness
> and slowness, I am considering fiddling with wireguard for a
> replacement of it. The review of it over on
> https://plus.google.com/+gregkroahhartman/posts/NoGTVYbBtiP?hl=en was
> pretty inspiring.
>
> My principal work is on queueing algorithms (like fq_codel, and cake),
> and what I'm working on now is primarily adding these algos to wifi,
> but I do need a working vpn, and have longed to improve latency and
> loss recovery on vpns for quite some time now.
>
> A) does wireguard handle ecn encapsulation/decapsulation?
>
> https://tools.ietf.org/html/draft-ietf-tsvwg-ecn-encap-guidelines-07
>
> Doing ecn "right" through vpn with a bottleneck router with a fq_codel
> enabled qdisc allows for zero induced packet loss and good congestion
> control.
>
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
>
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
>
> C1) (does the current codebase work with ipv6?)
>
> D) my end goal would be to somehow replicate the meshy characteristics
> of tinc, and choosing good paths through multiple potential
> connections, leveraging source specific routing and another layer 3
> routing protocol like babel, but I do grok that doing that right would
> take a ton more work...
>
> Anyway, I'll go off and read some more docs and code to see if I can
> answer a few of these questions myself. I am impressed by what little
> I understand so far.
>

-- 
make the world nicer, please use PGP encryption


--------------86750CE156CD5700C79FB0B7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>we have done some tests with wireguard and on top l2tp_v3 and
      batman-adv<br>
      this way batman adv handles the routing.<br>
    </p>
    <p>on monday we may change from our tinc tunnel to this setup. <br>
      in test scenarios we got stable 5-600 Mbit on a 1 Gbit cable.
      Everthing seem prety stable.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 27.08.2016 23:03, Dave Taht wrote:<br>
    </div>
    <blockquote
cite="mid:CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com"
      type="cite">
      <pre wrap="">I have been running a set of tinc based vpns for a long time now, and
based on the complexity of the codebase, and some general flakyness
and slowness, I am considering fiddling with wireguard for a
replacement of it. The review of it over on
<a class="moz-txt-link-freetext" href="https://plus.google.com/+gregkroahhartman/posts/NoGTVYbBtiP?hl=en">https://plus.google.com/+gregkroahhartman/posts/NoGTVYbBtiP?hl=en</a> was
pretty inspiring.

My principal work is on queueing algorithms (like fq_codel, and cake),
and what I'm working on now is primarily adding these algos to wifi,
but I do need a working vpn, and have longed to improve latency and
loss recovery on vpns for quite some time now.

A) does wireguard handle ecn encapsulation/decapsulation?

<a class="moz-txt-link-freetext" href="https://tools.ietf.org/html/draft-ietf-tsvwg-ecn-encap-guidelines-07">https://tools.ietf.org/html/draft-ietf-tsvwg-ecn-encap-guidelines-07</a>

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

</pre>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption</pre>
  </body>
</html>

--------------86750CE156CD5700C79FB0B7--
