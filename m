Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D84EE49A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Aug 2023 21:27:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1233cb3;
	Sat, 19 Aug 2023 21:24:05 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 734de1b3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Aug 2023 21:24:03 +0000 (UTC)
Received: janet.servers.dxld.at; Sat, 19 Aug 2023 23:24:02 +0200
Date: Sat, 19 Aug 2023 23:23:57 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Steffen Vogel <post@steffenvogel.de>
Cc: wireguard@lists.zx2c4.com, bird-users@network.cz,
 babel-users@alioth-lists.debian.net
Subject: Re: [Babel-users] [RFC] Replace WireGuard AllowedIPs with IP route
 attribute
Message-ID: <20230819212357.lkshcpslkgbeaq4e@House.clients.dxld.at>
References: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
 <4b-64e11f80-13-5e880900@8744214>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4b-64e11f80-13-5e880900@8744214>
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

Hi Steffen,

from the questions you ask I fear you've misunderstood my intention to
"replace" AllowedIPs. I'm strictly talking of the _implementation_
(allowedips.c) in Linux particular. The netlink interface would naturally
stay unchanged.

On Sat, Aug 19, 2023 at 10:00:17PM +0200, Steffen Vogel wrote:
> Interesting ideas! I am wondering if this complexity is really necessary?

I think so, right now wg's behaviour just prevents a number of advanced
use-cases which is a pitty.

> My biggest concern about the introduction of a route attribute is that
> this adds complexity for users.  WireGuard's simplicity (and portability)
> have been important factors for its success.

Nothing would change for users that don't use this feature.

> A route attribute would introduce another source for the crypto-routing
> peer selection process.  What happens if the two mechanisms select
> different peers? Which one would have precedence?

If you read my previous mail carefully you'll find I specified how this
would shake out. The rt approach will necessarily have to override
AllowedIPs to be useful.

> Similarly also for incoming packets. WireGuard's current principle is
> really easy to understand. If the source address in in the peers
> AllowedIP list, we will accept the packet. If not its discarded. This is
> a central part of WireGuard's crypto-key routing feature which would
> become more complex.

Having read Kyle's use-case I'm thinking my original plan to extend the wg
internal source-address filtering to use a rt lookup with our new attribute
would not be maximally useful so now my thinking is we should just have a
boolean toggle to disable it explicitly per device.

Then users can do whatever fancy rt (reverse-path) lookups they want with
nft. I'm particularly happy that nft rt lookups will actually do the right
thing with multipath/ECMP routes (any of the involved devices satisfies the
lookup) so this should actually work out fine in my case at least. Mmore
prototyping is required here though.

> A second concern I have with the use of route attributes is limited
> portability. Not all platforms support them.  How do we handle WireGuard
> userspace implementations?

No need. The Linux's rt table is Linux specific I have no plans to
introduce this on other platforms, that's for other intersted souls to
tackle. Again "replace" was referring to implementation concerns.

> - Networks which are found in a Peers AllowedIP list will be installed as a kernel route

That's configurable. I always turn this off when dealing with rt daemons.

> - Kernel routes with the peers unique IP address as next-hop will be added to the Peers AllowedIPs list.
> 
> This rather simple feature allows user to pair cunicu with a software
> routing daemon like Bird2 while using a single WireGuard interface with
> multiple peer-to-peer links.

Sounds like you do what I want to do at kernel level in userspace, then at
least we can agree this is a useful thing :)

> In my setup a periodic synchronization worked fine. But I agree that it
> would be nice if we could have a Netlink multicast group for subscribing
> to changes like we also have for other parts of the Linux network stack
> like routing tables, or link states. This feature was already discussed
> on the WireGuard mailing list [7]. But unfortunately the patch was never
> accepted. Maybe we can revisit this patch?

Sounds like a plan, I'll have a look at it.

> [1] Others planned features are:
> - IP-autoconfiguration by deriving link-local addresses from peers public keys

That's been discussed so many times before on the ML and someone always
realises Jason is right and there's no point to this in the end. Key
distribution is the crux of the problem.

--Daniel
