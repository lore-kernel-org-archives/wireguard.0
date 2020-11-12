Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03047C56201
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 17:44:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D15F2085B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 17:44:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEbf26LK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D15F2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50e56abd;
	Thu, 12 Nov 2020 17:39:39 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 41e8b99a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 17:39:35 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id r9so9658215lfn.11
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 09:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4d+CrabiQUijZGqQ5m8D1LLMK3DEvnixMUicel17Z9Q=;
 b=JEbf26LKgONg+y81OdEJ5EeUybWKHn4tVM9zwYQfXdJVdOonpXN/WcC50n51KjtfD+
 sDmEKF+Cc5wLEMI6UQYSeGtAGOkgtWF3yYp59XJBSZbKT4Q0XOuzJvwVefGblAxdrYmp
 NjJi8NcO5yRUIIewvwT87s0gETlbaTtzvGE+agWL/na0VZlUicVlQxlruLACZ9RrVUrf
 68/TqFhYsQ4WRQRmyXugDW+/n/fpH8xyLUoCsn+VdoJidCM9A8pot5nHlscU697Nrfei
 Dcmo7MlpFTHN6Qx1ZIjq5bxTvXZC70Ee/KoF5CSt8R1VVO99TCCUCKcjMZYLRiXdScTo
 iiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4d+CrabiQUijZGqQ5m8D1LLMK3DEvnixMUicel17Z9Q=;
 b=agkpzV6oV2H42+M26Mk+r4YnR9yNwBm+FGB+otSSl6iufEoFi90ngpwCBrzAyB6zsw
 ksWEgNgD9hVxqb8qwzoyGGs8jfMsNnJjH5EZVM2bOYBy+vwiNczU70i/mwU5HckEwwEb
 E5I7M0WVXxl7EUVThRAahkqR+36p6WwAjGRN7MLq7BKyp06iP5atstsmKD7B52xVvlto
 YOKJ8aF9b5VSv85mqoF4rY9ia1drUtQ1ne1TbpkDL7PFKfMdPe27riOg+Y7s2HmeJtWT
 mAPIYqfXxdnrVshPCqKdcXV1IEfuGkraSkC8zogrR1wOUREWz5ppv8mINPv55EqgBoRV
 INow==
X-Gm-Message-State: AOAM533wHcz0cPN+3iJhSggPCLA6TsRwXD21tVANxR8G73aMy6jZQWRy
 UWmZBWM8e4lFs+B0ARA7knu2QSB09GiqhdpOOcs=
X-Google-Smtp-Source: ABdhPJyZM5I1MBQ0n9sF63Chn7CrFs+f92uxo2qWeTdyJyTE9Hh6oDQAyrmqjG+7fIqqjnck3KwAYJM+SAB21otezKg=
X-Received: by 2002:a05:6512:481:: with SMTP id
 v1mr203338lfq.132.1605203012817; 
 Thu, 12 Nov 2020 09:43:32 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <CAH8yC8=tJD0ZKKTsRjynTqusRWr3m8YL0xoLNJe8AcR2BAHu4A@mail.gmail.com>
In-Reply-To: <CAH8yC8=tJD0ZKKTsRjynTqusRWr3m8YL0xoLNJe8AcR2BAHu4A@mail.gmail.com>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Thu, 12 Nov 2020 18:42:56 +0100
Message-ID: <CABtXGiDpcKdvr6H3s8+AED62+dOgm-1jBCLJVDgOJm0EdDod9g@mail.gmail.com>
Subject: Re: Should we sunset Windows 7 support?
To: noloader@gmail.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
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

actually, they do. it's obsolete.

sadly it's still in use at high enough volume that people have to care about it.

On Thu, 12 Nov 2020 at 18:41, Jeffrey Walton <noloader@gmail.com> wrote:
>
> On Tue, Nov 10, 2020 at 7:29 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Windows 7 has been EOL'd by Microsoft since January of this year. It
> > is no longer receiving security updates or fixes. This email is to get
> > the conversation started about doing the same with WireGuard for
> > Windows.
>
> Microsoft does not determine when an operating system is obsolete. The
> market does.
>
> Windows 7 still has a 24.79% market share.
> https://www.netmarketshare.com/operating-system-market-share.aspx.
>
> Jeff



-- 
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.
