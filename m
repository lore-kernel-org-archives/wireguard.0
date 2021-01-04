Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F09C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 12:47:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 779B321D93
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 12:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 779B321D93
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56fe4e23;
	Mon, 4 Jan 2021 12:36:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb53ba31
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 12:36:32 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0da913b4
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=SJtgQU8a9GNBkuLGXiU9ERu5Xoc=; b=PxQCwQ
 JzFC1j0I0UWC/oEo1O7SKi4JJDGEDMXX7hW6UZid/1MBMaoSUB87eCuKT+CeiJEc
 4KOZ1p0c4pcaw7KHAN6Gl1d9a/WWmfUi1QFGneuR+LdmLqqkKfXgUo0YILF+ghMC
 dzqiey5X6O6WiEo8B5/75eGQmQnL+fl1Vzm86yhA5ORfV7PnAiWFikbM1k1IoPul
 tAe54Jv+N17Yw33ym0yV+CA84IFid9FCGmMzunEwn3JeTpKRLsjwSUlILytUjJxv
 fzVfmiNlhk6MrNjtusy2pSoYi/Hj0u2STgzQHdf/LeeeiFOla8z0WcaJtYXKPJvu
 UJ/CGBtaDWmiEeQQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 65488888
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 12:37:17 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id f6so25842385ybq.13
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jan 2021 04:47:22 -0800 (PST)
X-Gm-Message-State: AOAM530NvKWAg/B5BENWUnXC0Tc+Wfm98yyY2AnL0afCy0SGl6Jbm//K
 JNO6V7qd1RcKLwPpHFcFZXPYDoRiZC7Ddva0JvI=
X-Google-Smtp-Source: ABdhPJxBVinGQzOkSSBDp6kMXhJhb5e9YTT9Dieoc3DWmyWTvqN6+Xmxr7mTAFjVpHY4oBqj4cBcriMsViS39rxjCjw=
X-Received: by 2002:a25:938a:: with SMTP id a10mr99006814ybm.49.1609764442085; 
 Mon, 04 Jan 2021 04:47:22 -0800 (PST)
MIME-Version: 1.0
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
 <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
In-Reply-To: <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 Jan 2021 13:47:11 +0100
X-Gmail-Original-Message-ID: <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
Message-ID: <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
Subject: Re: Wireguard not available for CentOS Stream
To: Joe Doss <joe@solidadmin.com>
Cc: Silvan Nagl <mail@53c70r.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Neal Gompa <ngompa13@gmail.com>
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

On Mon, Jan 4, 2021 at 2:24 AM Joe Doss <joe@solidadmin.com> wrote:
>
> https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/
>
> The official DKMS install method for CentOS has a Stream repo enabled. It
> should work fine. Let us know if you have any issues.

It's actually presently broken. I've fixed it in the master branch with:
https://git.zx2c4.com/wireguard-linux-compat/commit/?id=f7f55464a156e1181fa76d9c7e2fc0d495f2357e

But Red Hat still has not fixed other bugs that will enable our CI to
continue, and I won't release for RHEL alone until the CI is green.
You can cherry pick that into your dkms package if you need. I wrote
Red Hat a patch and sent it, but there's been no updated kernel yet.

More generally, I'm on the fence about how much I actually want to
support CentOS Stream. CentOS non-Stream is annoying, because it's
developed behind closed doors and is extremely slow to fix things, but
at least the changes are gradual and it's easy to keep up with, by
virtue of rarely changing. In contrast, CentOS Stream is fast moving,
and extremely unstable, with builds frequently breaking. This would be
fine and I would prefer it, since it means we can in theory get things
fixed reasonably fast, but actually, Stream is still developed behind
closed doors, with no visibility about what's going on, no
communication from RH on when fixes are coming out, no regular or
reliable release schedule, no releases for months sometimes, and just
a bugzilla blackbox that forces all reports to be private/secret. So,
unstable+secretive development makes developing for CentOS Stream
nearly as fun as developing for macOS, which is to say, not very fun.

Anyway, as soon as they drop a new kernel and the CI is green again,
I'll release. Or they ignored my patch and the CI will still be red.
We'll see!
