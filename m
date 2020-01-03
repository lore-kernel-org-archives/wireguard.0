Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A88C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 17:14:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9525120866
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 17:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="0BWyg1Bh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9525120866
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d91f834;
	Fri, 3 Jan 2020 17:14:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b157c7a
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 17:14:21 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ecb20e1
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 17:14:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 768d6f5e
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 16:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type:content-transfer-encoding; s=mail; bh=WlGH3CRJCbIQ
 xVzcYHL1i7zpGDg=; b=0BWyg1BhKCRzVCXKX7yyqbFIOUklneYhRMCC6AEl4oDv
 XRpunRmgrFWN8UlgTwT77xn5jG4BPU+dgYAdSLAeSZyeD4zHvqi7d8IA+RCs/D+Y
 WOix1ADvaz8VtrYsmw4JilddTQniZiBoiY2Z+OB3ssVKuqAkWXoBi4bnQIts3pu9
 lRWUELmN5I8PmGgGIsFw2m4rT7NwCtXjioOx1HaZaBQpaI17FUUQXqAHvDqCd9WE
 NZPEVZmxsccIAbOXZsYFg/GeBZlvOReZFg0Vd2bL6Ys3DEhCaEtPrpHW7aC2tri+
 cvF2lcEYcvMBayEGklShc8FqTKzdm3F1L4NRko3n+Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 33234a07
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 16:15:42 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 66so61892351otd.9
 for <wireguard@lists.zx2c4.com>; Fri, 03 Jan 2020 09:14:21 -0800 (PST)
X-Gm-Message-State: APjAAAUyqhlW4ILT1WalqG+PeIK2QtNW96C0dzdFFHYsLrgyEWnMpumZ
 Pj3FfcTMLznjy6MZCeoPpAf3e/c1Pw3o8p56cH0=
X-Google-Smtp-Source: APXvYqx8YdxiJRTETb65MoOoP0YPMRhWuV7liiaTcVQ7PsRrZ9s4itW5sSnFufuBzSInHjkibmW8znCcgKjVkrX5SGo=
X-Received: by 2002:a9d:1e88:: with SMTP id n8mr101570437otn.369.1578071660919; 
 Fri, 03 Jan 2020 09:14:20 -0800 (PST)
MIME-Version: 1.0
References: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
 <762ea0a4-cc2a-4b7d-91fc-efa9e9531043@zx2c4.com>
 <7eb40791-9689-2b3d-bfb0-2299cdf7b07a@attglobal.net>
 <CAHmME9r+HM27xhjwDP3q=DJV7KJsvZS__75szHzBE4qHBoXYUg@mail.gmail.com>
 <CAHmME9ruOqW=PRXE=mKj_a2WZ9q1CbUh7YOCf7ZhhNx6Us33kw@mail.gmail.com>
 <CAHmME9qMXKanb2dyQdGYWY=T=TjAGYmhtdAeKDmRzV=6Hdd7ww@mail.gmail.com>
 <PU1PR03MB3175D92D59E6C47D12822411D7230@PU1PR03MB3175.apcprd03.prod.outlook.com>
In-Reply-To: <PU1PR03MB3175D92D59E6C47D12822411D7230@PU1PR03MB3175.apcprd03.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 3 Jan 2020 18:14:09 +0100
X-Gmail-Original-Message-ID: <CAHmME9oxF4xeHXpirt+iRWQeWknDiteJ7S7WS7fMhfw7nPsHEg@mail.gmail.com>
Message-ID: <CAHmME9oxF4xeHXpirt+iRWQeWknDiteJ7S7WS7fMhfw7nPsHEg@mail.gmail.com>
Subject: Re: wg-quick: syntax error, unexpected saddr
To: Alvin Darkness <AlvinD11@hotmail.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Fri, Jan 3, 2020 at 5:43 PM Alvin Darkness <AlvinD11@hotmail.com> wrote:
>
> Unfortunately as slackware 14.2 is a (quite old now) stable release there isnt much we can do about getting nft past 0.6.  A good portion of us slackware users have moved onto slackware -current, which is the rolling release, as we wait for Pat to pull the trigger and get slackware 15.0 out.   Slackware -current is using nft 0.9.3 at the moment, so no issues there.
>
> I can add a caveat to the description/readme on the slackbuilds wireguard-tools page to include something about wg-quick and nft compatibility for 14.2 users.
>
> That commit is up to you.  If you think an install time solution is better we could just add something to the build script instead.

Can you just add:

sed -i 's/type -p nft/false/g' src/wg-quick/linux.bash

to your slackbuild before installing? That'll make it fall back to
iptables always.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
