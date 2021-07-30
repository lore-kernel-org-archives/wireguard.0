Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DB3C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:22:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB83360EBD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB83360EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 967e7422;
	Sun, 8 Aug 2021 23:02:02 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a4a9c586
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Jul 2021 03:27:57 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id e5so10298358ljp.6
 for <wireguard@lists.zx2c4.com>; Thu, 29 Jul 2021 20:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AXbuhRXzh1/4SMjVZpznHW68CseQ+KzBa3uVvG8gIlo=;
 b=cvjYxL8c01oOKkEFd4dk9Zco6ZyHhuJtDf5PlsNijrOOmwxcyEjTQxnzu/JzEzQqPF
 tnVBKFl8xzgiHysYiRv3OKCWAmuj4B9D/aQuHGL7AeXRoBzu/6oI9x3gehvoywy37p8t
 5FbNmS1MOxuLJFsEn43/srLzC8/LJFEZWfa0KVsXylx9l6RnzaFOA8bGDRyiDMuhLH+8
 cPfB8O4vJF0D3GvSeePUgoef7LD5sZLN5sfmNGp9bK0k9TvftRc2ZPn+VpjFDOofJ9rr
 2Xo/llhnci9vQrt9CKm1dlFUMhZBnkpIM1xPTWvzUg9jPKL7OTs1NJWa2vZ58WDp8mU7
 4+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AXbuhRXzh1/4SMjVZpznHW68CseQ+KzBa3uVvG8gIlo=;
 b=dVH+j6UadGrDu6v/Q5/pgOGqtwe4yxEeTZ72EgdVASxGfKp+JoM4+4rEF3CuHR3N3+
 o4ai0JyhYj0HK8CUx0Zq1Ix5sYOfGiaMxnmfgDgq54e7E8QgOfhj8Z4T8eYtC1305mFk
 TFdivDBldosD3V7ydWR2R3eeVa4urV3ttba+yDWvzYm0SFHMh0XVh14MV7+qKm1Loh9G
 2DjoKj2AI+3DKtwAAOAAFzRX6aqViI47Uyhs6189g7AKxu+1rpaiNdVE1OQ/G/Yoi2w0
 RtU7FsFFb7X8wSucQIoPP9NjJ1EfEWi3idwHNKbSW5S3+9OuujSaTIfoDQuyB25eI1lB
 3TCQ==
X-Gm-Message-State: AOAM533eZW/imdmkL72gOjaOlelZW5wsRRs08HZaXU48HNUxvb6+U/fA
 I09ULUYSfW3b5xPv3gjMWiH2rK1AsIvmyukwV6k=
X-Google-Smtp-Source: ABdhPJyxiMSEoBhGCpI7UAUFcBoycSVJa5+w4DqWmQaS5gSaypOVUfctQb/4kkck+y91i5sCox8v03bLl2yAuC5AIx0=
X-Received: by 2002:a05:651c:896:: with SMTP id
 d22mr291590ljq.242.1627615676804; 
 Thu, 29 Jul 2021 20:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <e4fef9da-ee7f-d1db-036e-b294785d9ee8@spam-free.eu>
In-Reply-To: <e4fef9da-ee7f-d1db-036e-b294785d9ee8@spam-free.eu>
From: Tom Yan <tom.ty89@gmail.com>
Date: Fri, 30 Jul 2021 11:27:45 +0800
Message-ID: <CAGnHSEmp5Dnk2y78Rt=9OdrkWjX+0kXgaCu=eQpzYzfyV-SwbA@mail.gmail.com>
Subject: Re: wg-quick with default route fails on nfs root filesystem
To: Chris <wireguard@spam-free.eu>, Jason@zx2c4.com
Cc: wireguard <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 08 Aug 2021 23:02:00 +0000
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

Hi Chris,

So I did a test and took a look at the log:
...
wg-quick[2003]: [#] ip -4 route add 0.0.0.0/0 dev aliyun table 51820
wg-quick[2003]: [#] ip -4 rule add not fwmark 51820 table 51820
wg-quick[2003]: [#] ip -4 rule add table main suppress_prefixlength 0
...

What if wg-quick adds the route after adding both rules? AFAIK, a rule
will be a no-op if the table it looks up is empty.

Regards,
Tom

On Wed, 14 Jul 2021 at 18:00, Chris <wireguard@spam-free.eu> wrote:
>
> When wg-quick detects a default route through the tunnel it does this through a
> new routing table with a default route.
> However not to destroy the existing non-default routes these will looked up and
> used first. This results in the follwing policy rule entries:
> (The priority numers may be different from system to system)
>
> 32764:    from all lookup main suppress_prefixlength 0
> 32765:    not from all fwmark 0xca6c lookup 51820
>
> It is very important of course, that the suppress_prefix rule comes first in the
> list, before
> the second rule introduces the new default route (preventig the wireguard
> traffic through it's own tunnel).
>
> The way to archive this is done by the following command sequence:
>
> ip -4 rule add not fwmark 51820 table 51820
> ip -4 rule add table main suppress_prefixlength 0
>
> The sequence of the commands is important as the latter command gets the higher
> priority (lower numer).
>
> BUT:
> In case your root filesystem needs the local network, the second command will
> not be reached as the
> first command (setting the new default route) kills the root filesystem and the
> system stalls!!!!!!
>
> One possible solution:
> Instead of adding the suppress_prefixlength 0 command secondly it must be first.
> The you must find the priority of that rule and the add the default route with
> the same priority.
> A rule with same priority will be added AFTER the other rules.
>
> Example:
> ip -4 rule add table main suppress_prefixlength 0
> PRIO=$(ip rule list from all|grep suppress_prefixlength|sed -e
> '{s/^\(.*\)\:.*/\1/;q}')
> ip -4 rule add not fwmark 51820 table 51820 priority $PRIO
>
> This will lead to the correct sequence:
> 32765:    from all lookup main suppress_prefixlength 0
> 32765:    not from all fwmark 0xca6c lookup 51820
> (Note the same priority number)
>
> There are probably better ways to cirumvent cutting off the root filesystem.
>
> Chris
>
