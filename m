Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEC6C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:33:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2883A2074A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:33:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGhBFfMw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2883A2074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 338546ac;
	Fri, 24 Jul 2020 08:09:52 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [2607:f8b0:4864:20::d36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7780dd67
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 08:09:50 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id t15so107557iob.3
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jul 2020 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=Ddv1fHhASWZagrjq1h/Dn3tdCGbUhBPGlg305Nx6iAQ=;
 b=SGhBFfMwRSNIfGZlLe+kL86p8RknzaVxgJrsVDjnPaJ6kSBEyP+TG0iF4rs+qmH+w1
 O6LZSQNjfkzGqmp90+g5i/+qPgtcOr0nMRaoDDTBuIh5S9n8yOsyzozy4/UPUGFGdi7O
 unT4ykkf1ocSLlKz3D7B+GkZ5wbFKHWqcL8sUxOEOOH/jE+13UjRG0uFT9T0vUC6iR10
 DoeH05IzfERdKBq9+ii2lX5z+LA5nBJHGFV3Pk475nd8iTXVDKTueqcb9vtBZuF8ElcT
 COPpiP6ILcynKqJ0IVNSwWIhU9r2KHmRmJabJXdTLI7EokVUxqO68M+9RLnIXB5Iiad1
 LW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=Ddv1fHhASWZagrjq1h/Dn3tdCGbUhBPGlg305Nx6iAQ=;
 b=ncr93i+MEs+lU7OyeJcsmOu4Z3i8Z134PpmFMdwqmtUXTs0AXwh7D2qkPVonxbtN9T
 VS7NFj2hy1B2+QXlbJ/GDxukQFVzuR+CWjjaHPiHTEgrTGq5f6LQxYGu+yYLKAIdRKoz
 c1TMcJSgtuVTelk3Vf7fszaqoJUwxkhEzgENqqdtNaLr93IwtKziLukNSbYbN0IdybIe
 A0yLSaBfNJcw+hWJirGuUbwv+VSOOHSL3wLaWhuIBtpkB8AJ3FTJVD9QvH21c2LOOQDj
 NwJqV93EZKNtkB4w/SKIQtF2rFf+GUwFmRYck2ZgXZmjdr+aTZpupysfIp/o0zP62HvO
 Qzag==
X-Gm-Message-State: AOAM532lSH7XSqnqGVGOmTAs8oUDBNlRaAZrxRRPwZIkxAYNflGT2Y+d
 oj1bWo2AgJgOO7n3L34l6WDSRaH9zXeKBUfJM2xRtnj2Uas=
X-Google-Smtp-Source: ABdhPJxc6y7dgIzYrGIL2w+AllSRePifQQMocnjouKXrSkxNf/5wLlD4h/HJg3yYYlOWMfIaonvlPyxoOWe7Hr1PMpg=
X-Received: by 2002:a05:6638:3aa:: with SMTP id
 z10mr9618559jap.54.1595579563726; 
 Fri, 24 Jul 2020 01:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200721155826.29f29036.peter@petergarner.net>
In-Reply-To: <20200721155826.29f29036.peter@petergarner.net>
From: Jeffrey Walton <noloader@gmail.com>
Date: Fri, 24 Jul 2020 04:32:32 -0400
Message-ID: <CAH8yC8nCwwx8h8HmTGhsh10Dm4ThQTc=53ESfO=6iAXx4XvqmQ@mail.gmail.com>
Subject: Re: Using OneRNG hardware RNG can I get wireguard to use /dev/random
To: peter garner <peter@petergarner.net>
Cc: wireguard@lists.zx2c4.com
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Fri, Jul 24, 2020 at 4:28 AM peter garner <peter@petergarner.net> wrote:
>
> I've used my OneRNG v3.0 external device to recreate my SSH moduli and
> am now looking to recreate my wireguard keys.
>
> According to the Wireguard docs it uses /dev/urandom:
> https://gist.github.com/rmoriz/58f1768218a4fbc4b318615bfb85111d
>
> fd = open("/dev/urandom", O_RDONLY);
>         if (fd < 0)
>                 return fd;
>         ret = read(fd, out, len);
>         close(fd);

Unrelated, the kernel-crypto folks recommend using /dev/urandom.
Wiregaurd is following best practices. Also see
https://lkml.org/lkml/2017/7/20/993.

Jeff
