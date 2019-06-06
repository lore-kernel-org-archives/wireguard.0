Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064CBC28EB3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 10:15:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC8F20866
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 10:15:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pwbxGR2H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC8F20866
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 912e0706;
	Thu, 6 Jun 2019 10:15:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4edf565a
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 10:15:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 435265bb
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 10:15:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49b613f0
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=du78k/r9EbOAUYKA32Fuw0lWQBU=; b=pwbxGR
 2H+aK4GFbMx6A1ddOvxRybM9Ct6I7hsCaOHakyor3gf6G6lGdhEMTTJ2RPaopHO3
 zMi4Bi+nmTuzSBC/tMLlgRyR3asy8OuWrYofu5pzgMEtccRVk/zC2oGTYHPrhV50
 7Tp1Md9JdYUA4B5Qyp0WPCBDyrP4eH3kUTyXUYQeEwnvNvpxwmDBvQiWj+Yl+XAB
 bncEFvtuAqUU4hnioD9lpRvh5tJ+FdbZvghGm1vMp6sNBB2uZUlSY9wD6KCGaKEB
 9TFQTiLPvA653idhSZ5feGGmZ0fE1Qr4z7iuUv7McG3X+faiI5oJmkDnla2NLJSu
 ntr4kHhJpR9sf09w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a7774772
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 09:44:04 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id t76so1174885oih.4
 for <wireguard@lists.zx2c4.com>; Thu, 06 Jun 2019 03:15:32 -0700 (PDT)
X-Gm-Message-State: APjAAAXsg6RBe9Eh92jkUkr6hgYXBt3DHDd4GZNfwZURp6N8lB+7dOBs
 /EIRlBpbB/LnUWSZbfwZ3NrLk5BjasUUe9yD8RE=
X-Google-Smtp-Source: APXvYqwdBIbrMQtkxRT9CrFVMaoDQjmOouFjZYZmyMWRn3U757Z9QbFwCaduLlZ6PzL7vgM5kjUPZn2CpHTbV7qwltw=
X-Received: by 2002:aca:5ed7:: with SMTP id
 s206mr11146621oib.122.1559816131768; 
 Thu, 06 Jun 2019 03:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190521081648.12160-1-jwriteclub@gmail.com>
 <20190521081648.12160-2-jwriteclub@gmail.com>
In-Reply-To: <20190521081648.12160-2-jwriteclub@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Jun 2019 12:15:21 +0200
X-Gmail-Original-Message-ID: <CAHmME9rLHOtovipk8y+t46w8gsi75vYzp-9xRPaOQ7XSHbRHeg@mail.gmail.com>
Message-ID: <CAHmME9rLHOtovipk8y+t46w8gsi75vYzp-9xRPaOQ7XSHbRHeg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Bubble up the error in attempting to delete the
 interface after attempting to set the interface name has failed.
To: "Christopher O'Connell" <jwriteclub@gmail.com>
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

Thanks, I'll apply this. But can you resubmit with a proper
signed-off-by line (git commit -s) and a commit message that meets the
format of all the other ones touching that file?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
