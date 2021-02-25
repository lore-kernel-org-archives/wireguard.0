Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BB6C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 18:01:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC08764DE8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 18:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC08764DE8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82c7111b;
	Thu, 25 Feb 2021 17:54:36 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fa3758c8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 17:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1614275670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+2XiSsKnPcFygkSvkJ8JQBsPA0c2ulspAXdAuvaJ4p0=;
 b=hpiL1RXNyjWpsK3nopIt2s2VIvKkmgBWWJATYwvoEvkZRggl9x+prcz364TT4xaVAZL41X
 3kVg0Lqqo1a+rlCHgVGpqzxGhCm9NmBKRMlFqb4ZZhi0ODyRFNPrudbdWsUsWc/rg2UnG5
 esB0zL8lGxW3CcknHDBXj2vQBDSJ3vY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 309f0764
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 17:54:30 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 133so6258716ybd.5
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 09:54:30 -0800 (PST)
X-Gm-Message-State: AOAM531y1oQYKp+5h4H/khbLPmLK4JdSOzTQFixoLQs4HQ3IVHooINi1
 bR/I/Qhv2mLYEjmVZ4SPFtnqifZAdEPHL3KeC98=
X-Google-Smtp-Source: ABdhPJx10BSusTNX/wrCbKNhth3URrtCn8MMhULWNMZ7eSKy4U1lxHHZGNUxV3mRmW955m3dTCPYsfn90zEUCFGyB9Q=
X-Received: by 2002:a25:4d02:: with SMTP id a2mr5398559ybb.49.1614275669749;
 Thu, 25 Feb 2021 09:54:29 -0800 (PST)
MIME-Version: 1.0
References: <CADjMg7Vp+p7n_JLMfFU4GwtNu_X3ARFJOuhxLasonuD-fvB5Hg@mail.gmail.com>
 <CAHmME9o9YNUKawN8bYArdfbDF9cZF+1nSTZuMef5RRVeaPTrXQ@mail.gmail.com>
 <CADjMg7VHCX04+UgCY4AwLub5=otDJ9dTHMLdX16OVDZoDG88xQ@mail.gmail.com>
 <CADjMg7WuZ-W0bRPM9oCXT6CnVSdYK=fMRANna7XimtEkerOerw@mail.gmail.com>
In-Reply-To: <CADjMg7WuZ-W0bRPM9oCXT6CnVSdYK=fMRANna7XimtEkerOerw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Feb 2021 18:54:18 +0100
X-Gmail-Original-Message-ID: <CAHmME9qNVFuf170GEObu1_d=F=snG94qE1Y+KWZJ5DEeL_14Vg@mail.gmail.com>
Message-ID: <CAHmME9qNVFuf170GEObu1_d=F=snG94qE1Y+KWZJ5DEeL_14Vg@mail.gmail.com>
Subject: Re: wireguard-go on windows
To: Devanath S <s.devanath@gmail.com>, Matt Layher <mdlayher@gmail.com>
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

+ Matt Layher

Hi Davanath,

> We are trying to use wgctrl way of configuring the wireguard devices
> and facing issues while creating/configuring the wireguard device on
> windows.
>
> 1) First problem was while creating the wintun device using wintun.dll
> and using wgctrl for configuring it.  It hangs in
> wgclient.ConfigureDevice api()

wgctrl works with wireguard. wireguard uses wintun, but wireguard is not wintun.

>
> 2) So tried to first create the device through wireguard.exe. And then
> used wgctrl way to configure it, but wgClient.Devices() is not able to
> get the devices on our test windows boxes (even though it works on my
> development machine)

This sounds like a potential bug in wgctrl.

Matt -- I wonder if there's a bug in the parser, recently unearthed by
a change in wireguard-go. Specifically, uapi stipulates that requests
and responses end with \n\n. Is it possible that you're relying on the
socket to EOF, instead of looking for the \n\n? Recent wireguard-go
keeps the socket open, in case you want to send one request after
another.

Jason
