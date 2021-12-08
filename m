Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9D2C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Dec 2021 15:02:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a4064929;
	Wed, 8 Dec 2021 14:56:32 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id cc3f29cd
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Dec 2021 14:56:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EBF15B82113
 for <wireguard@lists.zx2c4.com>; Wed,  8 Dec 2021 14:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2E4C341C7
 for <wireguard@lists.zx2c4.com>; Wed,  8 Dec 2021 14:56:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pras4VIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1638975387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iN8sHAb/TvdmMbQKpeGsIHCL/uURq6teNfTx8/hOUyQ=;
 b=pras4VIokB4mIBL0gjPS9+zbOOvubaNWySOoEGSuWapBdpAFiyAp4KJDEqprapB1qA1eZv
 r92Jndj2SQjwATLHPenNv6oDsutNGDSkSmliEDqYRggVqKbZoUkzS1uzYPKVnbNz+zOLXj
 t6AH59MW2XCej2xwlGFZ0MNqv4rr0ys=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eba3829d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Dec 2021 14:56:27 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id j2so6509938ybg.9
 for <wireguard@lists.zx2c4.com>; Wed, 08 Dec 2021 06:56:27 -0800 (PST)
X-Gm-Message-State: AOAM530JOx4HNvdH3ZYA0yRsNbNTwCU/yKQ8e/nUWIFwVmVfvRVOWz58
 rC0vupReq2GFYt0HKQ3d33O+sHIyoEqQ7WLXtxs=
X-Google-Smtp-Source: ABdhPJzhQ7IOvDqOl3QdbPVwHxRktB9//7VwYb3T3tL3PKQhRhDQ+ubbjEzoyaw3/5TVP2efrt5DO6QYSB3UwYERw2Y=
X-Received: by 2002:a25:9781:: with SMTP id i1mr59150806ybo.638.1638975386367; 
 Wed, 08 Dec 2021 06:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
 <c772d6c2-dac7-8c11-7c41-aaa6435a0bd6@grsecurity.net>
 <CAHmME9oyopU8euSuVy7su91fia6xG5V+9i+QodCBdTGdR_rD5Q@mail.gmail.com>
 <3a2d41dc-effb-158c-4a52-d7eb282ecb7e@grsecurity.net>
 <CAHmME9r4gspVnZGhgHhB1nR6FvOaryLoZvAJwpRU=-=rrbdoqQ@mail.gmail.com>
 <5bcdecdb-fbc0-4714-895d-1b1e6a87287a@grsecurity.net>
 <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
 <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <CAHmME9qhZZWf2SNFGWJepzuLXZx1o+AEa9-QunWupxBE8sk2mA@mail.gmail.com>
 <490048f6-0e1b-f058-753c-fdc1892b9167@grsecurity.net>
In-Reply-To: <490048f6-0e1b-f058-753c-fdc1892b9167@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Dec 2021 15:56:15 +0100
X-Gmail-Original-Message-ID: <CAHmME9rrpQRFKuF37h6PJBU736kNfKUjAd7cLQ4WouYFWBnjwA@mail.gmail.com>
Message-ID: <CAHmME9rrpQRFKuF37h6PJBU736kNfKUjAd7cLQ4WouYFWBnjwA@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Mathias Krause <minipli@grsecurity.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon, Dec 6, 2021 at 9:54 PM Mathias Krause <minipli@grsecurity.net> wrote:
>
> Hi Jason,
>
> Am 06.12.21 um 20:28 schrieb Jason A. Donenfeld:
> > On Mon, Dec 6, 2021 at 7:55 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >> Nice detective work! I just loaded this up on the CI, so we'll see if
> >> this does work across the board.
> >
> > Looks like https://git.zx2c4.com/wireguard-linux-compat/commit/?id=42c931dbccf9570f10a84e282daf79f385d51623
> > is all green on https://www.wireguard.com/build-status/ in the
> > wireguard-linux-compat category. Let me know if that commit looks okay
> > to you or if you want to adjust something about it. After that, I'll
> > cut a new compat snapshot release.
>
> ah, you modified the original commit of mine. Yeah, that works too.
> However, I'd add the following to the commit log to account for the
> output to input operand move:
>
> """
> Also make 'out' an input-only operand as it is only used as such. This
> not only allows gcc to optimize its usage further, but also works around
> older gcc versions, apparently failing to handle multiple alternatives
> correctly, as in failing to initialize the 'out' operand with its input
> value.
> """
>

Sure, will do.

Jason
