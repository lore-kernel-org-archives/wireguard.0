Return-Path: <SRS0=K7sE=LF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9860C48BD1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jun 2021 08:54:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA97611CD
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jun 2021 08:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADA97611CD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f44333ba;
	Fri, 11 Jun 2021 08:51:04 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5d160b13
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jun 2021 08:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1623401459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BsOESPKSEbN3XpR3nAlyw41UQQPGHha7spl7TfKWSM0=;
 b=csifoBJ92lPoisksHb9pPNEnvQKDwDyXWTycJMcfPgtHLQO+2ZGCcyxLA2JtDTDEV0IOGn
 /okcIQySVz5d1bgEbGSZPU9njy23T1bIgWTkjol16jOmG4fS+Nr3ibZN/uCKQplBkdQ5RS
 qZ04ptxXUFf1aEOFVq3b0i4RpLoN96Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f4ca3adb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jun 2021 08:50:59 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id b74so1369003yba.6
 for <wireguard@lists.zx2c4.com>; Fri, 11 Jun 2021 01:50:59 -0700 (PDT)
X-Gm-Message-State: AOAM5310fGeQ5WV1RNigNTQTt76IbuJQqYxHyckRx2sH3QTlOjo/xVZs
 rWlWSszzY09iIIsn4d7argYU4AiuvfGrV4brwL4=
X-Google-Smtp-Source: ABdhPJzZzWTIuH5msrsNtDwr81ujn8Lw8u2/b5J/lY9x2YzodGBF+opM+aLFTVHkFokHQwWvxO3vRP+h6XGviKancSM=
X-Received: by 2002:a5b:5c6:: with SMTP id w6mr4214658ybp.279.1623401458510;
 Fri, 11 Jun 2021 01:50:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:474d:b029:ce:da65:f582 with HTTP; Fri, 11 Jun 2021
 01:50:57 -0700 (PDT)
In-Reply-To: <3BD85DF3-A8B2-45BF-A78C-D03524A226DC@mullvad.net>
References: <760B19F6-17E7-4276-B2E2-DFE07AB19323@mullvad.net>
 <CAHmME9pKnJouF-Vf20y+1w_TUs1vj1bpOggd+dgm8epfN+8-MA@mail.gmail.com>
 <CAHmME9rqAH9a28apwB9Rg1k9Lg1gmBWv3KK_8ZmAdb6H9hBaKQ@mail.gmail.com>
 <CANdratux27RGAbVg1QBEKEnff8jb3pdezZ-Ad0=bqYfOw6iUeA@mail.gmail.com>
 <E201364E-C433-4A43-968E-F336D5944986@mullvad.net>
 <CAHmME9rs3g9ar7Fh-BduNFiD4GipuHbQNALOcstVBd-q3OmHdw@mail.gmail.com>
 <3BD85DF3-A8B2-45BF-A78C-D03524A226DC@mullvad.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 11 Jun 2021 10:50:57 +0200
X-Gmail-Original-Message-ID: <CAHmME9qXs=ct-RNm0eGwu7mTdM+mCoNiYcJOOe5te=9n1ScC5g@mail.gmail.com>
Message-ID: <CAHmME9qXs=ct-RNm0eGwu7mTdM+mCoNiYcJOOe5te=9n1ScC5g@mail.gmail.com>
Subject: Re: WireGuard is broken on iOS 15 beta
To: Andrej Mihajlov <and@mullvad.net>
Cc: David Crawshaw <crawshaw@tailscale.com>, 
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

Can I infer from that that your technique didn't work? Some
confirmation one way or another there would be useful, so I know
whether to dedicate some RE time next week to it or not. If I can
avoid the fd iteration, I'd prefer that.

Jason
