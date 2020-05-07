Return-Path: <SRS0=6+3U=6V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4C9C28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 May 2020 00:29:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD29F20747
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 May 2020 00:29:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="uGOICkyc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD29F20747
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd28be5c;
	Thu, 7 May 2020 00:16:45 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 383e8943
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 May 2020 00:16:43 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc2c00f5
 for <wireguard@lists.zx2c4.com>; Thu, 7 May 2020 00:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=srCbH+UdvClNbh9fh6TaSsPMBKs=; b=uGOICk
 ycIHYDTkSeaW7TqZjl94yB6UUpIQq5pET6QdGA3b5Kia6YRVExAOXKWQ6jhyYvZ/
 1BTIXISDAZWPTY3/N32YcznvB6XDyMqI1mjfwsVK872uUbT3ojrh6ejq63k/JE+C
 m+CtgLjEx9VuHManWGsxFbSCLjytmX6cRj6xlMyPSLav2wBc7hSKplRQUUOhRmxU
 UzAghQv4YTair8jkuSatWERUv1V+YTznBYLoQ1BUyBRK/6gz+Zh34biBHwAXzRPB
 6m0I4meJ4JY4Slw98OLUzS9MK5bv+GqWZasYraPp1z/M36vKjocc8L8IfMFzMsI3
 mKZE4hmKMSzj308Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fe88a65e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 May 2020 00:16:41 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id k6so2516742iob.3
 for <wireguard@lists.zx2c4.com>; Wed, 06 May 2020 17:29:25 -0700 (PDT)
X-Gm-Message-State: AGi0PuY/hbhSIdcucQaqbIHZYoeHqaG+jmV49B0j2v8EXKVA6rZ4+ZVB
 16Bau5XrWQo0Yeo103MppLvuFkTpVLvTaZpR3zg=
X-Google-Smtp-Source: APiQypKQqDH4OnD6kj6awJ4pZK8Q0tk+0W1tGRgOvf1/XM2NecTZS6wNR8ECKv3l9i32//5CWxJRhuAJiVpiuHjp1gc=
X-Received: by 2002:a05:6602:1c4:: with SMTP id
 w4mr1851807iot.80.1588811364862; 
 Wed, 06 May 2020 17:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <6565463c-0a99-9137-5cc2-714e2fbd6dfc@rub.de>
 <CAHmME9qDMiNh90_zA9KsFX-OaHNUHnw5=e65jH3PdXg1n7nyFw@mail.gmail.com>
 <20328df0-e2dd-1653-9fc1-1fb06cbc054f@rub.de>
 <CAHmME9rnxp2QYjhu1vU+2K1GaoM2hupz5uJGpo_8z4t=E2-boQ@mail.gmail.com>
 <d62b74e0-0ae7-4948-df6d-325bcef94112@sdeziel.info>
In-Reply-To: <d62b74e0-0ae7-4948-df6d-325bcef94112@sdeziel.info>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 May 2020 18:29:13 -0600
X-Gmail-Original-Message-ID: <CAHmME9qwfUTvEHHG6b3K3eGUiGZ7iyoD2VmX-tomz7tWTwT4TQ@mail.gmail.com>
Message-ID: <CAHmME9qwfUTvEHHG6b3K3eGUiGZ7iyoD2VmX-tomz7tWTwT4TQ@mail.gmail.com>
Subject: Re: Ubuntu kernel >= 5.3.0-52.46 breaks DKMS build for
 wireguard-linux-compat >= 1.0.20200429, patch included
To: Simon Deziel <simon@sdeziel.info>, unit193@ubuntu.com
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

On Wed, May 6, 2020 at 6:27 PM Simon Deziel <simon@sdeziel.info> wrote:
>
> On 2020-05-05 12:03 a.m., Jason at zx2c4.com (Jason A. Donenfeld) wrote:
> >> Note that as of now, 5.3.0-51.44 is still the latest "official" HWE
> >> kernel for 18.04, and 5.3.0-52.46 is only available from Ubuntu's
> >> "bionic-proposed" repo.
> >
> > Ahh, you're running -proposed, gotcha. So I guess I should wait until
> > this hits the main repo. Any idea when they usually do that?
>
> The next kernel batch should land in -updates on May 18th. The detailed
> schedule is at https://kernel.ubuntu.com/

Ooof, thanks for that info. Looks like we're a tad early on the .52 changes.
