Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D27EC2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:45:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69669241A7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=scjalliance.com header.i=@scjalliance.com header.b="Q1wzepO7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69669241A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=scjalliance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5a52cf4;
	Tue, 17 Nov 2020 21:40:14 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id efc07c93
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:40:12 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id ei22so1293901pjb.2
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 13:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scjalliance.com; s=g5;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MYB2cww6PfjsdbTimKRRXYo7mYTap2eReQF1WNTdUNI=;
 b=Q1wzepO75MFv4I9TxsGwr1/Y7A/pA3rJZFTH8tVLKfN4BWZuAliUVwzcJJkQpW2cEd
 e1oeWiD6/lJCsnYG4KTlGLkELt7LQtBd+exEVVHlSPBST4RopYY09uUT879QUDa0BbFz
 jDPoffX6fAaNPt4WO0xVDjUTfq/3bCH97/Y5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MYB2cww6PfjsdbTimKRRXYo7mYTap2eReQF1WNTdUNI=;
 b=Z5nyh4ufpU4gHicZPKFBiOHePKf6GKeSnvclkp8vUYE33is+C5NLEt4ypeUdoB0BNM
 cwiXRBWh88pQXRYimqP3Jv/cjIPa/4Aj87yjW0/z7/0Q3N7f6zWx7tEBI8axKqtPUlui
 czl5K4/s7Q6C+RyDfA7wuJtlglTwkeDe3CTlfOYHwGBcAonDACz7yoMG2ywC819s8834
 3iSlsZo5TvaRu8Gc7WvIMAxJS0rMawlCA4VHnLlpFn6GsJSJMOY5rvi51cvbXH28mZgl
 Zh3bNmCGOOV/ZZc3PvG1/WWYB077iL7Xf4bLOvXGOgYDmg/KTLPFCoDzaDmVRMExFiyY
 cebA==
X-Gm-Message-State: AOAM532CZwKkw2GRPbHvD5WIvSLPitVDSAPkyoYIlAg4i49yGV+kfAre
 0ZStqBoHuneVPIvKHkM1uSx4CXbApY9nlPKq+t5beg==
X-Google-Smtp-Source: ABdhPJz0XxQXIQQ0WpuOUPrJPEkGO8EN4fD2NpkLirDbAtsnzjAIKqb6/I11xYh9PFhZ9qqugz/LJe7iBCWQF95KfM4=
X-Received: by 2002:a17:90a:a393:: with SMTP id
 x19mr1032661pjp.8.1605649490416; 
 Tue, 17 Nov 2020 13:44:50 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuu+HvW+W=2--V1P9w4_4JoKpH12A=TNC5QsMsiaNZcrKQ@mail.gmail.com>
 <CAHmME9ridRrB+HsZ_SHDszjrrEvkU8Vp1+hmqjPjBdOO2x38GQ@mail.gmail.com>
 <CAHmME9rZsWXeGh__RpuZSC9ycgeK+jQ6OhRaksqX5P+LpcmnyQ@mail.gmail.com>
 <CAHmME9qOumhK+LxadUOw1TmD0NRg9+qvOhmFsGSFbC0w3jX2mA@mail.gmail.com>
In-Reply-To: <CAHmME9qOumhK+LxadUOw1TmD0NRg9+qvOhmFsGSFbC0w3jX2mA@mail.gmail.com>
From: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Date: Tue, 17 Nov 2020 13:44:39 -0800
Message-ID: <CALaUSusVyLRWKh93U3+Szdrf5LbiOnB+QiXaZPG=9ESekTrpvQ@mail.gmail.com>
Subject: Re: WireGuard for Windows fails to enable firewall rules after update
 to v0.2.1
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Magnificent!

We'll hold off on further updates until the new release is ready. If
we run into any issues with it we'll let you know.

And thank you so much Jason for all that you do. We appreciate your
tireless efforts!

Joshua Sjoding
SCJ Alliance
IT Specialist
www.scjalliance.com

On Tue, Nov 17, 2020 at 1:36 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Tue, Nov 17, 2020 at 10:13 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > But this part of your log:
> >
> > 2020-11-17 08:19:29.582424: [TUN] [SCJ] Enabling firewall rules
> > 2020-11-17 08:19:29.746988: [TUN] [SCJ] Unable to enable firewall
> > rules: Firewall error at
> > golang.zx2c4.com/wireguard/windows/tunnel/firewall/helpers.go:100: The
> > specified group does not exist.
> > 2020-11-17 08:19:29.767930: [TUN] [SCJ] Shutting down
> >
> > Is extremely puzzling. I'm wondering what led to this and how you
> > eventually appeared to fix it. Did it go away on its own without user
> > intervention? Did you have to manually start/stop the tunnel a few
> > times?
>
> I've now triaged and fixed this issue. It was a problem in Go's
> x/sys/windows library, which I've fixed upstream here:
> https://go-review.googlesource.com/c/sys/+/270897
>
> This should hopefully land soon, and I'll likely cut another release
> to address this. I don't like taking down people's tunnels like this.
>
> Thanks a lot for these logs and reports. I believe both of the issues
> in this email thread are resolved.
>
> Jason
