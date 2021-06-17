Return-Path: <SRS0=yhX4=LL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15310C2B9F4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jun 2021 09:45:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 249A0613DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jun 2021 09:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 249A0613DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01c2e4ab;
	Thu, 17 Jun 2021 09:43:28 +0000 (UTC)
Received: from fudo.makrotopia.org (fudo.makrotopia.org [2a07:2ec0:3002::71])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a39f31de
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jun 2021 09:43:27 +0000 (UTC)
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1ltoYT-0007Vb-AE; Thu, 17 Jun 2021 11:43:21 +0200
Date: Thu, 17 Jun 2021 11:41:02 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Florent Daigniere <nextgens@freenetproject.org>
Cc: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: passing-through TOS/DSCP marking
Message-ID: <YMsYrpAm/29Q91GX@makrotopia.org>
References: <YMn7qQ/7s/CciRNy@makrotopia.org>
 <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
 <YMpPnKhUuTHNU1Q0@makrotopia.org> <87v96dpepz.fsf@toke.dk>
 <0102017a18f77a7e-85cc3154-dbac-4a9f-a0c5-acba247919a6-000000@eu-west-1.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0102017a18f77a7e-85cc3154-dbac-4a9f-a0c5-acba247919a6-000000@eu-west-1.amazonses.com>
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

Hi Florent,

On Thu, Jun 17, 2021 at 07:55:09AM +0000, Florent Daigniere wrote:
> On Thu, 2021-06-17 at 01:33 +0200, Toke Høiland-Jørgensen wrote:
> > Daniel Golle <daniel@makrotopia.org> writes:
> > 
> > > Hi Jason,
> > > 
> > > On Wed, Jun 16, 2021 at 06:28:12PM +0200, Jason A. Donenfeld wrote:
> > > > WireGuard does not copy the inner DSCP mark to the outside, aside
> > > > from
> > > > the ECN bits, in order to avoid a data leak.
> > > 
> > > That's a very valid argument.
> > > 
> > > However, from my experience now, Wireguard is not suitable for
> > > VoIP/RTP
> > > data (minimize-delay) being sent through the same tunnel as TCP bulk
> > > (maximize-throughput) traffic in bandwidth constraint and/or high-
> > > latency
> > > environments, as that ruins the VoIP calls to the degree of not
> > > being
> > > understandable. ECN helps quite a bit when it comes to avoid packet
> > > drops
> > > for TCP traffic, but that's not enough to avoid high jitter and
> > > drops for
> > > RTP/UDP traffic at the same time.
> > > 
> > > I thought about ways to improve that and wonder what you would
> > > suggest.
> > > My ideas are:
> > >  * have different tunnels depending on inner DSCP bits and mark them
> > >    accordingly on the outside.
> > >    => we already got multiple tunnels and that would double the
> > > number.
> > > 
> > >  * mark outer packets with DSCP bits based on their size.
> > >    VoIP RTP/UDP packets are typically "medium sized" while TCP
> > > packets
> > >    typically max out the MTU.
> > >    => we would not leak information, but that assumption may not
> > > always
> > >       be true
> > > 
> > >  * patch wireguard kernel code to allow preserving inner DSCP bits.
> > >    => even only having 2 differentl classes of traffic (critical vs.
> > >       bulk) would already help a lot...
> > > 
> > > 
> > > What do you think? Any other ideas?
> > 
> > Can you share a few more details about the network setup? I.e., where
> > is
> > the bottleneck link that requires this special treatment?
> 
> I can tell you about mine. WiFi in a congested environment: "voip on
> mobile phones". WMM/802.11e uses the diffserv markings; most commercial
> APs will do the right thing provided packets are marked appropriately.
> 
> At the time I have sent patches (back in 2019) for both the golang and
> linux implementation that turned it on by default. I believe that
> Russell Strong further improved upon them by adding a knob (20190318 on
> this mailing list).

Thank you very much for the hint!
This patch is exactly what I was looking for:
https://lists.zx2c4.com/pipermail/wireguard/2019-March/004026.html

Unfortunately it has not received a great amount of feedback back then.
I'll try forward-porting and deploying it now, because to me it looks
like the best solution money can buy :)


> 
> Earlier this month I was approached by a NGO that was trying to do voip
> over satlinks in between ships... there too, any solution has to involve
> DSCP markings.

This is quite exactly the scenario I'm working on :)

Also here, we got multiple uplinks (2x VSAT, 1x 3G/4G/5G, 1x auxilary,
e.g. WiFi client during shipyard times). All those uplinks are often
congested and we can't do anything about their buffer bloat and as all of
them rely on a shared medium, the total amount of available bandwidth
varies quite a bit, which makes it hard to setup meaningful shaping. I
did setup cake qdisc on the upstream links with generously estimated
bandwidth settings, and that did not help a lot.
However, all of those proprietary black-boxes do seem to care about the
DSCP markings and that seems to be the way forward.


Thank you!


Daniel


> 
> Florent
> 
> 
