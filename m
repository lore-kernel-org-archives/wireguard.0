Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF72C072A2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Nov 2023 02:05:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78f689f1;
	Mon, 20 Nov 2023 02:05:14 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ebbd5a90
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2023 02:05:12 +0000 (UTC)
Received: janet.servers.dxld.at; Mon, 20 Nov 2023 03:05:06 +0100
Date: Mon, 20 Nov 2023 03:05:01 +0100
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Erin Shepherd <bird-users@erinshepherd.net>,
 Juliusz Chroboczek <jch@irif.fr>
Cc: Alexander Zubkov <green@qrator.net>,
 babel-users@alioth-lists.debian.net, Kyle Rose <krose@krose.org>,
 bird-users@network.cz, wireguard@lists.zx2c4.com
Subject: Re: [Babel-users] [RFC] Replace WireGuard AllowedIPs with IP route
 attribute
Message-ID: <20231120020501.t6jw2k2u42y2ntqt@House.clients.dxld.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <918e1d5b-9f11-4f9c-bf9a-94cb0d41ce2b@app.fastmail.com>
 <871qcn8d5g.wl-jch@irif.fr>
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

Hi Erin, Juliusz,

On Sat, Nov 18, 2023 at 11:21:57AM +0100, Erin Shepherd wrote:
> On Sat, 18 Nov 2023, at 03:19, Daniel Gr=C3=B6ber wrote:
> > That would be a problem as I specifically want to tie the source address
> > filtering to this too. I'll have a look at the internals (if and) when I
> > get around to starting work on this.
>=20
> Is tying source address filtering to the routing table the right thing to
> do here? It seems to me that it would cause issues similar to those we
> see more generally with Unicast Reverse Path Filtering

IMO not providing a way to do source address filtering at the routing level
was the original sin :)

There is certianly the multihoming challange to be overcome as traditional
BCP38 style filtering doesn't cut it in the general case. I have some ideas
on how to deal with this.

I've done some experiments and found that in Linux multi-nexthop routes
actually match reverse path lookups (using nftables "rt") for _any_ of the
source interfaces involved. I think this can be used to build RFC 3704
style Feasible Path Reverse Path Forwarding when the routing daemon
involved supports ECMP.

This experiment is what got me interested in having via-wgpeer in the
routing table in the first place, once we have that we can apply the above
idea not just at the interface level but at the wg peer level. Neat.

Can you think of a use-case where fpRPF isn't enough?

It's also noteworthy that once we have this support for via-wgpeer it'd be
possible to apply ip-rule policy to the filtering decision. Perhaps that
gives some additional power for more fun use-cases :)

On Sat, Nov 18, 2023 at 01:22:03PM +0100, Juliusz Chroboczek wrote:
> Issues are caused by the kernel performing filtering that the routing
> protocol is not aware of: it causes the routing daemon's routing table to
> no longer match the effective forwarding table (the kernel's routing
> table).  That's the reason why uRPF breaks most routing protocols, that's
> the reason why we have trouble making Wireguard work with Babel, and also
> the reason behind https://github.com/jech/babeld/issues/111.

Right on the money as always. This idea has been on my mind too.

> Contrariwise, we can teach Babel to explicitly take into account the
> kernel features that we're interested in using.  Thus, Babel could be
> aware of the restrictions placed on a wireguard interface, and collaborate
> with Wireguard so that the routing table and the forwarding table remain
> congruent.  I haven't looked at the issue in detail, but I believe that
> would be an interesting (short-term) research project, one that I would be
> glad to collaborate with (but not necessarily lead, at least not right no=
w).

Sounds interesting do you have a funding source in mind?

> For the specific case of source address filtering, Babel already has an
> (implemented) extension to deal with source addresses, and I encourage you
> to consider whether it can be used to deal with the issue at hand.  Please
> see https://arxiv.org/pdf/1403.0445.pdf and RFC 9079.

I don't think I mentioned this to you yet, but I have another one of my
crazy ideas of doing something vaguely similar to BGP flowspec with
babel. Restricted to IP source/destination address, so no L4 stuff. I just
want to represent firewall policy using ipv6 subtrees and distribute it in
realtime using babel :)

Unfortunately this is currently stalled due to an apparent nft rt match
kernel bug preventing me from representing multiple possible outcomes since
I want to support dropping, accepting but also stateful firewalling of
matching flows.

--Daniel
