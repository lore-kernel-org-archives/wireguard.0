Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D4AC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 07:53:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3F9A60F6D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 07:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3F9A60F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa0cd423;
	Mon, 27 Sep 2021 07:53:22 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 13bcdf7e
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 07:53:18 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 244D81FF81;
 Mon, 27 Sep 2021 09:53:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1632729198; bh=p08zjBRLqs/A7kSMiPWzi3+AF02FlgcHq+T+ov9ztds=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=M8WApSETIfIwY4DTbq/ji8zzjQBt2IZykLu4nFKDEhXUMw6tcmaaLQ4P+uKNGcZZb
 XHdboyR83UDTSod9Vnpt+3i0A1Td7SewX75/QtYBJ2iEKHUi3ANHO8EE/Hd1Ba18A8
 Xqpx0Z49h546LXn9yx+efkTCFFuNwnH2hBIscCBj8mB5xvaGAT7H8jWwlw7pG1itPa
 bsh0YL77XS8veCN1esF3UxwpZ1eOFBmgf7Ii3FLetflP2PxvoW62u61jBGMsJT0qOT
 xAV7wfV50q+7gCx1DROb+xYvbGNMWVRGVUXPXGgDl1+E7bzWQgqRPtaWA2Ckrptf0e
 N6cixmRDIEZ7w==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id C02E314CC28E; Mon, 27 Sep 2021 16:53:30 +0900 (KST)
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
 <877df2d5px.fsf@ungleich.ch> <20210927071130.GA13681@wolff.to>
User-agent: mu4e 1.7.0; emacs 27.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Bruno Wolff III <bruno@wolff.to>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>, el3xyz
 <el3xyz@protonmail.com>, wireguard@lists.zx2c4.com
Subject: Re: WireGuard with obfuscation support
Date: Mon, 27 Sep 2021 16:44:58 +0900
In-reply-to: <20210927071130.GA13681@wolff.to>
Message-ID: <87y27ibgjp.fsf@ungleich.ch>
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


Bruno,

thanks for raising 2 very important points:

Bruno Wolff III <bruno@wolff.to> writes:

> On Mon, Sep 27, 2021 at 09:53:08 +0900,
>  Nico Schottelius <nico.schottelius@ungleich.ch> wrote:
>>
>>I'd appreciate if wireguard upstream would take this in, maybe even
>>supporting multiple / dynamic listen ports.
>
> The problem is mostly orthogonal to Wireguard. There isn't going to be
> a one size fits all solution for hiding traffic. Failures in hiding
> traffic are potentially very bad for individuals. As such general
> solutions are not something you can recommend universally to people,
> as amateurs are not going to be able to make good decisions about the
> risks and some may get themselves tortured and killed.

1) being able to communicate for non-tech savvy users

This is a very important point, especially a failure to do so might be
critical in reality like you pointed out. So the easier we make it for
non-tech people to "just get it working", many more life's will be saved
from torture. Because the alternative are insecure communication channels.

> This may not be something the developers for Wireguard want to be
> responsible for.

2) The responsibility of software developers

As usual with GPL/similar licenses, software is provided AS-IS. We are
not selling a "fully autonomous car" here that is actually not able to
drive on its own, but instead giving a warranty free software to people.

It's important to raise these points, but from what I can see the easier
we make it for people to securely communicate, the less likely threats
arrive.

Outside of the scope of wireguard I see tunnel combinations like moving
wireguard traffic through udp+tcp/53, tcp/80+443, which are also
interesting options, but are probably solved with other tunneling tools.

Cheers,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
