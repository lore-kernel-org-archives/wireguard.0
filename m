Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB706C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 26 Mar 2022 12:49:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 658ba22c;
	Sat, 26 Mar 2022 12:49:31 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 13e1843e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 26 Mar 2022 12:49:29 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so11073040pjf.1
 for <wireguard@lists.zx2c4.com>; Sat, 26 Mar 2022 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=XESGQmw2y1D73AGLlq64cqEDm3Bg1e8kZ2bquz6ZkS4=;
 b=j6V/Sj6fnc5U2PFuiB5G5MyWjxvxLRawMT4d8zdWfOjiOVt9d20CCzVImPd8atJyX1
 WLsinXEFJOMXKvUS54t6xCF3ME7dVmkRTugdxxsw0xA5LUp5Q16mF0Umx0SEhCddcrbS
 ontFmQB4OyBrRuxvVzZmi4qpK8G7jNMaj0K/76jHrFPiNyJ0rNJc5M/CLq82ZyEHG3ZU
 fddGDzxoU7JSBBnHFog6kp7j0srITmxN8X7H2A0g8scA4rcdgsi2nW/IF+WZ9L2MCBoh
 41PFGhAlxtj6jvsa6e/tnWE7iuts059JOHiycNZEpaGY3pUIetSlDzAls7qTLWHoivpj
 TDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=XESGQmw2y1D73AGLlq64cqEDm3Bg1e8kZ2bquz6ZkS4=;
 b=gmZo+ky5HNvlm8La9m8r7MjXVltqkMKWgf2i0Pfgm97ZA2/606ZOWgBUEMSTnRwxbn
 /fY+OxVGuZTX8Z5N+TloFLTZYJ7hZvCvODSDFdeK8Vxns4yZZDOKa8YkpK5AMKp5RYl8
 53mKXWF78xCpFw8+jpP5ZQGhhq0KScpaacQK+5LbZ6jIriwD/cS21C7aKMvM9yR0kOVw
 UVZWfksh059cM/EulPbsvvPRpBm71OAo2QHcsVAbQANBlq0Nj1n1urwo1n5gxR+nSce9
 fIRyQfWA2RcHV9MEO0cKy13KIxxMkk8Qfdo8qtvzgsCZ07caw+njL9OSEspK0KsjboH9
 PYzg==
X-Gm-Message-State: AOAM531ps/PR9ZImCg41iRx+zHz+MTPq1TtaTt1tcG0g5J4Z4ppLThFo
 6ie3mUJnhxLUA7YDScUEmp8pcxf07QuskRktKBl6EkO7K5k=
X-Google-Smtp-Source: ABdhPJz5UNpeDsuDw7eg593xjkVg5X4ssaXfurrPlN6hPjQPQOzHqUYFQH65xiuEL+suk3uVCG2R2rvatb98EzhrLVU=
X-Received: by 2002:a17:90b:17c3:b0:1c6:b0ff:abf with SMTP id
 me3-20020a17090b17c300b001c6b0ff0abfmr18172798pjb.24.1648298967723; Sat, 26
 Mar 2022 05:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <CABBZOsnPNS3ZONaTEWvye6sy+kA8rS3uNUm1UUnQgFkcY=aYXg@mail.gmail.com>
In-Reply-To: <CABBZOsnPNS3ZONaTEWvye6sy+kA8rS3uNUm1UUnQgFkcY=aYXg@mail.gmail.com>
From: Houman <houmie@gmail.com>
Date: Sat, 26 Mar 2022 12:48:51 +0000
Message-ID: <CABBZOs=2ntCHoNrcnv74yJEUjVPOeFABbwzFvH4KKeVkje8Nuw@mail.gmail.com>
Subject: Re: Is Wireguard supported on Mac Catalyst?
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Jason,

I hope all is well.

I was hoping to nudge you on this issue again to see if you could
clarify this, please.
Does Wireguard support Mac Catalyst (macOS 11.0) on the Apple repo?
https://github.com/WireGuard/wireguard-apple

Mac Catalyst is supported natively in Xcode and allows turning an iOS
app into a Mac app.

Many Thanks,
Houman

On Wed, 16 Mar 2022 at 13:28, Houman <houmie@gmail.com> wrote:
>
> Hello,
>
> The Wireguard project currently supports both iOS and MacOS natively.
> Now there is also the option of enabling Mac Catalyst inside an iOS
> target and making it Mac compatible. Without having to rewrite the
> code in Mac's AppKit.
>
> But does Wireguard support Catalyst?
>
> When I try to build the project with Catalyst enabled, I get this error:
>
> ld: library not found for -lwg-go
>
> I have been trying now for hours. It would be amazing to know if
> that's possible or not.
>
> Many Thanks,
> Houman
