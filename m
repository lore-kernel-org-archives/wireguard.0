Return-Path: <SRS0=050+=FR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC36C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 13 Dec 2020 15:27:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B2723121
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 13 Dec 2020 15:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65B2723121
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c0d45af;
	Sun, 13 Dec 2020 15:19:26 +0000 (UTC)
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [2607:f8b0:4864:20::b43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9ef8fd27
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Dec 2020 15:19:24 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id u203so13098054ybb.2
 for <wireguard@lists.zx2c4.com>; Sun, 13 Dec 2020 07:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0U/jU5RkMzu5zlRR43LWUba3KGcXSHqGsMQRfeSGNUU=;
 b=VZJ/JV9lW6ZnEMtDmF4zpdsNvvy7vLU/FZKvGO9PPllC+1jUx3XrGLz8FKrUpCe8Sx
 nMvnhG8u3IrmE07cifYoFhlu4TxDXjturmIrc7P4m7Bb8PqFHGwp8ECMkJYAQO+FauSb
 HjRU0rW7FNs8s1zflZ5jqLLiYjjo4wiwfo7qpqRgMiDbTe1ZU91TIDu7bhhvUtVQt+Yv
 4g1JAnUnNcaQVieKr//CG4UTVypOY+X/27IYl4DHtOyWekzXWklghmrf4xz5AK2XUf2Y
 ACfeVt54ZCoq4K2fxqAzkphJeE3UVJivWPXyEtsIlTvW0JTCRydZ91gRJyqi5YziOklg
 cV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0U/jU5RkMzu5zlRR43LWUba3KGcXSHqGsMQRfeSGNUU=;
 b=NqC/6bKSP94mYkfCf8vl9qIu25H6wEPgJRVK49ZZQcwyaAWPYZUVvoXYO3qhCqc0yp
 Rb7uZIQAAOuEGPZ6XVZP9XAjMc+uLsol559aMnd01yxbDsefEWlwLM7AWEpA6z0E2vjD
 WyOYIXDA7C1tf9zkxT/T9UOr5wg9OgovcJM/f6ULJMiae252D/D2Anklyjc3Z4ToIB6Q
 iX0LOSJVETA9CxJqz54gm7tQy/FOilpq6tYQ+Pf6aCuUgarrBD6bg4HajXr333O3Ujex
 yONNd1joPYzVgy5sfynVeILRlJq1f+MM9o58aY5H1IRmxSr0XRjs9NVcMemcGwf9MYnL
 vZ7Q==
X-Gm-Message-State: AOAM530MC1UfGqjatbGXwFsLNmFYBmyF4gO6+fvkSPsHXggrfP9PLK9q
 k7LhypMOEWTULxDlln1/I0k+kmb5jPDQgy4iPSY=
X-Google-Smtp-Source: ABdhPJxi6/CjWqhWH3vgZntCXvVuEb6NihB6qIT22MoGs1z3K48dq8oW38IuHpxdu+lMQnavhVTJcWHi/RefKEktDCs=
X-Received: by 2002:a25:538a:: with SMTP id
 h132mr11965104ybb.247.1607873244794; 
 Sun, 13 Dec 2020 07:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20201128193335.219395-1-masahiroy@kernel.org>
 <20201212161831.GA28098@roeck-us.net>
 <CANiq72=e9Csgpcu3MdLGB77dL_QBn6PpqoG215YUHZLNCUGP0w@mail.gmail.com>
 <8f645b94-80e5-529c-7b6a-d9b8d8c9685e@roeck-us.net>
 <CANiq72kML=UmMLyKcorYwOhp2oqjfz7_+JN=EmPp05AapHbFSg@mail.gmail.com>
 <X9YwXZvjSWANm4wR@kroah.com>
In-Reply-To: <X9YwXZvjSWANm4wR@kroah.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Dec 2020 16:27:14 +0100
Message-ID: <CANiq72=UzRTkh6bcNSjE-kSgBJYX12+zQUYphZ1GcY-7kNxaLA@mail.gmail.com>
Subject: Re: [PATCH v3] Compiler Attributes: remove CONFIG_ENABLE_MUST_CHECK
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Masahiro Yamada <masahiroy@kernel.org>,
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

On Sun, Dec 13, 2020 at 4:16 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Because if you get a report of something breaking for your change, you
> need to work to resolve it, not argue about it.  Otherwise it needs to
> be dropped/reverted.

Nobody has argued that. In fact, I explicitly said the opposite: "So I
think we can fix them as they come.".

I am expecting Masahiro to follow up. It has been less than 24 hours
since the report, on a weekend.

Cheers,
Miguel
