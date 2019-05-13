Return-Path: <SRS0=YdU4=TN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C889C04AA7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 May 2019 16:25:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEBB2208CA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 May 2019 16:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMuEuXAF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEBB2208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b036ffc6;
	Mon, 13 May 2019 16:25:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b0934ac
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 May 2019 16:25:15 +0000 (UTC)
Received: from mail-it1-x132.google.com (mail-it1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7bd43df
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 May 2019 16:25:15 +0000 (UTC)
Received: by mail-it1-x132.google.com with SMTP id s3so735itk.1
 for <wireguard@lists.zx2c4.com>; Mon, 13 May 2019 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=CjJAcuA6AOxxNDR+XNNALXQSNxUWw3Bmh94Bgtj8IXQ=;
 b=FMuEuXAFypwHw9bwPipoTjTTfxjCw91ZiyWR7TmpkNZk8RC7ryFB7UYXaWyIfcfBsS
 u5+PgSnUdcml+9TB4LBE4kp2N4JvIULADnERTOY0a5NNLJJV5Ed8r35+qWO9m0OUVu+s
 f8O/oNQZ8gKLQQMncSTZs48LJOLI+o2nR+uWnir+i+tlm/GVOvmWFmxuGpxnwHA+hows
 k8pApPQl7ifc7J1w8Is4ufRBqNGPJzc96uZmR/salB0Nc+jzb4v/+awucdgYTTaUbWb6
 Xy9wPZ//5KPJ1V8L9oEs/r5GDm2ZpYa386BtACRdBjsuoHMg7dA8ExT3BkuXQeWkaJFn
 grdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=CjJAcuA6AOxxNDR+XNNALXQSNxUWw3Bmh94Bgtj8IXQ=;
 b=SSiuRJ7a4xNpl5CTP6N98AnRCC/cAIEQBKtLU758PUJh86GGQZvsp5wSQlqqH9i11d
 sfPkyP7eq/9L4PV1F/bIHZkOGgLnNMsk8UwWJ8B9t2LA/dGU/+PDkR4KGH42cGKUvW9r
 t0ObV5QyUImqbtQsh44oF1HMKTnsXmYkLaB8LWxsFimnuiFbpyn82xVSuolVrJ1nlifN
 sq++WS6Coowa4SzBhEupfmoAdkgNGt+StkyNs/Dtn0+Hp/fblwyKdgM8uVbLIQcG6pUA
 r872khMEmifZ+sYyCKEgJo7PrzXh6lDLwpFwa15UUc7PaTWssQYKAJXIcv82EtSa3zrn
 xjeA==
X-Gm-Message-State: APjAAAXmU1F+ZOfO4+IvBZaCn31yVi0qNRzwocSowIvCScP4scSST5mF
 DflAvzrybZhhAkt2mLKQqG+HlGuadXg=
X-Google-Smtp-Source: APXvYqx4is9dyGfXrC7Js40B6XJ5F3eDqIVHhx0Ni7KA9MkBXlhoQxbAEINLfebPPsKuXm5r6OWrEw==
X-Received: by 2002:a05:660c:799:: with SMTP id
 h25mr18871407itk.85.1557764714318; 
 Mon, 13 May 2019 09:25:14 -0700 (PDT)
Received: from ?IPv6:2600:6c4a:787f:d200:4cb1:3b59:cff8:b223?
 (2600-6c4a-787f-d200-4cb1-3b59-cff8-b223.dhcp6.chtrptr.net.
 [2600:6c4a:787f:d200:4cb1:3b59:cff8:b223])
 by smtp.gmail.com with ESMTPSA id z21sm5864798ioz.16.2019.05.13.09.25.13
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 09:25:13 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Matt Layher <mdlayher@gmail.com>
Subject: [ANNOUNCE] wgctrl-go (formerly wireguardctrl) moved to WireGuard
 organization
Message-ID: <2d055837-37e0-c51e-02a0-f69d7f6cef89@gmail.com>
Date: Mon, 13 May 2019 12:25:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello all,

I'm pleased to announce that wgctrl-go (formerly wireguardctrl) has been 
moved to the WireGuard organization. I'd like to thank Jason for this 
offer, and for his help in making the transition happen as smoothly as 
possible.

Package wgctrl is a Go package which enables control of WireGuard 
interfaces on multiple platforms.

The new repository can be found at 
https://github.com/WireGuard/wgctrl-go. It was previously my personal 
project at https://github.com/mdlayher/wireguardctrl, which now 
redirects to the new location.

The expected Go import path is now "golang.zx2c4.com/wireguard/wgctrl", 
and code which makes use of this package must be updated accordingly, 
including the package name switch from "wireguardctrl" to "wgctrl". 
Documentation can be viewed at 
https://godoc.org/golang.zx2c4.com/wireguard/wgctrl.

At the moment, wgctrl-go supports configuring both Linux kernel and 
userspace WireGuard devices on UNIX platforms, but Windows support is 
actively being worked on. My intent is to add support for configuring 
any type of WireGuard device under a unified Go interface, so please do 
reach out if you're building a new implementation for a different 
platform which does not make use of the userspace configuration protocol.

If you run into any trouble with wgctrl-go, feel free to reply to this 
email, file an issue, or reach out on #wireguard on freenode.

Thanks for your time,
Matt Layher

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
