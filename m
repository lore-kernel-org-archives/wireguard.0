Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D792AC83F2C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Sep 2023 03:22:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9959cd0e;
	Sun, 3 Sep 2023 03:22:48 +0000 (UTC)
Received: from mail1.matrix-dream.net (<unknown> [2a0a:51c0::71])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f25f449d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Sep 2023 03:22:46 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.93.0.4)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1qcdfx-0007YJ-DI; Sun, 03 Sep 2023 03:21:25 +0000
Date: Sun, 3 Sep 2023 03:21:25 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Daniel =?iso-8859-1?Q?Gr=F6ber?= <dxld@darkboxed.org>
Cc: Juliusz Chroboczek <jch@irif.fr>, Kyle Rose <krose@krose.org>,
 bird-users@network.cz, babel-users@alioth-lists.debian.net,
 wireguard@lists.zx2c4.com
Subject: Re: [RFC] Replace WireGuard AllowedIPs with IP route attribute
Message-ID: <ZPP7tab5OqR39RcY@matrix-dream.net>
References: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
 <4b-64e11f80-13-5e880900@8744214>
 <20230819212357.lkshcpslkgbeaq4e@House.clients.dxld.at>
 <CAJU8_nVR_ohTetKzHoxFH=dYccQg9HdniqV+JKk4LoJGorx0ZA@mail.gmail.com>
 <20230828160705.a5uxv5l2zknna7yj@House.clients.dxld.at>
 <87v8czqd3w.wl-jch@irif.fr>
 <20230828221312.fw5pvnt4x7p2c52k@House.clients.dxld.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230828221312.fw5pvnt4x7p2c52k@House.clients.dxld.at>
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

Hi,

IMO, a good tunnel solution may be if what is now called AllowedIPs,
were functionally split into:
 - AcceptIPS (to be different from AllowedIPs)
 - RouteIPs
Perhaps with a default shorthand of, say, IPs, setting both, as
AllowedIPs historically caused confusion wrt. it's meaning.

Wireguard API is a bit clunky, but I think one could dynamically manage
routes in reasonably efficient ways without extra interfaces and layers.

Not sure if it would fullfill all reasonably achievable goals.

Don't really have the time to implement anything, and I'm sure it would
not be easy, so just a possible tip to consider.

Regards,
Ivan Labáth

On Tue, Aug 29, 2023 at 12:13:12AM +0200, Daniel Gröber wrote:
> Hi Juliusz,
> 
> On Mon, Aug 28, 2023 at 07:40:51PM +0200, Juliusz Chroboczek wrote:
> > I've read the whole discussion, and I'm still not clear what advantages
> > the proposed route attribute has over having one interface per peer.  Is
> > it because interfaces are expensive in the Linux kernel?  Or is there some
> > other reason why it is better to run all WG tunnels over a single interface?
> 
> Off the top of my head UDP port exhaustion is a scalability concern here,
> just as an example, not that I'd actually ever need that many peers in my
> network :)
> 
> One wg-device per-peer means we need one UDP port per-peer and since
> currently binding to a specific IP is also not supported by wg (I have a
> patch pending for this though) there's no good way to work around this.
> 
> Frankly having tons of interfaces is just an operational PITA in all sorts
> of ways. Apart from the port exhaustion having more than one wg device also
> means I have to _allocate_ a new port for each node in my managment system
> somehow instead of just using a static port for the entire network. This
> gets dicy fast as I want to move in the direction of dynamic peering as in
> tinc.
> 
> Other than that my `ip -br a` output is getting unmanagably long and having
> more than one device means I have to keep ACL lists in sync all over the
> system. This is a problem for daemons that don't support automatic reload
> (babeld for example :P). I also have to sync the set of interface to
> nftables which is easy to get wrong as it's still manual in my setup.
> 
> All of that could be solved, but I would also like to get my wg+babel VPN
> setup deployed more widely at some point and all that friction isn't going
> to help with that so I'd rather have this supported properly.
> 
> --Daniel


