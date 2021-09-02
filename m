Return-Path: <SRS0=tDKf=NY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D459DC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 02:11:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F349D610A8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 02:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F349D610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd649ff0;
	Thu, 2 Sep 2021 02:10:49 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5dbcb287
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Sep 2021 02:10:45 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id 2so425408pfo.8
 for <wireguard@lists.zx2c4.com>; Wed, 01 Sep 2021 19:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to; bh=nHn8X9t8DufzirGHVWvg3YvnRjyhmJP8cN/Bl6pB5zI=;
 b=mgYRjQSNperC35GtRq9pAamZSXQPA9iR93z8fzFES9Z+4vcueEWQm769fy0um8pL1S
 xPB8dMD7VT6A8wACyP/0VmRlZwxYnuZWkfjERlp+eAgvXNSOJqHikxQgV1FaCBEo6pKo
 IZG2nHW3upfcomwJ7tQhhq0rXt/vbiOO4Cx7BsZ+Q/7OS+zKXW2UMYcisInCpSPVAo5A
 V7jfAdgZHGMNxa1h0pvE3L5NLVNd8Xful/XbeVZEYvYdPZBk07dqeeALWjndxKyjLajC
 p7hPio3TIjGKGqd9P3/SVwZvBY0tRazNouNhXXGBtD8sGXsy1EBaXEFUrXMajghj1Zrx
 5eMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to;
 bh=nHn8X9t8DufzirGHVWvg3YvnRjyhmJP8cN/Bl6pB5zI=;
 b=bgArTyqfyihnKteE+hEAz3umYehAqjrrTt4IIuJZxEhOpPBcBYwQLan7/TJfQ0wt2b
 /Ih77AMwLeBUBsKw7s4f8jvKsWgp2XRF/3s/CNus0jxjNruFT8bwtJNhSCdZ1l8KjSwc
 gRzdp9Jq+P2L+fh4Ty4/WUKL/2nScuPyUcqXJO35OrGml2h4/TircoA6z9MpKKDRRKw3
 cFgekYUZt4w7RsGZuGceqs5fcawqgtKQNiL04Gy+gHvTptG/6JguxXI87BR2r67xReYU
 Gh2PLmBOMZUtiQyBfJnA7yOakAjsUNqZ/7ZnSzIVcAqe7ruhe3siIPecA+00gFyn3vRq
 bmZg==
X-Gm-Message-State: AOAM530SZQwtGzDVh/5NFcu0ZSbCmxf4hAIYNB3r2sgLMRTwd25w99pm
 vnwH7zZYGFRYBd14EEBGzeAXcTkImgS6vrWOlcXa4ISBmdk=
X-Google-Smtp-Source: ABdhPJyiw/1BO3AAXD+N07CrGvTriW1+5AtgscdqkJYjW9P2b88zIAl/QtjSu3JvE9UitQhj1GYg7rUh7+VZedm+WNc=
X-Received: by 2002:a63:5c63:: with SMTP id n35mr717224pgm.311.1630548643185; 
 Wed, 01 Sep 2021 19:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <-_8oxop6VI5mP0UY_0vydSMUBInbj0hR4IUPDWshTaRG0-6O9ybfu6kzIAk68XdY9N-LHiVgaiWhNQw6-iYG1cR14pfODj2o5JMStY-75ns=@protonmail.ch>
In-Reply-To: <-_8oxop6VI5mP0UY_0vydSMUBInbj0hR4IUPDWshTaRG0-6O9ybfu6kzIAk68XdY9N-LHiVgaiWhNQw6-iYG1cR14pfODj2o5JMStY-75ns=@protonmail.ch>
From: Jeffrey Walton <noloader@gmail.com>
Date: Wed, 1 Sep 2021 22:10:12 -0400
Message-ID: <CAH8yC8nHSHg=rNaXRxjX_LdbGZEFBb+gB6TJkMVkw-cRO-nf-g@mail.gmail.com>
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
> ...
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
>
> actually builds successfully. I looked through the Makefile and applied some
> monkey see, monkey do. It turns out I could get it to link by adding
> GOOS_iphonesimulator := ios.

This looks a little odd to me. You should not need ios there because
the M1 is its own first class platform. About all you should need is,
ensure '-arch arm64' is used. But I probably do not understand how Go
does things.

Apple uses simulators, which means your high level C code is compiled
to the host's native instruction set. The host is where the simulator
runs. On an M1, that means code is compiled to the host's arm64
instruction set, hence the reason for '-arch arm64'. You still need to
be aware of a target SDK, but that is a particular detail. The broad
stroke is '-arch arm64' for the M1.

Android uses emulators, which means the high level C code is compiled
to the target ISA, like x86_64, arm, aarch64 or mips. Then, the ISA
instructions are interpreted on the host machine. The high level C
code is not compiled to the emulator's native instruction set.

Jeff
