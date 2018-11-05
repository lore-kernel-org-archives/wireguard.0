Return-Path: <SRS0=DDek=NQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7860C0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 23:20:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 337A42085A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 23:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lTG4OQMn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 337A42085A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2dcdf6fa;
	Mon, 5 Nov 2018 23:15:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74852015
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 23:15:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34630302
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 23:15:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e604be8
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 23:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=q4+HCaTTXcq/QqbnWSsVTXX0Btk=; b=lTG4OQ
 MnCx62MC4oE38Xp7QwBxj6M7y2LKjkZ6NfNNbfGV6KGD1Lrrh9JlZkQcJSFMVekk
 SFvPcoUaGHz0bfDgs7nxNUkoM0TlJtc/+gIjF5g7gXlvFKKUi1wU0DJuxlQPIG+3
 gBrhXVIRVqML8y85fmSTc8kZ3sT8RVJKegX6zaPM3ksQ6Vyf89e7XXAIzqCg1Sfp
 ef5Wyrgg6T6xacflHoGVVLj8KVvRmhmmOH9pNBW5hy/usUG66UarrYXHNveuT4tM
 9cD+dmVHU9c0wB6CCZAR1CFKXV4njX90OFplpE5A86sVBef4IJSeWgIbmaQuNBW/
 Wu/CXZi6kBVVdX8g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 80c7ba64
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 23:15:55 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id z33so9625162otz.11
 for <wireguard@lists.zx2c4.com>; Mon, 05 Nov 2018 15:20:12 -0800 (PST)
X-Gm-Message-State: AGRZ1gKhSPIqAhBvRFO9n2ZXy/dANVqpl7QQ3uLcioGdn34Gncj+ubw1
 nqs9+t3dA05F4DzfmCO+fpFtQYqyC5ildkUrWEc=
X-Google-Smtp-Source: AJdET5fvtvgo4gPbHvs1+n9eLFk+uISImI6guGbOhJAoBnq9K6gIhd8uXeDll98FJKrJ3KCnKpd2Xf6TXanXEtWDq2I=
X-Received: by 2002:a9d:60cf:: with SMTP id b15mr14040284otk.144.1541460011833; 
 Mon, 05 Nov 2018 15:20:11 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
 <20181105214406.GA4520@wolff.to>
In-Reply-To: <20181105214406.GA4520@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Nov 2018 00:20:00 +0100
X-Gmail-Original-Message-ID: <CAHmME9qio7BuQ6xPi9c9VX-e3eP5z3Rh9m2LQDfqG1h1kCfB=g@mail.gmail.com>
Message-ID: <CAHmME9qio7BuQ6xPi9c9VX-e3eP5z3Rh9m2LQDfqG1h1kCfB=g@mail.gmail.com>
Subject: Re: WireGuard for iOS - TestFlight
To: Bruno Wolff III <bruno@wolff.to>
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

On Mon, Nov 5, 2018 at 10:49 PM Bruno Wolff III <bruno@wolff.to> wrote:
>
> On Mon, Nov 05, 2018 at 22:27:24 +0100,
>   "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> >Hey folks,
> >
> >For the last few weeks, Roopesh and I have been hard at work on the
> >WireGuard for iOS app. Today we're happy to share a
>
> I thought you went on vacation, as it was so quite since V8 got posted.

I was out of town for a bit, but mostly I've just trying to space out
patch submissions a bit more, to get us to Linux Plumbers and the
kernel summit there, where hopefully there'll be some fruitful
discussions regarding Zinc.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
