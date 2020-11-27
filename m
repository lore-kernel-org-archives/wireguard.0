Return-Path: <SRS0=u9fd=FB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D10C63798
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Nov 2020 15:55:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53D5A21D7A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Nov 2020 15:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8TlO/HS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53D5A21D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c28f1d31;
	Fri, 27 Nov 2020 15:49:30 +0000 (UTC)
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [2607:f8b0:4864:20::b41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ebe0c853
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Nov 2020 15:49:28 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id x17so4918685ybr.8
 for <wireguard@lists.zx2c4.com>; Fri, 27 Nov 2020 07:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OXr+s5wAAmU9q3J5K/pMxQtkv/iCji6oBFIpmoY8EgU=;
 b=i8TlO/HSrIZgKHzub2Hkh91MLq6st6QSaekpQByjGZrJpv1XY0neQO2ef8ged8QYKT
 mgRqw9QF3RrXK2LkdBc3z3quag556lJnifjP1/6NoKnkgi4Ey8tMkT8n6nQx5Dzs42IX
 MEAiOwMggWPv9nhbQ2CEV1lqvw3GPfp0L2zk7Mke/zgnt7oc/YLWT2U04RD9p1j/dbk1
 prPugYZEgA6xu3qIAkFkxH4NUf0v0kosbhheWtUdyIg7BDhvfH870QDFY8YHSmqG4TC7
 Vgg2sYrlLRzXN/mqI8f3zt3o1dOprEssbaAdl7AufRg7tIWkKlKhe9vhjnlOsDwZ7MPV
 Vqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OXr+s5wAAmU9q3J5K/pMxQtkv/iCji6oBFIpmoY8EgU=;
 b=tZlcEZ9HgV7apdMMf58x6P3tdXXS3bpSTckYbEhX3gNMFT1gSLiQ4g8G+dE5TvZeoC
 qOPFqioPGw8QkmvXcyOOWslfxY0cU3K9Ik7AvL0nZ1NgqR5qzFVKgB1kuRKSYicYbiVs
 hilKhC5bX1ECHW71ukiXLTrNGuqhwACinNNoo9JoGn9W5G9TPYZ+B5BuM1XisdoPAsnw
 KV9Eropp1kCZuznFFGF80kMuP/bflmoTTGoPTfQFDR2rYt383J/u9TD0y2d9pr8V2skS
 edisyHx0TiO0R4JNJzYOg4bQTEbxnNdBIasLhfR4r19wmplJoP5xgsUYVEBBoSZ9NT85
 WXwg==
X-Gm-Message-State: AOAM533fLVxtxS+78xOd6WxLSTin3GCALPeQVadQB3xdqrsxu55qXOo6
 SywLfXS7vxwANVuNDOEUCxBer7FLQzskNRMuFbc=
X-Google-Smtp-Source: ABdhPJyXmEKyWzC59hbBxUJqm85YZ2F5NFkm6gYoisaDevi695oBAQHt9/vpckMGq4moEpoQrAtQNC2b2N6x+m/6t5g=
X-Received: by 2002:a25:df55:: with SMTP id w82mr9664030ybg.135.1606492523532; 
 Fri, 27 Nov 2020 07:55:23 -0800 (PST)
MIME-Version: 1.0
References: <20201121194339.52290-1-masahiroy@kernel.org>
In-Reply-To: <20201121194339.52290-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Nov 2020 16:55:12 +0100
Message-ID: <CANiq72=oFrCtd1rYw3p=AUyp6WzLoMqE2iC-2M9ndcBWBMfzFg@mail.gmail.com>
Subject: Re: [PATCH] compiler_attribute: remove CONFIG_ENABLE_MUST_CHECK
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Shuah Khan <shuah@kernel.org>, 
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

On Sat, Nov 21, 2020 at 8:44 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Revert commit cebc04ba9aeb ("add CONFIG_ENABLE_MUST_CHECK").
>
> A lot of warn_unused_result warnings existed in 2006, but until now
> they have been fixed thanks to people doing allmodconfig tests.
>
> Our goal is to always enable __must_check where appreciate, so this
> CONFIG option is no longer needed.
>
> I see a lot of defconfig (arch/*/configs/*_defconfig) files having:
>
>     # CONFIG_ENABLE_MUST_CHECK is not set
>
> I did not touch them for now since it would be a big churn. If arch
> maintainers want to clean them up, please go ahead.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Picked it up through compiler-attributes with the "appreciate" typo
fixed on my end. I did a quick compile-test with a minimal config.
Let's see if the -next bots complain...

Thanks!

Cheers,
Miguel
