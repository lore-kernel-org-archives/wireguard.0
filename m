Return-Path: <SRS0=+n2a=LK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1567DC48BE5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jun 2021 22:34:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4627F613DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jun 2021 22:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4627F613DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a2a2344;
	Wed, 16 Jun 2021 22:34:48 +0000 (UTC)
Received: from fudo.makrotopia.org (fudo.makrotopia.org [2a07:2ec0:3002::71])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f7876994
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jun 2021 19:26:23 +0000 (UTC)
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1ltbB7-0006vM-Q3; Wed, 16 Jun 2021 21:26:22 +0200
Date: Wed, 16 Jun 2021 21:26:10 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: passing-through TOS/DSCP marking
Message-ID: <YMpPnKhUuTHNU1Q0@makrotopia.org>
References: <YMn7qQ/7s/CciRNy@makrotopia.org>
 <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
X-Mailman-Approved-At: Wed, 16 Jun 2021 22:34:46 +0000
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

Hi Jason,

On Wed, Jun 16, 2021 at 06:28:12PM +0200, Jason A. Donenfeld wrote:
> WireGuard does not copy the inner DSCP mark to the outside, aside from
> the ECN bits, in order to avoid a data leak.

That's a very valid argument.

However, from my experience now, Wireguard is not suitable for VoIP/RTP
data (minimize-delay) being sent through the same tunnel as TCP bulk
(maximize-throughput) traffic in bandwidth constraint and/or high-latency
environments, as that ruins the VoIP calls to the degree of not being
understandable. ECN helps quite a bit when it comes to avoid packet drops
for TCP traffic, but that's not enough to avoid high jitter and drops for
RTP/UDP traffic at the same time.

I thought about ways to improve that and wonder what you would suggest.
My ideas are:
 * have different tunnels depending on inner DSCP bits and mark them
   accordingly on the outside.
   => we already got multiple tunnels and that would double the number.

 * mark outer packets with DSCP bits based on their size.
   VoIP RTP/UDP packets are typically "medium sized" while TCP packets
   typically max out the MTU.
   => we would not leak information, but that assumption may not always
      be true

 * patch wireguard kernel code to allow preserving inner DSCP bits.
   => even only having 2 differentl classes of traffic (critical vs.
      bulk) would already help a lot...


What do you think? Any other ideas?


Cheers


Daniel
