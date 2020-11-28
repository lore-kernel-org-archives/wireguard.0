Return-Path: <SRS0=Yklm=FC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D54C63697
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Nov 2020 13:14:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E541424658
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Nov 2020 13:14:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Yc0hZL6j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E541424658
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed8be13b;
	Sat, 28 Nov 2020 13:08:20 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 561d708d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Nov 2020 13:08:18 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a24f7ab
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Nov 2020 13:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=VxXDsIepi+eAd4xKb3U67HkBsHg=; b=Yc0hZL
 6jx7GcAZ9Zc+ZKaMPi/AwDBReO8Kg+hbdIgLsby4m64EpN3IWfCCrjhNVSk/Rqev
 Mu9gByATG7yn1gtWEPBID+O8VbrVX/+2dgeEpvHOMJmXEblJu8Zufa+7aKVcJ/Iw
 +ChYqqi9xZzzLuPixz/5crETi0eRgJqPmr+NRFY+w+srP/78zIoQjerKkLqf9w24
 vuHzu2YvtC+w0iklspKkcMmk0uv2wqYkn2ll3i4jBXnXAsrzW46JViHc/1zhf38Y
 rKanxXX6hhpSRPtuSU+K26h67XWsFWkW5Ct6dTO3qhxZaUsftO5j7INFdtqiFhpY
 rIlTnLtW7m6z2q7w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a9ea6e9a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Nov 2020 13:09:04 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id g15so6993486ybq.6
 for <wireguard@lists.zx2c4.com>; Sat, 28 Nov 2020 05:14:20 -0800 (PST)
X-Gm-Message-State: AOAM531+gslmnzRCoITyxh56/gpPnrnf2zAFKd02vwH6JEootEF6NdWK
 ddXOP8vJuxydlwVhlvdp/XhQnOkDZTlZzPTO6YM=
X-Google-Smtp-Source: ABdhPJzhpzpgqWtgM7qicLRbtzJzCdlKXMymfS4WuyC7aFryeXdSo+3zP9Yndl2qJmFaSFc5yZt4Oub26GQMTcJIL6U=
X-Received: by 2002:a5b:2c6:: with SMTP id h6mr14695421ybp.306.1606569259874; 
 Sat, 28 Nov 2020 05:14:19 -0800 (PST)
MIME-Version: 1.0
References: <20201128084639.149153-1-masahiroy@kernel.org>
In-Reply-To: <20201128084639.149153-1-masahiroy@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 28 Nov 2020 14:14:09 +0100
X-Gmail-Original-Message-ID: <CAHmME9o7uLRRD91nAie48nM=ogNuV9-cwwQcW1dSVSXhjCfWsw@mail.gmail.com>
Message-ID: <CAHmME9o7uLRRD91nAie48nM=ogNuV9-cwwQcW1dSVSXhjCfWsw@mail.gmail.com>
Subject: Re: [PATCH v2] Compiler Attributes: remove CONFIG_ENABLE_MUST_CHECK
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Shuah Khan <shuah@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>, 
 LKML <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, 
 Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Sat, Nov 28, 2020 at 9:48 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Revert commit cebc04ba9aeb ("add CONFIG_ENABLE_MUST_CHECK").
>
> A lot of warn_unused_result wearings existed in 2006, but until now
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

For the wireguard test harness change:

Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
