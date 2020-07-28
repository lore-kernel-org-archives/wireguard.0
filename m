Return-Path: <SRS0=JBbb=BH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,TVD_PH_BODY_ACCOUNTS_PRE,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF891C433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 09:03:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E92D20775
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 09:03:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eha7NGw6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E92D20775
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 947e5f44;
	Tue, 28 Jul 2020 08:40:28 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b26601ca
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 08:40:26 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 430312a5
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 08:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=bfGTvu6cWean
 exhrMMuKQWgC2GA=; b=eha7NGw639+F0OS9yuiFprsA4s7WdKREdi/MF/nEytug
 GqUaIMW6iWxcRDn/5rpTgI10PjykH1/FL8IHvnVQM1yOaldSDRSez/x9eo5qr8o2
 RA0Jzd5Oari9qNmXcNk84qDeDnrOPq79hN9zt7pfi+YYeLTBPu4j4WfhwWN03kyH
 S6yoZ1lC5t/pmeua+i/LfgHkTXc0p4iu8qdBZ5+b7sPlvQcfUVq1g06/eyXa4Ku2
 AfttjBth6l3iFvhwWh37Rls7ty0nVHdFm1+Kp9btyZZk0HjHSMJBUpcltwt5vTND
 tP2LIKheqPJCatmKS30IIj3Ofvf9aKwGjYWYYkSD9Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5ad9bc51
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 08:40:26 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id z17so433212ill.6
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jul 2020 02:03:51 -0700 (PDT)
X-Gm-Message-State: AOAM532H5lvNYdV/1U6DGA8udGGHXULAV+aPMxTXLvl7sAIeL5vbxjt2
 0R841c+h/lrjTbpTxOaQiZSXFPzn0iqHp8CCsLc=
X-Google-Smtp-Source: ABdhPJwEaCu3mniwbQPa33RCq+qg5LRSggf1jIyyb8QzQouTKOG2RidyEWDqTBWJv0yLg6rGUSp2h3rZO4C7dABXaSU=
X-Received: by 2002:a92:90d:: with SMTP id y13mr11064104ilg.246.1595927030982; 
 Tue, 28 Jul 2020 02:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <84986996953761e9d645b7ef583d3ffca689dfc5.camel@fud.no>
 <CAHmME9p+tVyEm_+ALbsCWhshrt5yR97enjBcuUdVhTAWTf-MwA@mail.gmail.com>
 <27652e0971672a8fab30f59ff053cf65feaa711f.camel@fud.no>
In-Reply-To: <27652e0971672a8fab30f59ff053cf65feaa711f.camel@fud.no>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Jul 2020 11:03:39 +0200
X-Gmail-Original-Message-ID: <CAHmME9qGX58JXCiw=Mr9=4qw=+-91etz8not91oJek-8qGrQPw@mail.gmail.com>
Message-ID: <CAHmME9qGX58JXCiw=Mr9=4qw=+-91etz8not91oJek-8qGrQPw@mail.gmail.com>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
To: Tore Anderson <tore@fud.no>
Cc: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jul 27, 2020 at 10:04 PM Tore Anderson <tore@fud.no> wrote:
> Absolutely, a 'wg syncconf' wrapper is unable to fully implement every
> conceivable change to the wg-quick config file. That said, 99.9% of my
> configuration changes are additions/removal of [Peer] sections that 'wg
> syncconf' do handle perfectly. Being able to add and remove individual
> VPN users without disrupting the traffic of other unrelated users is a
> really big win for me. I would imagine this to ability be highly
> desirable for most other VPN server operators as well =E2=80=93 even for =
those
> that do not use systemd.

But for people shell scripting, can't they just use `wg syncconf
wgnet0 <(wg-quick strip wgnet0)`, so that it's explicit what's
happening?

> I do use systemd, so I am personally fine with what just got merged. I
> do have to wonder, though, if I committed some sort of faux pas and/or
> violated some contribution guideline in posting my initial submission,
> considering that it was consistently ignored for months even though it
> implemented essentially the same thing as what ended up being merged
> just now.

No faux pas, just a bit backlogged in reviews. Then Domonkos' patch
came through, which seemed more straightforwardly mergable.

> Anyway. I would, if you are interested in that, be happy update my
> patch to rename the new wg-quick action =C2=ABsyncconf=C2=BB instead of =
=C2=ABreload=C2=BB,
> in order to more clearly indicate that this action will only change the
> parameters that 'wg syncconf' can change.

I'm still pretty hesitant for the reasons I outlined in the previous
email. If anything, it'd probably have to be "syncpeers", but even
then, it wouldn't update the routing information that wg-quick(8)
sometimes does. The right thing to do for a `wg-quick reload` command
would be to take into account all of the various other changes, and
mutate them the minimal distance to reflect the updated config file.
But this sounds pretty hard to do in bash. And that makes me worry
about overall mission creep in wg-quick(8). syncconf in wg(8) is
fairly simple, though still a bit verbose, but that's in C:
https://git.zx2c4.com/wireguard-tools/tree/src/setconf.c#n30 . And
there's a very clear way of doing this, whereas there are lots of
weird edge cases when handling routing.

Plus, how hard is it to add `wg syncconf wgnet0 <(wg-quick strip
wgnet0)` to scripts?

Jason
