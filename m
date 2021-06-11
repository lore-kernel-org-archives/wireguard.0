Return-Path: <SRS0=K7sE=LF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B61C4743D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jun 2021 07:56:20 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D95F610E9
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jun 2021 07:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D95F610E9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f084300a;
	Fri, 11 Jun 2021 07:54:06 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3ed3e36b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jun 2021 07:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1623398041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R93fK9wv3L0ufaoL61dO72/lW/oWH48pi8uNu9tT9uw=;
 b=cX6XJ5lPCiLNGZ1w1gloJuzYDu6k9Qxmy7Jbnzi56AfeloSCeOldE2+b+tfyjFZfAFdqMj
 Ynxodq+epqAj8cGOPCo52+2nMfLiO+OOTWfc/ouhOcUYKAqDB4K6EZEt6KOLcQWbi6PhuW
 wmrD551lqVL7bBpmul1Ugy9taz5E8XQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a9ae3533
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jun 2021 07:54:01 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id f84so3177318ybg.0
 for <wireguard@lists.zx2c4.com>; Fri, 11 Jun 2021 00:54:00 -0700 (PDT)
X-Gm-Message-State: AOAM530EZjqPXTTH24wijdyr6qNRicVNXXrZVGyc5Y8iWI2ElvH/bZ4H
 P31DWVtYouE3BN+i1o+SpxEX5k1IdjDcP7LH79M=
X-Google-Smtp-Source: ABdhPJxp+Mnva9BAQp7nIJw9tJLeOtg9jxiicw6okPIUymw9y7UdRmVNcYylnEjyD8sSjLxnWuW1ft+4tNoC4xjM5yY=
X-Received: by 2002:a25:d94a:: with SMTP id q71mr2945122ybg.49.1623398040504; 
 Fri, 11 Jun 2021 00:54:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:474d:b029:ce:da65:f582 with HTTP; Fri, 11 Jun 2021
 00:53:59 -0700 (PDT)
In-Reply-To: <E201364E-C433-4A43-968E-F336D5944986@mullvad.net>
References: <760B19F6-17E7-4276-B2E2-DFE07AB19323@mullvad.net>
 <CAHmME9pKnJouF-Vf20y+1w_TUs1vj1bpOggd+dgm8epfN+8-MA@mail.gmail.com>
 <CAHmME9rqAH9a28apwB9Rg1k9Lg1gmBWv3KK_8ZmAdb6H9hBaKQ@mail.gmail.com>
 <CANdratux27RGAbVg1QBEKEnff8jb3pdezZ-Ad0=bqYfOw6iUeA@mail.gmail.com>
 <E201364E-C433-4A43-968E-F336D5944986@mullvad.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 11 Jun 2021 09:53:59 +0200
X-Gmail-Original-Message-ID: <CAHmME9rs3g9ar7Fh-BduNFiD4GipuHbQNALOcstVBd-q3OmHdw@mail.gmail.com>
Message-ID: <CAHmME9rs3g9ar7Fh-BduNFiD4GipuHbQNALOcstVBd-q3OmHdw@mail.gmail.com>
Subject: Re: WireGuard is broken on iOS 15 beta
To: Andrej Mihajlov <and@mullvad.net>
Cc: David Crawshaw <crawshaw@tailscale.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On 6/11/21, Andrej Mihajlov <and@mullvad.net> wrote:
> IIRC one thing to consider with that lookup: iOS enables users to run
> Personal VPN and Custom VPN (aka WireGuard) side-by-side so there is a
> chance you may pick the wrong utun.

That doesn't make any sense. File descriptors are not OS-global;
they're process-local. That's how Unix FDs have worked since forever.
Unless you're suggesting "personal VPN" is somehow resident in the
same network extension process as WireGuard's "custom VPN"?

By the way, did the experiment in your branch work? I'd prefer a
direct route to brute forcing FDs, if possible. But if not, seems like
my kludge might ultimately do the trick.
