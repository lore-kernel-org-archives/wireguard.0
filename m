Return-Path: <SRS0=yhX4=LL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DB3C2B9F4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jun 2021 20:57:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7197160FDC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jun 2021 20:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7197160FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 321aac12;
	Thu, 17 Jun 2021 20:55:00 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 897f7e7e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jun 2021 20:54:58 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1623963298; bh=yA3EqmKSMftzlo9wTBBEHfwr3TNYoAIDU9GlzMZ6T4s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Eylsf+y6zHxnSKXv0cZd1VtWhUyDUhcU1y9zJ2XEzC8hhhyhZRUh22nNNk6SJinOh
 +s8H5k7IqNdM7LI4WEbYb6IMkd2nTsUM/laAf09+xrlyCX9pnJ2CM9xpF4EUsvpmo2
 5daoianf44Nzx0tNvC3zt+xlQ+Y43bNvlVoxeXZfMheOYtPwXi6MEaHnV2/cdFld2u
 z0aysK5iEo+5+gDenmA/x4XE5VhLsBBzInqf4C+iVVQ6qSq4R8HqJKtgvpkMklfrrQ
 FLKhBxYRKG/R+PGUps8zYXD1ctMceLEqPrehsOouZzQIFlfjWgORN3M/DENJ4I8mjE
 5+K1f76pU+a/g==
To: Reid Rankin <reidrankin@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Florent Daigniere
 <nextgens@freenetproject.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: passing-through TOS/DSCP marking
In-Reply-To: <CAMaqUZ09KRtp01OK3u-Di52X_kH9eT4E-wmnPc6QzjSCd5dEiw@mail.gmail.com>
References: <YMn7qQ/7s/CciRNy@makrotopia.org>
 <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
 <YMpPnKhUuTHNU1Q0@makrotopia.org> <87v96dpepz.fsf@toke.dk>
 <0102017a18f77a7e-85cc3154-dbac-4a9f-a0c5-acba247919a6-000000@eu-west-1.amazonses.com>
 <YMsYrpAm/29Q91GX@makrotopia.org> <87sg1gptky.fsf@toke.dk>
 <CAMaqUZ09KRtp01OK3u-Di52X_kH9eT4E-wmnPc6QzjSCd5dEiw@mail.gmail.com>
Date: Thu, 17 Jun 2021 22:54:55 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87lf78dxeo.fsf@toke.dk>
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

Reid Rankin <reidrankin@gmail.com> writes:

> It can also be done in a shell script with nftables (maybe iptables too,
> haven't tried) by taking advantage of fwmark passthrough. You can have one
> rule that matches incoming outgoing packets (heh) with a certain dscp value
> and marks them, and another rule that matches outgoing outgoing packets
> with that mark and sets the DSCP bits back.

The fwmark is not passed through wireguard, though, it's cleared during
skb scrubbing:

https://elixir.bootlin.com/linux/latest/source/net/core/skbuff.c#L5344

There's an fwmark config that you can set which will make wireguard
apply a certain mark to all outgoing packets, but that has nothing to
do with what was set on the inner packet...

-Toke
