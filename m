Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DF5C43217
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 14:10:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7554595b;
	Mon, 13 Dec 2021 14:10:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id db1d0218
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 14:10:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34BF36104D
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 14:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC29C34602
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 14:10:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FlJ7xc3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1639404642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ra3leMCWJIXkuBA+2Qoi95GWpQaIyf8Tt/+L/CPIUio=;
 b=FlJ7xc3K+jU+MWwa6PHQhDY5cmr5Edn3LRVAqaKPsW4wPT866Wq9I/RA6uT548Uzqoo6Qs
 1TKL/cSClqy91Oflg3l0uPtVygbFt5JWAvhWcsDXARzK7UKrj0WpguUe5DOy0MOyagWwvU
 k7mQU4HrWxPy1XQLsERu1G9ZaZlUxDA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7857ced0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 14:10:42 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id v138so38617837ybb.8
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 06:10:42 -0800 (PST)
X-Gm-Message-State: AOAM530BFXIECgruAAEd1jZhq0dDZx3mK3IErNx6ysnSlifLjhOPnuQb
 sexLksNOyUr/lPR3ixzaCq7Vv0SjWcvK+CQ4QfM=
X-Google-Smtp-Source: ABdhPJwLsbgX++kWFF29A14s0mGMtiyylC3oPttxjXcxbnxjFlz8/KVmCM8fa1fcBMQYfTvBfdvPsF88hACXVaPtGBI=
X-Received: by 2002:a25:d393:: with SMTP id
 e141mr35974513ybf.255.1639404641623; 
 Mon, 13 Dec 2021 06:10:41 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rckipsdZYW+LA=x6wCMybdFFA+VqoogFXnR=kHYiCteg@mail.gmail.com>
 <CAHmME9qVyk-7xou1K=97xdrg4UAA3W8YO6q6jevWc6YY6aTxSg@mail.gmail.com>
In-Reply-To: <CAHmME9qVyk-7xou1K=97xdrg4UAA3W8YO6q6jevWc6YY6aTxSg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Dec 2021 15:10:30 +0100
X-Gmail-Original-Message-ID: <CAHmME9qVBWPxHEwBOJ7iJ90ONxGF7B7geMq3GT2YWEEf8Gq+cA@mail.gmail.com>
Message-ID: <CAHmME9qVBWPxHEwBOJ7iJ90ONxGF7B7geMq3GT2YWEEf8Gq+cA@mail.gmail.com>
Subject: Re: final call for Ubuntu 14.04 WireGuard support
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: unit193@ubuntu.com
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

On Wed, Oct 7, 2020 at 1:23 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> An update on this thread: with dwindling usage and the poor quality of
> Canonical's ESM offering, 14.04 support has been sunset and the PPA
> removed.
>
> All users should update to a newer distro.

Over a year later, the vestiges of support have now been removed from
the repo: https://w-g.pw/l/kup9

Regards,
Jason
