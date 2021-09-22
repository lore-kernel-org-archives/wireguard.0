Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73392C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 19:39:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 896B560F3A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 19:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 896B560F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=scjalliance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85022df0;
	Wed, 22 Sep 2021 19:37:09 +0000 (UTC)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7e0d197a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 19:37:05 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 z14-20020a17090a8b8e00b0019cc29ceef1so5280850pjn.1
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scjalliance.com; s=g5;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wQrpVMVk9Ks9tD/zaD/txi98i+YIBDgRub+OUSeD/tU=;
 b=dRs212pVtEVPeQEXz+b+laI65wIHZ57Gz1SX0tUNmOn0S6moa2CSGoFGkBs+v8uV5+
 VnqdXB+kJE5XorcjzcE5eIM2A4Ao/UXPRG1L92RcDGwqz7IZStmzBNuEupFkbJViIiwr
 VQpwdzxJ8YhFAnXXKeqDip+jU3KSWoZJFs2iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wQrpVMVk9Ks9tD/zaD/txi98i+YIBDgRub+OUSeD/tU=;
 b=14C7j1q26zUgJ0cInbk2Gyoi5ze54HCAmIL2wMsEnks8BQKtX4Bxu6zhasM3ZdnEwm
 YXsz92J609iqia7b4qOV1Ky8CUP/RJJ/00vtODd8RgZlBqWhpxf+mKZAsMbx2jq0kz/o
 Es3+s8kLQAfQAnfddeT44xqQanK8xOxJeLssgGYRPp8T6gggemDqANgAMg0PCAYClJIR
 SUW5fKSuUHkRXab5Q8g7dspW9rqaxL8DR76Bl9nZQUTO99276pEMCrZy84P07eanoD7C
 koXk/eu/o8sgXE3avX7UaZRpyZn1Opgghlv4jvVWTsMj0q28gVmQf8NIDVHPfpVlpEq5
 4T8g==
X-Gm-Message-State: AOAM531pDNoEcdb0nFGyW1HAc/FTpoImFlAy7aelMQlsLwZF2/gMIOn9
 p2BTNt9bpoKpP2ma2YqwXlqYAzeDT7hCgNoh/1UTu/6997Jm3Q==
X-Google-Smtp-Source: ABdhPJylDV8Rk2mpCfYgXj6rOoj4oHjS7Dqh3OJEGVtM6zSM1B9qpen3k7P4YrcayXPRQ7s1yQFrVoYKRMCMuGu0Tak=
X-Received: by 2002:a17:90a:ab94:: with SMTP id
 n20mr13550445pjq.146.1632339423326; 
 Wed, 22 Sep 2021 12:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
 <CAHmME9pgz6PiXdFqcRw90EafHK-Jq9RfcgLUZaJ1ARrtdnjG0w@mail.gmail.com>
 <ddf37ac0-0d04-ad84-73c7-b334655c066c@physik.uni-bonn.de>
 <CAHmME9rP1a5XPtHp10_M5=w_ozGysOPYAk-PJ5hhZUCRXCJmQg@mail.gmail.com>
In-Reply-To: <CAHmME9rP1a5XPtHp10_M5=w_ozGysOPYAk-PJ5hhZUCRXCJmQg@mail.gmail.com>
From: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Date: Wed, 22 Sep 2021 12:36:52 -0700
Message-ID: <CALaUSutA42xfnnpLcNsYvE2-XH0qGA7zUPbYKJJFQE2yq1snYA@mail.gmail.com>
Subject: Re: Windows stuck in boot after WireGuard update (switch to
 WireGuardNT?)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>, 
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

We've seen these symptoms (infinitely spinning dots during bootup) at
least twice in the past week, but hadn't thought to link the behavior
to WireGuard. We had a third case this morning, and I can confirm that
the steps outlined by Oliver got the machine back to a bootable
condition. Thank you Oliver!

Before disabling the devices in Device Manager, we tried disabling the
WireGuard Tunnel service instead, but it still failed to boot.

The laptop that failed today is a Lenovo ThinkBook 15 G2 ITL
(20VE006UUS) laptop running Windows 10 Pro 20H2.
The laptops that failed previously are Lenovo ThinkBook 14s Yoga
2-in-1 (20WE001DUS) laptops.

We collected the WireGuard logs today while still in Safe Mode via
wireguard.exe /dumplog. I'll send those directly to the WireGuard team
off-list. We'll grab the setupapi logs as well when we get a chance
later today.

While this might be an issue with WireGuard for Windows, it's also
possible that the fault lies elsewhere, like a recent Windows update
or some other driver update. Like Oliver, we have BitLocker enabled on
these devices.

Joshua Sjoding
SCJ Alliance
IT Specialist

On Wed, Sep 22, 2021 at 12:00 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Oliver,
>
> Could you send the wireguard application log, as well as any other
> logs you find? Also \windows\inf\setupapi.*.log would help.
>
> Jason
