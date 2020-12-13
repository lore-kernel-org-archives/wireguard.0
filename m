Return-Path: <SRS0=050+=FR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5007FC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 13 Dec 2020 14:58:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B49F21D95
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 13 Dec 2020 14:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B49F21D95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c65c0960;
	Sun, 13 Dec 2020 14:50:33 +0000 (UTC)
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [2607:f8b0:4864:20::b42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 34a0f331
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Dec 2020 14:50:31 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id t13so12928433ybq.7
 for <wireguard@lists.zx2c4.com>; Sun, 13 Dec 2020 06:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=plNVcmrce8g2J8M3GvZaxtbh0wYjjwJH9EhP4nToGcg=;
 b=LpFXWaQL6fLau/RHuV7zuorCsHamAKs9/0ITBJlTv5NR82LANrttpzO2ebQMsHpZfG
 18b+X5d4gAG21gQxCKibZHkhKwIbA39zfcomdlccbTuhTTpTYE8s66MoSH14+4HiQUnr
 g4mbJj/cbabq1rM/S6PMysI3haCDy9iyIGpBgd0he39coQdvcCX3FGp28qe7ki5efaDV
 DBw+xjWRj9e3WpJE8JAacbCQFHl5SMH3FRHCj/uBZ6C2eT+VmDlUybrGEq1alP6Zll1R
 oPZbKzlxxQp7fxvY3PmQ59y30aadQOZGheSPiTTOv/SGokObhWdsdMTtSemZUbpWin2k
 P+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=plNVcmrce8g2J8M3GvZaxtbh0wYjjwJH9EhP4nToGcg=;
 b=CD1pPJIQtShQfKZEJSEIXEowQmCrQ+gzP14OgOsTBdR8epIyenscA3g7E6hMcd9bH9
 EtpHPt1FHtLEP7+FvI1RKaAI2A7qYsJVOvLnPlrJrwYDkApjNPk/QJserFkVKR+XpKYr
 ZC7XZK8Ztz3nSYWB3CJ7OTEllMCYJgl1aAhJ54dYrNalPyeIHFILsGVHeG8ca3eR84dF
 f0ri465C5OLSW6AifH260dErqOwQms42RyK0EVKwxd3/PYT6gwmTmmeAKWndzA6EcFpK
 ZYVHVz3Pi5s9DPs8oMzonSrmDzgI0vskldJggyzRsmW/5gcl6BHfHetBJAuXkjwTFYch
 87qw==
X-Gm-Message-State: AOAM531iFF25Oq4uVOZlbHw1IYsNhF2OOxf4bnDXNYiGalzHH34TggJi
 VoFPRdaDj4xNU/n++cNnJ9ahTNON9zozldElFKs=
X-Google-Smtp-Source: ABdhPJyleUHOQ1Dzwsvco4D8Kb6ED8lXDzo42gqSNXB0njsWpLnkEVMEMAkYlMTU9I4fZNhLo+xUhDEMmRjvFVpRMyU=
X-Received: by 2002:a25:538a:: with SMTP id
 h132mr11841975ybb.247.1607871511230; 
 Sun, 13 Dec 2020 06:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20201128193335.219395-1-masahiroy@kernel.org>
 <20201212161831.GA28098@roeck-us.net>
 <CANiq72=e9Csgpcu3MdLGB77dL_QBn6PpqoG215YUHZLNCUGP0w@mail.gmail.com>
 <8f645b94-80e5-529c-7b6a-d9b8d8c9685e@roeck-us.net>
In-Reply-To: <8f645b94-80e5-529c-7b6a-d9b8d8c9685e@roeck-us.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Dec 2020 15:58:20 +0100
Message-ID: <CANiq72kML=UmMLyKcorYwOhp2oqjfz7_+JN=EmPp05AapHbFSg@mail.gmail.com>
Subject: Re: [PATCH v3] Compiler Attributes: remove CONFIG_ENABLE_MUST_CHECK
To: Guenter Roeck <linux@roeck-us.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, 
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Shuah Khan <shuah@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
 Network Development <netdev@vger.kernel.org>, wireguard@lists.zx2c4.com
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

On Sun, Dec 13, 2020 at 1:55 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Witz komm raus, Du bist umzingelt.

Please, explain this reference. :-)

> The key here is "if nobody complains". I would argue that it is _your_
> responsibility to do those builds, and not the reponsibility of others
> to do it for you.

Testing allmodconfig for a popular architecture, agreed, it is due
diligence to avoid messing -next that day.

Testing a matrix of configs * arches * gcc/clang * compiler versions?
No, sorry, that is what CI/-next/-rcs are for and that is where the
"if nobody complains" comes from.

If you think building a set of code for a given arch/config/etc. is
particularly important, then it is _your_ responsibility to build it
once in a while in -next (as you have done). If it is not that
important, somebody will speak up in one -rc. If not, is anyone
actually building that code at all?

Otherwise, changing core/shared code would be impossible. Please don't
blame the author for making a sensible change that will improve code
quality for everyone.

> But, sure, your call. Please feel free to ignore my report.

I'm not ignoring the report, quite the opposite. I am trying to
understand why you think reverting is needed for something that has
been more than a week in -next without any major breakage and still
has a long road to v5.11.

Cheers,
Miguel
