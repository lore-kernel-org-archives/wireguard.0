Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E6ECA0FF2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Aug 2025 08:33:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8535d111;
	Thu, 28 Aug 2025 08:29:26 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0465db63
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Aug 2025 08:29:24 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-3366307712dso6752721fa.1
 for <wireguard@lists.zx2c4.com>; Thu, 28 Aug 2025 01:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756369764; x=1756974564; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B5Th/iQWngsJVnHRpwahesda7fALtmjE58FcB98oNg0=;
 b=VAanhigoFM2BHgqEcK6tXeBj+I4iVitkxnnstbzYhWvkq+cUdMA59LJXU4hyUhk34O
 SiYv5f/a2U1o/njlLBNzzQvCM6v9CiW+0JbFsxQ0VK30eHVFCDEPsFw3jBNS/6j2BDvi
 xHYG+8aeeEbH904+71xVJJUS3SVfxuPsJHYDedn/2iQzNr/q4TjL427dyrdzV4MKOHnz
 XzPcdHuCnNt4XOr4tY4qMhdKquoSK5F5A+ZxIQnDEUm/LH5P9xKu4D3GFnInj//iyxid
 TKzfA2ehCagWwYuEYOkOh3Tc3jTJukm1zEh4f++WaIDRw/0uP4AhwSWhISoGW7dSVQaD
 Kyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756369764; x=1756974564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B5Th/iQWngsJVnHRpwahesda7fALtmjE58FcB98oNg0=;
 b=AOGrP5FooXVAV/SQSpVH2CkKiu0l+6wjtFfv0TYrioCut/XKqsrUjj/mAf8/LsEsd8
 nvJmkD9sYilHHMKGK0fYrIlFgr9DF3PNgQnrzurLXUtRVpcbq/G58aS4GulgIH337V6q
 +1kpN/lpQ961Fq15Ur/kZxbJDkuGO1sbnEvGQffpCp7ri84kVS+nydvQJJIEYGZ9hS9/
 4vqEHHE0mbNkpYVkq+ptY5lwaBgFhzni1ij+EY4INTEigd1UYPkUKy/rShW6XbOOsY/m
 HZiFvR9oZ/J05AgYpAUdGJm4vCvMUT+Wunv34mP10wIc1YnXgrwlahV//7Z1NNTpMvU7
 sF3g==
X-Gm-Message-State: AOJu0YzpzwB1/C4v9wLXgUOtanBg5LWG8aLRmOLBPftc6GHTuLoRhMlu
 DBANrQ9qUET5Lp30B8dVahuZg9T1TEneRS1Ta+ZTlKC8ueDzc4ospZPiA0lTj2zln/Qn4y37ANS
 xchYTFPTJ6eWmq/GoKmkFvY06Yh62MMMZkPGd
X-Gm-Gg: ASbGnct9LOmE3SUlJDsXnNzNR6/mtdNClfrQgg6JAib/1J3BKs4ReGOn/Soin/i3UhW
 aWP7Lxd/a/8xReiY9lEBWOV4lQWutQ69B7RelSyzOVRFVwrMcarJ4T+mqn47hVBd5VcpsuXdmap
 9l/5Dr9a/Jk5oatxSjKeXrsQofBLdjOBAoKUhVjUuam2XBB7tOg+GEwQXdRtO6j10ZzfqU0ZJ/a
 x/Mjy+1lioqUBQa+TbhSYpn9FvgDCi8z8NxClDdr3IOBar+Ov3WI9mfA4v/7W74FxccWdP3TohO
 ALlhm5DuliDjA+JrRbE=
X-Google-Smtp-Source: AGHT+IFBZKB9lcvjhg1RcMqwdv8GpZqL/Gq9L3jK8noSzSCYdNRFHsgQI7PW0T23C2OhCNuYRddZIVicTGRmb3F1Hjo=
X-Received: by 2002:a2e:b5c4:0:b0:336:9ff3:8488 with SMTP id
 38308e7fff4ca-3369ff385e2mr4035021fa.19.1756369763699; Thu, 28 Aug 2025
 01:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <CABBZOsmKJYs9HeaMeNx60om81V2mCagWWhCgbxeppr_2FD_xfw@mail.gmail.com>
 <CAMjhiJjtnyRt5khY9L0cCNXr969mbmLDoWhzAL1wvnmXziSH2A@mail.gmail.com>
In-Reply-To: <CAMjhiJjtnyRt5khY9L0cCNXr969mbmLDoWhzAL1wvnmXziSH2A@mail.gmail.com>
From: Houman <houmie@gmail.com>
Date: Thu, 28 Aug 2025 09:28:50 +0100
X-Gm-Features: Ac12FXxsnQyNGd1xOYkuRQheKhGbLOuw5DNbZxqoWjvbycE3njO8vG41a2jus_I
Message-ID: <CABBZOsmcr1_uVvgvowNVn5biT6ZENwFdjSxETabpV3-8Z3ytew@mail.gmail.com>
Subject: Re: Google Play 16KB alignment issue with WireGuard library - fix
 needed
To: Leon Woestenberg <leon@sidebranch.com>
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

I got this email from Google:

To ensure your app works correctly on the latest versions of Android,
Google Play requires all apps targeting Android 15+ to support 16 KB
memory page sizes.

From May 1, 2026, if your app updates do not support 16 KB memory page
sizes, you won't be able to release these updates.


Thanks,
Houman



On Thu, 28 Aug 2025 at 09:25, Leon Woestenberg <leon@sidebranch.com> wrote:
>
> On Thu, Aug 28, 2025 at 9:31=E2=80=AFAM Houman <houmie@gmail.com> wrote:
> >
> > Google PlayStore is no longer accepting apps affected by Google Play's
> > 16 KB page size requirements.
> >
> > The native library `arm64-v8a/libwg-go.so` (from
> > `com.wireguard.android:tunnel:1.0.20230706`) is not 16 KB aligned
> >
> From what I read, the requirement is not to rely on 4KiB (hard coded)
> page sizes.  Or are they going to hard-code 16KiB now??!
>
> https://android-developers.googleblog.com/2024/12/get-your-apps-ready-for=
-16-kb-page-size-devices.html
>
> -
> Leon.
