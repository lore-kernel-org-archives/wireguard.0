Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9EDC6FA82
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 11:36:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 881c367d;
	Thu, 22 Sep 2022 11:33:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 845c9126
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 11:33:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F9B062CE6
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 11:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385A3C433D7
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 11:33:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AwenJ4MB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663846433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/IKFVzccKMPbQoHz2cUmoUj4AZ3GHysQiRm+UmwlRik=;
 b=AwenJ4MBOfffcKZ6gX6nR1bjrgi62eAmHyffTeYoQg1oiNWx1UXP7TZ5zRCuFmj6KUaYTA
 0G63PqLkoO5TCTbqehDTsr9bgG/PPppv3pTX9gWp3SOI+sF1fy8FHNTQi6Cj8C21X1CVDz
 btosncQt9Yu5vj/73UmE98pE/cTuaBM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 87162a9d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 11:33:52 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id v192so4752262vkv.7
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 04:33:52 -0700 (PDT)
X-Gm-Message-State: ACrzQf2L7xSMis0bWlsBgzSIWJBTYrJiL/tGXaecRfQmq2LMgTaFpUy2
 8t+Ri2y2D926LWy09qME2ZpuSuaYvT6NZ7bl58w=
X-Google-Smtp-Source: AMsMyM5OADbe2q4Enp/cHoAhrb1gYLSreiGxGoCvMM8PPsixZjnV5DrpaCLnkQCla4uPEu2X20nNJsQkQ5PRRsy4Deg=
X-Received: by 2002:a1f:24b:0:b0:3a3:ad4:a3b2 with SMTP id
 72-20020a1f024b000000b003a30ad4a3b2mr1051275vkc.13.1663846431858; 
 Thu, 22 Sep 2022 04:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
 <CABBZOs=bkOWQv09UQJnf18xVGAq_o6O+Ar+asMKoXtghcQvnog@mail.gmail.com>
In-Reply-To: <CABBZOs=bkOWQv09UQJnf18xVGAq_o6O+Ar+asMKoXtghcQvnog@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 22 Sep 2022 13:33:40 +0200
X-Gmail-Original-Message-ID: <CAHmME9rHYbDBU8Y0cs1YnGKqqxB7SdyoGjwE1n4Hd_1=GZ6ADg@mail.gmail.com>
Message-ID: <CAHmME9rHYbDBU8Y0cs1YnGKqqxB7SdyoGjwE1n4Hd_1=GZ6ADg@mail.gmail.com>
Subject: Re: MacOS app update needed
To: Houman <houmie@gmail.com>
Cc: Simon Karberg <simon.karberg@agillic.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Wed, Sep 21, 2022 at 9:55 AM Houman <houmie@gmail.com> wrote:
>
> Hi Simon,
>
> Not only that, even the repo
> https://github.com/WireGuard/wireguard-apple hasn't been updated since
> 27 Sep 2021.
> There are a number of useful contributions in the form of pull
> requests waiting there to be approved for over 8 months.
>
> The project feels abandoned, which is such a shame.

It really isn't abandoned. Please don't worry. No reason to start freaking out.
