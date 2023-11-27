Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F6CC4167B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Nov 2023 14:19:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 533f2446;
	Mon, 27 Nov 2023 14:19:30 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3f11fc67
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2023 14:19:27 +0000 (UTC)
Received: janet.servers.dxld.at; Mon, 27 Nov 2023 15:19:27 +0100
Date: Mon, 27 Nov 2023 15:19:24 +0100
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Thomas Brierley <tomxor@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Wg fragment packet blackholing issue (Was: [PATCH] wg-quick: linux:
 fix MTU calculation (use PMTUD))
Message-ID: <20231127141924.txr6kdhtk6ainrur@House.clients.dxld.at>
References: <20231029192210.120316-1-tomxor@gmail.com>
 <20231120011701.asllvpzuffih34wz@House.clients.dxld.at>
 <CAHTdPdd0o-w27DuaRk9C4chP=nCNEE=J3oJDUaB0+zsv91yGNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHTdPdd0o-w27DuaRk9C4chP=nCNEE=J3oJDUaB0+zsv91yGNQ@mail.gmail.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Tom,

On Thu, Nov 23, 2023 at 03:33:39AM +0000, Thomas Brierley wrote:
> On Mon, 20 Nov 2023 at 01:17, Daniel Gröber <dxld@darkboxed.org> wrote:
> 
> > > because this only queries the routing cache.  To
> > > trigger PMTUD on the endpoint and fill this cache, it is necessary to
> > > send an ICMP with the DF bit set.
> >
> > I don't think this is useful. Path MTU may change, doing this only once
> > when the interface comes up just makes wg-quick less predictable IMO.
> 
> Yes, I understand PMTU may change, usually when changing internet
> connection. 

Just to make sure you understand the distinction, PMTU may change at any
time. It's a property of the *path* IP packets take to get to their
destination, specifically the minimimum *link* MTU involved in forwarding
your packet on the routers along the path.

> > > 2. Consider IPv6/4 Header Size
> > >
> > > Currently an 80 byte header size is assumed i.e. IPv6=40 + WireGuard=40.
> > > However this is not optimal in the case of IPv4. Since determining the
> > > IP header size is required for PMTUD anyway, this is now optimised as a
> > > side effect of endpoint MTU calculation.
> >
> > This is not a good idea. Consider what happens when a peer roams from an
> > IPv4 to a IPv6 endpoint address. It's better to be conservative and assume
> > IPv6 sized overhead, besides IPv4 is legacy anyway ;)
> 
> MTU calculation is performed independently for each endpoint

I think you misunderstand, this is not about different peers having
different endpoint IPs, it's about one peer (say a laptop) moving from an
IPv4 network to an IPv6 one. In this case doing the PMTU "optimization" on
the v4 one would cause fragmentation on the v6 network.

> > "function correctly". Do note that WireGuard lets it's UDP packets be
> > fragmented. So connectivity will still work even when the wg device MTU
> > doesn't match the (current) PMTU. The only downsides to this mismatch being
> > performance:
> >
> >  - additional header overhead for fragments,
> >  - less than half max packets-per-second performance and
> >  - additional lateny for tunnel packets hit by IPv6 PMTU discovery
> >
> >    I was surprised to learn that this would happen periodically, every time
> >    the PMTU cache expires. Seems inherent in the IPv6 design as there's no
> >    way (AFAICT) for the kernel to validate the PMTU before the cache
> >    expires (like is done for NDP for example).
> 
> So, the reason I ended up tinkering with WireGuard MTU is due to real
> world reliability issues. Although the risk in setting it optimally
> based on PMTU remains unclear to me, marginal performance gains are not
> what brought me here. Networking is not my area of expertise, so the
> best I can do is lay out my experience and see if you think it adds any
> weight in favour of this change in behaviour, because I haven't done a
> full root cause analysis:
> 
> I found that browsing the web over WireGuard with an MTU set larger than
> the PMTU resulted in randomly stalled HTTP requests. This is noticeable
> even with a single stalled HTTP request due to the HTTP 1.1 head of line
> blocking issue. I tested this manually with individual HTTP requests
> with a large enough payload, verifying that it only occurs over
> WireGuard connections.

Hanging TCP/HTTP connections is a typical symptom of broken IP
fragmentation, there's a number of possible causes. There's a browser based
test for the common issues here (thanks majek):

  http://icmpcheck.popcount.org/   (IPv4)
  http://icmpcheck6.popcount.org/  (IPv6)

Try it (without any active VPNs or tunnels obv.) to see if your internet
provider's network is fundamentally broken. Note: The IPv6 test can give
wrong results for networks deploying DNS64+NAT64. To make sure this doesn't
affect you you should ensure ipv4only.arpa fails to resolve. Expected:

    $ getent ahostsv6 ipv4only.arpa; echo rv=$?
    rv=2

If broken fragmentation is the root problem you can work around this in a
number of ways. The easiest is probably by implementing TCP MSS clamping on
your gateway or host(s).

> With naked HTTP/TCP the network seems happy, I assume it is fragmenting
> packets; but over WireGuard, somehow, some packets just seem to get
> dropped. Maybe UDP is getting treated differently

That's entirely possible. UDP is (unfortunately) commonly abused for DDoS
and so network operators may filter it in desperation and pray no customer
notices. So it's up to you to notice, complain loudly and switch providers
if all else fails :)

> or maybe what's actually happening is the network is blackholing in both
> cases but PMTUD is figuring this out in the case of TCP (RFC 2923), and
> maybe that stops working when encapsulated in UDP?...

PMTUD is independent of the L4 protocol so it normally works either way,
but that always assumes your network operatior is doing their job
correctly. It's possible to filter (eg.) only ICMP-PTB errors involving UDP
packets. While this sounds pointless to me it could be some attempt at UDP
fragment attack DDoS mitigation.

Speaking of RFC 2923, another possible workaround is enabling RFC 4821
(Packetization Layer PMTU) behaviour on your hosts, but MSS clamping has
the advantage of letting you control this on a gateway i.e. without
touching (all) your hosts.

> This behaviour is probably network operator dependent, or specific to
> LTE networks, which I use for permanent internet access, and which
> commonly use a lower than average MTU. For example my current ISP uses
> 1380, and the current wg-quick behaviour is to set the MTU to the
> default route interface MTU less 80 bytes (1420 for regular interfaces),
> which results in the above behaviour.
> 
> I've used all four of the major mobile network operators in my country
> and experienced this on two of them (separate physical networks, not
> virtual operators). The other two used an MTU of 1500 anyway.
> 
> Just to prove I'm not entirely on my own, this issue also appears to be
> known to WireGuard VPN providers, .e.g from Mullvad's FAQ:

I have no doubt the problem you're facing is real, depending on the results
from the test above you may just be complaining to the wrong party ;)

Happy to help you figure out how to work around any ISP bullshit once we
figure out what it is that's happening.

--Daniel
