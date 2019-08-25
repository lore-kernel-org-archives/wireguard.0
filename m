Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98CCC3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:08:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88EF32080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="AyE1MTD1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88EF32080C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0eeaedfe;
	Sun, 25 Aug 2019 19:07:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46de9c9b
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:07:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d0bbf70
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:07:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25342bcd
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Wx03V5EHuNLO0NjjB1lR7XWYT3E=; b=AyE1MT
 D1Nt0gyzUhoAkRsqPaucEK/u17w+SOzo2L/KdjfRR/CU0EwWVlhaANMRMZSa45oD
 hdFlkv2csekBike9Edh0LgBbTjUHj63Xd4LkzvadHigKKIr+943HkJCf4lEx3Xf7
 HG+fGk8mVwrlsYnBbT92g0u2O5lYgWsy3zBtC8/cHjG4u3DrvEISh+/LlIglErZm
 c5Ko68a8D0Qun5A0nD/hJkYI2m/cBkzyTLKimLc99iIDbnNm1qBNDZEXWpUDOe/u
 iDuw6aD9TmWDWDM8MqYzV9YLI64HBcgctcWr3DBidJv7czsNpExxpYk1g1X//N4K
 fkHvZKnUM/1QKc9Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 56985042
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:26:02 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id r20so13245822ota.5
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 12:07:51 -0700 (PDT)
X-Gm-Message-State: APjAAAUDTqeV6zzfabq+6+Xr0/iTmSC+DVbrZVZrxqNMFndtUyEnF6Og
 EmFveQlxAvrjj5Q0ajIejXR3ZVReoT2FuxBYQlw=
X-Google-Smtp-Source: APXvYqzPFxCVqBOMvuiGOst2NxF9bzDS4LkbcxYuOVP0SmCq5wQj78DJBaVBEo3Dg317xTzyTSEoIBzLdr0gTg20NMM=
X-Received: by 2002:a05:6830:10c7:: with SMTP id
 z7mr12560170oto.243.1566760071337; 
 Sun, 25 Aug 2019 12:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <CANH_QeanVTjMG1gsps0Boj2vOUBCQqReH+u84su1--_t-QyiJA@mail.gmail.com>
 <CAHmME9romoNCJKaNfQXETG2GE+3mcVjEOkuu6+P4on-xXobEjw@mail.gmail.com>
 <CANH_QeYk=1HyuOFgg2_1YxHNyR9keWH883BD90bKvQn3im497g@mail.gmail.com>
In-Reply-To: <CANH_QeYk=1HyuOFgg2_1YxHNyR9keWH883BD90bKvQn3im497g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 13:07:40 -0600
X-Gmail-Original-Message-ID: <CAHmME9pxw2u=Su1jccf58iFPqvfY-opCSEJ3_TLtzjAA3tgYQw@mail.gmail.com>
Message-ID: <CAHmME9pxw2u=Su1jccf58iFPqvfY-opCSEJ3_TLtzjAA3tgYQw@mail.gmail.com>
Subject: Re: Linux kernel 5 different behavior
To: Vasili Pupkin <diggest@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sun, Aug 25, 2019 at 1:03 PM Vasili Pupkin <diggest@gmail.com> wrote:
> Yes. On kernel version 4, outer packets (i.e. encrypted packets) are
> sent from privileged user
> account credentials so they pass the iptables sandbox. On kernel 5
> they inherit owner id of the user who sent unencrypted packets.

Can you use the `fwmark` option and adjust your rules to match on
!1234 or the like?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
