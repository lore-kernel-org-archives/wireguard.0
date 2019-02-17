Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADF6C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:58:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8672921874
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:58:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XbIBFiI/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8672921874
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e34bd69a;
	Sun, 17 Feb 2019 01:49:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 060edea0
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 01:49:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10dd5c85
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 01:49:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e663788
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 01:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=+BY0NRdc4WxhUmNu+AcqtU4bWqw=; b=XbIBFi
 I/5IfAdPguMzd12qjs/90+2qGbSPeBA9YASrDIH4iknPHNuwhO4onwOioZgDgF85
 skteNHgBqfW3tQhWPMl6smlgA7/5x3m8Oez6wELyHedArzRaQ7ZSxg8YCbthZ0ML
 ghk5ozgZfu4dZ/9g3tcUeedDK7U/pi2TQ/t3ZdI0PWNmXL2nys01a1T7W1L6VGqj
 JlIB9seC1dYXeMM7AwntK9k0HPRI4X2RHlsL+9ndGOFC2af5u4gnUp7vnVYFlVJg
 P3ZyCLl8LKI3igkqVWquejz/qW47IT7yCSPrKh39VhguAnj010VD9TGGG8zba5J9
 JjO2UIqSPXH0S3tQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 198bc036
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 01:40:40 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id v62so14044015otb.3
 for <wireguard@lists.zx2c4.com>; Sat, 16 Feb 2019 17:58:08 -0800 (PST)
X-Gm-Message-State: AHQUAuZ4QzcN5oLdoH1J7mImLq7D9PwVmNd0ofB2JMZBzPGZwTi3ay7L
 a0cI/FVhuiHr674+vdP5KKQwGxgxa2JP+dXM8EQ=
X-Google-Smtp-Source: AHgI3IaQkhtJnh5aNRxc+NrdkNPcpaKlYsL5dAckQ1cDHWwo55ZyYQpMe36BwqUUmm7DU1Pe9r8cbygzfOp7LeZlUoM=
X-Received: by 2002:aca:eb52:: with SMTP id j79mr9672371oih.119.1550368687748; 
 Sat, 16 Feb 2019 17:58:07 -0800 (PST)
MIME-Version: 1.0
References: <mailman.3.1550314802.25721.wireguard@lists.zx2c4.com>
 <61B2DFA7-71B6-43A4-99F8-EFB537A4BA44@mercier.uno>
In-Reply-To: <61B2DFA7-71B6-43A4-99F8-EFB537A4BA44@mercier.uno>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 17 Feb 2019 02:57:56 +0100
X-Gmail-Original-Message-ID: <CAHmME9oSWZuq3UDXSWhg4H0NZMH0knrCh8hD=Ho73mLihy30GA@mail.gmail.com>
Message-ID: <CAHmME9oSWZuq3UDXSWhg4H0NZMH0knrCh8hD=Ho73mLihy30GA@mail.gmail.com>
Subject: Re: Subject: WireGuard for macOS
To: Vincent <vincent@mercier.uno>
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

On Sun, Feb 17, 2019 at 2:36 AM Vincent <vincent@mercier.uno> wrote:
> Thank you Jason for the Mac version.
> Can we mac users get also a previous OS version support?
> 10.13.

We'll happily consider patches that polyfill 10.14+ APIs such as
Network.IPAddress, Network.NWPathMonitor, and
AppKit.NSApplication.effectiveAppearance, especially if you can do it
in a minimally intrusive self-contained way. IPAddress should be
trivial. effectiveAppearance you can just ifdef out. NWPathMonitor
you'll need to reimplement probably using an AF_ROUTE socket as
backend, or perhaps you'll find a better API. It shouldn't be overly
onerous to do. If you need help implementing it, don't hesitate to
ping me on IRC and I can help steer you in the right direction.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
