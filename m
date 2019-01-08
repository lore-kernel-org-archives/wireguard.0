Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2746C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 10:48:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DFDD2087E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 10:48:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/cVZkmg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DFDD2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3525aa14;
	Tue, 8 Jan 2019 10:44:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82f80f9f
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 10:44:49 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4b3aea6
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 10:44:49 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id g9so1719924plo.3
 for <wireguard@lists.zx2c4.com>; Tue, 08 Jan 2019 02:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n+s6rHDC3ClqegCGEpHfabHlpqCBuK0sSDDCNYuoGTM=;
 b=c/cVZkmgUECBxhapn9+rYAPe1tk6eQiXAzS5kHuoRhZIGEhPOEjrwjZqBSrgW0TG57
 RQ/CYnCvAa7nki4xHaOivUZfFPSPZeqRkzVX5BkG+GqKvQ3pVvsrHRXBrW4NBMJEn4cc
 WUhF1qM2EPFTbhdFigZdOeBc64siNahzda3NIbNKW9eyVogh8uPLLfP5uFDPkzcvGuIZ
 M61mFYhmBsHnV8CeWYqMAjxiQDBeTcCv/FjZymsMxft1qbIxVIktroWoLVtkgOMpzYT0
 zvhrKinCcyvelR/6lKCRc22isGNwC3Q1AXEQAot/+ueC+oxd3BFE8TcakVTRHpY+3IFW
 wWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n+s6rHDC3ClqegCGEpHfabHlpqCBuK0sSDDCNYuoGTM=;
 b=SkAuR3kxs41UnsIw0EVl3rGT9H4gA10rrXSnENg8NqqJszcYmBRZxRI1bnZH8TBB2A
 44PJpCmMkjJo/k7ptK4FJ2ASPPHVmjR7+MGfT8yKLriAQeHoTqcr3HdIakYkCVHOqAA4
 cqYBfgwNLT8DeLFvM7cNlrkqAX1HPM5ZfLcdMPQWzDQvlfZ9YDnK2/cL0aLqWODY7poA
 8WCvY+nV2apeJAH7MD83g9R0yxMq2j3qk5dkm89VdtHfyprjdMqhNEXHDeyyPdfLklnC
 vwLVukorhT9xdujRq1OP5FY2bYRW9qaTSf+c1YpIy6GrhLLqg57levd9K0gir+pfBrYA
 a5mw==
X-Gm-Message-State: AJcUukfBU9KnXt13I/6oXeFEYKS3ERSjAnIqhLA7f2eS2vTWIdSgOG+j
 2GPBOOln5uhqGjG/gNR45uAILUM7/RIi3ooXvfjbatbO
X-Google-Smtp-Source: ALg8bN6ZjpkqMbYfU4f2WBxQIXGcQ4rxpiGbMBobN3W8N6H6vRyVslJGbELSLgAUogAwQqpJSizxdoTYNPInrcXVGe4=
X-Received: by 2002:a17:902:b48b:: with SMTP id
 y11mr1211094plr.200.1546944476014; 
 Tue, 08 Jan 2019 02:47:56 -0800 (PST)
MIME-Version: 1.0
References: <CAHLp1Y=_RavxCeoV5nQ+R96GTiY+jF9gvNox25B2XO9CVU+jMQ@mail.gmail.com>
In-Reply-To: <CAHLp1Y=_RavxCeoV5nQ+R96GTiY+jF9gvNox25B2XO9CVU+jMQ@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 8 Jan 2019 11:47:44 +0100
Message-ID: <CAKXLc7f_aDxkasodm0YCBysd63we-L1FeTnsRoZbTvckzEUp0A@mail.gmail.com>
Subject: Re: [Android] Wireguard on the Amazon FireTV stick
To: Christophe-Marie Duquesne <chmd@chmd.fr>
Cc: wireguard <wireguard@lists.zx2c4.com>
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

On Tue, Jan 8, 2019 at 11:27 AM Christophe-Marie Duquesne <chmd@chmd.fr> wrote:
>
> Hi there,
>
> I tried to run Wireguard on the FireTV stick. The only other relevant reference I found for doing this was on reddit [1], where people recommended to use TunSafe. TunSafe is unfortunately still closed-souce (AFAIK), and the wireguard developers have already expressed negative opinions against it [2], so I would rather use the official app instead. I am reporting here so that people interested in doing the same thing find this thread and know what has been attempted.
>
Great!

> Here is where I am stuck:
> The FireTV stick can only be navigated with their remote control, which has a very basic keypad allowing to move from button to button with <up>, <left>, <down>, <right>. Unfortunately, once an interface is configured, I do not manage to navigate to the button to enable it.
>
I guess it allows also a full shell... adb shell ?
No way to plug USB keyboard?
Or better controller: https://www.youtube.com/watch?v=QfmuXuYI288

> And here are questions to the Wireguard Android devs:
> - Could you let me know which Intent is sent when one enables the interface? I would like to try to enable the interface from adb.
>
https://git.zx2c4.com/wireguard-android/tree/app/src/main/AndroidManifest.xml#n49
?

Kalin.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
