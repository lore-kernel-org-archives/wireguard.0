Return-Path: <SRS0=pGg3=E7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A90C56201
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 21:42:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B986206E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 21:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="aelb+j0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B986206E0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2ee002d;
	Wed, 25 Nov 2020 21:36:37 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a1c61826
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 21:36:34 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ca0e814
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 21:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=oZmO89wRkFMjMMacU5Y6pJJd/Gc=; b=aelb+j
 0TvrbEaWufq0h/6J5rktsXynXS1erUAdwgEPg6MB86LIekeW7EQbPOM3T5CN+3ko
 UfUm/dGe3fEhC2LJW2AifXv0bUDp3UN6A5BVYqqkDRG+yqrBIikkXGyTihkfnQkY
 cujy7lhCP0gHpWxjX4dH/86SC3Hb58fc9EHoWZqqA0WkTloG5vfrSPqyiTFKp3GQ
 +j2ploBrKcJ1vmYYgBFa2oc+cgIrQfuVJujhkKTVpmM9ENSsKI96veF37npIKqR+
 7hBqtvVWbr3gOQvtpsUYHmiXlcJNvQZJw5KuTlVdfsfn6qckTOmkbCxxpbruH29U
 4mAdk8a1QrbOCM0A==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7c817545
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 21:37:20 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id v92so1057431ybi.4
 for <wireguard@lists.zx2c4.com>; Wed, 25 Nov 2020 13:42:16 -0800 (PST)
X-Gm-Message-State: AOAM5336LDkzczFj0SQajL5Wqx3JjVpN3IxgG0OM25leG8Cjy6rwzZDm
 WDC17GqQl/7vAwb0OX3v0EAnCZJy9xoAAyrX79c=
X-Google-Smtp-Source: ABdhPJwXUT/xPtvJTNmok8ppnFMPQqr4EehrOWSqoWzMXOlw6gwtbwpx/uLBDDIEPiUSgG2bC58o6kjMFoHrQDPxD/0=
X-Received: by 2002:a25:481:: with SMTP id 123mr7327084ybe.123.1606340535470; 
 Wed, 25 Nov 2020 13:42:15 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
In-Reply-To: <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 25 Nov 2020 22:42:04 +0100
X-Gmail-Original-Message-ID: <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
Message-ID: <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: Clint Dovholuk <clint.dovholuk@netfoundry.io>
Cc: Riccardo Paolo Bestetti <pbl@bestov.io>,
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

On Wed, Nov 25, 2020 at 7:04 PM Clint Dovholuk
<clint.dovholuk@netfoundry.io> wrote:
>
> Out of curiosity - why not just use " S-1-5-4" Interactive - " A group that
> includes all users that have logged on interactively. Membership is
> controlled by the operating system."
>
> If the user logged on - let the turn the tunnel on/off?

I guess that's the same argument as, "why doesn't Microsoft let users
twiddle around with adapter settings and IP addresses if they're
interactive?" Apparently there was some imperative for having control
over this be more fine grained, so they provide the NCO group. Turning
on and off WireGuard tunnels seems akin to disabling and enabling
network adapters, in general, so linking the two seems coherent.

More concretely, some folks are deploying WireGuard in a much more
restricted setting, in which the end user has no control over when it
goes up or down; that's all decided by some remote service out of the
interactive user's purview. For some high sensitivity applications,
not letting interactive users disable WireGuard is desirable. For
other applications, it's the opposite. The NCO group seems to fit the
level of granularity we're after.
