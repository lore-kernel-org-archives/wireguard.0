Return-Path: <SRS0=v8Vx=FE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CEBC64E7B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Nov 2020 01:04:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E7D220757
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Nov 2020 01:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WU2glR0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E7D220757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b526f69a;
	Mon, 30 Nov 2020 00:58:14 +0000 (UTC)
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [2607:f8b0:4864:20::f41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3706b1da
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Nov 2020 00:58:10 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id p12so4868036qvj.13
 for <wireguard@lists.zx2c4.com>; Sun, 29 Nov 2020 17:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9w+jIogOsKRBrpA0BOG2mGKZgZW7G/tIHqRWbeWWJW4=;
 b=WU2glR0TsgL7F4/RiVfuwal0YDkOeqqQo1eMszLAWLO0V78Iff5/n64/V+Tel6qT40
 0VZPZwJwnsbjpw844pzMgW2hYIqwz9mbmNNEs6O9eqV7TWRrdnQvvljYsI+oAgmSfU9d
 JIxDowmXVsOG4M50gjV44mXjYipYLj/9fbmyh2K14okhPO2JuJkIbpuUnR81GPub6sfc
 rlIoxazGL6HuV4KMjGROkoGEtAMmm7Vc+Pc82fuAAMqnezRvuWTfJB0nD/O/ozmK1le2
 0iQc4nSTPnFUJ+egMZNoYLZ/ZHipkw5XcHC1btQ4QFt9SCnPc6sbU8WpdjVCohjcBAA6
 sP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9w+jIogOsKRBrpA0BOG2mGKZgZW7G/tIHqRWbeWWJW4=;
 b=AjCXurLJ7AmnKJqXeqsprr4q0RItqKZS4sUfsKbE9DvpDrZsNXNum4xLv45UAmRuF9
 rDfHsyWkJ2oUzo0DlVzA+IRfK9bA47Bqqve/HN/K7evFYDMKIoiwdftr5VZfuccBo7sM
 t4B8czM7KzFPUHJkQHN9rwIObV0TfLcLNEwO+p53piGAjW0B1BOJHyV8LB9ZN6P1v2ct
 MUlDQFpKgQJpHRv6X6CDlsz5UCUQ2arJ9mSgxzHcAlnqIve3pVRsZU/IoZ7KEVD5tcUE
 8/JhDkgdkeid8VYLoNoUgO2S9FljihdOvbYbjGapt8011SMrODhxjA4fYTdw6XeIqw6y
 8n+w==
X-Gm-Message-State: AOAM533rwXKlqk5JcUIOYPbgJdduvBChRqUIl33hf4riOUo8FpKgFIKG
 3jsK3l97yBEcUiPUFLO1cV8=
X-Google-Smtp-Source: ABdhPJxNBQJpDe6Q+07RcfAa9BO9KXU9uK23WXodIbLjKY85NBzOpU1EHUFfTEHywAlwGfo76xkVUw==
X-Received: by 2002:a0c:fe04:: with SMTP id x4mr17013047qvr.61.1606698264424; 
 Sun, 29 Nov 2020 17:04:24 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id e19sm14025778qtp.83.2020.11.29.17.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 17:04:23 -0800 (PST)
Date: Sun, 29 Nov 2020 18:04:22 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Shuah Khan <shuah@kernel.org>, clang-built-linux@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org, wireguard@lists.zx2c4.com
Subject: Re: [PATCH v3] Compiler Attributes: remove CONFIG_ENABLE_MUST_CHECK
Message-ID: <20201130010422.GA1956616@ubuntu-m3-large-x86>
References: <20201128193335.219395-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201128193335.219395-1-masahiroy@kernel.org>
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

On Sun, Nov 29, 2020 at 04:33:35AM +0900, Masahiro Yamada wrote:
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

Acked-by: Nathan Chancellor <natechancellor@gmail.com>
