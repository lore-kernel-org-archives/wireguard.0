Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F19C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Jul 2022 07:09:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 14e8982a;
	Thu, 14 Jul 2022 07:09:05 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 506f9bf7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jul 2022 07:09:03 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id f14so664380qkm.0
 for <wireguard@lists.zx2c4.com>; Thu, 14 Jul 2022 00:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T0TGzHJ/d88sjvucmzrmHfr2w3pyHWB6L9OYmNBsm0w=;
 b=W5YyIB6f84m7vXR2leirsrRhoZV1jWUf2Fx1bIlNTxon1Kr0lmT2iJ016uzfqyS2lO
 wDwN2WjHZT4RuY2U87Yg1/UQsPv1AvikNH5xT3+k6sEkdDBNCmcJt6OQIQAQpdC3Hv8i
 thH9pVWH8Kq5Lp8CPDdn96gd2NIH6x5CsNb+GpaA6S9eZu6mkF4ZYQc01o7+Ay3kWJfG
 NW7h2ntqELqu5+1feK09G0ZRhHi/RsRmtkGre2hFUXBAuyQFZP/i7T8tsbuHKjWLfGEO
 /kkrAE86mF6Rm/YUjJ3hHZZi2/Jl1bLE/1BEPeKAkBn3rQhN2qLQvMUew+f2TeYmZHn1
 G4tQ==
X-Gm-Message-State: AJIora8hUxLM8s/JcYPMnqWxKg7b1t78Bf9vK+0yIUyHilZXbGrlILET
 GHHDZuFpSbY29HaQGknlMcicoxrljvrnLg==
X-Google-Smtp-Source: AGRyM1uFr+OxecM9dXeZJts4vToPyCGHcgHJ0NMlFPeW/QvbstseYzuv74H+XtWVKY9ZuHuyfrzwxA==
X-Received: by 2002:a05:620a:2681:b0:6b5:b547:40d with SMTP id
 c1-20020a05620a268100b006b5b547040dmr5113754qkp.34.1657782542225; 
 Thu, 14 Jul 2022 00:09:02 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 g7-20020ac84807000000b0031e9ff0c44fsm807191qtq.20.2022.07.14.00.09.01
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 00:09:01 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 64so1683897ybt.12
 for <wireguard@lists.zx2c4.com>; Thu, 14 Jul 2022 00:09:01 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr7497019ybh.36.1657782541422; Thu, 14
 Jul 2022 00:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220714042221.281187-1-sashal@kernel.org>
 <20220714042221.281187-39-sashal@kernel.org>
In-Reply-To: <20220714042221.281187-39-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Jul 2022 09:08:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWumKeJmsOsd7_=F-+8znY=0YtH-CbeLN7knSJ1LDOR_w@mail.gmail.com>
Message-ID: <CAMuHMdWumKeJmsOsd7_=F-+8znY=0YtH-CbeLN7knSJ1LDOR_w@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.18 39/41] wireguard: selftests: use virt machine
 on m68k
To: Sasha Levin <sashal@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, 
 wireguard@lists.zx2c4.com, netdev <netdev@vger.kernel.org>, 
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
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

Hi Sasha,

On Thu, Jul 14, 2022 at 6:29 AM Sasha Levin <sashal@kernel.org> wrote:
> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
>
> [ Upstream commit 1f2f341a62639c7066ee4c76b7d9ebe867e0a1d5 ]
>
> This should be a bit more stable hopefully.
>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks for your patch!

> --- a/tools/testing/selftests/wireguard/qemu/arch/m68k.config
> +++ b/tools/testing/selftests/wireguard/qemu/arch/m68k.config
> @@ -1,10 +1,7 @@
>  CONFIG_MMU=y
> +CONFIG_VIRT=y

The m68k virt machine was introduced in v5.19-rc1, so this patch
must not be backported to v5.18 and earlier.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
