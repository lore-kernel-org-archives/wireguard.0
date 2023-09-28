Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA13C001E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Oct 2023 14:24:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6772828a;
	Mon, 23 Oct 2023 14:07:37 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fb6ba337
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Sep 2023 10:36:41 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-41959feaae2so25435341cf.0
 for <wireguard@lists.zx2c4.com>; Thu, 28 Sep 2023 03:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=instasafe.com; s=google; t=1695897400; x=1696502200; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNBOL2F1ThT4nNV98bOyO5t2CdHFYKjLfju0V5QMrcc=;
 b=jQIJWZ+kUrTLq94zaiU3cpw/jFskxgB9zJze4aVg39sNmUihHao77q6gS7qIru+X5r
 Am5AyZS3X1WOLQx/heL1MobKnoO1pIokqmD8X3CB08iz1I69rhqehqaxFQTdAj0tUF9i
 TYo/Fnuax7UpaeDWqGwTdfYc1LyRxSyebTmTQbyCR0BCjLPSOnyE9YnoEO9E+WQxEQ46
 lG24GrszoI1RLCUgu2VCdyCPJwXrRkBSIlIHfeitjSPW4MAVMBfUEbfm23TkRunZHB/8
 eGOJs5Njfo0t0uBMNkFU9s/3Ix0e+u/AzV8OgIVpmOGhJuqNa7GSxVdkM1fNh1Fom1gE
 +8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695897400; x=1696502200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNBOL2F1ThT4nNV98bOyO5t2CdHFYKjLfju0V5QMrcc=;
 b=l3PWtydYRwCbdAUBLhkquH+6HcIkgx/bi2POIj1rWEIPKz8TSTeJ0hpg+4ul7sHq/S
 HNRsxFlZnpis/QwtugBD1zggV8J97EstEiQyEGPH5F6am9dCBl4/WZXo65+d4EB6ljGw
 v6iiMu+VO0vM9klSdDQH9JxoUzlCnWDXfnyqwJx1hznQyI+GZay8RuOKcJ3Nkllqbd+3
 k6ZUo7CbLqAn4CREC8NPXfjejA5CAKQTOnVymSiK7Fp3ZNoEUJ5tpmq9du1BRqLWv6+K
 hCb4+FbJ4DyLFr4r4CaAw1vnUoDLbaaZIbveNrRx0nHVIXD+gl8zoWUhLR1uOEdcDSfP
 5OlA==
X-Gm-Message-State: AOJu0Yy8Kak1PA3zfJY1YP7qhHGQ8CYml4U8o9R7GUT4Vf7gxT0wdqmw
 3uJ6W4GSgOqKJMQHitOTkfh3krb+nmQRJ+UPAmPG+w==
X-Google-Smtp-Source: AGHT+IFZmKCn0cT1vMbqRRZmOWrCUimHrnfT6+MViyrpKhDonf2bghImu7hjqGoKZ9WTK2/aDFKNRuBxwKq1YPloueY=
X-Received: by 2002:a05:622a:1445:b0:410:60a4:ffc7 with SMTP id
 v5-20020a05622a144500b0041060a4ffc7mr821473qtx.10.1695897399942; Thu, 28 Sep
 2023 03:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <BD851A2D-7FFC-4E84-801D-863F53198E8C@sec.uni-passau.de>
 <CAFVpa6fKk8YbSPsTdKL-OkO6uPmqahSGsQ7QmDYg949xKdsxhQ@mail.gmail.com>
In-Reply-To: <CAFVpa6fKk8YbSPsTdKL-OkO6uPmqahSGsQ7QmDYg949xKdsxhQ@mail.gmail.com>
From: Venkatakrishna S <venkata@instasafe.com>
Date: Thu, 28 Sep 2023 16:06:29 +0530
Message-ID: <CAFVpa6erJXXZixOXSFzG8yF5fd8=m5U3hAPDAOi5x1jH4nXiTA@mail.gmail.com>
Subject: Re: MAC OS 14 / Sonoma
To: "Posegga, Joachim" <jp@sec.uni-passau.de>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:07:27 +0000
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

Hey,

Not facing issues with VPN , but have some macOS service related
issues for VPN. The service handles VPN for me.

Thanks & RegardsVenkatakrishna S


On Thu, Sep 28, 2023 at 4:05=E2=80=AFPM Venkatakrishna S <venkata@instasafe=
.com> wrote:
>
> Hey,
>
> Not facing issues with VPN , but have some macOS service related issues f=
or VPN. The service handles VPN for me.
>
> Thanks & Regards
> Venkatakrishna S
>
> On Thu, Sep 28, 2023 at 3:28=E2=80=AFPM Posegga, Joachim <jp@sec.uni-pass=
au.de> wrote:
>>
>> Hi,
>>
>> I cannot route traffic through established WG tunnels after upgrading to=
 macOS 14.0 Sonoma (23A344). Anyone having similar issues?
>>
>>   Joachim.
>>
