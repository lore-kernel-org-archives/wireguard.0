Return-Path: <SRS0=i4ZG=5W=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F6AC2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 09:47:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54783206F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 09:47:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bf1neI+x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54783206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75fc7d66;
	Mon, 6 Apr 2020 09:37:55 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 45dbd955
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 09:37:54 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id z23so11269989lfh.8
 for <wireguard@lists.zx2c4.com>; Mon, 06 Apr 2020 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1ZaIIL+/zlTezEdyTG+ziOt7fzev0bbksZVsx1PsrY=;
 b=bf1neI+x6nY6AImessSIVL3oG86/5lgg0FY+S3WwnZz7W9b+LZ5J+DziQh7LklE+rk
 TW2mHby55Ziazjz/VfpsQAjwIquBb0+E2PS+e+W9KyQm+vnQP5dhFN1aTatCaz1mkE4Q
 GIj8fTzYpTd0jy1374ZDLWMHePDFIPKkNC+lg/MFo/C7FQw1qreka2PJ8w47XX9YnCCz
 JaOUuqs6/B8FLTt58lFivh/hlD2H1iuLfZR23Gfo4VqyPtZPAlhjhU9CsIAc/W95CE2z
 9p14eUnx1StKKuqwQUJmmdf5SPPxcwaLkAOU3cf7GLHvXAtVfYvRvOrDCGU7gTNiSsri
 KXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1ZaIIL+/zlTezEdyTG+ziOt7fzev0bbksZVsx1PsrY=;
 b=WFpnlk/XGJPP62v2mAh4rkAOwqQY6GSrHkYMJn9RADPYZ3xD8CnyEo+f7T46vKB3e7
 JeRfB6DCR6WCMdfyFumqgVtz4oAe+rPtY2vsTUHgxqNZRwpxrBxqjNQvOdEcrif5cRH3
 krcTdDJRVgt4biF8LLIQsjZxFSL+3hRowJDHQ7uJd96ZN2G+t1N5V/gEXzERmVY4isNU
 OYE2JU7Ng6bM3etVxO93EUsPpFnzkpez5ksDA/rbxHK0OVvCUpLKnuOUAkoTerWJwMnZ
 GR3X0P3R0zGs0Z/0JseD83yGg47vYUYQnoVNdSZnTmh03Xjrd0/HS57UsrhNGYWBl5Ks
 TKDA==
X-Gm-Message-State: AGi0Pubpf1IynENqa9rYiYFt1wYAppRCUmmGFsB8XiOC2HMYFsItPhWZ
 qxzR9QKZ8lYvlZtyed2uc9/n+3hI35eTnXlqtLg=
X-Google-Smtp-Source: APiQypKan7uEFLtTzVrOO7qXDUVrZ93VgUAYO6qamWKJLo5ZuH3xPSNNaj7Yqbl/jXQ57QtcG5/LBrGaSotL3IXnoY0=
X-Received: by 2002:a19:c850:: with SMTP id y77mr11685765lff.45.1586166398923; 
 Mon, 06 Apr 2020 02:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAMaqUZ2i+LFg8wreOr=H1gB5ocw9+N5uacsZukcjEx6xNrbdkQ@mail.gmail.com>
 <c41fb7b6ba61a41804ef50a7c92857367c51a36e.camel@gmail.com>
In-Reply-To: <c41fb7b6ba61a41804ef50a7c92857367c51a36e.camel@gmail.com>
From: Reid Rankin <reidrankin@gmail.com>
Date: Mon, 6 Apr 2020 05:46:02 -0400
Message-ID: <CAMaqUZ0mx-3RtcNU4WQReGHWNgZ__b+AqpgHQKJpkHwpaqM_4A@mail.gmail.com>
Subject: Re: Thoughts on wg-dynamic
To: Arti Zirk <arti.zirk@gmail.com>
Cc: wireguard@lists.zx2c4.com
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

That's a neat tool, and I'd probably use it in my own projects -- I'm
a big fan of the shell-script-only approach for userland tools -- but
the algorithm it uses has a few rough edges I'd prefer didn't get
standardized:

- The hash is taken over a (newline-terminated!) Base64-encoded key
and not the raw bytes; there's nothing else in the protocol that would
require implementations to have a Base64 encoder. (This might matter
in a microcontroller implementation.) It wouldn't be hard to pipe to
`base64 -d` before hashing, which would fix this.
- I'm a fan of SHA-256 in general, but again, there's nothing else in
the protocol that would require implementers to have a SHA-256 engine.
(This would definitely matter in a microcontroller implementation.)
OTOH, `sha256sum` is a commonly available utility and reasonable to
use in a bash script, while `b2sum` is not so much.

My prototype also uses the `(subnet & mask) | (hash & ~mask)`
construction, though I use the full fe80::/10 space, instead of
fe80::/64. There's a decent argument to be made for just using the
/64, though -- it's the "interface identifier" portion of the address,
which is why that's what RFC 3972 does as well. That said, I'm not
sure there's quite the same need for subnetting in a link-local
address space. (I also feel like the subnet id/interface id dichotomy
is going the way of IPv4 class-based routing, and was probably only
conceived of as a clever ploy to keep ISPs from screwing everyone over
by only handing out out /120s.)

I've taken another look at RFC 3972, and the only way it would work
here would be by using well-known modifier and Sec parameters of zero
-- and it would force reliance on SHA-1. So I'm now thinking we don't
bother.

In any case, that makes at least two independent engineering efforts
that both use `(subnet & mask) | (hash & ~mask)` rather than using
subnet as a prefix for the hash.

--Reid
