Return-Path: <SRS0=oIpX=JQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8684CC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 19:53:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447FB61260
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 19:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 447FB61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=stha.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 285c3d53;
	Mon, 19 Apr 2021 19:50:33 +0000 (UTC)
Received: from deponia.stha.de (deponia.stha.de [2001:8d8:1801:133::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 22fc62f5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Apr 2021 19:50:28 +0000 (UTC)
Received: from mail.stha.de (mail.stha.de [IPv6:2a03:4000:24:7d0:100::15])
 by deponia.stha.de (Postfix) with ESMTPS id 585E311245B;
 Mon, 19 Apr 2021 19:50:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: stefan)
 by mail.stha.de (Postfix) with ESMTPSA id 1605318A420;
 Mon, 19 Apr 2021 19:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=stha.de; s=20200509;
 t=1618861798; bh=PWwrWZUhDVFEsi+UQNEI5KiYXq/iXjezqcVm3CwE9ds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rcNkO2u6sF+B9EEs6AHIIF1PDykyYXtgmMavwPOL+ZZwSr6QC9gTvJVPuJ+EmZ8zw
 CcMqu75DMzTTdiMQweq+GWMoqF0gMe2pP+v9mmrK4MxAiVHZUuZlQbMP9AuIXodKf3
 Gik1IJ1cItDj3dfflEJubHtSdC5os6UXWodD+x/DGKB6ZiZQEnEnmuyFdPn/FwNmEk
 XhUoE21Xfv58M97bdQa+HlwmBsnj30QrqU1CK0lvaLZpK7a9H51N7q+uxJ1ZDWA/5x
 b8BuKQWKRJg1Tl1WMvzmiZVms3PJLrlisBZdD0SFD99kZsAMnYYsZRn8PX3OWv1R+7
 ahP4IjHXqidfw==
Date: Mon, 19 Apr 2021 21:49:56 +0200
From: Stefan Haller <stefan.haller@stha.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
Message-ID: <bcedf3fe-09ce-4964-85fc-b894583bd389@stha.de>
References: <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
 <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
 <87sg3rigdx.fsf@toke.dk>
 <CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com>
 <15c3483d-546b-4c86-aca7-9ab37945791e@stha.de>
 <87a6pyinbh.fsf@toke.dk> <87fszmgmhh.fsf@toke.dk>
 <c93d0e62-8992-4c19-a2d3-08f7af3f5873@stha.de>
 <CAHmME9rVb7vONYxfYfeccCpA3ePhfUifi_FX-=8ugBu_n0_SPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9rVb7vONYxfYfeccCpA3ePhfUifi_FX-=8ugBu_n0_SPg@mail.gmail.com>
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

On Mon, Apr 19, 2021 at 01:42:58PM -0600, Jason A. Donenfeld wrote:
> On Mon, Apr 19, 2021 at 1:42 PM Stefan Haller <stefan.haller@stha.de> wrote:
> >
> > On Mon, Apr 19, 2021 at 08:25:46PM +0200, Toke Høiland-Jørgensen wrote:
> > > Stefan, any chance you could test this patch to Bird (*instead of* the
> > > previous one that removes the check from the Babel code)?
> >
> > The patch is working on FreeBSD 13.0.
> 
> Just FYI, the previous patch was added to ports, so I wanted to double
> check that you removed that previous patch before adding this one...

Yes, I did remove the old patch (in proto/babel/babel.c):

> root@fbsd:/usr/ports/net/bird2 # git status .
> On branch main
> Changes not staged for commit:
>   (use "git add/rm <file>..." to update what will be committed)
>   (use "git restore <file>..." to discard changes in working directory)
>         deleted:    files/patch-proto_babel_babel.c
> 
> Untracked files:
>   (use "git add <file>..." to include in what will be committed)
>         files/patch-sysdep_bsd_krt-sock.c

Kind regards,
Stefan
