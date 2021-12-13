Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2263C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 16:34:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f3c4445e;
	Mon, 13 Dec 2021 16:34:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 19bdcd3b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 16:34:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0448661186
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 16:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353AEC34603
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 16:34:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Frt+OgLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1639413249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qAgNlrjLQmOwwCpfCJYofbOvWqynv5G4iyr5c7Xky3c=;
 b=Frt+OgLvmz9PqFt9m+PvRn2dfpapEJcSicFQvvtQ8q7ZmjDTslC5GSWouJ93cit0DbpRFX
 fDG/hNKARrd4W7aLIn23HWNFUkiUzz6nCf4RN1VPjdt3c2rkwE0BTae+Qy/BpgWq995XKC
 GbwwFwNOoiqA0GdGFpfNgYyxhAeszZE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 27022bc0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 16:34:09 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id f186so39658657ybg.2
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 08:34:09 -0800 (PST)
X-Gm-Message-State: AOAM533taX/GxJSjW5Vh+Z7FPXoUz8ku7dMSB1N2OZvkQTgDyo4mJWyR
 39sE7+HMSTWRxr7jnOQqS2iuc0kMZZgr/vR1RF0=
X-Google-Smtp-Source: ABdhPJwVMw2rGZWWkCxbalMZu+CAkTsKIdJeZ7tl8ZWQUYGw4bqMhcYGC5F0VBAevzba/SyGw8okk6jWsNg+Qafzafs=
X-Received: by 2002:a25:1e83:: with SMTP id e125mr33074525ybe.32.1639413248028; 
 Mon, 13 Dec 2021 08:34:08 -0800 (PST)
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
In-Reply-To: <ffb81284-53e4-dc94-75ec-d31b6a79f269@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Dec 2021 17:33:57 +0100
X-Gmail-Original-Message-ID: <CAHmME9oh4Zx01E-+5S3Ds6mj6tVhJj81sTnSreDAujaFSX1u_Q@mail.gmail.com>
Message-ID: <CAHmME9oh4Zx01E-+5S3Ds6mj6tVhJj81sTnSreDAujaFSX1u_Q@mail.gmail.com>
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

Hi Mathias,

On Mon, Dec 13, 2021 at 5:32 PM Mathias Krause <minipli@grsecurity.net> wrote:
>
> Am 13.12.21 um 15:37 schrieb Jason A. Donenfeld:
> > On Mon, Dec 13, 2021 at 3:33 PM Mathias Krause <minipli@grsecurity.net> wrote:
> >> yeah, don't worry. We can keep this change downstream in grsec. Dunno if
> >> Jason wants to take it as well, his call. It was just a side observation
> >> which came out of our need to read and understand the code to provide a
> >> workaround for the gcc bug we were hitting.
> >
> > I suppose I can load it up in kbench9000 to see if it makes a
> > difference. If it doesn't matter much, I'd prefer sticking with the
> > formally verified stuff. But if there is a nice speedup, then I guess
> > we can revisit more handwavy "obviously this is the same thing"
> > arguments.
>
> Had to hack main.c and run.sh a little, but here are some numbers:
>
> root@box:~# ./run.sh
> [+] Setting no-turbo to status 1
> [+] Setting non-boot CPUs to status 0
> [+] Inserting module to run tests
> insmod: ERROR: could not insert module kbench9000.ko: Unknown symbol in
> module
> [+] Gathering results
>                  ever64: 115100 cycles per call
>            ever64_out_r: 115080 cycles per call
>           ever64_out_rm: 113957 cycles per call
> [+] Setting non-boot CPUs to status 1
> [+] Setting no-turbo to status 0
>
> Slightly faster.

Huh, that's actually a pretty nice speedup for just changing register
allocation... What CPU is this?

Jason
