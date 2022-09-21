Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29744C32771
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Sep 2022 07:52:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0547fb20;
	Wed, 21 Sep 2022 07:52:48 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [2607:f8b0:4864:20::329])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 14646330
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Sep 2022 07:52:46 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso3380990otb.6
 for <wireguard@lists.zx2c4.com>; Wed, 21 Sep 2022 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xwMXNSL6RINST6emNoWZsuAxWDuExg+9N1STZxVcBlk=;
 b=Rnd0c50wl2vCwnE82YsGoIorsDKws4dvckxevlCl+GbhraT0J6hvpO07tg5msjlAg/
 r/CUzOepmGrbW6zUaLcGKi+B0C6R1D9qfY9JfYnVzLZeAMTpQB1eEmXEyGpRR7VqSXpl
 4fyFVZ2oBsWXG7dh46UjoaEdT/iD62sDG8BYWeXtGePFd4wT1bQvApXIvhYdQS8AdR7A
 inWWTOAjo4dExG1q2C9oTGOJ2PUXtcdjPTgswQ15egtOCQSJcBQMJKyeDF8BNNTOto/U
 pJfR8js2cRU08DzOKhGxRwizHkeZ7JongY1J3SihiWbC1EPV6e/wqodu80bTFe4EBdKr
 Q99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xwMXNSL6RINST6emNoWZsuAxWDuExg+9N1STZxVcBlk=;
 b=r7xzyshryqa2TiO2vyPujNi3wj3rNnEDc2f2QtNe6mwiHn4nFJRMsVYfFijeuIGvFb
 sRLdB7t1CkdEvfBc9w/Vbwfbi0tYv/FDISH3hJjtYGkRTHOPNPhcejh9gUyXSunAeilm
 ld37wlQBPPyQc/99bGLCR8oLMdBLlPVtilDR0dXLxN8KmqiA0MFDkwpuUiNFNb3BvKmz
 FpyJIA7rT7IDxvodXwWBveA6m0bK0invp3W08tmofuE8ECaeCCNavjpCnY0ynhVsLShX
 jMS2ULoz+9SVHC63HsV1Y4ZNvC/B3d66Hdu67qMGOZR3RIWAIY6YMR1ykUVWEwST38RI
 34jQ==
X-Gm-Message-State: ACrzQf3K+p2r0go7H3qwnYQy2XmGJDMmyfsQ7JF6RVktfWEY8tTCuw4J
 0Mnl+0U7fKIHo1LhGnvbJEjuzqsVauVbD67vARo=
X-Google-Smtp-Source: AMsMyM4w0jSyJ5muUJqNSCY/p3sqMWKX5Mqhl2np0a2f5O+A5WqCE1ifJpaSL1T4c7CVl/9HpBkqZd3ITBXoFlHSz/4=
X-Received: by 2002:a9d:7450:0:b0:655:f664:93ee with SMTP id
 p16-20020a9d7450000000b00655f66493eemr11632552otk.231.1663746765031; Wed, 21
 Sep 2022 00:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
In-Reply-To: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
From: Houman <houmie@gmail.com>
Date: Wed, 21 Sep 2022 08:52:09 +0100
Message-ID: <CABBZOs=bkOWQv09UQJnf18xVGAq_o6O+Ar+asMKoXtghcQvnog@mail.gmail.com>
Subject: Re: MacOS app update needed
To: Simon Karberg <simon.karberg@agillic.com>
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

Hi Simon,

Not only that, even the repo
https://github.com/WireGuard/wireguard-apple hasn't been updated since
27 Sep 2021.
There are a number of useful contributions in the form of pull
requests waiting there to be approved for over 8 months.

The project feels abandoned, which is such a shame.

Regards,
Houman


On Wed, 21 Sept 2022 at 08:33, Simon Karberg <simon.karberg@agillic.com> wrote:
>
> Hi,
>
> I've been testing the Domain Search functionality on all 3 OS'
> (Windows, Mac & Linux) and the setting:
>
> DNS=<dns server>, <search domains>
> Is only being applied on Windows & Linux.
>
> Further testing on MacOS I've found that the homebrew installation works.
> wiregurd-go is version 0.0.20220316 and wireguard-tools is version 1.0.20210914
>
> The App Store app is version:
> App: 1.0.15 (26)
> Go backend: 2ef39d47
>
> The app in the App Store hasn't been updated in 11 months, maybe it's
> time to get it on the newest backend?
