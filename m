Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767A4C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:15:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 105C220644
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:15:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="14Q3nf9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 105C220644
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef6a1dd9;
	Fri, 6 Sep 2019 19:13:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ed18d55
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 19:13:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57077589
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 19:13:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1fe6e988
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 18:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=iKcNQ81cBfogH2hszFqP1I6zx0c=; b=14Q3nf
 9I9UR2g3sCcMhuqUTqsNBvXtELL1EXSXTNaDgiVQPcdpOlLp84XWI+Hol3vqa6TQ
 X4ji57dZR1xSsVKOj18Or4izfM43vm32r+RTL0Xp9v72C6BBFl3CeayNXcg8RjsJ
 Ro9rkBnDX7Zak9rf3ym2GQRYkiO0GqhG63PQqdVYiccAFdxO5jQD+mwp+/ovdUvU
 /E+GNVxdQvGTPMlKy60U42LrmnlkybN0U4GJrtwACXGRLDukCAIfvM8dhcUH7DlV
 odP8H0UvH3xvZR64DVgWE64ET9dTIRvrSczCJEori8atnBUB3YBxJPLrJDwTI3ka
 ar6d5y/DifqwwC9w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 924cf62f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 18:30:34 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id y39so6723049ota.7
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 12:13:56 -0700 (PDT)
X-Gm-Message-State: APjAAAVwwV8x+os4kaoKkvJoRA9brjd+OzMsq6R6v0fM/BVeyq3148co
 7Vn6+YRAKX02QOS/M3sFXcyKOf5rD6bR4O5QHEw=
X-Google-Smtp-Source: APXvYqwlNjQExZiz/v5yRpibe92Qqg/x4xWeuHWrar78LMbLz+ax+DaixFFsRM140AC5RaiyQwlHJj3zqIjWC3za0RI=
X-Received: by 2002:a9d:6748:: with SMTP id w8mr8377137otm.243.1567797235474; 
 Fri, 06 Sep 2019 12:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <CALJizUN=-NyTqegwwjez9X_OZtr_CLzjDDbVoCwkBLBPsortOA@mail.gmail.com>
In-Reply-To: <CALJizUN=-NyTqegwwjez9X_OZtr_CLzjDDbVoCwkBLBPsortOA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Sep 2019 13:13:44 -0600
X-Gmail-Original-Message-ID: <CAHmME9q00L7iQtJv97daukPrtj=_eRjCQbTqy4VZaoJhJ-FR0A@mail.gmail.com>
Message-ID: <CAHmME9q00L7iQtJv97daukPrtj=_eRjCQbTqy4VZaoJhJ-FR0A@mail.gmail.com>
Subject: Re: dkms build failure - Ubuntu 16.04 kernel 4.4.0-161-generic
To: Felix Tang <felix.gofaster@gmail.com>
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

Thanks for the report. Ubuntu's kernel team made an error in
backporting a patch from mainline. They're aware of this error, but
they're unable to rectify it for another 7 weeks, which clearly isn't
an acceptable amount of downtime for WireGuard servers. So yesterday
we made a new WireGuard release that works around this issue. Then,
this morning, Egbert, the maintainer of our Ubuntu package, published
a new Ubuntu package for our new release. So you should be all set by
running `apt update && apt upgrade`. Sorry for the hassle. I'm not too
happy about this situation myself, and I'm going to try to figure out
how the Ubuntu kernel people can make sure they don't break WireGuard
in the future with some sort of CI.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
