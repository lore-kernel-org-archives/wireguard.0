Return-Path: <SRS0=050+=FR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F30C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 13 Dec 2020 16:32:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B32224BD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 13 Dec 2020 16:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70B32224BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b84aaea3;
	Sun, 13 Dec 2020 16:24:51 +0000 (UTC)
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [2607:f8b0:4864:20::b41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b80e4827
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Dec 2020 16:24:49 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id w127so13177369ybw.8
 for <wireguard@lists.zx2c4.com>; Sun, 13 Dec 2020 08:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OOly9loxLYTvtE1Njo5WCf0TNy0xF1kl9c/YUhN9Ldg=;
 b=CQnFeP/qKJ1PIVVbcikxlOyY0crNPCzCLu36oBQIVFV74Qm25kpqcvPED0RU69ffXH
 uD6MhZB+lq4W+AwP/iSR1y65ptVYtL2M9m/31Fq2JJPuJWN6yPuvek6A5N6ax9r5UCRw
 v0A7+nXAqDoI6u2QDgJS/P0XsGWZQKRj7ErAjJubTAV4bU8mufhSSkpu98ZVvUCjUmKH
 m8l5+M1F6sAbrcTb0c9JMjQIhq3a3okT8zVEj/9CKQSUV3R07tDspVdX2gGqJCSVv6xy
 7W5JptzuBD1Rtp0cr87thNuZ5gZd+z6n4BrWRFemSfSqlGvEaVbpoSKchAuRye9qKD9Z
 moJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OOly9loxLYTvtE1Njo5WCf0TNy0xF1kl9c/YUhN9Ldg=;
 b=OOaSSgUY8oVPY9knVTNIQsIgA8FO+FlAnUOKgM/WKjcY9jHb+HV/tf4R6MGNzuGrAh
 CX+/yFgxDFpM678MGWu4hdUbGcU+yIyZEveHBNCYnquplJy9aFj7ZOeIGPfvIpKRv0BQ
 j0EtOKgjwuMm9l9eaCN1GGifWSAHxrw/5uDm0vig3oKLiANYFINY+K8K2S3Aw2dWDUPp
 bQIlopf3Eb0xs0i6QaqVchIpeccKdbafugaxjr6HcPW5++y0CfYUybXgXgLE1ZWc+ZkR
 I4jkdTGLGx4vSyrRuTuOflZVC3FpSSjgfUEMpe3xf5vGEypc0+azYDf1S0ptFOEQuvJB
 uD2A==
X-Gm-Message-State: AOAM531fzW3n+H/EgcLVE9sMgp5YBF1z0XvRJJjf6F8Xczol62YUl7FE
 vJKpeqoqfLugLXcatf4JLJAfpRRNGUEVBDRrQVw=
X-Google-Smtp-Source: ABdhPJzYbmOg9ijb/AZ8TKkK+fOnNQR1Y5LH6RzvAMw7yylGfsj/NGzlkqPYBT43q2CZBUVma+fLSh0qufHXXvXT9TQ=
X-Received: by 2002:a25:40d:: with SMTP id 13mr32470818ybe.422.1607877169805; 
 Sun, 13 Dec 2020 08:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20201128193335.219395-1-masahiroy@kernel.org>
 <20201212161831.GA28098@roeck-us.net>
 <CANiq72=e9Csgpcu3MdLGB77dL_QBn6PpqoG215YUHZLNCUGP0w@mail.gmail.com>
 <8f645b94-80e5-529c-7b6a-d9b8d8c9685e@roeck-us.net>
 <f5c2d237-1cc7-5a78-c87c-29b7db825f68@urlichs.de>
In-Reply-To: <f5c2d237-1cc7-5a78-c87c-29b7db825f68@urlichs.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Dec 2020 17:32:38 +0100
Message-ID: <CANiq72kajFSgKmYW0tXUXNEQpMwBW7BsFSeqbMVDmXqBXDLh_A@mail.gmail.com>
Subject: Re: [PATCH v3] Compiler Attributes: remove CONFIG_ENABLE_MUST_CHECK
To: Matthias Urlichs <matthias@urlichs.de>
Cc: Greg KH <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Masahiro Yamada <masahiroy@kernel.org>,
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

On Sun, Dec 13, 2020 at 4:38 PM 'Matthias Urlichs' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> If your change to a function breaks its callers, it's your job to fix

No function has changed. This patch enables a warning (that for some
reason is an error in the case of Guenter).

Even if this was a hard error, the same applies: the function hasn't
changed. It just means callers never tested with
`CONFIG_ENABLE_MUST_CHECK` for *years*.

> the callers proactively instead of waiting for "as they come" bug
> reports. (Assuming, of course, that you know about the breakage. Which
> you do when you tell us that the bad pattern can simply be grepped for.)

No, *we don't know about the breakage*. The grep was for the
particular function Guenter reported, and done to validate his
concern.

If you want to manually inspect every caller of every `__must_check`
function, or to write a cocci patch or a clang-tidy check or similar
(that would be obsolete as soon as `__must_check` is enabled), you are
welcome to do so. But a much better usage of our time would be letting
machines do their job.

> If nothing else, that's far more efficient than [number_of_callers]
> separate patches by other people who each need to find the offending
> change, figure out what to change and/or who to report the problem to,
> and so on until the fix lands in the kernel.

This change is not in Linus' tree, it is on -next.

> Moreover, this wouldn't leave the kernel sources in a non-bisect-able
> state during that time.

Again, the change is in -next. That is the point: to do integration
testing and let the bots run against it.

Cheers,
Miguel
