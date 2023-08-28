Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14535C83F11
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 28 Aug 2023 16:07:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15af0864;
	Mon, 28 Aug 2023 16:07:15 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a41a2e91
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Aug 2023 16:07:13 +0000 (UTC)
Received: janet.servers.dxld.at; Mon, 28 Aug 2023 18:07:11 +0200
Date: Mon, 28 Aug 2023 18:07:05 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Kyle Rose <krose@krose.org>
Cc: Steffen Vogel <post@steffenvogel.de>, wireguard@lists.zx2c4.com,
 bird-users@network.cz, babel-users@alioth-lists.debian.net
Subject: Re: [Babel-users] [RFC] Replace WireGuard AllowedIPs with IP route
 attribute
Message-ID: <20230828160705.a5uxv5l2zknna7yj@House.clients.dxld.at>
References: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
 <4b-64e11f80-13-5e880900@8744214>
 <20230819212357.lkshcpslkgbeaq4e@House.clients.dxld.at>
 <CAJU8_nVR_ohTetKzHoxFH=dYccQg9HdniqV+JKk4LoJGorx0ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJU8_nVR_ohTetKzHoxFH=dYccQg9HdniqV+JKk4LoJGorx0ZA@mail.gmail.com>
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

Hi Kyle,

On Mon, Aug 28, 2023 at 11:40:48AM -0400, Kyle Rose wrote:
> On Sat, Aug 19, 2023 at 5:25 PM Daniel Gröber <dxld@darkboxed.org> wrote:
> > Having read Kyle's use-case I'm thinking my original plan to extend the wg
> > internal source-address filtering to use a rt lookup with our new attribute
> > would not be maximally useful so now my thinking is we should just have a
> > boolean toggle to disable it explicitly per device.
> 
> If there is interest among the maintainers in eventually merging a
> change with a per-interface knob to turn off the source IP check, I
> will go through the trouble of putting together an initial pass at
> this. I don't want to spend the time if there is firm opposition to
> the idea.

I think just a patch to turn off the wg source IP check is not very useful
at the moment. It would encourage bad source IP filtering practices when
multiple peers are involved as no mechanism for identifying the sending
peer is available at the policy routing or netfilter level currently.

I think such a patch would have to get merged after some kind of mechanism
to identify and filter based on the sending wg peer is available.

So if you want to move this along I would suggest working on this
first. Since I'm also interested in having this feature I'm happy
collaborate.

It's just hard to find the motivation for writing more wg patches when my
pending ones have (mostly) been lying around for a year without a response,
but if you're also keen on this feature I'm sure it's easier to stay
motivated together :)

If my kernel patches go ignored for too long too I'll probably just resort
to getting a forked DKMS wireguard module into Debian with this
work. Perhaps that approach (or a package in a different distro) would work
for your use-case too?

--Daniel
