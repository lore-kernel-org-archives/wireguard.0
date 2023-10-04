Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4CCE7C4DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Oct 2023 16:08:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5072b320;
	Wed, 4 Oct 2023 16:05:29 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a608fc76
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Oct 2023 16:05:27 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-533d6a8d6b6so4379393a12.2
 for <wireguard@lists.zx2c4.com>; Wed, 04 Oct 2023 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696435527; x=1697040327; darn=lists.zx2c4.com;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gbInfi8EX8w7n1MIsX5nDcmmz9YYW0B8t6nCq7H8Iq0=;
 b=cvkpvJx8X42wlIMBUwyIp4iT+1jyk7AL8RgGTXGjgabjjAuWxGzkhYGGJf/wktuC2J
 IFu1KfB9W6nMOKZaThH93V5noXMKMM4i4aJyQRXVYF0HCEyb/d6e+YxdfzlDiBQSQknU
 4tRMOWnLl3XvlET9x3AsTLrOktHxUjTdH0iqtWtcV7jMSHjmm2QRZCZ/D3yRXLwCZ2gp
 rcu+aZZllFRtLQAHsUgQx6xHDW6xwhUl3xAFO3DRd3+5n1PNGLAoUzWUGjvjH16/SoIG
 Z5gUUU3P+ccxMqTQSUK7+pvC/h4DMxf/c9TmwEIQMB1dW1b8wlK0tKecTGxzWF/WGKf3
 UB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696435527; x=1697040327;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gbInfi8EX8w7n1MIsX5nDcmmz9YYW0B8t6nCq7H8Iq0=;
 b=K3pOXHsnJduIfTKPJtWYec4Cz9iGJYXp+EKMzIhgh4zthOm8SC0MxkGDJY7haq97zc
 +lm/BuZP1mNDTvKuu4djOz6ZBaiKgsX/o61tzPRp7Qov8TQH1q5jXzipqAcqgqjhIhvF
 7R8ilbc5onjeXqNcF6urzLDmIUuW2ojWr1LuirVqgxd2ItnbSs/RjhmonoHPVBT3ylzV
 4QCPGJGzybdp/mw0u6DNwFnNlnAy9xEowyT0cjjSXHAPNUGPL79YKS63r4CRng/h5xdQ
 lWHUSlltwM4vEecIWYbgoHVewOUHNF+XPVVeW/pw1NLy+dcRoVaLebFPpkBc7Gfx/QRU
 lQtw==
X-Gm-Message-State: AOJu0YyG2aOjgy7k9fyXeDzkDN+NS8GFUCRxOJYmAlJGv3vMWpFbWVpi
 zuvso/8S2/sGnv+30/MF7G+QBvJQpJ1NGUPCcZbhrFcTaLU0vfYx
X-Google-Smtp-Source: AGHT+IGV5kNQv9uzn7nkPIXVxMAtskUCYYJ15DnVpjNhG73bsIteYVUAOV/zmA3UlZsW8cLoFDNDm31joKBkQw7UDdo=
X-Received: by 2002:aa7:d451:0:b0:52f:b5c8:fa6a with SMTP id
 q17-20020aa7d451000000b0052fb5c8fa6amr2409908edr.20.1696435527165; Wed, 04
 Oct 2023 09:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <CABBZOskMb-6Lc9rAyuqQvYbs3HX-yGXoQHJHcrZzJrbRfsq1wg@mail.gmail.com>
 <DDB7ACE8-3757-43C1-B0B6-0FB9C53079E8@mullvad.net>
In-Reply-To: <DDB7ACE8-3757-43C1-B0B6-0FB9C53079E8@mullvad.net>
From: Houman <houmie@gmail.com>
Date: Wed, 4 Oct 2023 17:04:50 +0100
Message-ID: <CABBZOs=zEFGfLERL=JC1KtbZTka+1EitTHH9ZEdwkU95BYEHyA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Wireguard=2Dapple_1=2E0=2E16=2D27_can=E2=80=99t_be_added_via_S?=
 =?UTF-8?Q?PM?=
To: Andrej Mihajlov <and@mullvad.net>
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

Hello Andrej,

Thank you for your reply.  I have already forked the branch and set
Package.swift to swift-tools-version:5.5. But I still get the same
error as before.

Swift-tools-version:5.5 only worked with the previous version
1.0.15-26 that was released on 23rd Sep 2021.
The 1.0.16-27 that was tagged on 15th Feb 2023 is completely broken
and doesn't work with SPM.  I have tried swift-tools-versions 5.6,
5.7, 5.8 and 5.9.  I strongly believe that this commit from Jason
ccc7472fd7d1c7c19584e6a30c45a56b8ba57790 on 14th Feb 2023 has broken
it.  I don't think he tested it afterwards with SPM.

This (outdated) PR proves that more people are having problems with
installing the latest version since the February release:
https://github.com/WireGuard/wireguard-apple/pull/24

Error Message:
Invalid manifest (compiled with: "/Applications/Xcode
app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/us/bin/swift",
"visoverlay", "/ar/folders/9m/lwx244892997kpg7vb5vssh0000gn/T/TemporaryDirectory.
BBHXP8/vfs.yaml*, "-", "/Applicationscode.
app/Contents/SharedFrameworks/SwiftM.framework/SharedSupport/ManifestA*,
"PackageDescription, "-Xlinker", "-rath", "-Xlinker", "/Applicatio..

Xcode version: Version 15.0 (15A240d)
Mac version: 14.0 (23A344)

Your help is much appreciated,
Thanks,
Houman


On Wed, 4 Oct 2023 at 12:46, Andrej Mihajlov <and@mullvad.net> wrote:
>
> Hi,
>
> Right. I think that preamble in Package.swift should be changed from:
>
> > // swift-tools-version:5.3
>
> to at least:
>
> > // swift-tools-version:5.5
>
> Which works with Xcode 15 based on my experience.
>
> Jason could you please bump it?
>
> Best,
>
> Andrej
>
> > On 30 Sep 2023, at 21:09, Houman <houmie@gmail.com> wrote:
> >
> > Hello Jason, Andrej
> >
> > Please try to add the latest Wireguard-Apple 1.0.16-27 via Swift
> > Package Manager and you will see that fails. The issue could be
> > related to swift-tools-version.
> >
> > Please advise what to do?
> > Thank you.
> > Houman
>
