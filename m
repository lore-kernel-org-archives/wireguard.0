Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296FAC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 17:54:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E42C610C7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 17:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E42C610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=scjalliance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a995688d;
	Fri, 24 Sep 2021 17:53:24 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 66bfdf4a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 17:53:20 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id y1so6974130plk.10
 for <wireguard@lists.zx2c4.com>; Fri, 24 Sep 2021 10:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scjalliance.com; s=g5;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AXIMpoAqjOuqrPnB4Il2xUDHnLx6emlb0UZNCfESNzc=;
 b=GCUkXyk/74fbpB7lfS7sy1IcvFx6FBjP9LGGJgO//hmjOVVVMv+8Mxd9TENqzieDE0
 BIAwaJXU+RRWJ2B9+++l0v4WVWKfRDKxEa1MJpNZNOkZzRI2d5ycZoMUzh15yM9YVyeK
 9moflgGpM4UzqZOdcFZzq2OjnfNQAKtRR4sJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AXIMpoAqjOuqrPnB4Il2xUDHnLx6emlb0UZNCfESNzc=;
 b=h0Yqto8dY1aEOsh7n9C4G2OP5/0oC3/FxcY5xSxkmcH9QgfAzGuJuPXVmNmAjck6QE
 Ts8Y/prZF6/o9WEtsqfO+P5xhzePNRrwSc1Kmr5axMfQEyqePsRM7nJzuPKgVRF/JMrD
 mko1CaHX4jbsCP52PF0zcD6f/45Iu/FTdGFtib3hGuVmVBnRljYq/Wk4OAHqbNyJf+VJ
 GXVPfau1YgqI5TI8bAQruIjnOaWR5zZ1lM6AcWI1pHCZCDIJLPMM6deQr1WJ8cSlF1kE
 5BfI0EvoBECVUUf50OH8TndB8XHb47YEwCOxam7PFjBoxzAnMle3Bj51O3cYw84mG+hK
 V2UQ==
X-Gm-Message-State: AOAM5335BJz/b40CpJFjQkjwg1mG9FwoLsie6/UIBW/x04XXGBBxdsMZ
 ExTnu3Pvw74eNEAujXrI9aMeZgantUwVb9Jm+F8sukGIk4g=
X-Google-Smtp-Source: ABdhPJwmoxnKiRxpfzYm5a+s+fFtOB2vOBIWXsDsHTGySHUVw7wDC13E2+j0MLnhbQC4+VLv9BG/d7QU5qCvkz54i/g=
X-Received: by 2002:a17:903:1207:b0:138:e2f9:6c98 with SMTP id
 l7-20020a170903120700b00138e2f96c98mr10488069plh.11.1632505998161; Fri, 24
 Sep 2021 10:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
 <CAHmME9oSSzJU4H8jc__HiFsexpB6jJUKM84kN+_9WesoTSMMsQ@mail.gmail.com>
In-Reply-To: <CAHmME9oSSzJU4H8jc__HiFsexpB6jJUKM84kN+_9WesoTSMMsQ@mail.gmail.com>
From: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Date: Fri, 24 Sep 2021 10:53:07 -0700
Message-ID: <CALaUSusvu8iJTXNc_07=tQ=yNKJ+HXOe1J5A=HRyAAJbzDjjYg@mail.gmail.com>
Subject: Re: Windows stuck in boot after WireGuard update (switch to
 WireGuardNT?)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>,
 Arlo Clauser <Arlo@starcubedesign.com>, 
 John-Paul Andreini <jandreini@geonerco.com>,
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

Awesome! Can do. Thanks Jason!

Joshua Sjoding
SCJ Alliance
IT Specialist

On Fri, Sep 24, 2021 at 10:49 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey guys,
>
> I think we might be onto something with https://w-g.pw/l/ZO5Z ...
>
> I'm going to cut a new release in the next few hours here. When that's
> released, would you try updating to 0.4.10, going back to using the
> kernel implementation, and letting me know whether the problem
> resurfaces? In the absence of being able to locally produce this on a
> debuggable machine, I think this kind of trial and error is all we've
> got. Hopefully the theory behind https://w-g.pw/l/ZO5Z is correct.
>
> Jason
