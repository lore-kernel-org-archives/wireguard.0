Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161CEC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 16:55:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e53e18ad;
	Mon, 13 Dec 2021 16:53:43 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9fe721ff
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 16:53:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D1A2B811D6
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 16:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20348C34605
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 16:53:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CDUdk28k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1639414417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8AK4XtVZbsFw4aq87e9h6+03lp/Makbx12SV+cRs/vQ=;
 b=CDUdk28kEJxlrJGNKff1rsAMQXX/qtuOy+2Cc3Wyr19g6kPSdckwbC1eaMMjhQywMtqKKY
 3CIspdoZjIV0RQQqxmXCJ1vS36Jh0cn9HGG2PB2lDaDndmWL7gMkbYs02RcYKzyW4yDEgs
 dskqH5F//RDYjHdyS3VH4xuXGGr2rsk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 76c077dd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 16:53:37 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id f9so39801964ybq.10
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 08:53:37 -0800 (PST)
X-Gm-Message-State: AOAM531Cy1ei8vqTW1LhppVcL/F6mum0n637RIvqJA/Aw9S5mZmIvzFU
 ci7tx0PJ0MjOAe8KtBmHY0KPrSuxlDEB4UaBdK0=
X-Google-Smtp-Source: ABdhPJyHNgzC+oOMLbADjEOEc3hSBXYJUTtjS/OleKSxQav9xFe6dM7uXdt4R6VMYui21g9Q6U4GL1nhGxOWh+EHTUg=
X-Received: by 2002:a25:1e83:: with SMTP id e125mr33180605ybe.32.1639414416938; 
 Mon, 13 Dec 2021 08:53:36 -0800 (PST)
MIME-Version: 1.0
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
 <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
 <3a1be638-4ddd-44c0-87aa-56cd26f4f396@grsecurity.net>
 <2026222873.1815432.1639405220767.JavaMail.zimbra@inria.fr>
 <fa249625-2698-3890-7e39-9273072810b9@grsecurity.net>
 <CAHmME9pC=eVFq-4eiU6iFVGOqZfr7RgniAP7H5YGBXDqc7W9jg@mail.gmail.com>
 <ffb81284-53e4-dc94-75ec-d31b6a79f269@grsecurity.net>
 <CAHmME9oh4Zx01E-+5S3Ds6mj6tVhJj81sTnSreDAujaFSX1u_Q@mail.gmail.com>
 <d52c29d2-3530-e2e9-7096-77da1eb21078@grsecurity.net>
In-Reply-To: <d52c29d2-3530-e2e9-7096-77da1eb21078@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Dec 2021 17:53:26 +0100
X-Gmail-Original-Message-ID: <CAHmME9qhcdAZSzcWQ3fSFix+_66jKkdvPvs-JeCQevJYde_HXA@mail.gmail.com>
Message-ID: <CAHmME9qhcdAZSzcWQ3fSFix+_66jKkdvPvs-JeCQevJYde_HXA@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Mathias Krause <minipli@grsecurity.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Aymeric Fromherz <aymeric.fromherz@inria.fr>, 
 Karthik Bhargavan <karthikeyan.bhargavan@inria.fr>
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

On Mon, Dec 13, 2021 at 5:39 PM Mathias Krause <minipli@grsecurity.net> wrote:
>
> Am 13.12.21 um 17:33 schrieb Jason A. Donenfeld:
> >> root@box:~# ./run.sh
> >> [+] Setting no-turbo to status 1
> >> [+] Setting non-boot CPUs to status 0
> >> [+] Inserting module to run tests
> >> insmod: ERROR: could not insert module kbench9000.ko: Unknown symbol in
> >> module
> >> [+] Gathering results
> >>                  ever64: 115100 cycles per call
> >>            ever64_out_r: 115080 cycles per call
> >>           ever64_out_rm: 113957 cycles per call
> >> [+] Setting non-boot CPUs to status 1
> >> [+] Setting no-turbo to status 0
> >>
> >> Slightly faster.
> >
> > Huh, that's actually a pretty nice speedup for just changing register
> > allocation... What CPU is this?
>
> It's an "Intel(R) Core(TM) i9-9900 CPU @ 3.10GHz" But shouldn't matter
> all that much, as the inline ASM is integer ops only.

Yet it does. Here are results on a tigerlake, i7-11850H:

[+] Setting no-turbo to status 1
[+] Setting non-boot CPUs to status 0
[+] Inserting module to run tests
[+] Gathering results
    donna64: 141081 cycles per call
     hacl64: 135645 cycles per call
     fiat64: 132547 cycles per call
    sandy2x: 126933 cycles per call
precomp_bmi2: 120276 cycles per call
precomp_adx: 113578 cycles per call
     ever64: 106943 cycles per call
    ever64r: 105924 cycles per call
   ever64rm: 108139 cycles per call
     fiat32: 297854 cycles per call
    donna32: 467667 cycles per call
  tweetnacl: 1195385 cycles per call
[+] Setting non-boot CPUs to status 1
[+] Setting no-turbo to status 0

https://xn--4db.cc/c4B65RUy/diff

Looks like Tigerlake is able to make use of free stack accesses thanks
to the new "fast forwarding" feature.
