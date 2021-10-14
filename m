Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B717CC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 03:48:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B388B60F93
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 03:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B388B60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e10998b;
	Thu, 14 Oct 2021 03:48:25 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 05028563
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 03:48:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m22so15164182wrb.0
 for <wireguard@lists.zx2c4.com>; Wed, 13 Oct 2021 20:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zTzDkh16Jv8MM74+0Njh0p9DJHNYeXEKdRyqUpKdIaI=;
 b=jucgt1JhK0hmxcPRYfrlbTb6aoT6dZSlZdyks3FAeY66XhkXZCFf00LwZimLs0Qs3Z
 Cy1OOW6AKakLeb5DpK70wSKD1WkFuKpXgF5i+8MM8c6mxq/EUKotq0M9nYd8AKGyVmO6
 u/hr8lsY5wc7KZt14kcQ7BmTzoB5SBLjfphr3OG35sO0m7xHE/ASOH+g/T0tkLvCH1WX
 1II9NGJ8kRvft7lUFwoY4x6nL5WWNrPqpirGeuAmX9n4sT79JorluIOKydq4qEftaN1K
 nQ3GBOz0ZX7KxfwjuxYFLcnWueO6K+g8bMjRmcNDqjFuNKpvPvxKjKuXqL3F3a8CcQ88
 Yt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zTzDkh16Jv8MM74+0Njh0p9DJHNYeXEKdRyqUpKdIaI=;
 b=aspVUpj8mU51LFDciXdG95o6MLHJFetz36vEmRmsDaaNmO0X5p4OVVkIFIOknY1aV+
 10me9W6Euqh3zzhYgxOfHYNTHjNHpWdt3kJZIaSRizeg7gp1YB8yO9yhvoQVya/CYm5B
 Q+7o3guV7vPbdYvY4zRczXKCbjriDVqgoxAUNKV9LgV3SPdVyJSCmW6f8SMN4eQsMJv2
 qdCM9pbUsbj+v+GWU4rfSGSNJAv8etbvJZtaGD4vy8yCs/bybiZoAy+DOzPM4w0Gg6Tc
 OvTO5qSwq18MgE6xPFXdOh+KZmI+4aHjG/+V0DrSaHSbHxNuoQZUNJ/X0wlhCPiXL4gb
 8dyQ==
X-Gm-Message-State: AOAM532Xx2z7/VZlimul1/Akuflwai5dPcrhgANqTaGH5y5T2OxEtHVL
 hCvVOE0eChFhjvMxA7tDA2lMpmjI98qOE2UQj8BXi8cC583OGg==
X-Google-Smtp-Source: ABdhPJx1+tV55K7s5XCvwwoluDbM+SwCLqSzcafrkmx582rzw3ahHCUQ+RYmJSrxocZvwjln4xIA7pW1kOnH4gEIwqQ=
X-Received: by 2002:adf:a48c:: with SMTP id g12mr3690060wrb.341.1634183303429; 
 Wed, 13 Oct 2021 20:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <b28e05e1-4209-8b82-1b00-e963b2e8fc85@m7n.se>
In-Reply-To: <b28e05e1-4209-8b82-1b00-e963b2e8fc85@m7n.se>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Thu, 14 Oct 2021 12:48:10 +0900
Message-ID: <CAA2ss9HGhumPcQ-wNZMvf1fmyrTxgv5L3rBsuToaBKdaVL9vJw@mail.gmail.com>
Subject: Re: [PATCH] wireguard-tools: embeddable-wg-library: add named
 wg_endpoint union
To: mikma.wg@lists.m7n.se
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

Your patch is being sent in an undesirable way, so I think it will not
be reviewed.
In this page, contributing to wireguard-tools requires
`git-send-email`, so you should include the patch file in the body of
the email, rather than attaching it.
https://www.wireguard.com/repositories/

Here is an example how to use `git send-email`
https://git-scm.com/docs/git-send-email#_examples

Hope this help.

2021=E5=B9=B410=E6=9C=8811=E6=97=A5(=E6=9C=88) 6:24 <mikma.wg@lists.m7n.se>=
:
>
> Hello,
>
> It would be useful to have a named wg_endpoint type in the embeddable wg
> library. It's added by the attached patch.
>
> /Mikael
>
