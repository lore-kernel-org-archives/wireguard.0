Return-Path: <SRS0=I1qK=KF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C99C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 May 2021 14:47:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FC72613DE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 May 2021 14:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FC72613DE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a1221af;
	Mon, 10 May 2021 14:47:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dbf5de8f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 May 2021 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620658043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=20B8fgzM78KbFPunzHiNAJt7rRdMsCcEwdHc90fqazw=;
 b=LHhaS2rXSKPqmIxQQFimIbY5xPgaN/fqUFVUbf+yYdFwYUlDwW+88zi7DsGVY5fe1+L8OS
 CfH9eyYvtLAUuttqjOL3QPq8w+iy9xh6nJ9A2J0sYcXidSCTuXQVob5mu+0yPuvvd83mZm
 cwhQ60tGtia+1VUZLvU+khnF5jqdRSg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 98ad482a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 May 2021 14:47:23 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 15so22041953ybc.0
 for <wireguard@lists.zx2c4.com>; Mon, 10 May 2021 07:47:23 -0700 (PDT)
X-Gm-Message-State: AOAM532gwnxQjkzpc/Voji9Db5GWiPXWcuyBHSRcb15xdIORCkEtgSyq
 9gksJCbDLXtKDTxOhxkensD2/4o6w/Rs2zfXvfg=
X-Google-Smtp-Source: ABdhPJw4uAcm91pkcqqZNVuOYzf2gDvXLgPzBeskzeqmZLFQYpTlZvR2bXTgkMwTz6Yni/xASYPTvwN7jsB/Jm3nrcA=
X-Received: by 2002:a25:be09:: with SMTP id h9mr35376872ybk.239.1620658042985; 
 Mon, 10 May 2021 07:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <2b73e539c3f0ae11bb68e2a7410a52b4@mail.gmail.com>
In-Reply-To: <2b73e539c3f0ae11bb68e2a7410a52b4@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 May 2021 16:47:12 +0200
X-Gmail-Original-Message-ID: <CAHmME9pOk3cA9OjJWg0fb33PQrpQ9A5sRdSVQ=ifc7jEa_uGmg@mail.gmail.com>
Message-ID: <CAHmME9pOk3cA9OjJWg0fb33PQrpQ9A5sRdSVQ=ifc7jEa_uGmg@mail.gmail.com>
Subject: Re: mechanism for wintun updates
To: clint@openziti.org
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

Hi Clint,

The cgit has an atom feed https://git.zx2c4.com/wintun/ and you can of
course enumerate tags using the http dumb protocol:
https://git.zx2c4.com/wintun/info/refs . The github mirror also has
its own notification stuff.

I could start sending [ANNOUNCE] emails for minor wintun updates, if
you really think that's necessary, but so far, it seems like it's
mostly a smaller group of developers using it.

Jason
