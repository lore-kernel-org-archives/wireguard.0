Return-Path: <SRS0=tDKf=NY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A4CC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 07:06:04 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE3CB60462
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 07:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE3CB60462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 501a1bfd;
	Thu, 2 Sep 2021 07:03:10 +0000 (UTC)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ec0295a2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Sep 2021 07:03:06 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id l3so713799pji.5
 for <wireguard@lists.zx2c4.com>; Thu, 02 Sep 2021 00:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to; bh=YhmK1TmSRcoXxw+SzOGLC5JBsLpldMCO4mDxuz59D8k=;
 b=aTIpOTLvg+LRpnNlrsoG5luTG59ryC7sOwcwERGl7fURdkTOn2hZmNXmVeaEHVhxxn
 S6F3hvhb0qMXqsXQqb6sDF8zYJLXwE7W7gfRqEVptINJePZrwfbAkw6S5K/uLeZQqtMM
 1Y4ygAaWeHHf4DuluHSy3XjY+6SlNJuGIJvXyoKmRaHmusSVQFmU/vBYO5VoKozG/WVl
 Q9P3gNubLKXyWaLPJR49Hs0n3/yWwNrgwYI0AGD8sn1+6ADT8UNYp0mU2vB2Ies3tcAL
 p7Er0G+wze5Dn53bC56r2+vfe0P467QTMujpHY7DPBp/RXhAaWXKG4Q5nNLS52nJmQH4
 QS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to;
 bh=YhmK1TmSRcoXxw+SzOGLC5JBsLpldMCO4mDxuz59D8k=;
 b=tgaAfL5joK7ba/BfWEChYxbOB4X+l6ff450qnLRPIqFsVU3Ds11C5HdqZM5CGecbuA
 0O/Y7jCy3jmR7pPvHE3D44UUHk7Qfop0xsfsUdNKR7yur93Lg+wPFmhXCIFjzL25FcYi
 B0Wf3JKop/oTd0zYYF3dRwYhwo0ImLNnCFtaX5JhY3tL+SafWHgLZjkqdwY27zs6o90s
 Iu9Ik6zfehtcQ3EsaCpVSBBAEXK0GRK3uWaI+7lHLhqC1wrAYsW7zNDamaLe6+0TGSGf
 2dfUPcJV8wJi/yoaN/ZyIdCsH8FjsdmwKdqQQvRa6HGPWa/vFOGKdlCzv5j6yfcEPd3l
 yHLQ==
X-Gm-Message-State: AOAM531Cyv1y+UP9vZR1LAWpFo30qVHMDRQZiIuVzVzkr0+jY9DLV7AT
 dkZCzM6qNh5j5ue2OXAMjyYF0lg3iizbq7hu1a9ILuFQGfA=
X-Google-Smtp-Source: ABdhPJzo8dS+GKxMatdpk5gPAiW+0m4rHrw0/sNHgoww3mpflNrHa6b71P5RJQUCcMaDonFmxMODfueUpIosVej2YOY=
X-Received: by 2002:a17:903:120e:b0:138:d732:3b01 with SMTP id
 l14-20020a170903120e00b00138d7323b01mr1679717plh.21.1630566184654; Thu, 02
 Sep 2021 00:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <-_8oxop6VI5mP0UY_0vydSMUBInbj0hR4IUPDWshTaRG0-6O9ybfu6kzIAk68XdY9N-LHiVgaiWhNQw6-iYG1cR14pfODj2o5JMStY-75ns=@protonmail.ch>
 <CAH8yC8nHSHg=rNaXRxjX_LdbGZEFBb+gB6TJkMVkw-cRO-nf-g@mail.gmail.com>
 <4hMWm75HKpodCnXIg9XhHltxE-7XSQVijaKMwRC5XcKpdTEWnZ9Vn4TtWr4k1EdAMbBMMMS4BBPrvNhoisXG-oQLUj_3jErUO76UBfjM2ZY=@protonmail.ch>
In-Reply-To: <4hMWm75HKpodCnXIg9XhHltxE-7XSQVijaKMwRC5XcKpdTEWnZ9Vn4TtWr4k1EdAMbBMMMS4BBPrvNhoisXG-oQLUj_3jErUO76UBfjM2ZY=@protonmail.ch>
From: Jeffrey Walton <noloader@gmail.com>
Date: Thu, 2 Sep 2021 03:02:32 -0400
Message-ID: <CAH8yC8k--EzaMeAcrpPNjRBnMb5KNLx3aFJemNQg-pQTMxJ=Cg@mail.gmail.com>
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

On Thu, Sep 2, 2021 at 2:50 AM Neutron <dotneutron@protonmail.ch> wrote:
>
> Jeff, thank you for the clarification on how a simulator operates compared to an
> emulator. The difference was certainly blurry in my head. I did a little more
> digging and it turns out
>
> GOOS_iphonesimulator := ios
>
> is not required when targeting an iOS12.0 simulator. I had initially run it with
> iOS14.5. Perhaps this line can be useful in the Makefile once the project's iOS
> version gets bumped. Still, I would like to know why this happens.

Getting the environment setup correctly is tricky with Clang. With
GCC, you just run 'gcc -dumpmachine' and you can tell what you are
targeting. -dumpmachine does not work with Clang. Clang reports the
host's arch, like x86_64 even if you are targeting iPhone or
iPhoneSimulator or WatchOS or AppleTV.

To get the information from Clang you need to do something like this:
https://github.com/weidai11/cryptopp/blob/master/GNUmakefile#L50. You
have to run the preprocessor with CFLAGS or CXXFLAGS, and look for
defines like __x86_64__ or __aarch64__.

You have to use CFLAGS or CXXFLAGS because that's where you put '-arch
arm64'. Xcode sets this for you in the IDE, but you have to do it
manually when setting up a makefile.

> Just like before on iOS14.5, I'm having issues with creating/editing
> configurations in the simulator, with log messages like:
>
> Saving configuration failed: Error Domain=NEVPNErrorDomain Code=5 "IPC failed"
>
> The message I'm getting may be just as well be unrelated, but a common theme I'm
> seeing is that you can't get Network Extension providers to work on simulators.

Yeah, Apple has some cryptic error messages at times. If you can't
find it while searching, then you have to burn one of those Apple
Support incidences.

> This Eskimo fellow seems to have good insight on the matter.
>
> https://developer.apple.com/forums/thread/46004?answerId=134358022#134358022

Quinn is usually very helpful. He's been supporting Apple development
for as long as I can remember.

Jeff
