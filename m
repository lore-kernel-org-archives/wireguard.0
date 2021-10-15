Return-Path: <SRS0=FZ0+=PD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6734EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 19:58:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8395061151
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 19:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8395061151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e5c5b07;
	Fri, 15 Oct 2021 19:58:51 +0000 (UTC)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [2a00:1450:4864:20::141])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a2f04187
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Oct 2021 19:58:49 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j21so46682858lfe.0
 for <wireguard@lists.zx2c4.com>; Fri, 15 Oct 2021 12:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UsnezzBBB6CVq52PVsHsA2VZ1oGCdLH6XEuXKi7HDsQ=;
 b=XV6c0TTat18crQIOmeonO1ZPsVhTnjAYwOHiSRVsvhaAnDgKKdCnHBgmlO0Dh8Hd/d
 j9U38f2CE22Ll0DZvH+X65Z5KIC9+KElf8Q2KIpZY4oLcSgmuFtXgE3JdULcY/ogzdLM
 qM0+IW7e5VSw0I9mg1XQxFh2cVk5V4a3WmoYiVrHtu4iWfNW/5g7MuYyXNug4gcVIIHU
 rU6hc8ggb5/h3J4NVShR6CFhzy4HyVPKP7t1vXeN63cGwTnOa+7Qs6YVTObxbLQvScSL
 bEJf7JVyf756qYpN+XZ/tp94llLW6bZxa3VMAF0jdCDKQS0zePDHqpiWQRH0eO39c+VP
 Gjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UsnezzBBB6CVq52PVsHsA2VZ1oGCdLH6XEuXKi7HDsQ=;
 b=bh+na0j2zT95WD7l6u9bffOFyV42RegPNwmoYo8yBJ4aTDKb87etP9zu5JfFfteHz8
 EVpW3kUPtlD9NYszztEMfHHe8g8QEddRTkIroMUIuOpp3p8iCrZy03Iy4fnIxvpp6cH4
 jcimKxrQB7PzoV7w27IP/G2iRk/jpsL4B6XDhaDqNfOnLKT6g8C8jC5zePC/sFCFBRNg
 sWNAwgVxGWZqtBvUfTTKYE2ACgiF8mWYhgSwgR9TYZ8flBnXeJFNL1nwQPhTLSqQQwk4
 x9Eq2c7aowDtYCnxblGYwioJn45Hsl7oPN79z2Joa4zjWg+cWtygjDGXQCk7/WwfpeDP
 EEsA==
X-Gm-Message-State: AOAM5311JlKiaKSTNhDdV+rZx4sAaj3qzmL8vmT+pKslFeIYegvf/ZKI
 aN74To0ofhBoa7DILlEZGrHnyIyPQFx2o+D4cVI=
X-Google-Smtp-Source: ABdhPJxjisJ59aIeEnqrek4iTLgSF+pti4zQt20XoTs95LdNu4wk+i8ld1SO1yOQgi1oSjW3NxNP6Xm9e9hMgQo03ys=
X-Received: by 2002:a05:6512:3b88:: with SMTP id
 g8mr13622214lfv.546.1634327928366; 
 Fri, 15 Oct 2021 12:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9p9XxAhh4WgZgRiMRFxahp2wabPr-KuW=AdVQyRsHaD+A@mail.gmail.com>
In-Reply-To: <CAHmME9p9XxAhh4WgZgRiMRFxahp2wabPr-KuW=AdVQyRsHaD+A@mail.gmail.com>
From: Matthew Poletiek <matthew.poletiek@gmail.com>
Date: Fri, 15 Oct 2021 14:58:41 -0500
Message-ID: <CAJhSV8uZ3nGOL9-oUu=wL1CiY7Eeux0UYzsL4psMWeR1D73VMQ@mail.gmail.com>
Subject: Re: [WARNING - iOS 15] Update WireGuard to >=1.0.15-26 *before*
 updating to iOS 15
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Thanks for the update Jason.

Unfortunately I wasn't reading and didn't prepare properly. In XCode,
does anyone know the best way to upgrade the wireguard-apple package
so my custom app can leverage the latest fixes?

Thanks again,
-------------------------------------------
Matthew Poletiek
303.810.9082
matthew.poletiek@gmail.com
www.matthewpoletiek.com



On Thu, Sep 23, 2021 at 9:25 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hello list,
>
> Due to buggy changes Apple has made to the Keychain on iOS 15, older
> versions of WireGuard on iOS will *eat your VPN configurations* when
> upgrading to iOS 15. This has been fixed by [1], which is now
> available as of version =E2=89=A51.0.15-26. If you are still on iOS 14, b=
efore
> updating to iOS 15, please remember to update the WireGuard app to
> this latest version in the App Store.
>
> Sorry for the hassle.
>
> Jason
>
> [1] https://git.zx2c4.com/wireguard-apple/commit/?id=3D03a59ff38e96fb3bb5=
dde2f15fe42198d1dfb995
