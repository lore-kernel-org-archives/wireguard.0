Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E98EE49A6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Aug 2023 19:16:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77b1bdb5;
	Sat, 19 Aug 2023 19:16:37 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d103385e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Aug 2023 19:16:35 +0000 (UTC)
Received: janet.servers.dxld.at; Sat, 19 Aug 2023 21:16:35 +0200
Date: Sat, 19 Aug 2023 21:16:32 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Nathaniel Filardo <nwfilardo@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: IPv6-only flag set on v6 sockets prevents the use of v4-mapped
 addresses
Message-ID: <20230819191632.hjwjyan5kiz6gwyu@House.clients.dxld.at>
References: <CAKsvP2ZcqUvFD5g6vMxZrv7Z5+YAmoGBAh7zf8iZPPRE6LNEDg@mail.gmail.com>
 <20230819072245.bj7giu7lk4zqib2h@House.clients.dxld.at>
 <CAKsvP2Zo-P1Z3VeF9KC+cwgE99Y0as9C--0a+vKyPRCb95Bp4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKsvP2Zo-P1Z3VeF9KC+cwgE99Y0as9C--0a+vKyPRCb95Bp4Q@mail.gmail.com>
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

Hi Nathaniel,

On Sat, Aug 19, 2023 at 05:34:00PM +0100, Nathaniel Filardo wrote:
> DNS absolutely can and does

I mean I can (and used to) enter fe80::/64 link local addressess into DNS
but it turns out this is actually forbidden by the RFCs but nothing will
stop you. I'm not convinced putting ::ffff: into DNS is a legitimate
use-case given that it it entirely up to an application whether it uses the
IPV6_V6ONLY socket option or dual-stack sockets instead as you've
noticed. This is supported by my reading of RFC4038.

I checked RFC4291/5156 for mentions of how IPv4-mapped v6 addresses are to
be treated but they don't mention any restrictions. So I guess it's up to
us to decide whether it's a legitimate use-case or not. Unless anyone else
has a reference to the contrary?

> In my use case they arise because I have scripts that take wireguard peer
> addresses and register them with my DNS service provider, and it's
> simpler to update a single AAAA record per peer regardless of address
> family than it is to switch between having an AAAA and A record for the
> name.
> 
> At the very least, the radio silence after the kernel accepts a
> v4-mapped v6 address is unexpected behavior.

Not really, in networking traffic black holes are pretty common. I'd expect
the ::ffff:0.0.0.0/96 traffic to get sent via the default route and being
filtered somewhere. Expected behaviour, some people might want to use
::ffff:0.0.0.0/96 as their NAT64 prefix for example. Though that might be
ill advised when a standardized local prefix exists ;)

> More generally, I don't see what good setting the v6only flag here is
> doing (in fact, that's true in general; there are very few
> circumstances, and most of those are for *listening* sockets, where
> v6only seems remotely sensible; the v4 to v6 migration is such a
> mess), so "the established wg behavior" makes no sense to me.

What you're probably not seeing is that there's a technical reason wg
doesn't use a single socket: The code currently supports CONFIG_IPV6 not
being set, so then it can't rely on being able to create a v6 socket! The
way it's written it's just easier to have two sockets and not switch
between v4-only and v6-mapped sockets.

I'm a IPv6-only-or-bust kind of guy so IMO we should just mandate
CONFIG_IPV6 and get rid of a whole bunch of legacy IPv4 code (yey), but
eh. someones probably going to complain about code-size for their v4-only
legacy use-case then :]

> (It's also plausibly true that I'm the first to *notice* this aspect
> of the established behavior!)

You're not, I noticed too when I was working-around the lack of the
AddressFamily= option with a PostUp= script using `getent ahostsv6` and
while the additional `| sed -n '/^::ffff:/d;s/\s*DGRAM.*$//p'` pushed the
PostUp= line over 80 characters I don't consider it an overly onerous
requirement :)

> In any case, in decreasing order of preference, I'd suggest:
> 1. Drop the v6only flag on peer sockets and allow the kernel speak to
> v4-mapped v6 addresses.
> 2. I missed something and v6only does serve a purpose; add special
> handling for v4-mapped v6 addresses to the wg kernel interface,
> bending them into v4 sockaddrs internally.
> 3. For some reason 2 isn't acceptable either, so add special handling
> to the wg userspace tools and do the transmogrification there.
> 4. For some reason none of that is tolerable, so have the kernel
> reject v4-mapped v6 addresses rather than silently accept them and
> fail to speak.

I don't like any of those. The way I see it your DynDNS approach is broken
please use the appropriate rrtype for each address-family. Note my opinion
is not authoritive here, Jason likely has the final say or, recently, more
likely lack of say ;)

In userspace we ask getaddrinfo() not to return v4-mapped addressess by
having AI_V4MAPPED unset, unfortunately this doesn't work when you enter
those addresses into DNS (a libc bug perhaps? *hint* *hint*). I would
suggest filtering them on our side if they get returned anyway and emitting
a warning so this is less of a stumbling block for the next poor soul.

I do wonder what the behavoir of the other wg implementations is on this
point, if it's inconsistent with the kernel impl. that's even more reason
to warn about it.

--Daniel
