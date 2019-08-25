Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D53C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:23:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2413206DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:23:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="U4Xo2gcQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2413206DD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63090bd1;
	Sun, 25 Aug 2019 15:22:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87603f06
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:22:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f11d4cc7
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:22:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d90197c8
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 14:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=lAHdNNRYHONbX3q+ZNzXsDrgzGg=; b=U4Xo2g
 cQbh63QcDyZ66D7N/ReJ2pgO34mZvfye59JTiyD2m2E74jdJNXS06Wl11FZUEMgC
 0U9q8FVuUu7GJMmSa44Riftpre5rMK/sXlPZ2mFndVDFSG+QrYPAYNrnLNqEB3Ed
 qRWk23qn+qAQ5aQB9yh1UcKvCW08ss6+F/aYqJDUfZ1oRrZsb+GxaBzwuHtmNtK8
 JhnZ9TTggJNq+3ofdawNV6R/jRbeu9YYYADETEM3gckxf+4bfUHyB3n47xNpmjjs
 VauCxFWHxzbN4jlCAcs8mMyLe3BuiEC0RPrW7x8GsI/zLmcfpQ3hwKLxaJcnMBKO
 PlZs2qztoJzLp/dA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 70addf22
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 14:41:00 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id m24so12944562otp.12
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 08:22:48 -0700 (PDT)
X-Gm-Message-State: APjAAAUKLoXmkOLQPiuekowRNC7ONJXJDuKeRs3PCZdACkiDgWEerchj
 e5Uf4rgr05CnLmaLBPdSgcj0FO7XOThgjiKV9pI=
X-Google-Smtp-Source: APXvYqydYFTHmVCdCvwP8WUqx92496/kcHoVmPGcm+1qUfBmLJrK1FssLaLaQr6rPA6aEwt/nbpol1uKLrJB4nhL9dg=
X-Received: by 2002:a05:6830:10c7:: with SMTP id
 z7mr11962887oto.243.1566746567555; 
 Sun, 25 Aug 2019 08:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <5d625420.1c69fb81.9f8e7.70a4@mx.google.com>
In-Reply-To: <5d625420.1c69fb81.9f8e7.70a4@mx.google.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 09:22:36 -0600
X-Gmail-Original-Message-ID: <CAHmME9rDLvQQNd0VO5_rrNMakxaXuYt9hKij+tqOJ5aOur3gQQ@mail.gmail.com>
Message-ID: <CAHmME9rDLvQQNd0VO5_rrNMakxaXuYt9hKij+tqOJ5aOur3gQQ@mail.gmail.com>
Subject: Re: [PATCH] tun: darwin: fix panic: close of closed channel
To: liuhaichao@bytedance.com
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

I was under the impression this was fixed with
https://git.zx2c4.com/wireguard-go/commit/?id=6d78f895579b114c93bd493ad8d61316fc5dd15a

What precisely is the bug you're seeing?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
