Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C876C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 22:30:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF0A02065D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 22:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Vs8G6XOU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF0A02065D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41b8ae29;
	Tue, 17 Nov 2020 22:25:05 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1e86a515
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 22:25:02 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8511ec1f
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 22:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=pjdg3Td/RGxvjxUEmormbv1XAk8=; b=Vs8G6X
 OUuYCnG71A+1uuD1NbBm6pVh4r1CXkpUND6D0Itv0sYLWObJQm+5kJgYCl7m5Z62
 FQXx3Zjwtl8ZKGSbszAtoB8Jnn/ToRtxmZ3SWubK0OmZc+TWuxlBMxFVHa19ocyH
 qhOnXjY2f9X6LhgzYLXho7Sw8jq3VM69IoOY5d/paNOSCzVA9JXaaMkLCB9KpD0z
 7sTdUtgdK+Z0H6Z679bbQp/0EU9ntFBL6yJt7XGNj9vP09RMnhroXuGwr1QHV/F4
 w9BEH8/aItkvJ4mrW9FTLIO1bFcJ561i2e/iGDE48i8kL7VUcN9qF/7po+WeFOKF
 1ocxniPl04L6Vk9A==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5cd46352
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 22:25:48 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id x17so2156259ybr.8
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 14:29:41 -0800 (PST)
X-Gm-Message-State: AOAM5308Q27AL8qOj5aRDBxrkkRFzgNR+oCERUsA+t3DMkSm3Y5NkULp
 lW3n9saGoB8l53BSNTEVHNZ6rGIM3Q3+sXf6MR0=
X-Google-Smtp-Source: ABdhPJwYaccJbN+2qaD17/CjRjwiuYEW3hnnT2xbs1xmEzvf9O7glf5Ad7Xne4501rO3muVMgkURdUC+uD3UUzAOHO8=
X-Received: by 2002:a25:df05:: with SMTP id w5mr3520571ybg.20.1605652181257;
 Tue, 17 Nov 2020 14:29:41 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuu+HvW+W=2--V1P9w4_4JoKpH12A=TNC5QsMsiaNZcrKQ@mail.gmail.com>
 <CAHmME9ridRrB+HsZ_SHDszjrrEvkU8Vp1+hmqjPjBdOO2x38GQ@mail.gmail.com>
 <CAHmME9rZsWXeGh__RpuZSC9ycgeK+jQ6OhRaksqX5P+LpcmnyQ@mail.gmail.com>
 <CAHmME9qOumhK+LxadUOw1TmD0NRg9+qvOhmFsGSFbC0w3jX2mA@mail.gmail.com>
In-Reply-To: <CAHmME9qOumhK+LxadUOw1TmD0NRg9+qvOhmFsGSFbC0w3jX2mA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Nov 2020 23:29:30 +0100
X-Gmail-Original-Message-ID: <CAHmME9oJze5Pmf5SnRXaTtpYa2UWuCs7pdki2Qsp-yAewmwJaw@mail.gmail.com>
Message-ID: <CAHmME9oJze5Pmf5SnRXaTtpYa2UWuCs7pdki2Qsp-yAewmwJaw@mail.gmail.com>
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

On Tue, Nov 17, 2020 at 10:36 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
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

Merged as:
https://github.com/golang/sys/commit/ba5294a509c715d7fea0f9022a3d0ca21f64942a
and updated in wireguard-windows here:
https://git.zx2c4.com/wireguard-windows/commit/?id=4cd498b8075e85e54711a0cf8481b9c74841d0ac
