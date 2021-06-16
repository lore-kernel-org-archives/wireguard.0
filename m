Return-Path: <SRS0=+n2a=LK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445B5C48BE5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jun 2021 23:33:20 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C82F06128C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jun 2021 23:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C82F06128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4056220;
	Wed, 16 Jun 2021 23:33:17 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a7ac84a4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jun 2021 23:33:15 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1623886395; bh=HrYRQ9c/y3JUHnICyP8ZXqZMEhRuVacH7xEhwB9v7wg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nBUvojnEvQ7SvrJXSL+ghcMWItjTH4rFVF1Smgpe5Qp6WL8+gD/OmJ2XJ0lxpmxC8
 x6B3Kjcav8xaqwOG0bPxbvSMCr1ST/sWN7XbBFyc2TjCGNxrLGTSfB/gr6zfsyESPG
 mqDLkwpH+vq0ZZhWsrcrOHNG+RrTQhNYJ2dh3o08eiYZ5O2ISlhQEj4KauzpKMxhNr
 KykMZnLt99AMuAnweQT79jx94yN7XhbbkdQxXdSm9kDahWFR580zqOwjYtzpSGdtTS
 pMJyXA3OSzP/KYBXspmCol52KHt0BrEim1j2mJWaaZ60vEYR7kcTyf+Ru9uqgMGlDU
 s3PC9FEMVTizA==
To: Daniel Golle <daniel@makrotopia.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: passing-through TOS/DSCP marking
In-Reply-To: <YMpPnKhUuTHNU1Q0@makrotopia.org>
References: <YMn7qQ/7s/CciRNy@makrotopia.org>
 <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
 <YMpPnKhUuTHNU1Q0@makrotopia.org>
Date: Thu, 17 Jun 2021 01:33:12 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87v96dpepz.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
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

Daniel Golle <daniel@makrotopia.org> writes:

> Hi Jason,
>
> On Wed, Jun 16, 2021 at 06:28:12PM +0200, Jason A. Donenfeld wrote:
>> WireGuard does not copy the inner DSCP mark to the outside, aside from
>> the ECN bits, in order to avoid a data leak.
>
> That's a very valid argument.
>
> However, from my experience now, Wireguard is not suitable for VoIP/RTP
> data (minimize-delay) being sent through the same tunnel as TCP bulk
> (maximize-throughput) traffic in bandwidth constraint and/or high-latency
> environments, as that ruins the VoIP calls to the degree of not being
> understandable. ECN helps quite a bit when it comes to avoid packet drops
> for TCP traffic, but that's not enough to avoid high jitter and drops for
> RTP/UDP traffic at the same time.
>
> I thought about ways to improve that and wonder what you would suggest.
> My ideas are:
>  * have different tunnels depending on inner DSCP bits and mark them
>    accordingly on the outside.
>    => we already got multiple tunnels and that would double the number.
>
>  * mark outer packets with DSCP bits based on their size.
>    VoIP RTP/UDP packets are typically "medium sized" while TCP packets
>    typically max out the MTU.
>    => we would not leak information, but that assumption may not always
>       be true
>
>  * patch wireguard kernel code to allow preserving inner DSCP bits.
>    => even only having 2 differentl classes of traffic (critical vs.
>       bulk) would already help a lot...
>
>
> What do you think? Any other ideas?

Can you share a few more details about the network setup? I.e., where is
the bottleneck link that requires this special treatment? If the
bottleneck router is the same one that does the wireguard encapsulation
(e.g., a home router with a slow uplink), you should be able to just use
flow queueing (fq_codel or sch_cake) in place of your diffserv-based
prioritisation and get most of the benefit: wireguard will save the
packet hash before encapsulation, so any qdisc running on the same box
can actually distinguish flows even on the encapsulated packets...

-Toke
