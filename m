Return-Path: <SRS0=oxb/=FZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BD7C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 13:51:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C59E822BED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 13:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C59E822BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbbd90f6;
	Mon, 21 Dec 2020 13:42:27 +0000 (UTC)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7b5a449a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 13:42:25 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id k78so8826055ybf.12
 for <wireguard@lists.zx2c4.com>; Mon, 21 Dec 2020 05:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=22WfrYqwVdHV4R9eUfnFdyTLajoJ14FZuqG4/EZXiBg=;
 b=hEivyO3LAqfRO7APVQNvlx80TFpDZAMkK9Tfh8FYVr3fN0r/Zk+/pTNRHJNqfX1Ct0
 udvsyN91BPHDXD/1xV5fOmoQXDojvukiY7WDXkv2hJYxTCCluvIQXhBE1aRpleBk3uzE
 VDbqoOyZB2Bv4dBgzgCt/hA/p+6aplEP1Vo+7xlN4cBMRUVlau+dGJhlfiEgpKRtA4cS
 XUymUTFtgedYJDbbbYFoXaK4w8RWfQzQvhN6FHjkuebPSQdWz9/VN9yv7CXEJPuznwlC
 0nFe7HJ2BD6vznil1FyQlsC2LNB3nbdHlxiuKWBJEDXu2cuSDqA0xLGqvjuHxU4sXU0Y
 bQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=22WfrYqwVdHV4R9eUfnFdyTLajoJ14FZuqG4/EZXiBg=;
 b=mzklpFJxq5IryzOgv9FH1iGfsv60C2TxOulJaFk6aCggpYAix+P6off4RJdu7aeiAM
 RRZObHIL1h+HOM6vbRd1XaeIvpOrpRAtJcJ6ZyWUlsMabkYjQxvg5zbVtLDkB4KX2ljU
 Io6dIe+NciK6EUqatU+wPTbixXd6LsEnMa9puFCatUDAOJy1WR2cvj6dMYVLTMff3O3B
 27fKsaKCwT0S+l+yAzy16UumhX9qRgRO7KVzcfM7Qryle1zQ3AKrDxjErDd1l96hfGrD
 gmgAQ4Kpk+X359LyB26Aa71vt6X/D+BtCofyCvHnTvEQ6IrQHubrQoTxZpRjtuYDY2rL
 Xqqg==
X-Gm-Message-State: AOAM530b/JNjb0IrVngSavVw0duTPMaKZqc1T0iRFUtxVbz7CXzDdDc4
 3suQ5PgBPc5oPQaixh1l2HUQZvoObLKmhrv9XZ0=
X-Google-Smtp-Source: ABdhPJxcWxnUc+rwQRDI3Z0RTTF/LyrVAt5D2vgqWNNDeUaVA4VaKDcfByXRkjUfG6dWy5TDydUbKo8m1BZtu1WNZkM=
X-Received: by 2002:a5b:949:: with SMTP id x9mr22811402ybq.33.1608558687798;
 Mon, 21 Dec 2020 05:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20201128193335.219395-1-masahiroy@kernel.org>
 <20201212161831.GA28098@roeck-us.net>
 <CANiq72=e9Csgpcu3MdLGB77dL_QBn6PpqoG215YUHZLNCUGP0w@mail.gmail.com>
 <8f645b94-80e5-529c-7b6a-d9b8d8c9685e@roeck-us.net>
 <CANiq72kML=UmMLyKcorYwOhp2oqjfz7_+JN=EmPp05AapHbFSg@mail.gmail.com>
 <X9YwXZvjSWANm4wR@kroah.com>
 <CANiq72=UzRTkh6bcNSjE-kSgBJYX12+zQUYphZ1GcY-7kNxaLA@mail.gmail.com>
 <CAK7LNARXa1CQSFJjcqN7Y_8dZ1CSGqjoeox3oGAS_3=4QrHs9g@mail.gmail.com>
 <55261f67-deb5-4089-5548-62bc091016ec@roeck-us.net>
In-Reply-To: <55261f67-deb5-4089-5548-62bc091016ec@roeck-us.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Dec 2020 14:51:17 +0100
Message-ID: <CANiq72mQ=5JpMh1OZfJo6dypF0KHSUp9Umd_5qwATxEMgO5OmQ@mail.gmail.com>
Subject: Re: [PATCH v3] Compiler Attributes: remove CONFIG_ENABLE_MUST_CHECK
To: Guenter Roeck <linux@roeck-us.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, 
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

On Mon, Dec 21, 2020 at 11:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 12/20/20 10:18 PM, Masahiro Yamada wrote:
> With a change like this, I'd have expected that there is a coccinelle
> script or similar to ensure that claims made in the commit message
> are true.

It is only a warning -- the compiler already tells us what is wrong.

Cheers,
Miguel
