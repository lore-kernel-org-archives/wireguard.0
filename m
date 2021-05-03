Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A306C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 19:54:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3913960BD3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 19:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3913960BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=manojav.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e681627;
	Mon, 3 May 2021 19:54:20 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3c343c17
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 19:54:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id 124so9855405lff.5
 for <wireguard@lists.zx2c4.com>; Mon, 03 May 2021 12:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manojav.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/z/6JjMKwTTG47jB6Gj2MYcFk3WL3dGFVL09a+8J60M=;
 b=MsEP8Cbc5XdIkPE9x+vqOK1YRkbU0QR9BSlJXknaNlFw0zEf8YO+797fcN3W8CW8Yv
 VZ764ZetI0vsayqBZKFW63bPeJH9xHa2CCO2UiJ12Q2mRg0ROvy3r5LR1A3Ruf7HcJmB
 kmxXKDwd1qaQiSE3pAAu6uqwZUkI42XHL7bFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/z/6JjMKwTTG47jB6Gj2MYcFk3WL3dGFVL09a+8J60M=;
 b=iOKsHvFr8ZkfMK9edKAoahg+dtWZ7A7w5OXMg/NIT9y9sHd+pURF9U7OaMSfm+OuJD
 X20LArachxCXEoWeHy/F5Sw+RP8/1DWf2lsazCf63MkSmkCt+x10W1l87sjD78xDG7YR
 YrwD7/ZTIR7G8iCDQhu6XNf1MSWWxMnH1pgUAUBhTAi3FJVMcHXym/JCgILD9hxj6f1h
 Z6aMgKsEfZVnZOJnNBuyUMAkyIqItoIhFZAjU2/qcTgXPtKmNReUlWiL9vOgsIluhCMr
 VywQNLgQEJuQSdrbSjViIi/SVWIiZq2yrZlmAAHtU1xcXiYsdicOFXohdChA7PlF8u6G
 f4Bw==
X-Gm-Message-State: AOAM531kQAuT+m1dckMdaRGZyVJk+GlFNBGpSPZ+oAXc0HKlqq5wzitT
 L42miX//Ua7omsuqJokrGvF2iL0pm4nJ4KRaXRHOrw==
X-Google-Smtp-Source: ABdhPJwWaHau5ZZpzATAC9MA5Paw0eCftReaBaS061RqIlUBjzPvgK/22sY40NiZNnT7MTduAXzLSkttAtdb3OzWUHA=
X-Received: by 2002:a05:6512:3130:: with SMTP id
 p16mr13997389lfd.83.1620071657981; 
 Mon, 03 May 2021 12:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
 <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
 <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
 <CAGaAVNWDMLAP3FdBPUh33iyVpMSBLTzVEH8_LGXKsS8ebzwjQA@mail.gmail.com>
 <CAHmME9rLSSaaREtMPh9OYuO-oe363KF-VJcpQQHr8=54oDiAiA@mail.gmail.com>
 <CAGaAVNUyrQEppHMmTZe_WyohDPEopyupB2iaTj45peeq5qU9vg@mail.gmail.com>
 <CAGaAVNUQ1+R7MtUYm2Not1J+pWkkKxQw384RYxAkjCsAuiigFg@mail.gmail.com>
 <CAHmME9rMv2PDQL-SWUX0x6QENSMgmonooS8vvdjerBDsmXQSDQ@mail.gmail.com>
 <CAGaAVNUMaRjvpPXqJaSm7JNq=PoxzfTkXgftvXrCVOkkNx0NUw@mail.gmail.com>
 <CAHmME9oTyAAbEmu1-7Mv-tx6UxnXTa3-i6=+fro84U286h+RMg@mail.gmail.com>
In-Reply-To: <CAHmME9oTyAAbEmu1-7Mv-tx6UxnXTa3-i6=+fro84U286h+RMg@mail.gmail.com>
From: Manojav Sridhar <manojav@manojav.com>
Date: Mon, 3 May 2021 15:53:51 -0400
Message-ID: <CAGaAVNXqqvdxWOO7Yr4Zrjh_Z-O8kCkbGJguhs=bD04CA=n_eQ@mail.gmail.com>
Subject: Re: kp's and mem corruption?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Christian McDonald <rcmcdonald91@gmail.com>
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

Jason,

Thanks for the update. Yes it still triggers this on the current
snapshot, which is built prior to your fix. I will retry it once you
release a new snapshot. It seems quite a long shot that this occurred
on my firewall in the first place. Glad it was reported and fixed.
Onward!


Thanks
Manoj



On Mon, May 3, 2021 at 1:56 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> The code in here will repro the bug much faster:
>
> https://git.zx2c4.com/wireguard-freebsd/commit/?id=561f3a8f930cf2e44f493fa04d932ba9a2362cc5
