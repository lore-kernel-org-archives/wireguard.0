Return-Path: <SRS0=K46V=QL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68315C169C4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Feb 2019 00:10:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1A912177E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Feb 2019 00:10:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de-vri.es header.i=@de-vri.es header.b="fLgTL8Py"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1A912177E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=de-vri.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f744c32;
	Mon, 4 Feb 2019 00:03:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9dde5c87
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 00:03:27 +0000 (UTC)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f2408f4
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 00:03:26 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u89-v6so10242523lje.1
 for <wireguard@lists.zx2c4.com>; Sun, 03 Feb 2019 16:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de-vri.es; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VoGLTgL1lJLD7jkkFHwYj//x90MIGoJBi1GvrXcFwK4=;
 b=fLgTL8PyK5TNOGbOjXqbrN21+G3RU5kd9BkX2ryjBGlTrWU1Q+PjEejgG2mtBAUbEu
 TdiwKMie2sy9QLbs85vNbn9IRLNXgl49kRhrwrNT0UYLUkhoKAOzzbY79fSiAPmdQeGs
 XZU1oOxdqHg33HXgv5/qgb9TFh/ETChmsZcbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VoGLTgL1lJLD7jkkFHwYj//x90MIGoJBi1GvrXcFwK4=;
 b=ed1MtPVToGblI4yuZvBRkPuQfn/RXl5zqX2aM1/OnvyNtaTFqmNMT7vlnU2c2lI8uz
 zW9WZ6IJ7FtuUi5DrwRj1fK5Eb1YH8UmaMqO5zluQzxGNX2TooZjuBszEGQAqTqLZ5Sc
 RdIzC9zb95GXCsFRwfGLzEy+j+09d/y3U4vmVFsmGGapaCEoZrFT2nPbJRdzIjpwi+8U
 blUgCFQfYXx4G4AfqdfetJfOdYco51GcsHmOyWAE0G8vy0oDwFVhiuBEmC9iPVX3w4qI
 4tZCHIVp9c73XVAwqw7apVIg2llYV8WhHNm8H/4Wmb1wjFQQIGbUMW2sLusEnrJYyx4u
 C2IA==
X-Gm-Message-State: AJcUukdeKzhBrD8thOoMBrvMm5ytAFa9oqgEcV0hZIIHfVyhSQG5AfwL
 emFWHE+YDcVyVhzN665wE0A/qLFGPVU=
X-Google-Smtp-Source: ALg8bN4vchLaAqu9kCqa8Pa9cyIO/2x45SFn4FB2wsjxBp/xmo75ZrVTrAkucazVP7oeZn7RD2+xGg==
X-Received: by 2002:a2e:8951:: with SMTP id
 b17-v6mr41365591ljk.142.1549238997482; 
 Sun, 03 Feb 2019 16:09:57 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id r29-v6sm2437370ljd.44.2019.02.03.16.09.56
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Feb 2019 16:09:56 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id v1-v6so10220684ljd.0
 for <wireguard@lists.zx2c4.com>; Sun, 03 Feb 2019 16:09:56 -0800 (PST)
X-Received: by 2002:a2e:2d4:: with SMTP id
 y81-v6mr38349599lje.62.1549238996195; 
 Sun, 03 Feb 2019 16:09:56 -0800 (PST)
MIME-Version: 1.0
References: <20190203213156.7553-1-maarten@de-vri.es>
 <CAHmME9o3=5VUp3qXVKtoaAi+dE+5eNA6M9LVJbbs6LUZpDFbVw@mail.gmail.com>
In-Reply-To: <CAHmME9o3=5VUp3qXVKtoaAi+dE+5eNA6M9LVJbbs6LUZpDFbVw@mail.gmail.com>
From: Maarten de Vries <maarten@de-vri.es>
Date: Mon, 4 Feb 2019 01:09:45 +0100
X-Gmail-Original-Message-ID: <CAPWpf+wETOdQGZYSLzMy43DQFdqyvXO5N=q2Qttkebm9TEExsQ@mail.gmail.com>
Message-ID: <CAPWpf+wETOdQGZYSLzMy43DQFdqyvXO5N=q2Qttkebm9TEExsQ@mail.gmail.com>
Subject: Re: [PATCH] Allow changing `creator_net` after interface creation.
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, 4 Feb 2019 at 00:57, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey Maarten,
>
> Thanks for the patch. It turns out that in the git repo, the
> jo/transit-namespace branch from Julian (CC'd) already has something
> that seems very familiar with this. Pending upstreaming, we're holding
> off on adding new features, but following that, we'll start to
> evaluate options like this very seriously.
>
> Do you see a difference between what your patchset does and what Julian's does?
>
> Jason

I'm not sure. I will read through Julian's patches tomorrow, but at a
glance it does appear to address the same issue.

I still sent a follow-up to add missing checks for CAP_NET_ADMIN.
Didn't feel right to leave it here without that, even if none of it is
merged in favour of Julian's patches :)

Kind regards,
Maarten de Vries
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
