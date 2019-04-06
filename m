Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364C1C10F06
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:59:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91AAE2083E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:59:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="xIzeZ7U0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91AAE2083E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d9f1eea;
	Sat, 6 Apr 2019 11:56:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3b60063
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 11:56:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f98c20e
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 11:56:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f9b77bd
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=JyENc9hPmGdGnoPsoBN8X/NsOHQ=; b=xIzeZ7
 U0wx0pxe33usz3FB2mz2Wws5CVgf81+m3n+v3BaTjlahA83l0D5NOr+OQqi946ZQ
 gRr7X0iWwjsVvkWsycUMI2TtIkRZwi9maiE2nN8G66y4yVEYe6R4kOGE5Jeqse+A
 dx/24v46MhdbohhcuzlTc88iHCpu4heWEHNHHXMe1XlsZKvNp6Pttn79pMuc9NZF
 dhivmhcagPVMrn0OLmXuP9cslZ12cgxsbpc+jh0pjNc4EmVoU/Qf2YuDTpOgI53Y
 xsipiGhgEIBUxeWZSZnS8S92dnemJgNcagDDYYzNqDYhiCymZ9MBj6Y+8RuZGa7x
 EUGh63wlYb8ypKNw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dcdbe531
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 11:35:17 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id y84so6969395oia.12
 for <wireguard@lists.zx2c4.com>; Sat, 06 Apr 2019 04:58:56 -0700 (PDT)
X-Gm-Message-State: APjAAAXtGjB5UpvVE1dBu8YxrS00vydHoEqpT1djcnMaQw9tm30bU1jG
 5OuSTDDg3XicJ3wVzp3McIYYjfBF4Uynlf7sPWk=
X-Google-Smtp-Source: APXvYqwRaxGchmc+4N6/24kCnCBfk832OYN2OI3yIlZgQ0dBSDYVdSKhQo+wt6iILRM8HZoe2vcb2YSyaoBTq4UQsVk=
X-Received: by 2002:aca:550c:: with SMTP id j12mr10305615oib.52.1554551936363; 
 Sat, 06 Apr 2019 04:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <CALwBDFuMTbXCEXW3Qbpbuk6LL1pj+bCedZ9p6P6R6tJV0zBqTQ@mail.gmail.com>
In-Reply-To: <CALwBDFuMTbXCEXW3Qbpbuk6LL1pj+bCedZ9p6P6R6tJV0zBqTQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 6 Apr 2019 13:58:45 +0200
X-Gmail-Original-Message-ID: <CAHmME9ps153jM+QVKr4ppBniqkw53DntF3ELagKPYAbMk6RORQ@mail.gmail.com>
Message-ID: <CAHmME9ps153jM+QVKr4ppBniqkw53DntF3ELagKPYAbMk6RORQ@mail.gmail.com>
Subject: Re: Multiple connection support for GUI clients
To: Varun Priolkar <me@varunpriolkar.com>
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

On iOS and Android, this is a limitation of the APIs provided to us by
Apple and Google. On macOS, the API is extremely buggy with multiple
tunnels, and we're not sure we can make it usable until Apple
straightens out the behavior there in a future release. If you'd like
to poke around with the latter, feel free to join us in #wireguard on
Freenode.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
