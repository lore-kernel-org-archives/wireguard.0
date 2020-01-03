Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAB9C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:38:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C27421734
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:38:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="MC+a1P0J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C27421734
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a87efc1;
	Fri, 3 Jan 2020 15:38:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26b988a9
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 15:38:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0405b7b9
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 15:38:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b90ebe3b
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=A0PEVc2rd2XgwNVZ9VThyUBRo2U=; b=MC+a1P
 0JnoQ4/f2wrY4p/vftOzmYmeoo7HRJMWvIXWV9hmWzWfUaajIKxecPD9YdQ6BfHB
 51piQ0UoKdoFIo2LYylVT3jSL5hcZhF5+5AFDnSVsufLl9TL+5Rj6vp5+Z70eJc2
 Hkiv3so4ADMNnWr8VE0lqzx8SmHukoRL0q41O4XYRXAPXSW+2xP3xIgLRa6ivmfM
 fvcnl1/2ZNuk/GWbOHuI5l5KsgN8K7P3lMvmFlivFKSG+MhstLzRLisfkWx+P0iR
 8fVXZnsWbN7vY6U2ui9gJzOVJZl8AsbXIax0hPVlC1pBR5bjsYBXwc+H3ahV/K+l
 oJ/WCyp+33hBfoeQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2e6ba7f8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 14:39:53 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 19so49117119otz.3
 for <wireguard@lists.zx2c4.com>; Fri, 03 Jan 2020 07:38:31 -0800 (PST)
X-Gm-Message-State: APjAAAWnt95i30navnZL2d6oHN0Oi2jlEMNJVAbx+5Hvn8sbq7cY8H9k
 ggcImBe1dTWRwox1MhRcZojtGWID38cBI5Xzxs0=
X-Google-Smtp-Source: APXvYqwkZ42NhtiBzXm2oQqjWJyDDsfYXFeoqk2n4KWqrQmAbXSk5eu9+Xnn42yHNW7oQT/BBE+iItxvTXMhOZ6Z/HU=
X-Received: by 2002:a9d:6745:: with SMTP id w5mr85089567otm.52.1578065910872; 
 Fri, 03 Jan 2020 07:38:30 -0800 (PST)
MIME-Version: 1.0
References: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
 <762ea0a4-cc2a-4b7d-91fc-efa9e9531043@zx2c4.com>
 <7eb40791-9689-2b3d-bfb0-2299cdf7b07a@attglobal.net>
In-Reply-To: <7eb40791-9689-2b3d-bfb0-2299cdf7b07a@attglobal.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 3 Jan 2020 16:38:19 +0100
X-Gmail-Original-Message-ID: <CAHmME9r+HM27xhjwDP3q=DJV7KJsvZS__75szHzBE4qHBoXYUg@mail.gmail.com>
Message-ID: <CAHmME9r+HM27xhjwDP3q=DJV7KJsvZS__75szHzBE4qHBoXYUg@mail.gmail.com>
Subject: Re: wg-quick: syntax error, unexpected saddr
To: Eddie <stunnel@attglobal.net>
Cc: alvind11@hotmail.com, WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Eddie,

A new Slackware maintainer (CC'd) has been found.

Something to consider with the nft(8) issue, by the way, is not only
the version of nft(8), but also the options in your kernel. We check
for these ones in Gentoo:
https://gitweb.gentoo.org/repo/gentoo.git/tree/net-vpn/wireguard-tools/wireguard-tools-1.0.20200102.ebuild#n39

Jason


On Thu, Jan 2, 2020 at 9:43 PM Eddie <stunnel@attglobal.net> wrote:
>
> I don't use those packages for wireguard.  I build my own from source.
>
> But yes, the rest of Slack seems to be stuck in a time-warp.
>
> Cheers.
>
>
>
> On 1/2/2020 12:10 PM, Jason A. Donenfeld wrote:
> > On 1/2/20 6:25 AM, Eddie wrote:
> > > First time running wireguard as a native client on my Slackware 14.2
> > > system throws this:
> >
> > So far as I can tell, Slackware hasn't updated its WireGuard since
> > 2018: https://slackbuilds.org/repository/14.2/network/WireGuard/
> >
> > I've tried several times to contact the maintainers and have not
> > received a reply.
> >
> > It sounds like their kernel and/or nft are similarly bitrotted?
> >
> > Maybe consider a new distro.
> >
> > Alternatively, just get rid of nft from your system, and it will
> > fallback to using iptables.
> >
> > Jason
> >
> >
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
