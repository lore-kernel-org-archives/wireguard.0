Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96AFE82CDE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Oct 2023 09:28:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccaf250c;
	Thu, 5 Oct 2023 09:28:19 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 652da7a1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2023 09:28:16 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40684f53ef3so6949425e9.3
 for <wireguard@lists.zx2c4.com>; Thu, 05 Oct 2023 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad.net; s=july2021; t=1696498096; x=1697102896; darn=lists.zx2c4.com;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFKIJuk6CfgeRW+t/sPFOi0WK29ckLp3PYMyfUzWtYc=;
 b=TRD5aVGfoVqfjXBgwhnxW2KSfQFIoZ/Lkf43Jpp5IERxPHTgWI078MHtiTVeChKv23
 oPep3rvJFoJkcCb3gFxBWNBxiGIEUPkiUqJUUDHp1uLtZNxV8rY7D7pRXAKzeG8EKVUt
 D5U9l8o3LKc9uvzsRy9jw4xDaNukFYpHPXcQoc4ibDvAPm1xbRxGupukRBbUhAVbDX1z
 nVvh9e29l5A5uoyz8QFT23sPZreV/GWVrPXzLzEY4c4apvLRBN0mo4c0Oth/m7/UeFs/
 WZcONT27CuknGd8ydMtkJm4BejLyTtpLL4whD6dLAUplwnMVC2sSp4z9WAOp1XGpu+52
 O65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696498096; x=1697102896;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XFKIJuk6CfgeRW+t/sPFOi0WK29ckLp3PYMyfUzWtYc=;
 b=qLyaz2X7Qk7HAdZW3Hskc631D1wwJL8tAaGNmLjf34uFRZHYfYzVjI56lmmDz0f98y
 +IRSJknaZUngnqCcVZH90Nr4tjCUxY88qLQMenQI0VXCQOVEZxelnc2M+QrVcGe/2Iw3
 LOjvuzAVKJQpUShXLLA+WHApKBtVtS2bt3zkt/CMRhRsPqGcndpiDOuM/Pm2z8NThNBQ
 T0PLixFgy6iCtkezpD6BCKyeWkU5O06eiPuW0CfTs5d8ujxYK3C2xm69BfA1MNDFjkf5
 35XFa83IRuzp+nx28Ocb6plRILizOkAxufcJ/0CwERTHvwaiUEpfFgaqnJl/OzmoNM78
 K3zA==
X-Gm-Message-State: AOJu0Yy+CD7KdRMCsIMx0hK7lJrQ3I4lGIyML6/+I8dP0ZKHkukSVuFl
 /ArhBw7iunxQ0OFiU/JFb63nwg==
X-Google-Smtp-Source: AGHT+IFkSNhdeZamvUWrA89MK0irpGy1GHJ7ArOrdCfoNzVhPTXEKD+wpjsQMhEKra3MOOLRUCINcg==
X-Received: by 2002:a05:600c:b4b:b0:405:3f06:c084 with SMTP id
 k11-20020a05600c0b4b00b004053f06c084mr4389281wmr.13.1696498095908; 
 Thu, 05 Oct 2023 02:28:15 -0700 (PDT)
Received: from smtpclient.apple ([176.76.225.239])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b00405935b417asm3367281wmf.2.2023.10.05.02.28.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Oct 2023 02:28:15 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: =?utf-8?Q?Re=3A_Wireguard-apple_1=2E0=2E16-27_can=E2=80=99t_be_ad?=
 =?utf-8?Q?ded_via_SPM?=
From: Andrej Mihajlov <and@mullvad.net>
In-Reply-To: <CABBZOs=zEFGfLERL=JC1KtbZTka+1EitTHH9ZEdwkU95BYEHyA@mail.gmail.com>
Date: Thu, 5 Oct 2023 11:28:03 +0200
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C5E4F9F5-D489-4250-890A-3DE50ED09BE8@mullvad.net>
References: <CABBZOskMb-6Lc9rAyuqQvYbs3HX-yGXoQHJHcrZzJrbRfsq1wg@mail.gmail.com>
 <DDB7ACE8-3757-43C1-B0B6-0FB9C53079E8@mullvad.net>
 <CABBZOs=zEFGfLERL=JC1KtbZTka+1EitTHH9ZEdwkU95BYEHyA@mail.gmail.com>
To: Houman <houmie@gmail.com>
X-Mailer: Apple Mail (2.3731.700.6)
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

Hi Houman,

I maintain a fork of wireguard-apple for the past couple of years and it =
works with Xcode 15 and Swift 5.9:
github.com/mullvad/wireguard-apple (branch: mullvad-master)

In the app I maintain, WireGuardGoBridge target is built using bash =
script for flexibility, instead of bash sorcery so you might want this =
too:=20
github.com/mullvad/mullvadvpn-app/blob/main/ios/build-wireguard-go.sh =
<http://github.com/mullvad/mullvadvpn-app/blob/main/ios/build-wireguard-go=
.sh>

Hope any of this helps.

Best,
Andrej

> On 4 Oct 2023, at 18:04, Houman <houmie@gmail.com> wrote:
>=20
> Hello Andrej,
>=20
> Thank you for your reply.  I have already forked the branch and set
> Package.swift to swift-tools-version:5.5. But I still get the same
> error as before.
>=20
> Swift-tools-version:5.5 only worked with the previous version
> 1.0.15-26 that was released on 23rd Sep 2021.
> The 1.0.16-27 that was tagged on 15th Feb 2023 is completely broken
> and doesn't work with SPM.  I have tried swift-tools-versions 5.6,
> 5.7, 5.8 and 5.9.  I strongly believe that this commit from Jason
> ccc7472fd7d1c7c19584e6a30c45a56b8ba57790 on 14th Feb 2023 has broken
> it.  I don't think he tested it afterwards with SPM.
>=20
> This (outdated) PR proves that more people are having problems with
> installing the latest version since the February release:
> https://github.com/WireGuard/wireguard-apple/pull/24
>=20
> Error Message:
> Invalid manifest (compiled with: "/Applications/Xcode
> =
app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/us/bin/swift",
> "visoverlay", =
"/ar/folders/9m/lwx244892997kpg7vb5vssh0000gn/T/TemporaryDirectory.
> BBHXP8/vfs.yaml*, "-", "/Applicationscode.
> =
app/Contents/SharedFrameworks/SwiftM.framework/SharedSupport/ManifestA*,
> "PackageDescription, "-Xlinker", "-rath", "-Xlinker", "/Applicatio..
>=20
> Xcode version: Version 15.0 (15A240d)
> Mac version: 14.0 (23A344)
>=20
> Your help is much appreciated,
> Thanks,
> Houman
>=20
>=20
> On Wed, 4 Oct 2023 at 12:46, Andrej Mihajlov <and@mullvad.net> wrote:
>>=20
>> Hi,
>>=20
>> Right. I think that preamble in Package.swift should be changed from:
>>=20
>>> // swift-tools-version:5.3
>>=20
>> to at least:
>>=20
>>> // swift-tools-version:5.5
>>=20
>> Which works with Xcode 15 based on my experience.
>>=20
>> Jason could you please bump it?
>>=20
>> Best,
>>=20
>> Andrej
>>=20
>>> On 30 Sep 2023, at 21:09, Houman <houmie@gmail.com> wrote:
>>>=20
>>> Hello Jason, Andrej
>>>=20
>>> Please try to add the latest Wireguard-Apple 1.0.16-27 via Swift
>>> Package Manager and you will see that fails. The issue could be
>>> related to swift-tools-version.
>>>=20
>>> Please advise what to do?
>>> Thank you.
>>> Houman
>>=20

