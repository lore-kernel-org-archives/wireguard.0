Return-Path: <SRS0=tDKf=NY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB7AC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 01:21:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2486560200
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 01:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2486560200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 536eb745;
	Thu, 2 Sep 2021 01:21:12 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e2bdcd53
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Sep 2021 01:21:09 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so289638pje.0
 for <wireguard@lists.zx2c4.com>; Wed, 01 Sep 2021 18:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to; bh=nl5p0s6QUUbBLVQn5tBsOG2xlBsddFXE9LDcbaLtBNE=;
 b=KPP8l3UDUMFYkWG8SyypRZgmXssISeK+vB9bjk8J7VhCCsuB8mllT6RD13Rja3DBOe
 IGvM23aJchEcsGmrVcw+qq7qkpReoyNF6yX1aPn4RyfJWtoVi0KMtZN97Yekp4RWImFU
 mTeODw7/isZpVLJO+OrV2Z0+5ty5Kgq04UQyj5IqyQZyCCZmrAMuDfEjYGb/sm9k5vPy
 fRl5FQkiTXTtPq67hONT5lgxb6p5yyDicUVVNLqq1oMHD1b56LXAOdiVCzrrs2sP2Kfc
 VvDJ2YcnqUVfjAMNYu1rMzvF1xTDi4IbhIlvFKt8IriKVjY+thukkfK6t7n2wEopM1NP
 2EMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to;
 bh=nl5p0s6QUUbBLVQn5tBsOG2xlBsddFXE9LDcbaLtBNE=;
 b=ShowHvFC5ZE9UmkjvCY62cCE7itOQaZUXMdAVhLMyKDkQvEVUWmc9t9LEXjTeB1sp/
 trp3wEKGQG/xf5V4wHTUTyxQ0KL2vZg9PK4A6yi10igJyxzV1Kp5DQXBC46vW1MFK6iR
 zD+uJfuWjRoLoZmJRulWTFNB4WPkDgh0cebDGiWAfQhQL7pHM9y6jeAOsthRzQcpymEd
 tPFBMgjas36T2XLz1A8hVtivzVeOSgW9HlQCNzpotMtFMHVs0Q2ex4Mfm6OYkfrVVxzr
 khn7b3E5JfsCA1qHzEzF/sJFCpO5sGIonTEij+z5BCj031F/7KaShcFmeIaDhJOlkyjV
 Ek0Q==
X-Gm-Message-State: AOAM532DddzvK9MKkE/1Bf1XzkB+Fjz+0FWA2RwWVGzpLyquHku4nOtu
 GLYyC6q4d+hDZK3E1BjniYQW9wyUX1ltuR9CR2d4plfV1E0=
X-Google-Smtp-Source: ABdhPJwNfiJLTnwMaWCdUyAoF3k+heylRiD3/4+uuXwwoov2xXfRioSKg60YDZFLbVBAjMEMimdsANFNzxFQADThSIs=
X-Received: by 2002:a17:90a:194a:: with SMTP id
 10mr768247pjh.221.1630545667262; 
 Wed, 01 Sep 2021 18:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <-_8oxop6VI5mP0UY_0vydSMUBInbj0hR4IUPDWshTaRG0-6O9ybfu6kzIAk68XdY9N-LHiVgaiWhNQw6-iYG1cR14pfODj2o5JMStY-75ns=@protonmail.ch>
In-Reply-To: <-_8oxop6VI5mP0UY_0vydSMUBInbj0hR4IUPDWshTaRG0-6O9ybfu6kzIAk68XdY9N-LHiVgaiWhNQw6-iYG1cR14pfODj2o5JMStY-75ns=@protonmail.ch>
From: Jeffrey Walton <noloader@gmail.com>
Date: Wed, 1 Sep 2021 21:20:36 -0400
Message-ID: <CAH8yC8=T82_UUcWsp3Q6Bv-YgAb2P5rVm-JD7uHRU1+-bmyoOg@mail.gmail.com>
Subject: Re: [wireguard-apple] [iOS] Running WireGuard on a simulator
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Sep 1, 2021 at 9:00 PM Neutron <dotneutron@protonmail.ch> wrote:
>
> I've tried running wireguard-apple on an iOS simulator and encountered some
> trouble during the compilation of WireGuardKitGo. I did this on an Apple M1,
> which I thought at first would be the culprit.
>
> The Go version is "go1.16 darwin/arm64". The build process fails at
> # runtime/cgo
> Undefined symbols for architecture arm64:
>   "_darwin_arm_init_mach_exception_handler", referenced from:
>       _x_cgo_init in _x004.o
>   "_darwin_arm_init_thread_exception_port", referenced from:
>       _threadentry in _x004.o
>       _x_cgo_init in _x004.o
> ld: symbol(s) not found for architecture arm64
>
> This issue was reported a few times in Go's issues section, e.g.,
> https://github.com/golang/go/issues/45772#issuecomment-874616905
>
> Further head banging lead me to the discovery that
>
> xcodebuild -target WireGuardiOS -sdk iphoneos14.5

Yeah, whenever you start seeing problems with missing symbols related
to exception handlers, you should look at the target SDK. I see it a
lot when trying to cross compile for Apple WatchOS and AppleTV when
using the wrong SDK.

Besides -sdk, other ones to look for are -miphoneos-version-min,
-miphonesimulator-version-min, -mappletvos-version-min,
-mappletvsimulator-version-min, -mwatchos-version-min and
-mwatchsimulator-version-min. If you drop them too low, you will break
during link with the missing exception handlers.

I think what happens is, the headers mostly work with a lot of
different targets. But the exception handlers are specific to a
particular SDK, and you only have a limited range of them installed
(otherwise, you have to install older versions of Xcode and older
SDKs).

I don't know how Go affects things. I usually work with native C/C++/ObjC code.

> I don't have an actual iPhone on hand at the moment,
> so I guess the question is, is the project supposed to
> work only on real hardware? Was that flag left out
> intentionally? If so, is there a way to get it to run
> properly on simulators?

In the past, the network stack was crippled on the simulator. I don't
know if that's the case nowadays. I think Android is about the same.
It is hard to test some of this stuff on a simulator or emulator.

Jeff
