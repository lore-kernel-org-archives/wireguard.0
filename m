Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BD5E8FDC3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Oct 2023 10:10:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0de01696;
	Thu, 5 Oct 2023 10:08:44 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 744f436b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2023 10:08:41 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53406799540so1333721a12.1
 for <wireguard@lists.zx2c4.com>; Thu, 05 Oct 2023 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696500521; x=1697105321; darn=lists.zx2c4.com;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E9lHC4yLk8k5ua4oETevaU5+LwILaYQtnc/BzI2h6v0=;
 b=R3d+pkhzm047eH9fHizM4EegPgAhN5KMeECdvm9MfiAa5f9PiNCBaZxa45CGPsrDn/
 aOVGZjiyzBfiHbgxLGbvdIZ78EX0a/A703NjfMSl/IHUInyxXpe3q4bVHnRl2c1yV0pO
 JBJ6QFZGeDIvQCzSCGev95SPwJK66tdz6eXAo9NCUTB33boE+BP5PE+YU/cQcHhUsL/j
 6ACewuO5v1RRR9rL6jBe873BWU7cqIUJjkYNKRvbEJ19Hw/x0EwMjc2WGtwmHJh6ox+V
 Qs0hBnCG7qTACJWJfCiXF6a2a4ACr0vMlDPpQZ5gmT+ayBswGtbgTYIrc0A4Gpw/deAg
 3oPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696500521; x=1697105321;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E9lHC4yLk8k5ua4oETevaU5+LwILaYQtnc/BzI2h6v0=;
 b=JMUGtLNOVF+WVDRtpLknyf5iE7h/n/mkRGn0m6/mpcxzi3LKYz4Ss+gomAQvTAk9bD
 urPmuz1qCM7iUK51UCTvBR85xp3ghS8CJcQOFig6kzdNeXhX6eGUtnJQcCllt8PCLxQw
 FEL3B/Ifu4u7O1WOvBcQhvjRiHMaw9YflwLB1TGBDpsv3PXS0q6+/mAyH2PrIlXZrdZb
 49noutNfiXxJlhd6vBVZF8qugE7Iaa9vNegwSOoQ06i5y8aZld7L58T8GbvBFJ9VyvTS
 CDbQwQr35GUpVck39FkqdeDzbpk6BqKmTl+CPsjmRlutPgEIU9JDrl/dabCSQtytbCpq
 lkWg==
X-Gm-Message-State: AOJu0YzNHNj0e5nP+maRakqF+4pnKo/Sp2k+Dk3GU3GCr094QM8FYfoh
 FB1F4+OaJ32DWskuTf7Oa+Lv0xt65ZXrprxK+UA=
X-Google-Smtp-Source: AGHT+IF+OKYVtU+tTpo5p8vPi0/Ud+0eR3fle4eecol1J9ywqLiGkkgJ7fLJV+pWFqkXzIrejiJ+Mghqa18HC9sHDyg=
X-Received: by 2002:aa7:d8d3:0:b0:52b:d169:b374 with SMTP id
 k19-20020aa7d8d3000000b0052bd169b374mr4200793eds.3.1696500520985; Thu, 05 Oct
 2023 03:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <CABBZOskMb-6Lc9rAyuqQvYbs3HX-yGXoQHJHcrZzJrbRfsq1wg@mail.gmail.com>
 <DDB7ACE8-3757-43C1-B0B6-0FB9C53079E8@mullvad.net>
 <CABBZOs=zEFGfLERL=JC1KtbZTka+1EitTHH9ZEdwkU95BYEHyA@mail.gmail.com>
 <C5E4F9F5-D489-4250-890A-3DE50ED09BE8@mullvad.net>
In-Reply-To: <C5E4F9F5-D489-4250-890A-3DE50ED09BE8@mullvad.net>
From: Houman <houmie@gmail.com>
Date: Thu, 5 Oct 2023 11:08:04 +0100
Message-ID: <CABBZOsnduGWGQFEPP=p4iPcLOzemXW2rzO5dc0NziNHZA11ZOA@mail.gmail.com>
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

Hi Andrej,

That's absolutely brilliant. Thank you for showing love to this
project. I have pointed my SPM to your repo and it worked right away.
What is the WireguardKitType?  That wasn't there before, but It seems
to be working even without adding that to my project.

I've starred your project too. Well done.

Best,
Houman





On Thu, 5 Oct 2023 at 10:28, Andrej Mihajlov <and@mullvad.net> wrote:
>
> Hi Houman,
>
> I maintain a fork of wireguard-apple for the past couple of years and it works with Xcode 15 and Swift 5.9:
> github.com/mullvad/wireguard-apple (branch: mullvad-master)
>
> In the app I maintain, WireGuardGoBridge target is built using bash script for flexibility, instead of bash sorcery so you might want this too:
> github.com/mullvad/mullvadvpn-app/blob/main/ios/build-wireguard-go.sh <http://github.com/mullvad/mullvadvpn-app/blob/main/ios/build-wireguard-go.sh>
>
> Hope any of this helps.
>
> Best,
> Andrej
>
> > On 4 Oct 2023, at 18:04, Houman <houmie@gmail.com> wrote:
> >
> > Hello Andrej,
> >
> > Thank you for your reply.  I have already forked the branch and set
> > Package.swift to swift-tools-version:5.5. But I still get the same
> > error as before.
> >
> > Swift-tools-version:5.5 only worked with the previous version
> > 1.0.15-26 that was released on 23rd Sep 2021.
> > The 1.0.16-27 that was tagged on 15th Feb 2023 is completely broken
> > and doesn't work with SPM.  I have tried swift-tools-versions 5.6,
> > 5.7, 5.8 and 5.9.  I strongly believe that this commit from Jason
> > ccc7472fd7d1c7c19584e6a30c45a56b8ba57790 on 14th Feb 2023 has broken
> > it.  I don't think he tested it afterwards with SPM.
> >
> > This (outdated) PR proves that more people are having problems with
> > installing the latest version since the February release:
> > https://github.com/WireGuard/wireguard-apple/pull/24
> >
> > Error Message:
> > Invalid manifest (compiled with: "/Applications/Xcode
> > app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/us/bin/swift",
> > "visoverlay", "/ar/folders/9m/lwx244892997kpg7vb5vssh0000gn/T/TemporaryDirectory.
> > BBHXP8/vfs.yaml*, "-", "/Applicationscode.
> > app/Contents/SharedFrameworks/SwiftM.framework/SharedSupport/ManifestA*,
> > "PackageDescription, "-Xlinker", "-rath", "-Xlinker", "/Applicatio..
> >
> > Xcode version: Version 15.0 (15A240d)
> > Mac version: 14.0 (23A344)
> >
> > Your help is much appreciated,
> > Thanks,
> > Houman
> >
> >
> > On Wed, 4 Oct 2023 at 12:46, Andrej Mihajlov <and@mullvad.net> wrote:
> >>
> >> Hi,
> >>
> >> Right. I think that preamble in Package.swift should be changed from:
> >>
> >>> // swift-tools-version:5.3
> >>
> >> to at least:
> >>
> >>> // swift-tools-version:5.5
> >>
> >> Which works with Xcode 15 based on my experience.
> >>
> >> Jason could you please bump it?
> >>
> >> Best,
> >>
> >> Andrej
> >>
> >>> On 30 Sep 2023, at 21:09, Houman <houmie@gmail.com> wrote:
> >>>
> >>> Hello Jason, Andrej
> >>>
> >>> Please try to add the latest Wireguard-Apple 1.0.16-27 via Swift
> >>> Package Manager and you will see that fails. The issue could be
> >>> related to swift-tools-version.
> >>>
> >>> Please advise what to do?
> >>> Thank you.
> >>> Houman
> >>
>
