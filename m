Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D62C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:17:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB5BF206BB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:17:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="w5kPdGBL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB5BF206BB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ccda3e2;
	Fri, 6 Sep 2019 19:16:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec8dec22
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 19:16:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57aa5024
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 19:16:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07ac9b2c
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 18:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=iKcNQ81cBfogH2hszFqP1I6zx0c=; b=w5kPdG
 BLk1fKRo3Sm4WhuCoeErFZ5lVUjyPW0bvsNGz42KDCffCyoLmpa561cxWGVIgN2A
 +8jHILDeX0wu0GLovDho86tptVsoiJwunmEvuOK6/N6o6vkM8D2j3SwH6yjPjM0N
 GMa8t5LX1slrbeDZYa0fN6IiCXpr2ZQ+DCho7QgtR5ivBEPonR9NvXruVbStUy0H
 icu1wzhyezjHhhoCbPknUeV51MSkfDeUXWG9O+PdWmWPhgoJlTlK7QAr188b7EGN
 OAjvFvvcdLo7AV/V1B20BuU2tdUW2xOv9cchrhNCFaGYof2E8zdDSkTYoN2tqc5L
 Rx7XLUU7XHa0On1A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3c1b5871
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 18:33:10 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id h17so2892867otn.5
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 12:16:31 -0700 (PDT)
X-Gm-Message-State: APjAAAUEpxVg7yumNkvusDngIefOTces+Ef5t3OzedoCqfuc90s1UVXZ
 xML6kmzK9eWmFmXmB2Lt0sWAp13uR7BVJ1NGLjI=
X-Google-Smtp-Source: APXvYqxehl3Lzopen7isEs85Hl9lFa6afctQ7Asd1csDEqvz2hWTbpRypuT8GGtib5MOFRBYClkkfEsJhrXP/F9EoMQ=
X-Received: by 2002:a9d:73c4:: with SMTP id m4mr8736038otk.369.1567797390630; 
 Fri, 06 Sep 2019 12:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAC4jZLHEJAHZpPnNJR22jzVC-nn1of3CbopgTdv=-5Mv2e5=Yg@mail.gmail.com>
In-Reply-To: <CAC4jZLHEJAHZpPnNJR22jzVC-nn1of3CbopgTdv=-5Mv2e5=Yg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Sep 2019 13:16:19 -0600
X-Gmail-Original-Message-ID: <CAHmME9rKtM60QicmrnjWUNQJit6Xtm-iZiqztAohC6M-S2ssCg@mail.gmail.com>
Message-ID: <CAHmME9rKtM60QicmrnjWUNQJit6Xtm-iZiqztAohC6M-S2ssCg@mail.gmail.com>
Subject: Re: kernel 4.4.0-161-generic (i686) build problem
To: Jorge Mireles <jorgeluismireles@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thanks for the report. Ubuntu's kernel team made an error in
backporting a patch from mainline. They're aware of this error, but
they're unable to rectify it for another 7 weeks, which clearly isn't
an acceptable amount of downtime for WireGuard servers. So yesterday
we made a new WireGuard release that works around this issue. Then,
this morning, Egbert, the maintainer of our Ubuntu package, published
a new Ubuntu package for our new release. So you should be all set by
running `apt update && apt upgrade`. Sorry for the hassle. I'm not too
happy about this situation myself, and I'm going to try to figure out
how the Ubuntu kernel people can make sure they don't break WireGuard
in the future with some sort of CI.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
