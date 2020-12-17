Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7756FC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 11:11:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268062389B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 11:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268062389B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad6f015b;
	Thu, 17 Dec 2020 11:02:09 +0000 (UTC)
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5d033b4c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 11:02:06 +0000 (UTC)
Date: Thu, 17 Dec 2020 11:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1608203434;
 bh=S1k32tXG9wVfLUHRfATWxEGY4FQjxw5EzG6j8y+TYZA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=k+xT8V8BMtuJrrSh6Id7/W+uTEf5nDQff3wzXh7wcVsipnBmTOtbgM8o+y1s650Fz
 4DRCJDTuFz92t1085bWqhVYRPLI7ny4/Ux2MlkQAgcEzm8OkeQk6h1UVirnT+qDpO2
 Zzg960K5dnzUusgpkXhai8cuNXoZ2BloH4rrhzh8=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: macOS update logic needs improving
Message-ID: <LvO7jEfvaClgGzkjlV_5oB0sX9g_SDTpPZ3BZkPQwfLNLasO7VeW6_A0yv451e6zCt3QSl9OruQXW0uUhzEZ7ERKBapva3EPHsrhVek8SYU=@protonmail.ch>
In-Reply-To: <CAHmME9qPofMW7tsSSdOXRPYR6fQG2vXwYAAfDEn=43tZGDiM_w@mail.gmail.com>
References: <Em6qFgnUJHoAWQmkBzNyZi4JA8DAd7Ylk0OANNRR1LVrZs8SzGAWkGCvyYj-jQPMTg3AV83_0oGW8Z40Uxm-KvseNM_CWXM9kQQLaOoOJPY=@protonmail.ch>
 <CAHmME9qPofMW7tsSSdOXRPYR6fQG2vXwYAAfDEn=43tZGDiM_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Yes all good.  Killed the tunnel and quit Wireguard and I'm now writing you=
 this from the shiny new version. ;-)


=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Thursday, 17 December 2020 10:33, Jason A. Donenfeld <Jason@zx2c4.com> w=
rote:

> Hi Laura,
>
> Thanks for letting me know. I was under the impression that we were
> handling this case
> https://git.zx2c4.com/wireguard-apple/tree/Sources/WireGuardApp/UI/macOS/=
MacAppStoreUpdateDetector.swift
> but maybe things broke in Big Sur.
>
> Were you able to eventually unlodge it and update, or did it remain stuck=
?
>
> Jason


