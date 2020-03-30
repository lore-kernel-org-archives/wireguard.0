Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671DCC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 12:25:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93AB520714
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 12:25:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=mullvad-net.20150623.gappssmtp.com header.i=@mullvad-net.20150623.gappssmtp.com header.b="qyahbzMX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93AB520714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 130f2bda;
	Mon, 30 Mar 2020 12:17:11 +0000 (UTC)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0d7cb567
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 12:17:09 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id r19so11917643otn.7
 for <wireguard@lists.zx2c4.com>; Mon, 30 Mar 2020 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=o+qq4XrTFyf+eQNzwO/39xfNCr34imoFWTWDeFTWv9w=;
 b=qyahbzMXJLr7TCBa15a0JDTpn7sgAQllaE0DCFoxJD679fsgG4BCqaettk2s7EXXq0
 dTkQX7swb2gtBcgfp4Kf36n3kmp2wXjgH88m4upfjPcSKCT2RkuRBABvBTMsiNladLrk
 ED8s2fnwW5fXDczo83QGCzxdoyYzN76EKYuiY89hjGl20GnbraXaCVDtyAALV23J5zcx
 L4LjjhNrbU7Mtc4Y5tK1BOUdboJhECx1Bcs2HADE/uBQ4bqoyC9H+YCvRtezwRj83QK3
 YRREB9LBxcSed85oxWbIyWtAMrv1fJosjcBFjUp1ZEJ+29rMqjg134fOAVIMR9/W+kWw
 u5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=o+qq4XrTFyf+eQNzwO/39xfNCr34imoFWTWDeFTWv9w=;
 b=KHxbRoBIw05eQzuuXyqcZPe1Ez3qX2aKZ8POPGI4vQNOM6BLpOR2lWswhb/jOip2wR
 Rrdw4ule69DsXwU/4ca0Shljia4+0XBzSoa846lYvJs2w/ywspMJz7ps+xY5S4yW79+Y
 VRatYxveqHdjLChlvWoworDrGJk9aspaTYASFcF2aMLMtq2G52or+M0SERCiO1Bz1HQJ
 HxFWXVzJTIXt50uFfn/R+mE1iHSgsKuGQ2PZYvOEEVbfLfCAM7vsGAl5r8tgmbAQ3Xal
 U3D8j9mM9tETIL79K0rVGuKNxlDijhPaMwZrQbnoqGgKCQzlxmE3nqX9TGBK1sivhzOw
 mMzw==
X-Gm-Message-State: ANhLgQ3YZS//UVs47MjecwGvKCkdWX3Tex4nyRumKHQ0fMS2C/NP4NPp
 B85bPmvZnlwv6H6Lzk24GByugUhrMoV+qYLtZoFDGm2j2HU=
X-Google-Smtp-Source: ADFU+vvbW6rcXmvyrCn0cQAQmKu0HnbiKTnMm7NMKjRzAGpqedatcTSpMGTYBOmNzQUlVG4TuqaLak1HuNQD3rl1/Eg=
X-Received: by 2002:a9d:6142:: with SMTP id c2mr9209666otk.92.1585571102027;
 Mon, 30 Mar 2020 05:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9qOpDeraWo5rM31EWQW574KEduRBTL-+0A2ZyqBNDeYkg@mail.gmail.com>
In-Reply-To: <CAHmME9qOpDeraWo5rM31EWQW574KEduRBTL-+0A2ZyqBNDeYkg@mail.gmail.com>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Mon, 30 Mar 2020 14:24:51 +0200
Message-ID: <CANTUoechj1jeWTm0YqwPxXctA2eYDah8OiVWi=zL61p8yHhViA@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard 1.0.0 for Linux 5.6 Released
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon, Mar 30, 2020 at 4:33 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Earlier this evening, Linus released [1] Linus 5.6, which contains our
> first release of WireGuard. This is quite exciting. It means that
> kernels from here on out will have WireGuard built-in by default.

Yippee!

Congratulations Jason, and to everyone else who has contributed to the
development of WireGuard.

Cheers,
Fredrik Stromberg
