Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4027C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:20:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A934C24181
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:20:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=scjalliance.com header.i=@scjalliance.com header.b="ZDyaJH4S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A934C24181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=scjalliance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a0de761;
	Tue, 17 Nov 2020 21:15:25 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 23ad4891
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:15:23 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id b12so1256327pjl.0
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 13:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scjalliance.com; s=g5;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tzb5Mt4cZrhOv4YpZTqFziaoSRMH59smozTiPI0xgAQ=;
 b=ZDyaJH4S7vqBrJkvf4EecTo0A7SiZ9Dferm8ofMN9Oaxk7ZHVVFlW3GLn00JBKsNEv
 FU5EDadM0ad3YPwnqQAkEeZT4h5o9vrQmx23jQClwZHOguVqA9rEcSPraDTJZdGLfR5/
 XtEzhe/9GsPb9IpbkPIgm+wapkgPW19/HFVC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tzb5Mt4cZrhOv4YpZTqFziaoSRMH59smozTiPI0xgAQ=;
 b=YVbsWlmihrYyHtJ2Sq7acuIEgnDiSSD56kSoJ4ppHzK0viUGq7nZQZMJt4v+csTlWu
 IQLisVOwwxZGKH8i4Js7UvfNXQmKG6XMMP7nT3LvGv5yUQsijaDPYXc68bkWYfJgyoem
 Ul82cevfvg26P2ezQRxNW7938Zpmyyy0tUFEywm2D+p5e1AoONkvTIFcBzaZDbZnu4gD
 iHLO4Olq+0bSdi/7f37BnMEkBvUon8Te+puO9VLxM8MGitYsTyY/uGX/6QO4sCwcYpQT
 J72CL0+CliRJZtCukOoHSZjyCctYfwtmEtGn6QL1qyFNPsQwVZ+MJs6TBajNdvHNpS4O
 Pthw==
X-Gm-Message-State: AOAM532z4seBH6b+4RW8eWbpWxRFpjo69UOdlw3cY3e7gfkB2UVqxg0J
 e8w5PXUEcCtuVzNTuLXw3mRzQ7jO2Wf7SirkIr1B3FZwqMCy8OV/
X-Google-Smtp-Source: ABdhPJwWWnQgHy3S8UFP4/1H7ccCf91jmU8+vAfY47X5C0ugajy7FruuoWZUFuzrOrdPLb5zTI2imDRwrInppa3c9jo=
X-Received: by 2002:a17:90a:528c:: with SMTP id
 w12mr939091pjh.126.1605648001439; 
 Tue, 17 Nov 2020 13:20:01 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuvDgxsr99R2qiOrXM20btnvnaiyAx7197jfcTauOt5CTA@mail.gmail.com>
 <CAHmME9oeZc7cruN2fayu+F+8BO0RiwGuA+dqzQRr5spnvhY6GA@mail.gmail.com>
In-Reply-To: <CAHmME9oeZc7cruN2fayu+F+8BO0RiwGuA+dqzQRr5spnvhY6GA@mail.gmail.com>
From: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Date: Tue, 17 Nov 2020 13:19:50 -0800
Message-ID: <CALaUSuuzQhTcDE_b6PPf=fXuOjbmVf7Tgzdz9DbWMxCJ8-2WUQ@mail.gmail.com>
Subject: Re: WireGuard for Windows failed to start after update to v0.2.1
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

I think they're separate issues both related to the new version, which
is why I opted to send in separate emails. The other email is about an
issue first encountered on two other computers within the company.

In my case I was able to get WireGuard working again. Here's what happened:

1. I manually started the WireGuard desktop app. It immediately
prompted for elevated privileges, which is atypical. I provided it
with administrative credentials.
2. The WireGuard desktop app launched, but lacked any of my configured
tunnels and still was prompting me to upgrade. I see that there's a
config data migration recorded in the log, so my guess is that
WireGuard was still running the old executable and didn't know to look
for the configuration data in the new location yet.
3. I told WireGuard to run the updater again and this time it went through fine.
4. When WireGuard came back up it had the tunnel configuration again.
The tunnel was left in a shut off state, even though it was on prior
to the first upgrade attempt. I switched the tunnel back on and it
seems to be working fine now.

I got my own tunnel back in a working condition easily enough, but
we'll need to be cautious as we upgrade our WireGuard clients across
the company. We have over 100 installations of WireGuard for Windows,
so we'll see what sort of success rate we get.

On Tue, Nov 17, 2020 at 12:59 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Joshua,
>
> Does your subsequent email obsolete this one? Trying to keep track of what's up.
>
> Jason
