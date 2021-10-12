Return-Path: <SRS0=Z6z9=PA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02605C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Oct 2021 21:42:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3284560041
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Oct 2021 21:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3284560041
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02a06383;
	Tue, 12 Oct 2021 21:41:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1aa8e1b1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Oct 2021 21:41:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50928610A2
 for <wireguard@lists.zx2c4.com>; Tue, 12 Oct 2021 21:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="lUkAoRkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634074869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fHxx5oT3G6JGzUbwMXBsxijbR06HpZzrS4u+oA4A3to=;
 b=lUkAoRkWEIqi9Am6U0952CekpiuT5M4K6z/MGPp3GJiuMbdfc8tqyPMRGgu8OfM52qgLkA
 43ZGks1BGg9L1cbvGBhf9ugG1OMBuxBpDhGAh7QI5nnl0ySpxqFGi57uwDfxBStiN/OWYO
 hW2qnLjQaGwrId9BzvdRUuYZ1KCX3zI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 641029aa
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Oct 2021 21:41:08 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id h2so1506283ybi.13
 for <wireguard@lists.zx2c4.com>; Tue, 12 Oct 2021 14:41:08 -0700 (PDT)
X-Gm-Message-State: AOAM532v5lp9ASn7F5PngjB9YM42b7HCSL/cGAyyshlXrx3VjdI7HkKX
 XxwdYQksdSypwEBROUNqqlVmdeEhfNphuWVgCD8=
X-Google-Smtp-Source: ABdhPJwKB5N14e8Gw+6dwd3+bir+cpYUkjrODQ3yKYiJ5nSfLHDg3injlXD5/duFycKMw7Vp7RsOJmOrLQxib5j4M7M=
X-Received: by 2002:a25:d10d:: with SMTP id i13mr32894274ybg.62.1634074867914; 
 Tue, 12 Oct 2021 14:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
 <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
 <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
In-Reply-To: <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 Oct 2021 15:40:57 -0600
X-Gmail-Original-Message-ID: <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
Message-ID: <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
Subject: Re: Windows Log Output to Event Viewer or Text File
To: Frank Wayne <frank.wayne@northwestern.edu>
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

On Tue, Oct 12, 2021 at 3:39 PM Frank Wayne
<frank.wayne@northwestern.edu> wrote:
> That's pretty awful. It is only possible to get the last 2048 events and no way to get just the events since the last update. There is no way for an aggregator to simply collect WireGuard logs on Windows.

Your "that's pretty awful" aside, is what you're asking for some kind
of CLI "follow" mode that doesn't terminate and spits out logs to
stdout perpetually?

Jason
