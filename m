Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94121C001DE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Jul 2023 17:05:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d7205f0;
	Sun, 23 Jul 2023 17:05:13 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2526cb9e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Jul 2023 17:05:11 +0000 (UTC)
Received: janet.servers.dxld.at; Sun, 23 Jul 2023 19:05:09 +0200
Date: Sun, 23 Jul 2023 19:05:04 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: John Lauro <johnalauro@gmail.com>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>,
 wireguard@lists.zx2c4.com, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>
Subject: Re: Wg source address is too sticky for multihomed systems aka
 multiple endpoints redux
Message-ID: <20230723170504.srjgry54xkyva4wf@House.clients.dxld.at>
References: <20230721000643.44y5pd7sfcjzhbjw@House.clients.dxld.at>
 <87351h4rp7.fsf@ungleich.ch>
 <CADGd2Dpxst52_OxMJBO19Qn11hrgxsXVaNnryb9YryipLvX8Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADGd2Dpxst52_OxMJBO19Qn11hrgxsXVaNnryb9YryipLvX8Gg@mail.gmail.com>
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

Hi John,

On Fri, Jul 21, 2023 at 09:47:11AM -0400, John Lauro wrote:
> I have a lots of multihomed routers setup for vpn site to site and
> running bgp over the vpn mesh.
> 
> First, make sure these are all 0 as are multihomed.
> cat $( find /proc/sys/net/ipv4 -name rp_filter )

My routers are behind consumer ISPs so I never get packets which would fail
RPF and I have RPF upstream of me either way, so this doesn't make a
difference in my case. Like I said I have ip-rules (PBR) to direct traffic
to the correct interface based on source address to appease upstream's RPF.

> The other thing I do is I run a different wireguard interface and peer
> on a different port and interface.

Same, in order to run a routing daemon on top of wg you pretty much have to
do that currently as only one peer may have AllowedIPs=::/0 but the routing
daemons dont (yet, I'm working on this for babel) know how to update
AllowedIPs.

> With bgp on top, one multihomed router to another multihomed router
> just ends up being multiple links it can route over and let linux/bgp
> decide which ones to use and automatically fail over if one path goes
> down.
> 
> That said, I don't have any NAT and both ends have fixed IPs, although
> they are multihomed.

I'm pretty sure you're not seeing the problem I describe here because your
paths are going to be pretty equivalent, but in my case one is DOCSIS3 and
one is LTE/5G (depends on weather) which is much worse in terms of
bandwidth and latency/jitter consistency. So I can actually see the
difference in applications (video buffering etc) which is what had me start
debugging in the first place :)

> Can you create a separate wireguard interface for each physical
> interface (I suggest a different port too).  Separate wireguard
> interfaces should keep WG from having issues, and of course disabling
> rp_filter to keep linux from having issues.

Hmm, that might just work since my routing daemon does RTT based routing
and the mobile connection is going to be much worse there. I already have
to deploy two tunnel because of the mentioned v4/v6 dualstack issue so I'm
not really keen to multiply that number _again_. Besides my `set fwmark`
workaround does actually legitimately work but it's ugly as hell :)

> On Fri, Jul 21, 2023 at 4:05 AM Nico Schottelius

/me realizes you were replying to Nico *blush*. See this is why you don't
top-post. Learn some netiquette people :-)

I've actually taken my followup discussion with Nico off-list because I
think it might be a more involved debug session on what's going on in his
setup, which is going to distract from my proposal. I'll send any
conclusions we come to back to the list though.

FYI: I do have a patch to add the necessary debugging code and logs to show
the concrete issue here, I just didn't want to cause information overload
in the initial mail. Just let me know and I'll send those along if there's
any doubt about whether what I describe is the actual issue I'm having. I'm
pretty convinced but the first rule of the internet it that the problem is
always the X-Y problem~.

Thanks,
--Daniel
