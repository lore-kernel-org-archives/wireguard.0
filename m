Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA73BC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 11:48:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CFDB238E8
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 11:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CFDB238E8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59124797;
	Sat, 19 Dec 2020 11:39:33 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 246c1209
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 11:39:31 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ce0efa2
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 11:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=qubtZUPTZpi8lgqELR5sxtm5H3M=; b=i9R1wa
 SB7Tk2EUkaWurCOPY3hWSlyeWDQCG0RHMC0YnGZ5X7MrSJ57P0ZwS2nB0B+nS+Ra
 HRl0wHqIGDSz5nz9fsFX0fMDimQ3lj+FFjDO1NldbcPSDPttOw/OB7mPigoCIw15
 jEGC55jaGKCBhoxEHyEUtWDzKIMoNX9U+ebLLdLJMVGI8qWDwocOHIBmlfKm0Qli
 gGC2ZuVzrLqcMRHLjedbrS3trOr0NjF0Qnmsa6uIMi1tgi2xYOVqnYsPvOrLlCy9
 KolMyI2676bCgU9jWq/5CH3oWw9Pk1Ez1x86kEWPlBtqVni5qrcW5KkK4gRrbBV4
 H3KmIuhmBt4BwPUw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f6523acf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 11:40:17 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id w135so4409663ybg.13
 for <wireguard@lists.zx2c4.com>; Sat, 19 Dec 2020 03:48:17 -0800 (PST)
X-Gm-Message-State: AOAM532TOTf9WuP/nCJHOkmbd9kIIa7uGnsDODdkt5+9GUy+Qc0WA4S/
 dpCAvEJUYZgXHfla8PLRls5H+ZQZNijcjF61/i8=
X-Google-Smtp-Source: ABdhPJx3oAU0r5agG49bQvQd3rX7SWBnO+Bp2bZe3D6mWGw2JmOSSkyN/Nzkyd+LcVufQy6PIq1dcTcv/hSXfhcVD7M=
X-Received: by 2002:a25:2cd6:: with SMTP id
 s205mr11539076ybs.279.1608378497370; 
 Sat, 19 Dec 2020 03:48:17 -0800 (PST)
MIME-Version: 1.0
References: <CAA6-MF-fXL58SWcr6ct+iKLutObvM7xNoRTUW=iwfXUjcPsUGQ@mail.gmail.com>
 <CAHmME9offZGOgySFGF-uzKCQ_NFwGQAy06HCE4=3iuwqprMc=A@mail.gmail.com>
 <ruafXiXluY0DZUNuLCh3Pzrxpk8CIkHqfrDjsnZ1IOfobylVKP0wc8w_lfT4JlpTbIC1nZ3mjeGb4t2fYfOBEqARrKvZ1_cHIlXBatZKZlU=@protonmail.ch>
In-Reply-To: <ruafXiXluY0DZUNuLCh3Pzrxpk8CIkHqfrDjsnZ1IOfobylVKP0wc8w_lfT4JlpTbIC1nZ3mjeGb4t2fYfOBEqARrKvZ1_cHIlXBatZKZlU=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 19 Dec 2020 12:48:06 +0100
X-Gmail-Original-Message-ID: <CAHmME9oA9iibjYJpkO6COjNkK=h3qTBfH0X95JCuFbACNdxzGA@mail.gmail.com>
Message-ID: <CAHmME9oA9iibjYJpkO6COjNkK=h3qTBfH0X95JCuFbACNdxzGA@mail.gmail.com>
Subject: Re: MacOS and wg 1.0.11 issues (for me)
To: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Cc: Janne Johansson <icepic.dz@gmail.com>,
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

On Sat, Dec 19, 2020 at 12:10 PM Laura Smith
<n5d9xq3ti233xiyif2vp@protonmail.ch> wrote:
>
> Jason,
>
> Out of curiosity, is NetworkExtension not available if you push a test app via TestFlight ?

There is no testflight on macos.

I've now added Janne as a developer device on the WireGuard account by
using the unique hardware ID of his laptop, so we're able to make a
bit of progress that way, but Janne's availability for testing is a
bit limited, so I'd still be happy to learn about other people who
have the same problem and can help out. I still am unable to reproduce
it myself.

Jason
