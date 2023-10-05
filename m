Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7AAE93701
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Oct 2023 10:41:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b7e7b54;
	Thu, 5 Oct 2023 10:36:14 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 93227704
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2023 10:36:11 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9b9a494cc59so144658566b.3
 for <wireguard@lists.zx2c4.com>; Thu, 05 Oct 2023 03:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad.net; s=july2021; t=1696502171; x=1697106971; darn=lists.zx2c4.com;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u4QMk02cLz/bZ7X3NZrlOKH7nlarTKp4sKPFJyNsmWQ=;
 b=Y86HFySPnwJDCp7BOpW8Yri620R6bG5Z2+t2Watqiyyr5S3EKC6aUY6xEPCf0UEbcI
 nALJWEgKiP+20ucGE5vFrD45SiAIJPbYUmN7Fwkk3cCaQw2KFV+D2R5txhVGHPXBPaX6
 HzyxldU6TNjHaT2goJ1wrLxKvcBvgn/VRhlj1uficZ8JdhxZvup9a3iHUtr7zuRm4KlW
 7bWhzFHpAiF+MvQ9iDTxJUK+Bxm+N7bAKnlinmakiFm5crtOpCJdzf6TpfbRBOealeQj
 Z9RimefgzcySWiqtyWnItuzG1rJVvgB6bDHUI/tNGtmyNujHZI/KJanBuBVf+7HyIjc8
 xu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696502171; x=1697106971;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u4QMk02cLz/bZ7X3NZrlOKH7nlarTKp4sKPFJyNsmWQ=;
 b=qi9usWhfP6RsYPnsAD1FDs0IceLCWNGgBdbeJNoK1aPl0dmiRWaD8Oe5BTLpOHeGhH
 PwbdeJTLt35+tGzL90xRr+udyTypnr543FZYmbdthmqjyDeFbsWsl3ynrDPfu2ntbAmc
 d/cSNO0FH6qGYVkUBCTRpHvYldPzHWOACnSDL3Ye8xilo4OZPblDZtwTajfgTOVN1VvU
 d55891ZAXA2ZjJyUSGtfVSy6PLE5o9fKpMAtaiemPf5OOr6nWKyRN7bQV5fNAc675VQ8
 qObZVUhS1maeiPyiyfTvAy4dkw1oDhK2dtO1Qmg7lU7KsD4tXrG1I4R6kzAcA2REBfYH
 1FYw==
X-Gm-Message-State: AOJu0YyQCkFBFnf7XoKTVIcCz88qmGcXiIvIIEpyuVinNmwHK0u0AMdO
 r/FaLXGZhmIQsRwrrU0DY/n/rf8vJk6yNU6ZA20QWg==
X-Google-Smtp-Source: AGHT+IG8AU2mRf6x67mDmHjaHD0tYytA/gSpesvcPmu9UPj+8HlBCskTDVodJ/e9+c9G+TTJpxb6kQ==
X-Received: by 2002:a17:906:196:b0:9ae:72b8:4a84 with SMTP id
 22-20020a170906019600b009ae72b84a84mr4155000ejb.41.1696502171529; 
 Thu, 05 Oct 2023 03:36:11 -0700 (PDT)
Received: from smtpclient.apple (84-52-158-57.dynamic.telemach.net.
 [84.52.158.57]) by smtp.gmail.com with ESMTPSA id
 c17-20020adfe751000000b00327de0173f6sm1469641wrn.115.2023.10.05.03.36.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Oct 2023 03:36:11 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: =?utf-8?Q?Re=3A_Wireguard-apple_1=2E0=2E16-27_can=E2=80=99t_be_ad?=
 =?utf-8?Q?ded_via_SPM?=
From: Andrej Mihajlov <and@mullvad.net>
In-Reply-To: <CABBZOsnduGWGQFEPP=p4iPcLOzemXW2rzO5dc0NziNHZA11ZOA@mail.gmail.com>
Date: Thu, 5 Oct 2023 12:35:59 +0200
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B97F367-1E1C-4F13-AC03-3611511899EA@mullvad.net>
References: <CABBZOskMb-6Lc9rAyuqQvYbs3HX-yGXoQHJHcrZzJrbRfsq1wg@mail.gmail.com>
 <DDB7ACE8-3757-43C1-B0B6-0FB9C53079E8@mullvad.net>
 <CABBZOs=zEFGfLERL=JC1KtbZTka+1EitTHH9ZEdwkU95BYEHyA@mail.gmail.com>
 <C5E4F9F5-D489-4250-890A-3DE50ED09BE8@mullvad.net>
 <CABBZOsnduGWGQFEPP=p4iPcLOzemXW2rzO5dc0NziNHZA11ZOA@mail.gmail.com>
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

Houman,

Great!=20

I have added WireguardKitType as a dynamic library which contains all of =
the Swift data types used by WireGuardKit, such as: PrivateKey, =
PublicKey, IPAddressRange, etc.

It does not depend on WireGuardGoBridge, which proved to be problematic =
to include in unit tests (if I recall that right). Apart from that I =
noticed that go runtime spawns some worker threads when binary is linked =
against wg-go, so we didn=E2=80=99t want that in our main bundle or app =
extensions.

So in short, when using any of data types provided by WireGuardKit:

- Import WireGuardKitTypes in main bundle or app extensions.
- Import WireGuardKit in network extension. Internally WireGuardKit =
re-exports all types from WireGuardKitTypes.

There is a handful of other improvements besides that and I hope that =
all of them will be upstreamed over time.

Best,
Andrej

> On 5 Oct 2023, at 12:08, Houman <houmie@gmail.com> wrote:
>=20
> Hi Andrej,
>=20
> That's absolutely brilliant. Thank you for showing love to this
> project. I have pointed my SPM to your repo and it worked right away.
> What is the WireguardKitType?  That wasn't there before, but It seems
> to be working even without adding that to my project.
>=20
> I've starred your project too. Well done.
>=20
> Best,
> Houman
>=20
>=20
>=20
>=20
>=20
> On Thu, 5 Oct 2023 at 10:28, Andrej Mihajlov <and@mullvad.net> wrote:
>>=20
>> Hi Houman,
>>=20
>> I maintain a fork of wireguard-apple for the past couple of years and =
it works with Xcode 15 and Swift 5.9:
>> github.com/mullvad/wireguard-apple (branch: mullvad-master)
>>=20
>> In the app I maintain, WireGuardGoBridge target is built using bash =
script for flexibility, instead of bash sorcery so you might want this =
too:
>> github.com/mullvad/mullvadvpn-app/blob/main/ios/build-wireguard-go.sh =
<http://github.com/mullvad/mullvadvpn-app/blob/main/ios/build-wireguard-go=
.sh>
>>=20
>> Hope any of this helps.
>>=20
>> Best,
>> Andrej
>>=20
>>> On 4 Oct 2023, at 18:04, Houman <houmie@gmail.com> wrote:
>>>=20
>>> Hello Andrej,
>>>=20
>>> Thank you for your reply.  I have already forked the branch and set
>>> Package.swift to swift-tools-version:5.5. But I still get the same
>>> error as before.
>>>=20
>>> Swift-tools-version:5.5 only worked with the previous version
>>> 1.0.15-26 that was released on 23rd Sep 2021.
>>> The 1.0.16-27 that was tagged on 15th Feb 2023 is completely broken
>>> and doesn't work with SPM.  I have tried swift-tools-versions 5.6,
>>> 5.7, 5.8 and 5.9.  I strongly believe that this commit from Jason
>>> ccc7472fd7d1c7c19584e6a30c45a56b8ba57790 on 14th Feb 2023 has broken
>>> it.  I don't think he tested it afterwards with SPM.
>>>=20
>>> This (outdated) PR proves that more people are having problems with
>>> installing the latest version since the February release:
>>> https://github.com/WireGuard/wireguard-apple/pull/24
>>>=20
>>> Error Message:
>>> Invalid manifest (compiled with: "/Applications/Xcode
>>> =
app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/us/bin/swift",
>>> "visoverlay", =
"/ar/folders/9m/lwx244892997kpg7vb5vssh0000gn/T/TemporaryDirectory.
>>> BBHXP8/vfs.yaml*, "-", "/Applicationscode.
>>> =
app/Contents/SharedFrameworks/SwiftM.framework/SharedSupport/ManifestA*,
>>> "PackageDescription, "-Xlinker", "-rath", "-Xlinker", "/Applicatio..
>>>=20
>>> Xcode version: Version 15.0 (15A240d)
>>> Mac version: 14.0 (23A344)
>>>=20
>>> Your help is much appreciated,
>>> Thanks,
>>> Houman
>>>=20
>>>=20
>>> On Wed, 4 Oct 2023 at 12:46, Andrej Mihajlov <and@mullvad.net> =
wrote:
>>>>=20
>>>> Hi,
>>>>=20
>>>> Right. I think that preamble in Package.swift should be changed =
from:
>>>>=20
>>>>> // swift-tools-version:5.3
>>>>=20
>>>> to at least:
>>>>=20
>>>>> // swift-tools-version:5.5
>>>>=20
>>>> Which works with Xcode 15 based on my experience.
>>>>=20
>>>> Jason could you please bump it?
>>>>=20
>>>> Best,
>>>>=20
>>>> Andrej
>>>>=20
>>>>> On 30 Sep 2023, at 21:09, Houman <houmie@gmail.com> wrote:
>>>>>=20
>>>>> Hello Jason, Andrej
>>>>>=20
>>>>> Please try to add the latest Wireguard-Apple 1.0.16-27 via Swift
>>>>> Package Manager and you will see that fails. The issue could be
>>>>> related to swift-tools-version.
>>>>>=20
>>>>> Please advise what to do?
>>>>> Thank you.
>>>>> Houman
>>>>=20
>>=20

