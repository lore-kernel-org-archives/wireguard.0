Return-Path: <SRS0=t+97=OC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCEDC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 Sep 2021 21:09:35 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC48A61026
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 Sep 2021 21:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC48A61026
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be934835;
	Sun, 12 Sep 2021 21:07:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 80c688c3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Sep 2021 21:07:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AEAF6101A
 for <wireguard@lists.zx2c4.com>; Sun, 12 Sep 2021 21:07:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="EbrbIP2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1631480828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=13WnX1VvZPW4E8fjl8gsQZL6+O5ByWry7MdN+ugn8jc=;
 b=EbrbIP2L71adbWX2pvQ/LPbt5USPnuQmMy/QA/t5Jn/fmUJMoz4DAiDmmQLi2ACNBEwwWN
 acKdA0q66fsQNrOesOrQMZj/6RU/EfO1iGrBZBqA411Derw+SLKAN60nsKZ9tltgJThCBu
 +twXmPVgT7lWAgkq1YBoGiPt48K0iR0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c6e00aa5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Sep 2021 21:07:08 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id c6so16214214ybm.10
 for <wireguard@lists.zx2c4.com>; Sun, 12 Sep 2021 14:07:07 -0700 (PDT)
X-Gm-Message-State: AOAM5332UuLY5zGqlqzcaP+x0rsdZdymncdphd4p9+DZeUy0B0ioD8rF
 93U27gqxKttFvM60675w/gptLbieW73xdzbp4mw=
X-Google-Smtp-Source: ABdhPJzK2Gh5EFhF0vm9lTZQvtjHypnde36pqnMbIEkppuWMh4VPFx/NYKH1+N1DH2nQxzCvLduHmmpfSVy9IqYw4oY=
X-Received: by 2002:a25:61c8:: with SMTP id
 v191mr10889720ybb.472.1631480827145; 
 Sun, 12 Sep 2021 14:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <YQgrCfqIL2SWfF6G@zx2c4.com>
In-Reply-To: <YQgrCfqIL2SWfF6G@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 12 Sep 2021 23:06:56 +0200
X-Gmail-Original-Message-ID: <CAHmME9ruyCFABTB1S1RYC5CSCBWPr2eqCZDCszDX4NZNR-vi9g@mail.gmail.com>
Message-ID: <CAHmME9ruyCFABTB1S1RYC5CSCBWPr2eqCZDCszDX4NZNR-vi9g@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuardNT, a high-performance WireGuard
 implementation for the Windows kernel
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi everyone,

As described in the original announcement:

> There will be three phases of the 0.4.z series:
>
>   Phase 1) WireGuardNT is hidden behind the "ExperimentalKernelDriver"
>            registry knob. If you don't manually tinker around to enable it,
>            the client will continue to use wireguard-go/Wintun like before.
>
>   Phase 2) WireGuardNT is enabled by default and is no longer hidden.
>            However, in case there are late-stage problems that cause
>            downtime for existing infrastructure, there'll be a new hidden
>            knob called "UseUserspaceImplementation" that goes back to
>            using wireguard-go/Wintun like before.
>
>   Phase 3) WireGuardNT is enabled, and wireguard-go/Wintun is removed from
>            the client.

After quite a bit of testing, the bug reports have dried up. We've
gone through several subphases of phase 1, from being masked behind a
registry knob, to introducing a checkbox, to opting in users part of
the Windows Insider program. There's been a pretty heavy amount of
testing, from what I can gather, and I think things have shaped up
nicely.

Finally, tomorrow with the release of v0.4.8, we will move onto phase
2. That means that WireGuardNT will be on by default. If something
goes wrong, you will still be able to disable it and revert to the
older wireguard-go/Wintun using the "UseUserspaceImplementation"
switch described on this page (as of September 2021; will be removed
in the future):

    https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md

But note that if you /do/ revert to using wireguard-go/Wintun, you
*must* absolutely email team@wireguard.com with details as to why
you've done so, so that if there is a bug, we can fix it. If you do
not do this, it is possible that your bug will never be fixed, and in
a month or so, we'll move onto phase 3, and you will lose the ability
to revert to using wireguard-go/Wintun. Do not rely on other people to
report your bug for you; Windows is weird and diverse and there are no
guarantees that somebody else will run into your same problem. So
please: if you enable "UseUserspaceImplementation", send an email
saying why.

Depending on how Monday morning goes, this should be released in
around 12 hours from now. Enjoy!

Regards,
Jason
