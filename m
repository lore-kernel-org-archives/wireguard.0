Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B33C7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:52:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E39D121872
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:51:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="tMqvfJlw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E39D121872
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fc8c258;
	Wed, 17 Jul 2019 20:51:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36ce2873
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:51:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04f4d38b
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:51:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a59250aa
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=SvRi3e7HYY0nKnvn+QD1LjppmWw=; b=tMqvfJ
 lwRSaanXScZKTghD6gyg0HyyVwwH7xoqmcLbrFZAhJPCL+Mr3hfHn7EvPf3u0pix
 9ADwgGKcgko2iAnulv9nYqHI1zLM2c9OhNmozYPKIOYmgu274MXNj+WuuGH9KjIz
 ei9xEpWZSOAmtcqPkVCvcCYtJ9siJjp8Cdw1O0nDqmHYebTRWGUzNq+UrB6aMMJE
 d5uWEj73Obb4UmV7REigkDxBxPOgM6zs26lf5aF5YXGkjfQgz+RF84TPVIrDcyPN
 /Iu0HcUAeMAeV8CXt4jUWFH94ReimLWXgrBX8ESSxutGpW8Su2cIiAKKav6KnsX3
 ZDhtilkKT5eZdBug==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6b91b81f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:14:56 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id j11so2326680otp.10
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jul 2019 13:51:44 -0700 (PDT)
X-Gm-Message-State: APjAAAXAOMJMc2ozB5CVQyyFhNwmqRxC7Ewfl0jgBY+QQzCy7X7A3im5
 wHu1tsrEoQmxVYTWZKlJ6B55JS7mNhyij/E/xO8=
X-Google-Smtp-Source: APXvYqyOjhkE0Rem36poNiml8r9e7srb46zgHRCnyJR8J8+jN+bPt7dOMmx2UflvqNwQSaJG8nISoUqcviYvn8yJiNs=
X-Received: by 2002:a9d:67d5:: with SMTP id c21mr9897096otn.243.1563396703505; 
 Wed, 17 Jul 2019 13:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAJcUPC4W67nNOMWDW27m_fnNNYMvrkXr5Zi1AGNn_6miJ1=iPg@mail.gmail.com>
In-Reply-To: <CAJcUPC4W67nNOMWDW27m_fnNNYMvrkXr5Zi1AGNn_6miJ1=iPg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jul 2019 22:51:31 +0200
X-Gmail-Original-Message-ID: <CAHmME9oRe5L1w0O6sgoEG1CpMaVX2gwnCcLrhBn5_7SW0ix_Rg@mail.gmail.com>
Message-ID: <CAHmME9oRe5L1w0O6sgoEG1CpMaVX2gwnCcLrhBn5_7SW0ix_Rg@mail.gmail.com>
Subject: Re: Wireguard for Windows tray menu problem
To: Alexey Ivanov <alexey.ivanes@gmail.com>,
 Alexander Neumann <an2048@googlemail.com>
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

Hi Alexey,

Cool bug and thanks for the reproduction steps. I see the same thing
you are. I love bugs like these. Will investigate. I've also added it
to our Windows TODO:

https://docs.google.com/document/d/1-jlULsy1uDun-b4ow3RvnNQJU5K_pAv87sqDAfK66Kk/edit?ts=5cd97371

Jason

On Wed, Jul 17, 2019 at 10:39 PM Alexey Ivanov <alexey.ivanes@gmail.com> wrote:
>
> Hello.
>
> Here is a bug when wireguard's gui tray menu opened.
> Sometimes when menu created behind taskbar (known windows bug) you can't open Windows Start menu by pressing WIN button or click on Start.
>
> Steps to reproduce:
> 1. Press WIN
> 2. Right-click Wireguard tray icon
> 3. Press WIN again, 50/50 Windows start won't open.
> 4. Click Windows Start it won't open, but it should.
>
> Also wireguard's menu when its created behind taskbar won't even close itself when you click somewhere else on desktop, only way to close it now its select any menu item like "about" or exit.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
