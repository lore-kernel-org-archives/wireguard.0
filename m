Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE30EC63697
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:36:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB1F221F9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:36:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="wpvXETOM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAB1F221F9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f76f013;
	Tue, 17 Nov 2020 21:31:58 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 86c9b96e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:31:56 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e07bd53f
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=tBJjLwDqjOYzk14mMNp2F3PK6WM=; b=wpvXET
 OMgDohH2S7wa8YSpAp687EZKL9x+GHasb+oKXaM0lcAsNgJP0D4Bqdx7b7Vl589t
 ITtE+I/wovRzS5CNc5xUzW7UoborgdV7yB/sgHXe7nYOPZIPY3q+jDJ8h9l6Psn4
 onylTuu+P8QTXcTKmuRUW8cnXhRyPDV8S2fJguyA/xiYUdOdAZFX7fNAN5R3ZxWk
 r/kkznINOlC5z+Qs97o8r71nYfhPaoyTbhV8DrhEzm6G9UHOu2/+KPcuyManXh29
 COeq66G+nlRgNMqV3x4GQ/wpmq6oh+pFyLvdQi4IMblxjWCWVg86zRSdglp70ttD
 enuRZZlzfAxhqcrA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8232f789
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:32:42 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id d1so8137983ybr.10
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 13:36:35 -0800 (PST)
X-Gm-Message-State: AOAM5313U2cnZMyUZBmqE4eVRxiH3vm6au+ZiZjJn2TJbV3DB6O7zwgl
 TczvyGV6VvPa5taTHKSVE2BX6lUJEu3Rf26xC8Y=
X-Google-Smtp-Source: ABdhPJwX+0INtjEp7pjWnE34d8J4Y4pfPTsM0eG0Vk8WeGbgyOj4ETDCUGY5mxVkeLLD5nD/OQdBzpzB58mLhsUMUkk=
X-Received: by 2002:a25:5084:: with SMTP id e126mr3118643ybb.239.1605648995175; 
 Tue, 17 Nov 2020 13:36:35 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuu+HvW+W=2--V1P9w4_4JoKpH12A=TNC5QsMsiaNZcrKQ@mail.gmail.com>
 <CAHmME9ridRrB+HsZ_SHDszjrrEvkU8Vp1+hmqjPjBdOO2x38GQ@mail.gmail.com>
 <CAHmME9rZsWXeGh__RpuZSC9ycgeK+jQ6OhRaksqX5P+LpcmnyQ@mail.gmail.com>
In-Reply-To: <CAHmME9rZsWXeGh__RpuZSC9ycgeK+jQ6OhRaksqX5P+LpcmnyQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Nov 2020 22:36:24 +0100
X-Gmail-Original-Message-ID: <CAHmME9qOumhK+LxadUOw1TmD0NRg9+qvOhmFsGSFbC0w3jX2mA@mail.gmail.com>
Message-ID: <CAHmME9qOumhK+LxadUOw1TmD0NRg9+qvOhmFsGSFbC0w3jX2mA@mail.gmail.com>
Subject: Re: WireGuard for Windows fails to enable firewall rules after update
 to v0.2.1
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
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

On Tue, Nov 17, 2020 at 10:13 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> But this part of your log:
>
> 2020-11-17 08:19:29.582424: [TUN] [SCJ] Enabling firewall rules
> 2020-11-17 08:19:29.746988: [TUN] [SCJ] Unable to enable firewall
> rules: Firewall error at
> golang.zx2c4.com/wireguard/windows/tunnel/firewall/helpers.go:100: The
> specified group does not exist.
> 2020-11-17 08:19:29.767930: [TUN] [SCJ] Shutting down
>
> Is extremely puzzling. I'm wondering what led to this and how you
> eventually appeared to fix it. Did it go away on its own without user
> intervention? Did you have to manually start/stop the tunnel a few
> times?

I've now triaged and fixed this issue. It was a problem in Go's
x/sys/windows library, which I've fixed upstream here:
https://go-review.googlesource.com/c/sys/+/270897

This should hopefully land soon, and I'll likely cut another release
to address this. I don't like taking down people's tunnels like this.

Thanks a lot for these logs and reports. I believe both of the issues
in this email thread are resolved.

Jason
