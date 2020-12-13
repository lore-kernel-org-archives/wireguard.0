Return-Path: <SRS0=050+=FR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B382FC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 13 Dec 2020 05:04:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 065A0230FF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 13 Dec 2020 05:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 065A0230FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02d80e28;
	Sun, 13 Dec 2020 04:56:31 +0000 (UTC)
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [2607:f8b0:4864:20::b44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e8eee80
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Dec 2020 04:56:28 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id s186so805779ybf.3
 for <wireguard@lists.zx2c4.com>; Sat, 12 Dec 2020 21:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z/uJz/Jw3MmfDGc84gX9EJKwTVBpnb7jcNLsPy/WYTg=;
 b=qbb6zoMeusOCfpjDEE+KXrzxNik5+GwTEST8oZQxqGb0IPh7Acicglg6QgggwsSODl
 nhmi5IZs8NFMHOJS9Yo8im9+F6eMyboUcziJjh0xGEuvW0hFEMamyfTAMmkMzuwuwX7N
 F7un+qdeVf7AfMvJFsM2N74xMrk1N+n+CNi+PoK2LZ/g5SRKe2ZSOaXInTCmSuGM2UqK
 WDSAPOgdLlaVIC/WZKgWOfLzQGw9yV3yCE+Yjctj5TDfdBKiGsBr/0IZ/eCnmiev/IRO
 dO9L/dpm29dI+w++0vDQl4NexJ7Effk7Df2uak5r9BhepGYXo6RWONeUuJxNmOU48l+r
 D/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z/uJz/Jw3MmfDGc84gX9EJKwTVBpnb7jcNLsPy/WYTg=;
 b=nuLlq0tqzYEWF0fzcY3EDeuSE2VdPyAc32yE6SYI9NakahM6bmifv/Oy3W1YfHYeuF
 9u+NBOUYPkNWVjJGZmibWbYWp5NnNBFgim4murRjniCjz7kR2q5sshGunJmXbKjXcNJ5
 OsXvcQ1Pg8kgKuYJEFZFulmiyqdHzsnVOnz7KHhZvasV7UP7L9J0o0g428C6IFNYcU3j
 mh9mAjuYwueES717f6R5MDsZTTzq7lf0ulesRDS2a1bRBqpvXlnRaFnBkvexET9zLIiC
 W//Eg6XVdA4elm+bn27REl4Zpj6hc3S4VfHXf7Ngs7iyke4P9ZZXpi28p8xNZ+Uqz23D
 C1Xw==
X-Gm-Message-State: AOAM532uhKA71FZ1BFnkUwBNihbogabLSCT9AjZ2Jg8uUoWWOY+83svw
 11azNPLaWhHBuLLnf6Nnk4LX0Y7bRsku3BI1V0M=
X-Google-Smtp-Source: ABdhPJwwjj1eu9V+fuA1Gf6y0i37Y+U+rhZRbNZrW53zzJW2PAYnMbAfMlzfkf0c0LLKIpapY5qqc4+MNZRlFQ4aivA=
X-Received: by 2002:a25:ef0c:: with SMTP id g12mr8240256ybd.26.1607835865316; 
 Sat, 12 Dec 2020 21:04:25 -0800 (PST)
MIME-Version: 1.0
References: <20201128193335.219395-1-masahiroy@kernel.org>
 <20201212161831.GA28098@roeck-us.net>
In-Reply-To: <20201212161831.GA28098@roeck-us.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Dec 2020 06:04:14 +0100
Message-ID: <CANiq72=e9Csgpcu3MdLGB77dL_QBn6PpqoG215YUHZLNCUGP0w@mail.gmail.com>
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

On Sat, Dec 12, 2020 at 5:18 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> This patch results in:
>
> arch/sh/kernel/cpu/sh4a/smp-shx3.c: In function 'shx3_prepare_cpus':
> arch/sh/kernel/cpu/sh4a/smp-shx3.c:76:3: error: ignoring return value of 'request_irq' declared with attribute 'warn_unused_result'
>
> when building sh:defconfig. Checking for calls to request_irq()
> suggests that there will be other similar errors in various builds.
> Reverting the patch fixes the problem.

Which ones? From a quick grep and some filtering I could only find one
file with wrong usage apart from this one:

    drivers/net/ethernet/lantiq_etop.c:
request_irq(irq, ltq_etop_dma_irq, 0, "etop_tx", priv);
    drivers/net/ethernet/lantiq_etop.c:
request_irq(irq, ltq_etop_dma_irq, 0, "etop_rx", priv);

Of course, this does not cover other functions, but it means there
aren't many issues and/or people building the code if nobody complains
within a few weeks. So I think we can fix them as they come.

Cheers,
Miguel
