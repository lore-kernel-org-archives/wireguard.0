Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB71C432C1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:30:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82E7C20673
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:30:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="uFLcSUjc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82E7C20673
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d60e206;
	Wed, 25 Sep 2019 08:29:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02f3dbe9
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 08:29:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8eca7fa0
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 08:29:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83b6b69e
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 07:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=F1x6e+
 cCGG/zD2EMOllsVE7y05c=; b=uFLcSUjcfehMSQaYeALWaBn4jNxO+wgx8fX7h0
 FcPxVROU1FWNhQqgVP3Y2Wzpdsk3riWgZHyoVC5J5TWJfGEX7V1/FcrBhjxsETS/
 TF2T8T/lcbgsmxElLSK6D1ULFg2ggjEm9uzcdWFVIBY1xrn2QptvD1H0PNVKOjeZ
 l1G93XobpNjHPRUR1e7jalUVGKpSQH6nxMjAnvLz6Tulr6hbTFxsMXdGTBVUh8/J
 dzSN9eQ2s2WbG4NQU8wn9F+uPVT74v5kFhPhZ3yOTYvyZH/qX2dvBTrlu6+99GLw
 ZDuGwpmEo309sBG+lhwVd1cRv0/HgTP+hK46WgzDst/3yS+w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 53304f34
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 07:44:14 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id k9so4158689oib.7
 for <wireguard@lists.zx2c4.com>; Wed, 25 Sep 2019 01:29:57 -0700 (PDT)
X-Gm-Message-State: APjAAAUkthLwehPzvkJfFTQG0fuLGRtHXAXCOMmzrYrF5jZ7l/D2wPKI
 21I4zvMoFGX2tNIkTf4WP9wLPylwmc++oFrq45s=
X-Google-Smtp-Source: APXvYqwNXLHiOGCKCubwzVxRj/ec4LjQJFZ7Aw+gylPjxUUmM/jS8eL6FGpbNGuX9OzHxhRru7lSKTbuxmkXFmEDZYQ=
X-Received: by 2002:aca:f555:: with SMTP id t82mr3519613oih.66.1569400196781; 
 Wed, 25 Sep 2019 01:29:56 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 25 Sep 2019 10:29:45 +0200
X-Gmail-Original-Message-ID: <CAHmME9pmfZAp5zd9BDLFc2fWUhtzZcjYZc2atTPTyNFFmEdHLg@mail.gmail.com>
Message-ID: <CAHmME9pmfZAp5zd9BDLFc2fWUhtzZcjYZc2atTPTyNFFmEdHLg@mail.gmail.com>
Subject: WireGuard to port to existing Crypto API
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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

Hi folks,

I'm at the Kernel Recipes conference now and got a chance to talk with
DaveM a bit about WireGuard upstreaming. His viewpoint has recently
solidified: in order to go upstream, WireGuard must port to the
existing crypto API, and handle the Zinc project separately. As DaveM
is the upstream network tree maintainer, his opinion is quite
instructive.

I've long resisted the idea of porting to the existing crypto API,
because I think there are serious problems with it, in terms of
primitives, API, performance, and overall safety. I didn't want to
ship WireGuard in a form that I thought was sub-optimal from a
security perspective, since WireGuard is a security-focused project.

But it seems like with or without us, WireGuard will get ported to the
existing crypto API. So it's probably better that we just fully
embrace it, and afterwards work evolutionarily to get Zinc into Linux
piecemeal. I've ported WireGuard already several times as a PoC to the
API and have a decent idea of the ways it can go wrong and generally
how to do it in the least-bad way.

I realize this kind of compromise might come as a disappointment for
some folks. But it's probably better that as a project we remain
intimately involved with our Linux kernel users and the security of
the implementation, rather than slinking away in protest because we
couldn't get it all in at once. So we'll work with upstream, port to
the crypto API, and get the process moving again. We'll pick up the
Zinc work after that's done.

I also understand there might be interested folks out there who enjoy
working with the crypto API quite a bit and would be happy to work on
the WireGuard port. Please do get in touch if you'd like to
collaborate.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
