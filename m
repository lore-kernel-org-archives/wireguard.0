Return-Path: <SRS0=K6Kf=FG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B6AC64E7C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 12:50:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7B592222C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 12:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7B592222C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd9360db;
	Wed, 2 Dec 2020 12:44:11 +0000 (UTC)
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [2607:f8b0:4864:20::b43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3996c3b9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Dec 2020 12:44:08 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id 10so1482983ybx.9
 for <wireguard@lists.zx2c4.com>; Wed, 02 Dec 2020 04:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wZOsnLsRD15EE78n8bQEf+aUkvjzCWrGeOD2j6m7n7M=;
 b=Pz5K1LSqrNHi9j26JaHRbiUG9fIgZ88xbsQOpQuqNaY6to0gMZKA3gZJQkUb0wH5DZ
 m49l97B/Sqo285TY12ocrdpvuF1+g3C5wyRcsbz5oUmKsqn2e3S3KkpISid+6Jy9TPZJ
 Yhi5380lJNF1O7HhBn1xvlehBO23pu1N+bhGYtju8XUuq3mjQtYO7rQGT3bt/wyhJYu2
 nmqwt7PmuQulhc96znbjOdtX+q3UrUnUYeqP4ZRdx3XdbsSwYDKeQGZVsWKY8+j3ePUW
 6FnR5bBGkAJxjBXXLZqpT5MNdDiJQM0xvHspl+LDp7RWfzuVkEt8IC16/vlbOKXzJ2tq
 tkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wZOsnLsRD15EE78n8bQEf+aUkvjzCWrGeOD2j6m7n7M=;
 b=ZC27E/hECm4LQI6JY7LpVQ18UZ8hAQ0l8t4xCVkCCOlIVkHqcMGYIprEsiIWakeKmS
 t/KCe5lftVpQS1Gq2I5DV47Df7wiIoy2JynArwoukC5Lb6fcLWdJQiVIt43QFTf4hyrS
 Dew94i7fu3WiY2aoGCEVgQogn0jOHSS0tuwdzMTL5Jyr3k7Q3q7j7epOY91h5LhF/19j
 uu8ObQ5+Ajhl2uohzcp3/NDhe12n45fDhaO/bljFnDpPpvhBO0XuvrADocrziS4eZKoK
 nYX3QlNttxXux2WnOlu6+EJYKHga0OqA+1XobzZ7ULCX7+GInXDiXtMv0lydoWGLrUda
 Bd9Q==
X-Gm-Message-State: AOAM530uaw13OX54DMG8yvtMa7SJFhHEHuiFAwpJSn9zkLYODuLohfjJ
 PrQC2XmcxRbiB902u+BAURmnRKMac+E9FpcmxsQ=
X-Google-Smtp-Source: ABdhPJz8aVFXdWixZUHiWQB00VKrKgXW70L2NcuTpGtmUg1BcqQkFiV8/vapf4IM/PFZ+z2SfEViZMUjxnQAlGcdtd8=
X-Received: by 2002:a25:df55:: with SMTP id w82mr3065596ybg.135.1606913441319; 
 Wed, 02 Dec 2020 04:50:41 -0800 (PST)
MIME-Version: 1.0
References: <20201128193335.219395-1-masahiroy@kernel.org>
In-Reply-To: <20201128193335.219395-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Dec 2020 13:50:30 +0100
Message-ID: <CANiq72=WanQ0sqL14D3Keu0hT3L5GXBSV-znU5C9hhC1gjs=wA@mail.gmail.com>
Subject: Re: [PATCH v3] Compiler Attributes: remove CONFIG_ENABLE_MUST_CHECK
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
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

On Sat, Nov 28, 2020 at 8:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Revert commit cebc04ba9aeb ("add CONFIG_ENABLE_MUST_CHECK").
>
> A lot of warn_unused_result warnings existed in 2006, but until now
> they have been fixed thanks to people doing allmodconfig tests.
>
> Our goal is to always enable __must_check where appropriate, so this
> CONFIG option is no longer needed.
>
> I see a lot of defconfig (arch/*/configs/*_defconfig) files having:
>
>     # CONFIG_ENABLE_MUST_CHECK is not set
>
> I did not touch them for now since it would be a big churn. If arch
> maintainers want to clean them up, please go ahead.
>
> While I was here, I also moved __must_check to compiler_attributes.h
> from compiler_types.h
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

Picked this new version with the Acks etc., plus I moved it within
compiler_attributes.h to keep it sorted (it's sorted by the second
column, rather than the first).

Thanks a lot!

Cheers,
Miguel
