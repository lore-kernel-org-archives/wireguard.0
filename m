Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99C7C54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 23:51:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24c31874;
	Wed, 21 May 2025 23:51:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7bcd2cab
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 May 2025 23:51:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C46E43743
 for <wireguard@lists.zx2c4.com>; Wed, 21 May 2025 23:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DBCC4CEEA
 for <wireguard@lists.zx2c4.com>; Wed, 21 May 2025 23:51:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="jhwk5RpD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1747871511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shHXBB3coCQypIwl6wJ0Ke65sD39lWEF8uZBG2+9XW8=;
 b=jhwk5RpDifeoaHOeg7vq27IMcKo7cYf7XbCVjPd8qD173LFgshIgLoSMGCyd0KUu6VjbLq
 WbMhcbLInSxQRue+xjPRQX6bKF7gB8UcHQB/ZRfXumiMiuhYyHqGzQzLoDpSr7rkGHPYZM
 1CWzB2NH+pSSHajc5ogJw0BLTuqQyDA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9916bb35
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 May 2025 23:51:51 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-40356cb3352so5179530b6e.1
 for <wireguard@lists.zx2c4.com>; Wed, 21 May 2025 16:51:51 -0700 (PDT)
X-Gm-Message-State: AOJu0YxtKEArmSGAB9iHfe8y7UwI8lDUCHgD6FGxm78TM7lqcztb9Nwq
 r7HUOHAzfzabWmgH6YGBN8XncKgbGeTEYsUGU64viXJCEhWr88lP67zyZ7aiJ8kD6tmwZ29Q/1K
 0cAYR3eKsZv6SczqKNuxIN1dyL4rZ+Mo=
X-Google-Smtp-Source: AGHT+IEIwHNcIpd5V7g/BVe78OFddhwilZu8M9OB/QCWuixELJ53rxcsxekdN+C+d28lwhuGnID+84vasEalnWbuMXI=
X-Received: by 2002:a05:6808:3090:b0:3f9:176a:3958 with SMTP id
 5614622812f47-404cd6a9338mr15020638b6e.11.1747871510514; Wed, 21 May 2025
 16:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250517192955.594735-1-jordan@jrife.io>
 <aCzirk7xt3K-5_ql@zx2c4.com> <aCzvxmD5eHRTIoAF@zx2c4.com>
 <vq4hbaffjqdgdvzszf5j56mikssy2v2qtqn2s5vxap3q5gi4kz@ydrbhsdfeocr>
In-Reply-To: <vq4hbaffjqdgdvzszf5j56mikssy2v2qtqn2s5vxap3q5gi4kz@ydrbhsdfeocr>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 22 May 2025 01:51:39 +0200
X-Gmail-Original-Message-ID: <CAHmME9rbRpNZ1pP-y_=EzPxRMqBbPobjpBazec+swr+2wwDCWg@mail.gmail.com>
X-Gm-Features: AX0GCFuMANmqfDSG4JH6SXWxpZ4_QbTk3_0NFmDMO-JkLf12gfBrPBxF6YfJbtY
Message-ID: <CAHmME9rbRpNZ1pP-y_=EzPxRMqBbPobjpBazec+swr+2wwDCWg@mail.gmail.com>
Subject: Re: [RESEND PATCH v1 wireguard-tools] ipc: linux: Support incremental
 allowed ips updates
To: Jordan Rife <jordan@jrife.io>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, May 22, 2025 at 1:02=E2=80=AFAM Jordan Rife <jordan@jrife.io> wrote=
:
> > > Merged here:
> > > https://git.zx2c4.com/wireguard-tools/commit/?id=3D0788f90810efde88cf=
a07ed96e7eca77c7f2eedd
> > >
> > > With a followup here:
> > > https://git.zx2c4.com/wireguard-tools/commit/?id=3Ddce8ac6e2fa30f8b07=
e84859f244f81b3c6b2353
> >
> > Also,
> > https://git.zx2c4.com/wireguard-go/commit/?id=3D256bcbd70d5b4eaae2a9f21=
a9889498c0f89041c
>
> Nice, cool to see this extended to wireguard-go as well. As a follow up,
> I was planning to also create a patch for golang.zx2c4.com/wireguard/wgct=
rl
> so the feature can be used from there too.

Wonderful, please do! Looking forward to merging that.

There's already an open PR in FreeBSD too.
