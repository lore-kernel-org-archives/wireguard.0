Return-Path: <SRS0=t+97=OC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1AFC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 Sep 2021 21:57:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B315610A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 Sep 2021 21:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B315610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb67ce62;
	Sun, 12 Sep 2021 21:55:16 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cf8abdf6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Sep 2021 21:55:12 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d18so4548599pll.11
 for <wireguard@lists.zx2c4.com>; Sun, 12 Sep 2021 14:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to; bh=5M3B5J7SVjABOO3Jpkj33mJemdw1D6hLnY1qN/AXdH8=;
 b=a0AtX2Q/LpYEy6wXF401UiiBJ6X4HPNLUQxMawRSrkuih25wOXfYtayUjGXET2u7bt
 c2x3BXjausnbwhUnblJTETk0gTexCQ9DWn8CeNLs+3+vQXYkSX8ngqJdWad2gGnFVf63
 zG09tGNcmiyHKvO71QGEm2MnFQQbbWg/P6IoyztG3Bup6xxxypWudw2+tZpByceocjpD
 d1PA15yi42l4Tl9PFjIBdYK/DzOYzFJI7OHENi7ffNkLlw0eDwzusBoB+l4sLnktXO92
 j6B12NaLMxmT6TJu2uz+dtbqH/hOJrDlrW4fpQTOW92e1a9nN1+HGcCI9fYUpfKnE/Ge
 /vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to;
 bh=5M3B5J7SVjABOO3Jpkj33mJemdw1D6hLnY1qN/AXdH8=;
 b=Pna9YzdQsVKJpWzRgK0JuTnbJc8LImUGmuis49Mp5QyOM19Atdkdl98A4fBqszZe1n
 LQTGkQDF67FB8tTL12AyWUqTKrcarKbTkku0YRDjmnHRYfgVGdjseNIhBQEphaRMVIws
 qErlAzIAQAwk9EPL8Qn/0tpNpsb09pIw4JZ1A64/mul4S+xO2x7J5YCEcVfcHqc7mhuP
 1lqzLhbKtka7QKQhbpDwp8/8VSN1ZW7pQn0OXXo0KKdXro3Z4vu/O3A+lVUBZa6d/Lrt
 xg6JmA64Isxk4fnQE/xavKyfOJOP81oz8WeG5Vh5pRcKuVLrGgBK7flhkfem0zCNSLm5
 kyVA==
X-Gm-Message-State: AOAM532Ynfdv+CJqsnoD9WzIJOLTX835fZWHGIgUy+t/3m6SD48fG7yJ
 EFTTIM2fhnHEUMKwGO4AtYMoEzqeZdHzmXTOSEplvHNE+7A=
X-Google-Smtp-Source: ABdhPJzbsaJ8Z+caDNQhblDzy1X4SEAm8+vmSwNVA6FBHQOfm+vIppZVRLoysW5rRJNoxmoRLde+H+7F1DD1WttOC4Q=
X-Received: by 2002:a17:90b:38cd:: with SMTP id
 nn13mr9561275pjb.108.1631483710184; 
 Sun, 12 Sep 2021 14:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <YQgrCfqIL2SWfF6G@zx2c4.com>
 <CAHmME9ruyCFABTB1S1RYC5CSCBWPr2eqCZDCszDX4NZNR-vi9g@mail.gmail.com>
In-Reply-To: <CAHmME9ruyCFABTB1S1RYC5CSCBWPr2eqCZDCszDX4NZNR-vi9g@mail.gmail.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Sun, 12 Sep 2021 17:54:05 -0400
Message-ID: <CAH8yC8=m72gvv3U-mbs5ib3eT79m+VNAX9s3muj63mHgoaD7Ew@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuardNT, a high-performance WireGuard
 implementation for the Windows kernel
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Jason,

On Sun, Sep 12, 2021 at 5:11 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> ...
> Finally, tomorrow with the release of v0.4.8, we will move onto phase
> 2. That means that WireGuardNT will be on by default. If something
> goes wrong, you will still be able to disable it and revert to the
> older wireguard-go/Wintun using the "UseUserspaceImplementation"
> switch described on this page (as of September 2021; will be removed
> in the future):
>
>     https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md
>
> But note that if you /do/ revert to using wireguard-go/Wintun, you
> *must* absolutely email team@wireguard.com with details as to why
> you've done so, so that if there is a bug, we can fix it. If you do
> not do this, it is possible that your bug will never be fixed, and in
> a month or so, we'll move onto phase 3, and you will lose the ability
> to revert to using wireguard-go/Wintun. Do not rely on other people to
> report your bug for you; Windows is weird and diverse and there are no
> guarantees that somebody else will run into your same problem. So
> please: if you enable "UseUserspaceImplementation", send an email
> saying why.

One month to move into the next phase may be a bit tight for some
folks. 30 days is probably fine for a developer or standalone
installation, but some organizations cannot move that fast.

I've worked in US Financial and US Federal, and some changes take
longer to approve. Some organizations have processes in place that
require approvals from management. It may take months to get a Change
Control Request approved.

When I worked at Treasury a trivial change could take two or three
months and it required management signoffs and complete testing before
being released to the production network. Nearly everyone dreaded a
Change Control Request.

It may be noteworthy... on Windows OSes, the trend is to move stuff
out of the kernel and into userspace to reduce risk. For example,
Microsoft moved parts of the GDI out of the kernel and into userspace.
So some folks may actually want the userland architecture to reduce
risk.

Jeff
