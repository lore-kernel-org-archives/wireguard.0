Return-Path: <SRS0=di/l=VB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4BAC06513
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Jul 2019 09:45:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0D621852
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Jul 2019 09:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Tssq9hNe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A0D621852
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e90e2a7;
	Thu, 4 Jul 2019 09:45:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65d9ac19
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jul 2019 09:45:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d67e412a
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jul 2019 09:45:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 411de3cb
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jul 2019 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=A9GqGLDu5rkMyJCL2TxmpkB/cYc=; b=Tssq9h
 Ne3Twkteg0sirZ+EArrI+Wq2Ft98KIvGpgOtev4UIXgzfP7QvxFjX8nm5xeHbyoJ
 BYUo3d0JMrXXnPi69o6aSftWMAAp5cFKg+Se/51Y7VI6W5vK15zdDBQ+IOIfXjQ7
 3aAmC3thsbvmnw7OTR9TpsxvxWAdYODrdY1u3ewTdj8hbKQMGGJuihrjoGmf6EdC
 8A6OE1OU8T7J65hNwe4GFRa45okZZ1t0dXQa1VuKduXtfmeJE8ntgHkybOpJ4QYP
 AyvlNauv0jUse6kn2Ybs3RkmlqvXNrEX+HesRSs4/8m1wR3ns/je7QSG5SKnyOl9
 9AZ+B9EoNhlzjG/w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c8930c43
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jul 2019 09:10:16 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id d17so5396106oth.5
 for <wireguard@lists.zx2c4.com>; Thu, 04 Jul 2019 02:45:19 -0700 (PDT)
X-Gm-Message-State: APjAAAWiqJUOllRLopYgDPXV+YiQuvQQnl7JB3qhtcsReQeKuq1/9/Ms
 hUkqQZLplLOGozq/brrZ3cDHLyMSiAijpw19T2c=
X-Google-Smtp-Source: APXvYqxYd/3s3Zq8hgse27+0qdAk//oWmztyHVfD2fJVqnqQxKtgls+CKthYtGgmFcuCqDQobvppdf/zYHrCXgjFJdo=
X-Received: by 2002:a9d:67d5:: with SMTP id c21mr33612453otn.243.1562233518798; 
 Thu, 04 Jul 2019 02:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <59eba07cc65097ac@frisell.zx2c4.com>
 <a54fa617-96a4-8b3b-2c34-3046c61c82a9@kent-dobias.com>
 <8d85242a-3162-7ddb-c1b5-14fb7884cf5f@kent-dobias.com>
In-Reply-To: <8d85242a-3162-7ddb-c1b5-14fb7884cf5f@kent-dobias.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 Jul 2019 11:45:07 +0200
X-Gmail-Original-Message-ID: <CAHmME9rkfa6-BDK_QM537+vD0rdw3djF9qc0toeSZY0wjMmb4A@mail.gmail.com>
Message-ID: <CAHmME9rkfa6-BDK_QM537+vD0rdw3djF9qc0toeSZY0wjMmb4A@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20190702` Available
To: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
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

On Wed, Jul 3, 2019 at 6:55 PM Jaron Kent-Dobias
<jaron-wg@kent-dobias.com> wrote:
>
> On 7/3/19 12:42 PM, Jaron Kent-Dobias wrote:
> > The kernel source is here [2].
> >
> > [...]
> >
> > [2] https://github.com/boulzordev/android_kernel_motorola_msm8937
>
> Sorry, wrong kernel, it's this one:
> https://github.com/boulzordev/android_kernel_motorola_msm8953

Try running `rm net/wireguard/.check` and trying again.

https://git.zx2c4.com/WireGuard/commit/?id=c31f8664cff475b8f4160506e582fc423c71f381

Something something cthulhu something.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
