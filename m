Return-Path: <SRS0=Vhpd=JN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18873C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 17:47:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 253606137D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 17:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 253606137D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9dced906;
	Fri, 16 Apr 2021 17:45:23 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5b0b0669
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 17:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618595113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JKPjELZRfmWjS+zF8SyJLJu074pDtbdP4HrhbKk4xN0=;
 b=APPDUfBskwBgl/H4VO34zMIe4wBZNUvtvxuVmRJvgcfqAU+hgEJI2ycuJS7cP62ywh34qG
 vz6JZ652R6IXLN65hHC/aZOwxW0LzoeM0pcPlG7Wlc9/u1nBrdxHpxu4x4iOLxGX2R+1kW
 dtdHkbO/4asKScTSUQYIl8pOMtLWjVM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dddb2bd0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 17:45:13 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id y2so28914103ybq.13
 for <wireguard@lists.zx2c4.com>; Fri, 16 Apr 2021 10:45:13 -0700 (PDT)
X-Gm-Message-State: AOAM533z3XXoKgpC0+ZZJ4aDVocUxlyTyLpjisHAngS/jNg6XF6/6nq8
 YP9nzeLv86G3VSPrA2rctA9cNig2r9wC/9rZKaY=
X-Google-Smtp-Source: ABdhPJxPcv8sQSo8pNRRpxYmfmNk3a7zAd7uRFbKm7cqppCV5t1JI8vYnCJAnJjfgezCaN/Vx4yKE8SuVPkCzYfUfnY=
X-Received: by 2002:a5b:5c6:: with SMTP id w6mr330569ybp.279.1618595113006;
 Fri, 16 Apr 2021 10:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de> <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
 <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
 <87sg3rigdx.fsf@toke.dk>
 <CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com>
 <15c3483d-546b-4c86-aca7-9ab37945791e@stha.de>
 <8e80a3e4-4118-6273-a5e3-0ec7692fcb17@spam-fetish.org>
 <CAHmME9p3MOtJKw7LK4WraPjB20cGGrmGgMNZOSf4YT=jTzH-ww@mail.gmail.com>
In-Reply-To: <CAHmME9p3MOtJKw7LK4WraPjB20cGGrmGgMNZOSf4YT=jTzH-ww@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 16 Apr 2021 11:45:02 -0600
X-Gmail-Original-Message-ID: <CAHmME9rP6U_b05xWkmcMTyCLhgD673VOD_5JMNG5y6HWLCd8Kg@mail.gmail.com>
Message-ID: <CAHmME9rP6U_b05xWkmcMTyCLhgD673VOD_5JMNG5y6HWLCd8Kg@mail.gmail.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
To: "Muenz, Michael" <m.muenz@spam-fetish.org>
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

On Fri, Apr 16, 2021 at 9:17 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > I set up a lab and will do some testing with version before and after
> > the change, maybe for FRR it's enough to set NBMA or similar.
>
> Could you send a minimal bird config that's broken so that I can
> reproduce the problem and debug?

With the latest version --
https://lists.zx2c4.com/pipermail/wireguard/2021-April/006634.html --
wireguardd seems to be working out of the box with frr.
