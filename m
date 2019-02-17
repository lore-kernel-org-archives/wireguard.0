Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28E9C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 02:24:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1946121B69
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 02:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XyZiRiwl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1946121B69
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 144dec8f;
	Sun, 17 Feb 2019 02:16:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 858bb072
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 02:16:15 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0052769
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 02:16:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3cd8f57
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 02:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=XMLCo6RiLzG9dzRdxDfB3xZDHJs=; b=XyZiRi
 wlJ06iMhNF+T+fooemus+Qmne+k0ZnJkPJy133goubTwMMuUhLzwmvvmedu5wxbh
 QZuIH206jDWBPSn8VGq/C+4kC4eykOBXkcd79BSGVyfFkyg+0bDIVG2xtx7PrRIt
 YEENwhhhBWchy3SgpN3Trg761HCshD6ksI3CvO/H/RMbXgeHkdEoWU7M66AgdDjd
 f8cDGnZP5fO1aEwwniuawazf1rTKu0e2dRmxkPtIjL0Hg1iaKy5/blAni2dON1Qy
 b89YTL1lzlApXQFtDoLM/yREQrYleJxSe5AmG8IdlnY5obJjop/N2E1pHu0xYK1+
 cANZt98o/wMPck5A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 63b77f59
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 02:07:01 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id c18so1342188otl.13
 for <wireguard@lists.zx2c4.com>; Sat, 16 Feb 2019 18:24:29 -0800 (PST)
X-Gm-Message-State: AHQUAuaBqyY4gKnbZATw9BylCePYsuPsOaEnLYrU048WWSJo6kNHTVeH
 VBTbEOTjdPfdaCscrDv9Z/WyOYSXEOlRiDA7YL8=
X-Google-Smtp-Source: AHgI3IaH9W7sneqErf8TqfNKH1tD/Dmp7UFb//0OuGW2iAZ5t9OGnl3o8fpYX86J0790DjIS/6Gk0Wt8fBgIZMcc1u4=
X-Received: by 2002:aca:eb52:: with SMTP id j79mr9714108oih.119.1550370268539; 
 Sat, 16 Feb 2019 18:24:28 -0800 (PST)
MIME-Version: 1.0
References: <MWHPR20MB1245664BA43F11A3368F1D8BE96F0@MWHPR20MB1245.namprd20.prod.outlook.com>
In-Reply-To: <MWHPR20MB1245664BA43F11A3368F1D8BE96F0@MWHPR20MB1245.namprd20.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 17 Feb 2019 03:24:17 +0100
X-Gmail-Original-Message-ID: <CAHmME9r=rUwZpwW_Q4wYaV-LBGf5YSxgD8dJW-uf2JKEuSXRrg@mail.gmail.com>
Message-ID: <CAHmME9r=rUwZpwW_Q4wYaV-LBGf5YSxgD8dJW-uf2JKEuSXRrg@mail.gmail.com>
Subject: Re: Wireguard-go on FreeBSD - Not working until the interface (wg0)
 is set into promiscuous mode
To: Nate Williams <nate@yogotech.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

That's odd. Does this fix it for you?

https://git.zx2c4.com/WireGuard/commit/?id=7c833642dfa342218602ab18e7091e86408d2982
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
