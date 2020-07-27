Return-Path: <SRS0=JaX8=BG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D06C433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Jul 2020 20:04:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5B982072E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Jul 2020 20:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5B982072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fud.no
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fb4e583;
	Mon, 27 Jul 2020 19:41:02 +0000 (UTC)
Received: from mail.fud.no (mail.fud.no [2a02:c0:2f0:de01:f816:3eff:fede:dc6a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7c8919e6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Jul 2020 19:40:59 +0000 (UTC)
Received: from [2a02:c0:2:7::1] (port=39534 helo=sloth.fud.no)
 by mail.fud.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tore@fud.no>)
 id 1k09MA-0003Tk-2V; Mon, 27 Jul 2020 22:04:18 +0200
Message-ID: <27652e0971672a8fab30f59ff053cf65feaa711f.camel@fud.no>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
From: Tore Anderson <tore@fud.no>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Date: Mon, 27 Jul 2020 22:04:17 +0200
In-Reply-To: <CAHmME9p+tVyEm_+ALbsCWhshrt5yR97enjBcuUdVhTAWTf-MwA@mail.gmail.com>
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <84986996953761e9d645b7ef583d3ffca689dfc5.camel@fud.no>
 <CAHmME9p+tVyEm_+ALbsCWhshrt5yR97enjBcuUdVhTAWTf-MwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 (3.36.4-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

* Jason A. Donenfeld

> But it doesn't sync Address=, DNS=, or any routing particulars. That
> seems like a problem if it's to become a bona fide "reload" subcommand
> of wg-quick, since it's not doing what it should be. On the other
> hand, adding it to the systemd unit seems far enough away from core
> code that we can kind of say, "eh, this sort of works," which might be
> good enough. If even _that_ causes problems for users too, we'd have
> to talk about removing it from the systemd unit. But hopefully it
> stays under the radar and people don't have overly high expectations.

Absolutely, a 'wg syncconf' wrapper is unable to fully implement every
conceivable change to the wg-quick config file. That said, 99.9% of my
configuration changes are additions/removal of [Peer] sections that 'wg
syncconf' do handle perfectly. Being able to add and remove individual
VPN users without disrupting the traffic of other unrelated users is a
really big win for me. I would imagine this to ability be highly
desirable for most other VPN server operators as well – even for those
that do not use systemd.

I do use systemd, so I am personally fine with what just got merged. I
do have to wonder, though, if I committed some sort of faux pas and/or
violated some contribution guideline in posting my initial submission,
considering that it was consistently ignored for months even though it
implemented essentially the same thing as what ended up being merged
just now.

Anyway. I would, if you are interested in that, be happy update my
patch to rename the new wg-quick action «syncconf» instead of «reload»,
in order to more clearly indicate that this action will only change the
parameters that 'wg syncconf' can change.

Tore

