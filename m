Return-Path: <SRS0=g8VQ=JF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353CFC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Apr 2021 23:41:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F4586023C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Apr 2021 23:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F4586023C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=scjalliance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b1b1996;
	Thu, 8 Apr 2021 23:41:23 +0000 (UTC)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [2607:f8b0:4864:20::52f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b89b2e20
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Apr 2021 23:41:21 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id g35so2497302pgg.9
 for <wireguard@lists.zx2c4.com>; Thu, 08 Apr 2021 16:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scjalliance.com; s=g5;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ikSCggeZ5FgzUkGb299D1fncg1sFPkfRWn9XjUcBwX4=;
 b=erYK18uRRAKWRBoI45WtylEdb1pyYGAXDYAyoVRA1/3dX0ZuG6ejbIuh5n0FV6oK3W
 TQTG21/Rf0jID0Og7px95+7v4+HzGnmBo9hu6pytdDRyGTigbd1nXdtUwdNxbNLyCYB/
 Y9QMPNtbUwPlDIu2oTLmLSijGwcvH0/2w/sXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ikSCggeZ5FgzUkGb299D1fncg1sFPkfRWn9XjUcBwX4=;
 b=AkXpNlBvrDlmLuF6sDhyLKSE2V3sxyx102qIc0FQW5rBEFHB4nPrIxqwVP8MK63Wvd
 9HUO7wEMpXeScYY6h7gRoJvNOJNc7BIkRGKNxAoMmByLBXkXGV2ekPQhiNqNLOdvjrMG
 JI50Xz36E3LnAfgHssrYVVMTklMHO/Crr2q/3S/E7zMwU6I3aGgoIRaiUV/Q/YBLIWzt
 COYuk5K0CrQ0lqX81NAPcPVhZjO/UflKbgXUtvJibtM5g9Da86y2kxfYZuMwU9sMthB+
 eBIgZzf4XXp8AK09ovvAuiZoaVEQwFW93DBNZwx5MdrlxIIDdKmUdmwGiuECW+9IvtZf
 STlA==
X-Gm-Message-State: AOAM530kqfqXbau1Cv8n0b6+0Zv32rNkRBgZxAEmkGUg+5rvFaL8V6MC
 TCHsx31B2zL44pbAp4gFlHjfjpG3QVHsCG+5ROIHKA==
X-Google-Smtp-Source: ABdhPJzuwTnFrZqxm8jeNhXc7gQJJ69Fj+gMleZckPUFpSk6PFL8PrF8gtUlhR31J2FqiqmDNtDRfMKWWGZidG8iEmU=
X-Received: by 2002:a62:8f4a:0:b029:241:fc67:d425 with SMTP id
 n71-20020a628f4a0000b0290241fc67d425mr9970802pfd.21.1617925279242; Thu, 08
 Apr 2021 16:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <CALaUSusmdvz2XAT6c24023dZroTwVPKr0k7S+y6YVAXW1-ubJw@mail.gmail.com>
 <CAHmME9qYHttPgwranGbUS4ijQOde96Je-f2VAM94LMvsNqSfVw@mail.gmail.com>
In-Reply-To: <CAHmME9qYHttPgwranGbUS4ijQOde96Je-f2VAM94LMvsNqSfVw@mail.gmail.com>
From: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Date: Thu, 8 Apr 2021 16:41:08 -0700
Message-ID: <CALaUSutUZSCEdLjkire-cJAymWU34r57yB=rJvYoUO+AdxF9wQ@mail.gmail.com>
Subject: Re: WireGuard for Windows "cq is corrupt" panic in rio_windows.go
 after insufficient buffer space
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

To my knowledge the log is complete. I didn't see any personally
identifiable information in it so I sent it as-is without
modification. It was produced directly via WireGuard's save button on
the Log tab.

On Thu, Apr 8, 2021 at 4:13 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Joshua,
>
> Thanks for the log. It seems like Windows' Registered I/O extensions
> still are causing issues...
>
> Is the log that you sent me "complete"? I'm asking because it appears
> there are only 2032 WSAENOBUFS lines, rather than the 2048 or 2047 or
> 2049 that I'd expect to see.
>
> Jason
