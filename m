Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A25C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:47:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22051207DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:47:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="sGpBw8JV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22051207DF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1575f9a;
	Mon, 3 Aug 2020 16:23:21 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 93e7bf2a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:23:18 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b23f7d03
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=chDXxSunmGJFgvjjqTq5PmqJRVo=; b=sGpBw8
 JVoNr61m0IGU8de3m0Jxp/kpFG9DYGvq5IbhOfJCG6yHDK/pzAuBbOB/mOaVz7gS
 ELaMB18oSn+138laZ4LRIXfpEHgWa6NNirK8Y2RzuuX2Vsn6hxW4GndqQr9JimZi
 DPzy534VT5Hmx77Vr7tt6NKHaAfiTkFPILBnQq02o2Kv1NbByTE0o91nCwaoR2su
 qzQrwVOmZeyaEkUxyJwVXUSyTFZ2IUkcMMHTPXaVMXBaMiQz2/wBEPQ0Q+CKtE3a
 JYGrPSuvEf8j1SgnWs7qqz/t5ZoetBDmxiVoPZW36Qz15jNa0qPFffV0wDrX0JH1
 R+mz+E3BMPr51f6A==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bfb3e9da
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:23:18 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id x1so11353581ilp.7
 for <wireguard@lists.zx2c4.com>; Mon, 03 Aug 2020 09:47:33 -0700 (PDT)
X-Gm-Message-State: AOAM53345QfXchqBEHmX6wJ2Wzn5WtPdJ5qveQHC0Mkarf2sqekgChmY
 8ghvMYjXG5bo6RAf2vUhWJYYChLT5+kKw+6WxMw=
X-Google-Smtp-Source: ABdhPJzMnHljdM/wwPP81WgL9jVGyglFK0oxxybabceIZNZr7376guFdHfaNi8KFkgjrXxySpjQk/e8+WFAI2GTDlD8=
X-Received: by 2002:a92:bb92:: with SMTP id x18mr270615ilk.64.1596473252629;
 Mon, 03 Aug 2020 09:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
 <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
 <CAHmME9pA7qmK9Vg-W5Sa7O8y15H5cN0curQWG6=N5rU6TT3fVQ@mail.gmail.com>
 <CAHmME9oTLHTfRw+_QAqqZNb4=GCb1WnJaEBsm_tBhzJ7FzoFkA@mail.gmail.com>
 <2bf53aa68644d0595c76db514a5aca769a13f25f.camel@noddingdog.org>
In-Reply-To: <2bf53aa68644d0595c76db514a5aca769a13f25f.camel@noddingdog.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Aug 2020 18:47:21 +0200
X-Gmail-Original-Message-ID: <CAHmME9raRNgM3+NPjpF4aPQpH9VUYNkrg=h9zUwb0jVfBgx=ZQ@mail.gmail.com>
Message-ID: <CAHmME9raRNgM3+NPjpF4aPQpH9VUYNkrg=h9zUwb0jVfBgx=ZQ@mail.gmail.com>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
To: lists@noddingdog.org
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Andy Whitcroft <apw@canonical.com>, W.Jackson@dell.com, unit193@ubuntu.com
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

On Mon, Aug 3, 2020 at 6:43 PM NoddingDog <lists@noddingdog.org> wrote:
>
> Good you've found the issue.
>
> That'll teach me to be an early adopter... ;-)

Sigh. Sorry you're having that experience with WireGuard. Usually
things go quite a bit better with the WireGuard side of things, but
this seems pretty par for the course with _Ubuntu_ and Canonical's
kernel team. We've had perpetual issues over the last 6 months with
getting Canonical to release high quality packages in a timely manner.
A pretty large portion of my time is spent dealing with these bugs and
Ubuntu in general. I'm hoping they can finally get their stuff worked
out and support users properly, and I had hoped that everything was
*finally* in order today, but it seems like it was not meant to be.
Problems continue, alas. I've poked Andy on IRC and hopefully we can
get fixes for this deployed as soon as their procedures and paperwork
allow.
