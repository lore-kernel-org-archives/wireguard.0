Return-Path: <SRS0=aBj4=LM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41807C48BDF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Jun 2021 12:24:58 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4265E613E9
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Jun 2021 12:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4265E613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=freenetproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a641c718;
	Fri, 18 Jun 2021 12:24:55 +0000 (UTC)
Received: from a4-4.smtp-out.eu-west-1.amazonses.com
 (a4-4.smtp-out.eu-west-1.amazonses.com [54.240.4.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9cc6aaae
 (TLSv1.2:ECDHE-ECDSA-AES256-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jun 2021 07:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1623916510;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=6M0rtbOfiHAzBuH+SuRwoKx0NK91kUYtqUDWTe0YKhI=;
 b=ALzVxNuq0ivLtsIiSRx3ZAlXaUXtjyiYapvdBHvpWmnZbfvfryAzDKSartDM4Iq0
 GBhIonlCsgy2XqnkLxb+P2GKgWO4UQoJCYyARRor63vWZB9esA71TFe4/+vkLIj99Rt
 sL6nFLjVUJ9UCYu69NHd+qe8bYyXFdP6jtPb3ZJg=
Message-ID: <0102017a18f77a7e-85cc3154-dbac-4a9f-a0c5-acba247919a6-000000@eu-west-1.amazonses.com>
Subject: Re: passing-through TOS/DSCP marking
From: Florent Daigniere <nextgens@freenetproject.org>
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>, Daniel Golle
 <daniel@makrotopia.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Thu, 17 Jun 2021 07:55:09 +0000
In-Reply-To: <87v96dpepz.fsf@toke.dk>
References: <YMn7qQ/7s/CciRNy@makrotopia.org>
 <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
 <YMpPnKhUuTHNU1Q0@makrotopia.org> <87v96dpepz.fsf@toke.dk>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.eu-west-1.pdg62YgwzwxEqxeEXyLJB4Hk3i4AYkez1He1VuR521Q=:AmazonSES
X-SES-Outgoing: 2021.06.17-54.240.4.4
X-Mailman-Approved-At: Fri, 18 Jun 2021 12:24:54 +0000
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

On Thu, 2021-06-17 at 01:33 +0200, Toke Høiland-Jørgensen wrote:
> Daniel Golle <daniel@makrotopia.org> writes:
> 
> > Hi Jason,
> > 
> > On Wed, Jun 16, 2021 at 06:28:12PM +0200, Jason A. Donenfeld wrote:
> > > WireGuard does not copy the inner DSCP mark to the outside, aside
> > > from
> > > the ECN bits, in order to avoid a data leak.
> > 
> > That's a very valid argument.
> > 
> > However, from my experience now, Wireguard is not suitable for
> > VoIP/RTP
> > data (minimize-delay) being sent through the same tunnel as TCP bulk
> > (maximize-throughput) traffic in bandwidth constraint and/or high-
> > latency
> > environments, as that ruins the VoIP calls to the degree of not
> > being
> > understandable. ECN helps quite a bit when it comes to avoid packet
> > drops
> > for TCP traffic, but that's not enough to avoid high jitter and
> > drops for
> > RTP/UDP traffic at the same time.
> > 
> > I thought about ways to improve that and wonder what you would
> > suggest.
> > My ideas are:
> >  * have different tunnels depending on inner DSCP bits and mark them
> >    accordingly on the outside.
> >    => we already got multiple tunnels and that would double the
> > number.
> > 
> >  * mark outer packets with DSCP bits based on their size.
> >    VoIP RTP/UDP packets are typically "medium sized" while TCP
> > packets
> >    typically max out the MTU.
> >    => we would not leak information, but that assumption may not
> > always
> >       be true
> > 
> >  * patch wireguard kernel code to allow preserving inner DSCP bits.
> >    => even only having 2 differentl classes of traffic (critical vs.
> >       bulk) would already help a lot...
> > 
> > 
> > What do you think? Any other ideas?
> 
> Can you share a few more details about the network setup? I.e., where
> is
> the bottleneck link that requires this special treatment?

I can tell you about mine. WiFi in a congested environment: "voip on
mobile phones". WMM/802.11e uses the diffserv markings; most commercial
APs will do the right thing provided packets are marked appropriately.

At the time I have sent patches (back in 2019) for both the golang and
linux implementation that turned it on by default. I believe that
Russell Strong further improved upon them by adding a knob (20190318 on
this mailing list).

Earlier this month I was approached by a NGO that was trying to do voip
over satlinks in between ships... there too, any solution has to involve
DSCP markings.

Florent


