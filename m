Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82A0C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 03:14:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E27F561159
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 03:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E27F561159
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c6ec101;
	Wed, 22 Sep 2021 03:14:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b59b5fc3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 03:14:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1606C61159
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 03:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FSaxfqkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632280451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VRGUgmSfRJ407ZyZwrdCk2g8aVX8fOgM+2XMcQJwArA=;
 b=FSaxfqkXmPsKsF+4uUcEuyKnVvltv6eFGOmnzK0CEflZtlL+CztLenTX2UzhQt4zl4DqQY
 4r9hkbiWarbsjxAB+0pSsSBUo6gmwm4bBW33YR9yXzp1gIi4mD7/1kVZMnSCc1k7SsUy/U
 Erl/LEYk20JUhsMVfw2wa0SygvLu9eU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f39f5ab6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 03:14:11 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id a10so4494954qka.12
 for <wireguard@lists.zx2c4.com>; Tue, 21 Sep 2021 20:14:11 -0700 (PDT)
X-Gm-Message-State: AOAM533dOLzJdL9PkjFp2f4XUXVDnqJ/gzNNfoBjgtSwLzyhFoI7TAyM
 QfSwjqaab3zxrBzXMki+5/9WaYcNypRxrfsGTDs=
X-Google-Smtp-Source: ABdhPJwWXOpWSIwuwWhchNkTRwIBovOiQqjjgaRblOBwKVfCH4f0jllyTmMcyXOMD+1+H1QUok4i0aL59dL3QBSH3t4=
X-Received: by 2002:a25:d442:: with SMTP id m63mr17610230ybf.79.1632280451003; 
 Tue, 21 Sep 2021 20:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
In-Reply-To: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Sep 2021 21:14:00 -0600
X-Gmail-Original-Message-ID: <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
Message-ID: <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: Eddie <stunnel@attglobal.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Roopesh Chander S <roop@roopc.net>
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

Hi Eddie,

On Tue, Sep 21, 2021 at 6:26 PM Eddie <stunnel@attglobal.net> wrote:
>
> Title says it all.  On both iPhone and iPad.
>
> The configuration names still show, with the slider, but trying to
> activate gives:  Activation failure.  Unable to retrieve tunnel
> information from the saved configuration.
>
> Selecting a tunnel name doesn't show any configuration.

Thanks for the report. I had seen murmurs of this on IRC and Reddit
too. This post [1] mentions that they just get deleted... I'm
decrustifying my Apple setup, updating phones and macOS and Xcode and
will hopefully have a patch out soon enough, and then hopefully not
too rough of a time with the dreaded app store review process. I'm
also CCing Roopesh who might be able to whip something up faster than
me.

Jason

[1] https://www.reddit.com/r/WireGuard/comments/prhb3k/ios_15_released_on_monday/
