Return-Path: <SRS0=JBbb=BH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09055C433E8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 09:54:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2834C2074F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 09:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2834C2074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fud.no
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16da84f1;
	Tue, 28 Jul 2020 09:30:41 +0000 (UTC)
Received: from mail.fud.no (mail.fud.no [2a02:c0:2f0:de01:f816:3eff:fede:dc6a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 593b605c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 09:30:39 +0000 (UTC)
Received: from [2a02:c0:2:7::1] (port=45280 helo=sloth.fud.no)
 by mail.fud.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tore@fud.no>)
 id 1k0MJ8-0005n7-Q2; Tue, 28 Jul 2020 11:54:02 +0200
Message-ID: <48a85c212bffaf7004c4934b1da5c4b02674a54c.camel@fud.no>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
From: Tore Anderson <tore@fud.no>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Date: Tue, 28 Jul 2020 11:54:01 +0200
In-Reply-To: <CAHmME9qGX58JXCiw=Mr9=4qw=+-91etz8not91oJek-8qGrQPw@mail.gmail.com>
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <84986996953761e9d645b7ef583d3ffca689dfc5.camel@fud.no>
 <CAHmME9p+tVyEm_+ALbsCWhshrt5yR97enjBcuUdVhTAWTf-MwA@mail.gmail.com>
 <27652e0971672a8fab30f59ff053cf65feaa711f.camel@fud.no>
 <CAHmME9qGX58JXCiw=Mr9=4qw=+-91etz8not91oJek-8qGrQPw@mail.gmail.com>
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

> On Mon, Jul 27, 2020 at 10:04 PM Tore Anderson <tore@fud.no> wrote:
> > Absolutely, a 'wg syncconf' wrapper is unable to fully implement every
> > conceivable change to the wg-quick config file. That said, 99.9% of my
> > configuration changes are additions/removal of [Peer] sections that 'wg
> > syncconf' do handle perfectly. Being able to add and remove individual
> > VPN users without disrupting the traffic of other unrelated users is a
> > really big win for me. I would imagine this to ability be highly
> > desirable for most other VPN server operators as well – even for those
> > that do not use systemd.
> 
> But for people shell scripting, can't they just use `wg syncconf
> wgnet0 <(wg-quick strip wgnet0)`, so that it's explicit what's
> happening?

Of course they can, just as they can opt to not use wg-quick at all.

However, it would be better, in my opinion, if every user do not have
to re-invent the wheel in order to accomplish common tasks, which (I
assume) is the reason why wg-quick – «an extremely simple script for
easily bringing up a WireGuard interface, suitable for a few common use
cases», to quote its manual page – exists in the first place.

> I'm still pretty hesitant for the reasons I outlined in the previous
> email. If anything, it'd probably have to be "syncpeers", but even
> then, it wouldn't update the routing information that wg-quick(8)
> sometimes does.

Fair enough. If you do not want it in wg-quick, I won't insist.

> The right thing to do for a `wg-quick reload` command
> would be to take into account all of the various other changes, and
> mutate them the minimal distance to reflect the updated config file.
> But this sounds pretty hard to do in bash. And that makes me worry
> about overall mission creep in wg-quick(8). syncconf in wg(8) is
> fairly simple, though still a bit verbose, but that's in C:
> https://git.zx2c4.com/wireguard-tools/tree/src/setconf.c#n30 . And
> there's a very clear way of doing this, whereas there are lots of
> weird edge cases when handling routing.

Agreed, this sounds very complex and not worth the trouble.

That said, I do believe that most admins would not be bothered by the
fact that some changes would require a restart (i.e., an wg-quick
up/down cycle). This limitation is common in other pieces of software
too, e.g., one can normally not use 'apachectl graceful' to make Apache
listen on a new port below 1024. However, in spite of it not being
perfect, 'apachectl graceful' remains extremely useful.

> Plus, how hard is it to add `wg syncconf wgnet0 <(wg-quick strip
> wgnet0)` to scripts?

Not hard - it is precisely what my patch did, after all.

Tore

