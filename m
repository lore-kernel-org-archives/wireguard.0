Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A14C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 16:29:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2df321a0;
	Mon, 13 Dec 2021 16:29:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a28d8084
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 16:29:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8517B6118D
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 16:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94EFC34602
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 16:29:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FWONa8pH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1639412971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i56dZSggDJsz3Hb7aTPT6mbxKm82ug3eIZelrUlPDTk=;
 b=FWONa8pHj8y8/uR5BybiIPrxL2neD3a//bvol4tlIceAFTxwsEIKTUSt1r/3gtjOBDMedt
 Ml/90byUZiue9EUiPIz5o/43Xq7YqTbw1iVuOYJCk/pehekcIMpZkYQ+n41nWYHpKdxt59
 sEzrbD0WqwAk/ZqzFf1qWOuPey9KwpA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4c2fd696
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 16:29:30 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id f9so39625164ybq.10
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 08:29:30 -0800 (PST)
X-Gm-Message-State: AOAM530sotPRg8K1iqWn2xZiqx6qUxQv/H0GQeEUO8zgs6/pTCjN3gnH
 p+P5VrERWqVqhoeBOdvvLCAasuv4ckld6wZrzdc=
X-Google-Smtp-Source: ABdhPJz/2vmp8J9aAOWmpBLR7gKDnY9zx8OGZLogMc4f4K4We46FTrP9YwHxBRcYDqPOrW5cSWqdB/MusjXbiz1g6RI=
X-Received: by 2002:a25:ab86:: with SMTP id v6mr34378373ybi.457.1639412970153; 
 Mon, 13 Dec 2021 08:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
 <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
 <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
 <CAHmME9ppTs-jmmV9uV+C0jbtQC5a5RWO5zJB5_-dRD3BMjDZZA@mail.gmail.com>
 <d1921390-7fcb-a627-11ea-ce580214db63@grsecurity.net>
 <CAHmME9r8udYyD+R9PPyN15G4QKsm45ZH_UbYXAjXXDwuvvob=g@mail.gmail.com>
In-Reply-To: <CAHmME9r8udYyD+R9PPyN15G4QKsm45ZH_UbYXAjXXDwuvvob=g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Dec 2021 17:29:19 +0100
X-Gmail-Original-Message-ID: <CAHmME9qJottk_hHxjPKF=5Ls2Ux5=9YF6pdy1pwbS3L4UKZbcw@mail.gmail.com>
Message-ID: <CAHmME9qJottk_hHxjPKF=5Ls2Ux5=9YF6pdy1pwbS3L4UKZbcw@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Mathias Krause <minipli@grsecurity.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Aymeric Fromherz <aymeric.fromherz@inria.fr>
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

On Mon, Dec 13, 2021 at 12:36 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Mathias,
>
> On Mon, Dec 13, 2021 at 8:54 AM Mathias Krause <minipli@grsecurity.net> wrote:
> > So, after importing Aymeric's changes into wireguard-linux-compat, the
> > alternatives change is still needed. I can help you create one, if you
> > want me to (we have that change in grsec anyway, just used named asm
> > operands here, as the %0/%1/%2/... was rather confusing and hard to follow).
>
> Sure, I'll take a patch for that. Let's wait until Aymeric
> incorporates your suggestion on the out param, merges the PR, and then
> I'll reimport that to wireguard-linux-compat, and you can send a
> patch.

Actually, wasn't so bad, did it myself: https://w-g.pw/l/LjOY
Hopefully nothing to butchered in the process.
