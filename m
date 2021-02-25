Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F98FC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 17:51:04 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 102E464F2F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 17:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 102E464F2F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f87c6e7f;
	Thu, 25 Feb 2021 17:50:59 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [2607:f8b0:4864:20::136])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9efb486f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 16:44:27 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id k2so5474320ili.4
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 08:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=6alDdAduoAB3GOQjlfxE/p3RLWHGxgUETT3XSyE0vtw=;
 b=VTYRDIBfagtKxRLLIbiyid3q9OUxB06ElJ4IaE8CLardZGWUj2YpHa5HwXIHrLsUav
 FtOhFyEauEUPZLel4OvDot04l3Nf/S2qjwwH62dh62vGg14Cy1fX7rsII48L/Lx1wnxF
 yhaqThkzU8r1O0ibH7eDlo6JoIC9Nj5oO/9Xl9cHN956NhH64RdUX6un7gQ3zamZZ2lN
 jIgKZalJiCCPUL8+Au5SrgTRafo6Z0v8Fbh9wC93sb5hCwFVH5sqBeOhQFugaQuqNcKA
 O8oARXdYbxvDR7THxNNuio5r04lb7aQPGEYRn9VDeiXEQNYEvms4lEjMcp4lntdHPVnT
 6cMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=6alDdAduoAB3GOQjlfxE/p3RLWHGxgUETT3XSyE0vtw=;
 b=Jx6iBQpRM+fZ6IB4+MVbNdbYaaENVe8ukCFuONTyre3m+l2rPTmhHWkB9Q27iPrgNm
 FKmBY2HcqbKjfcAbPfeBbHcHMo/RCSEd76ZN+gcdNjgOepm5/yOtoxgYWW1Ulb3XPMUh
 8FtxDyO+TFEbY+mwqExunEFVyvV91b4dOF18NzR3ZRgFIkliX8DD/MmsyAiBDc3qBlLG
 CTKOJlDmMqBM41A1kHFfybaJnxzMDT8MYMyz4Hdo7tiAuKqdQxVyygE3okE7/sFPylk9
 pAPvzHxrXXVI1tRXRJ5rksP12cV0HfDQmDCic1nmmMo3jL9VfJv9uJmXy6/21IEOY94i
 PWUA==
X-Gm-Message-State: AOAM531395sc8l4V7iykSoYQR37TjhZnrztAd8CrI7/Vh5pFvk3QottV
 8k0e8JVkADDs18E90dmFdIS0sXh8ZdaH76QNN6h5SbzVmQQ=
X-Google-Smtp-Source: ABdhPJx73S5kEOpF4BfgseAbju7rNYvIfiS7e1BoYQAC0FMackperlCGbFQ1O3EkmouQ135IPYYnNs8ekUL4qezAEbU=
X-Received: by 2002:a05:6e02:881:: with SMTP id
 z1mr3245074ils.288.1614271465981; 
 Thu, 25 Feb 2021 08:44:25 -0800 (PST)
MIME-Version: 1.0
References: <CADjMg7Vp+p7n_JLMfFU4GwtNu_X3ARFJOuhxLasonuD-fvB5Hg@mail.gmail.com>
 <CAHmME9o9YNUKawN8bYArdfbDF9cZF+1nSTZuMef5RRVeaPTrXQ@mail.gmail.com>
 <CADjMg7VHCX04+UgCY4AwLub5=otDJ9dTHMLdX16OVDZoDG88xQ@mail.gmail.com>
In-Reply-To: <CADjMg7VHCX04+UgCY4AwLub5=otDJ9dTHMLdX16OVDZoDG88xQ@mail.gmail.com>
From: Devanath S <s.devanath@gmail.com>
Date: Thu, 25 Feb 2021 08:42:58 -0800
Message-ID: <CADjMg7WuZ-W0bRPM9oCXT6CnVSdYK=fMRANna7XimtEkerOerw@mail.gmail.com>
Subject: Fwd: wireguard-go on windows
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 25 Feb 2021 17:50:58 +0000
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

Thank you for your prompt response.

We are trying to use wgctrl way of configuring the wireguard devices
and facing issues while creating/configuring the wireguard device on
windows.

1) First problem was while creating the wintun device using wintun.dll
and using wgctrl for configuring it.  It hangs in
wgclient.ConfigureDevice api()

2) So tried to first create the device through wireguard.exe. And then
used wgctrl way to configure it, but wgClient.Devices() is not able to
get the devices on our test windows boxes (even though it works on my
development machine)

So was trying to investigate how wireguard works on windows.  With
wgctrl package I was able to get it working on linux/mac, but facing
such issues on windows.  The reason for using wgctrl was to make it
configurable through our own APP.

Regard,
Dev

On Thu, Feb 25, 2021 at 7:54 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> I'm curious to learn what you're trying to debug this way; you're
> better off using wireguard-windows.
>
> The pipe permissions are too strict internally, it appears. Try
> running as Local System.
>
> Jason
