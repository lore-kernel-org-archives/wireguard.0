Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78587C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 18:36:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0A992173E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 18:36:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="FDpfmihA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0A992173E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1468cd24;
	Sun, 25 Aug 2019 18:35:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38056d1f
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:35:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3abf8401
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:35:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 632a220b
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 17:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=jvftyj3/V3YSGn4LMfstYOdYIjU=; b=FDpfmi
 hA0KS15KQMmnzTRwMQK2dquM6HfmdSF+mf3fX2u0By/U28YsZGEAV8P6VpCFz5F2
 mrcYLyS9b+J0VUa+JPzmzUwBfEWdW5y8gDsV68AgayYqe3U4jbyrA8xyVR3Eo1xl
 rRg+lZ1tI2ErTX4WKDXQ8MdCWcagsiATKQpRNSswQzy+w8ANL0jqz85BdrjtN5Cr
 7cYUFnsmA0+7g1MrBj8mIZEpP6+mt3YSw8YYYC+Ghq201cZTc7mSqxNJVCcV48kl
 i9hkutMm3bGT+AoaJrJMjsSGXbTsb7qMu1uav03MrDdNmy5l57qIi5yU+XCDcs2r
 mDl+O+QaM0V/aVcQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bf91c020
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 17:53:53 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id b1so13213499otp.6
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 11:35:42 -0700 (PDT)
X-Gm-Message-State: APjAAAUHOGS9cApMWDskTwqO3FWphDs3iyjAx41eDEhMqgI0XBu36Nfx
 5bdhzP07twhdRRwWiwtjY2d6t3CByjnwJqf8wX0=
X-Google-Smtp-Source: APXvYqw62ljxEj+hV0hyj0H9eYjJOWb3F/MYHjPxNAAwwgMEyGPb5H4K8/3TTEsxsZu8UVGlWApv/JLqRKkPrP7plIs=
X-Received: by 2002:a9d:675a:: with SMTP id w26mr12795018otm.179.1566758141628; 
 Sun, 25 Aug 2019 11:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <036a01d54abe$4c049cb0$e40dd610$@lindenberg.one>
 <CAHmME9r6XdEMUxwq5p9S0pcC4d6dneM5pcv6bU0H0MHEMzP9SA@mail.gmail.com>
 <014e01d55b69$d19256e0$74b704a0$@lindenberg.one>
In-Reply-To: <014e01d55b69$d19256e0$74b704a0$@lindenberg.one>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 12:35:30 -0600
X-Gmail-Original-Message-ID: <CAHmME9o7PrETcRuLdO7DnpUiKNyO1AyL0qY4Xa1XFT4FPVsVvQ@mail.gmail.com>
Message-ID: <CAHmME9o7PrETcRuLdO7DnpUiKNyO1AyL0qY4Xa1XFT4FPVsVvQ@mail.gmail.com>
Subject: Re: Hyper-V 2019: unable to create wintun device: no interfaces found
To: Joachim Lindenberg <wireguard@lindenberg.one>
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

On Sun, Aug 25, 2019 at 11:23 AM Joachim Lindenberg
<wireguard@lindenberg.one> wrote:
> my experiments were actually roughly three weeks ago with versions .18 and .19, and that mail was somehow stuck..
> Just retried with .22, and the good news is that I was able to set up a tunnel between a Hyper-V as a server and a windows client. The old error on wintun is gone.

Good to hear.

> trick wireguard to work around the dynamic IP issue most Germans face. With the Ubuntu vms I can ping the server from the client, and if it is unreachable I am pulling down the interface and then up again.

Not sure I understand exactly. Is the goal to simply
change/re-randomize your listen-port due to some weird quirks of your
router's NAT table, in which case `wg set wg0 listen-port 0` will
probably work better than down/up? Or is this actually a case where
adding PersistentKeepalive=25 could fix things? Both of these options,
anyhow, are available in the Windows client. wg.exe is installed into
system32 and works as expected.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
