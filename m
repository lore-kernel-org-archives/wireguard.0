Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BE8C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:45:41 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3172560EFE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3172560EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8af654d6;
	Fri, 27 Aug 2021 14:43:08 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [2607:f8b0:4864:20::d29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 22662cf1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Aug 2021 14:43:05 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id y18so8848816ioc.1
 for <wireguard@lists.zx2c4.com>; Fri, 27 Aug 2021 07:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=841NI7Z85mz/p/3TXurbi2/xeOdSbUSAAK7flVsYggM=;
 b=Uahlx3CIJDPc3WVyDMnzu21i++h3CLys784uPSXbqscUn/nG7KPhy8eqLDgcn1TgSp
 yHG2dTrmjXt8xXSll10hStzXlpzBsofuKV+mu8eouJZTuyjgRnLGZnABD/g5utHdHwco
 wjn9HOsuatwB8F2KxBgWja/XzcSyOfQv964m4MLh3TRqanjLyic7VJ8b7TPgyjtmm/LU
 FLUQGGZ3ZWHU3U57J8PeN6AuWSz1hrKhcBtO18T8UXcLIXD89d9DcS8gvnzvvbQv3uqW
 7dazcEwGFO0SPI7BmfnD+DzCrUPFM99kyaV+XzvunflcQ78kGfizWtowt3NiplXWCrJM
 gLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=841NI7Z85mz/p/3TXurbi2/xeOdSbUSAAK7flVsYggM=;
 b=WXy1/yU74zflSXsAuMiBaWtnAlWDO4G3F0E164mgvSS522d7PLg5cfQ0lBrwEHWxXh
 Dl6bFmYrqb6MWcRua02Nmx3EHBB3YyuxP/CRpUHmCHaocXfVcPKs+ohaRU2q3gdTtRjA
 NLAjB0DFjshErNu+XG5S2BxKMM3L6x6qP3bJyAKMouWObR9QFabRmkkFHe/h6uRVP2Fd
 q7wdwXUd515LJa5I0mXM1t8Mb4F7NDxP0ViSJux7zQKWX00ENL0qtCYpjOWEvmSLAo9i
 sGFkgcbsGFh37c6bsueNn/9DBwuHzXK+fMyxF39zwEes1HGe3LFLngLrHIczl6+55joP
 aHsQ==
X-Gm-Message-State: AOAM532XTopImYNskx0YhslRsUmc9Vj7tN4StBmnJQtZIlZAtl+bNPHf
 G+jUkX1cMb9wfBg9T/3anZcZQvlNOxeQRGOXaDJA1l9g
X-Google-Smtp-Source: ABdhPJxTfaDDh93mkizsMsaFWqwWntF+F2GrlBUeQQmzDtZzeMSQqpnJLQxVwznxQRiNQtpLiqwr2YVuTL9JkWZK7pk=
X-Received: by 2002:a05:6602:2219:: with SMTP id
 n25mr7646462ion.185.1630075383835; 
 Fri, 27 Aug 2021 07:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <CABK1yFAx0mLhx1jj=WmAfLewvzea6n4hwhabY4RNG137smBiFA@mail.gmail.com>
 <CAHmME9ooDHz4-o0EZzNu1bHOrqDn5NNz-Kv+7Y2B4hLbff9nng@mail.gmail.com>
 <CABK1yFAsb8uKe+rDrhg9CsE-Sw+qr-SzmL5t5mJcSdkfjsfCDQ@mail.gmail.com>
In-Reply-To: <CABK1yFAsb8uKe+rDrhg9CsE-Sw+qr-SzmL5t5mJcSdkfjsfCDQ@mail.gmail.com>
From: Gopakumar Choorakkot Edakkunni <gopakumar.c.e@gmail.com>
Date: Fri, 27 Aug 2021 10:42:52 -0400
Message-ID: <CABK1yFDmYDONbk1DRqDpZYLLTm7uoKnHK=A2E69BSf=V_ec8Dw@mail.gmail.com>
Subject: Re: wintun0.13 memmod load fails in windows10 (wintun 0.12 loads fine)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

oh well I guess I dont need a new wintun, but just the new wireguard
go. Sorry I misread it, will try that

Rgds,
Gopa.

On Fri, Aug 27, 2021 at 10:40 AM Gopakumar Choorakkot Edakkunni
<gopakumar.c.e@gmail.com> wrote:
>
> Thanks for the response Jason. My reason for trying 0.13 version was
> because I "thought" 0.12 had some issue because I was seeing random
> packet loss (I had another email thread for it) - but then I figured
> the random loss was because I was doing a device.New()/device.UP AND
> also reading wintun from my own goroutine, so two of them reading same
> queue. Now that I fixed it, I am happy with 0.12. I will wait for the
> next wintun release which has this memod load issue fixed (0.14 ?) and
> upgrade directly to that
>
> Rgds,
> Gopa.
>
> On Fri, Aug 27, 2021 at 10:11 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Update to the latest wireguard-go commit.
> > https://git.zx2c4.com/wireguard-go/commit/?id=bad6caeb82edd0e22bdbcfa1ca544a5805109e14
