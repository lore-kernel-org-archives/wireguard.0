Return-Path: <SRS0=rgFP=QK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5EDC169C4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Feb 2019 22:04:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DFD5217D6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Feb 2019 22:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLB0RWtk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DFD5217D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a9ed6b7;
	Sun, 3 Feb 2019 21:57:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83df9580
 for <wireguard@lists.zx2c4.com>; Sun, 3 Feb 2019 21:57:46 +0000 (UTC)
Received: from mail-it1-x12d.google.com (mail-it1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd58eba2
 for <wireguard@lists.zx2c4.com>; Sun, 3 Feb 2019 21:57:46 +0000 (UTC)
Received: by mail-it1-x12d.google.com with SMTP id p197so17712409itp.0
 for <wireguard@lists.zx2c4.com>; Sun, 03 Feb 2019 14:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mkZYscFd3ESbe781mLVNK0KHoz5AcjL6k7wsT2mogmM=;
 b=ZLB0RWtkHgG/R2gVvpg3oNCB264iaVDMH5TwTx6l9eXc9FV3lOyjC6681Zr3uOpLyP
 dCvMnwt+7QcYwov1pRJsfnuqRHAOsMhwLI7lIELI3m/UeGMgL5yhDxW4x6rz4Jd62Ci0
 +2+pS7Nc8JNR/xuk54Urw2/wqF4mf2hQ9rfyY26282eec8jw2zR68BagLC5BmTSqI9FB
 d65INccf44BPZiymbSAOk7TM8Xj+LGkVQId4UuLnNqIuLKU6QHQF+ENfyXbe3h7BcMEb
 TNMdjkZ/GNELUrdOJVOR3V3RHHU5F+yWXkJujiwSAbECHFwT2Q/SbWl3MC2jP6WoJ6YY
 r4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mkZYscFd3ESbe781mLVNK0KHoz5AcjL6k7wsT2mogmM=;
 b=oRGyVegJtsguNkBnAh9frodxb7cHG25+/U1bxL9Vv/kn2MaWIRKlXsu/QEvJQRvdfd
 9ebhNRmJvrPtflmb2IlSvIX4KXKzY4dzQN3VGR5uelKgI+wIpqHqqTP0I+I3o95BewE1
 o5xJwSp8uAbwg7tL+An/HvKfD2Zs0EWLiEOdNdTeeqJ5csFl365zjgZ/hSdIJjYOS+47
 l7YF2ljg0z8Hi0MtVbXTTJHmJsCs0/lraxIiYzD4GjHtE5tSg88+KfG5evhhgXyoinoY
 0d0jwCyPlF67abdbl4DNgEVT6mO3RPTcmcEJJCDVzWGQxRcXhfutWwUU7A97ktJc+fpW
 dD0w==
X-Gm-Message-State: AJcUukd8qghpWvzKBCSRRIYMus428IAUcIm30VtV3p9cPXyXPEMjUjX3
 fUyTuSCraP3J1PEVGke36eb8/JadBIC2/EfimpFBJY7K
X-Google-Smtp-Source: ALg8bN5W3yVqXH7/P64Q4tST11Rvfylnn6wpKBI7Ob8lmgqFuEXmYz6gxvDvqu9VL6ql0fxs1ECbuy2dnleaZReh6wM=
X-Received: by 2002:a02:9951:: with SMTP id d17mr29415743jak.134.1549231458033; 
 Sun, 03 Feb 2019 14:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20190203213156.7553-1-maarten@de-vri.es>
In-Reply-To: <20190203213156.7553-1-maarten@de-vri.es>
From: Julian Orth <ju.orth@gmail.com>
Date: Sun, 3 Feb 2019 23:04:06 +0100
Message-ID: <CAHijbEUR1CfvwFT+AKCxVsLhO6nscGXPPUB6KNF+e=Dx8xb8wQ@mail.gmail.com>
Subject: Re: [PATCH] Allow changing `creator_net` after interface creation.
To: Maarten de Vries <maarten@de-vri.es>
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

See [1] for a similar idea.

[1] https://lists.zx2c4.com/pipermail/wireguard/2018-December/003662.html
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
