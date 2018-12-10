Return-Path: <SRS0=tdjr=OT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1316DC07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 02:06:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82FC92081C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 02:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="wWdyi1lt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82FC92081C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc6d21dd;
	Mon, 10 Dec 2018 01:57:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76ceb7f7
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 01:57:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46246ef5
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 01:57:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76b36132
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 01:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=d7UHqoO9GkU4tYgE99peIXgBX38=; b=wWdyi1
 ltnhd8FTcKms8hnRt+KpkndPMrjpotuabRK1YxfdWWouswo6/EFkfVEAPtxcCENS
 hlKK2E6W/Lwvjl0Yg4spezMcTdPRzGDvAWo01Y3IsV3l17QtXoI42QNroo6Mna1i
 prFnrsCc4UcDVVpoe45JUYFkQAmtfvwERteoyHKqP4RR6hyA1DkvAuZM32aNJ4o5
 1EpcLNT9V8/cekILdzhzwxFH1MUVZi30qibc5XddJBIfCWrvOdQXYwgTDjE1YZZi
 ugbYT0v0dpase7RopdT6QEqdUmJFpakVsusAfdziZq2vU5xLhXtCjbawRP6/M+vn
 i+qa5gg6rkUklh0g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3faa9e26
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 01:57:23 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id t5so9003019otk.1
 for <wireguard@lists.zx2c4.com>; Sun, 09 Dec 2018 18:06:00 -0800 (PST)
X-Gm-Message-State: AA+aEWYwgSeKALJRhCffrM5nC4UogBcTWokI7BeoQMi+LPvn6XlNwW5+
 vEFr5YbgspSvkiJyzKiTBuwa8BGJ6sw/Zbiqe9g=
X-Google-Smtp-Source: AFSGD/WBYnIv8E2v7M3H6V0WBezmB31e9BdrcHr+HbsJa+IaNFVW2MynwRc9NWrgO5HNQFFQSQZQz0KJx1WHzy7xoII=
X-Received: by 2002:a9d:837:: with SMTP id 52mr7063690oty.143.1544407560177;
 Sun, 09 Dec 2018 18:06:00 -0800 (PST)
MIME-Version: 1.0
References: <c430b4be-fc84-40c3-c9d2-5d5833d8ae89@attglobal.net>
 <6a703cdc-13e4-4881-7bb5-072b0f576a3e@xand.uk>
 <CAHmME9qw52LXqgJj=yanmyB6Yzm1Q_cYbe50ZYLNT0b5dzbu+g@mail.gmail.com>
 <1b935975-d810-fe67-a7b3-eb89e4c625c3@sholland.org>
In-Reply-To: <1b935975-d810-fe67-a7b3-eb89e4c625c3@sholland.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 Dec 2018 03:05:48 +0100
X-Gmail-Original-Message-ID: <CAHmME9rU2tHNHgo1k49GAot4_FKC+=Qany7K-KfCH3SjJO2awg@mail.gmail.com>
Message-ID: <CAHmME9rU2tHNHgo1k49GAot4_FKC+=Qany7K-KfCH3SjJO2awg@mail.gmail.com>
Subject: Re: Should wg-quick with SaveConfig accumulate IPv6 link-local
 addresses
To: Samuel Holland <samuel@sholland.org>
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

On Mon, Dec 10, 2018 at 3:04 AM Samuel Holland <samuel@sholland.org> wrote:
>
> On 12/09/18 19:15, Jason A. Donenfeld wrote:
> > This is mostly just a CentOS issue. On older kernels, we don't
> > successfully disable LLv6:
> > https://git.zx2c4.com/WireGuard/tree/src/compat/compat.h#n583
> >
> > There's probably a way to backport that tweak to before 3.17, but I
> > haven't spent time on it. Feel free to send a patch, and if it's clean
> > and fits entirely into compat.h, I'll gladly apply it.
>
> You can also work around this in wg-quick by changing up_if() to
>
>   cmd ip link set "$INTERFACE" up addrgenmode none

Does that work in kernels < 3.17?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
