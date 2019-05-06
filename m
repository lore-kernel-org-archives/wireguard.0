Return-Path: <SRS0=sgLz=TL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3A4C04AB1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:10:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81C382173B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="cO0r5mKM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81C382173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2abb19c7;
	Sat, 11 May 2019 13:10:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 603cb787
 for <wireguard@lists.zx2c4.com>; Mon, 6 May 2019 20:57:16 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [IPv6:2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 027220c9
 for <wireguard@lists.zx2c4.com>; Mon, 6 May 2019 20:57:16 +0000 (UTC)
Received: from nico.schottelius.org (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 09E04200F8;
 Mon,  6 May 2019 22:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1557176235; bh=z+BGfO/I/0bX6iy9vQCUNvXr06JUl7Wc70y2Yh3ys0o=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=cO0r5mKMGIjkXR+S86F3EdbNTcsphkYEGNF4tMQUQJBNjTh/wlThCyn9D0x6J4o0V
 hCDlGQ4+bPPY+r72KzQ5smNi1E9v8vBH6esbKvkjZU5YDs5Emc6R9Li9/HjzEvkyb9
 8KooUVi7QlDN4juP2gIskvS5iiAS0xYOXWGz4kIY=
Received: by nico.schottelius.org (Postfix, from userid 1000)
 id 43E3A1A011B2; Mon,  6 May 2019 22:57:14 +0200 (CEST)
References: <CAFWLA-XbDKtYHib8G2ujk7E+fsuPco9uX9NvPsu35Dd_HxVGyA@mail.gmail.com>
User-agent: mu4e 1.0; emacs 26.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Will Tisdale <will@z3n.uk>
Subject: Re: Request to change IPv4 preference - mobile apps
In-reply-to: <CAFWLA-XbDKtYHib8G2ujk7E+fsuPco9uX9NvPsu35Dd_HxVGyA@mail.gmail.com>
Date: Mon, 06 May 2019 22:57:14 +0200
Message-ID: <87pnovti6t.fsf@line.ungleich.ch>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 11 May 2019 15:10:35 +0200
Cc: wireguard@lists.zx2c4.com
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


Hey Will,

I think the "proper" way to handle this is by using the happy eyeballs
algorithm: resolve AAAA and A, connect to both, use whatever answers
first.

Best,

Nico

Will Tisdale <will@z3n.uk> writes:

> Hello,
>
> I sent a message to the list about weirdness with IPv4 being preferred
> over IPv6 in the iOS app a few days ago, but it didn't get there for
> whatever reason.
>
> I've since done a bit of digging through the code and found that
> preferring IPv4 is intentional, and it's also implemented that way on
> the Android app too.
>
> It seems a shame to hobble native IPv6 support for everyone just to
> work around some peoples misconfigured setups.
>
> My suggestion/request would be to change the apps to prefer IPv6 as
> default, but add a switch to the apps to disable IPv6 or prefer IPv4
> for those with broken setups.
>
> Does that seem reasonable?
>
>
> Cheers,
>
>
> -Will
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--
Your Swiss, Open Source and IPv6 Virtual Machine. Now on www.datacenterlight.ch.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
