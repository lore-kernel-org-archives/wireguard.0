Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9D9C56202
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 14:10:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 071822080A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 14:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7K+/UQ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 071822080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25310b61;
	Mon, 23 Nov 2020 14:04:52 +0000 (UTC)
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [2607:f8b0:4864:20::b42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4a3fb7ea
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Nov 2020 20:40:43 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id x17so12091338ybr.8
 for <wireguard@lists.zx2c4.com>; Sat, 21 Nov 2020 12:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jfob3+FnyGrRXkhnjH+zGr8/PgDK3twBANc/QMxzgFE=;
 b=J7K+/UQ7F1lLvhDUkN5iLO0MvjX7Kj2Yl4f0hrn4pIZzSXMIv+YjKJExTuyxkjxvAu
 tDTtUy+dCTzZRxCvYI08Es+Rl6Pj4vkoYp3+zBz2zdG0p9fgwIMi+vmfdbPi610owxXt
 HOsCV5UlDZ/TzHhOGjCMucJtSwOjTbXxfnlkYxe26eUyRp3YcXM2A6BvMEfXCTOfG4rb
 GkMhSphirNkrqej5d9RzyRYhiPWYz5JSPLgq0rDX45LXAPGSGzEXPnsDkttCidhrAUWp
 S66B6SiAvXTGG4744mRaXXAnxUh+5r4Bm+LuMzu1qgXtDVzh1v87M2X6pqtuJNTp/D1Z
 b31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jfob3+FnyGrRXkhnjH+zGr8/PgDK3twBANc/QMxzgFE=;
 b=ARTef8YYNw/ouOsLaAP4LcMMQUYWDgMYee3n/s2nCotwzhAcWxFS/Yvi+m8CQN7+I6
 ooJUVn5p69dE4UOQEhMCMilHxpbxEMHvM3MWs+HxE75RvPOwfJG0cE0SvRno1aOK14Bg
 6QJSM2PqPCZCgUPF7cu2AibSP6gNYQ5cD3OMS1UC9p0d1qxArEvv8UVXiFhL7DMeM4n8
 htctBEhJwI1L10DWx0exwmZoIomW++vIqd936wW3jQx/fqOQM/xmRnmwP2OZok9iggyb
 QUPwsKmk6tHaTdLWFWHGp1rS49kXfYVAjQCuzvCqp4D2Kw7eLMiT5UVA+cHrLeLDSK7I
 CXnw==
X-Gm-Message-State: AOAM533h8u1rziuDGtjetMYKliN4KmhgIZ/EB9i7IG/rmjV77mN8Xhja
 7MxL9QvpGwpNTWlP/vcU1lwyOol2wmaudhajiww=
X-Google-Smtp-Source: ABdhPJw29eh3xaiHlSU2WpXqs9VkBeKzCzHJyDlT0wlOE00mduy9vnpv6HjM6io7IBtMYamga//5r9fCirI/O4wN5Ko=
X-Received: by 2002:a25:2e0d:: with SMTP id u13mr28744857ybu.247.1605991552718; 
 Sat, 21 Nov 2020 12:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20201121194339.52290-1-masahiroy@kernel.org>
In-Reply-To: <20201121194339.52290-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Nov 2020 21:45:41 +0100
Message-ID: <CANiq72nL7yxGj-Q6aOxG68967g_fB6=hDED0mTBrZ_SjC=U-Pg@mail.gmail.com>
Subject: Re: [PATCH] compiler_attribute: remove CONFIG_ENABLE_MUST_CHECK
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Shuah Khan <shuah@kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, 
 Network Development <netdev@vger.kernel.org>, wireguard@lists.zx2c4.com, 
 clang-built-linux <clang-built-linux@googlegroups.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 23 Nov 2020 15:04:50 +0100
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
> Our goal is to always enable __must_check where appreciate, so this
> CONFIG option is no longer needed.

This would be great. It also implies we can then move it to
`compiler_attributes.h` since it does not depend on config options
anymore.

We should also rename it to `__nodiscard`, since that is the
standardized name (coming soon to C2x and in C++ for years).

Cc'ing the Clang folks too to make them aware.

Cheers,
Miguel
