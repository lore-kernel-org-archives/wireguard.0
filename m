Return-Path: <SRS0=23NU=3L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CED9C35240
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:48:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F7C424656
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS1c2/7t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F7C424656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed9bb9ae;
	Wed, 22 Jan 2020 19:48:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0fa874a
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 11:57:37 +0000 (UTC)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89c856d9
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 11:57:37 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id z14so18798093qkg.9
 for <wireguard@lists.zx2c4.com>; Thu, 16 Jan 2020 03:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=WoWwmeXUfQcawSsDEStUFeQpE0EXmJ7rLJed6tS15GM=;
 b=CS1c2/7trqXbW/NAjfcl5/SmrRVVLtXg3WPVLFu63F//LC+5hmB7pWIMigS+8aBsCk
 9B72tfPh6Gxodntx54J0ZSYk/jWFnmqBQmJ1e/F9lEF+hvtkokl3wP9qyJd2CcR6JsoR
 elvuE9dxpmmvfhnFk3qXLFllzeQzZM+7AF1skhD+fQM7DiZHMghWMByZ0yHxdfN8BQXw
 uVeGa39g4BBrSO73GjFbHzNB8NGpbTHBwrJVowdcCrs/OZpfyhKf4rYo3+XylzKTUsC+
 286QMNRyfTpC/r/Uwa/rLJbBCGMZmRHJ31F/BtrUpnywaYLx4G5TdbAHWWsyo+L/2AYp
 NqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WoWwmeXUfQcawSsDEStUFeQpE0EXmJ7rLJed6tS15GM=;
 b=VWR5QnX30hTAvJUil9ygT00exATjWS1iR26obVbWFMkK7i6G8TiUY1GZs/PwC0VrMt
 Z6YulVRqEQndIyFwu9o07tq0/pf0mTFfaFcSFyhlSsPPcVTkXMN3vEgeM9/NpwxkPzbC
 E3w/0L7+EErPbAS5iF41ZHnl9Yqxb5mGHJ9YHCl8blN28pTZuS4Ww68/FIF+ReBLlPjU
 d9rvF4+DS402SUVqu2zw0igWL8qO7d+2dcxAU/2hS6tV56wZf6A4fRnZnddbZl/B7Xoe
 4uIVUp7nNlXAiWXfSGU1OiRo+IW6SIWq5iK9+dBwIuooYoSDhEHuzMS12SClEhmLc6f0
 1zZw==
X-Gm-Message-State: APjAAAUOQ8Bn4W/GDeKRgbgSfw/Ibmu1K6EWECell8dIjaACxfBoWXdA
 31M1P9asq6OIIU+P5TRrbl5187DGBUyNz6zTsb0UEBPnqmI=
X-Google-Smtp-Source: APXvYqxd3/ODEu/iPpOw5TDzOQPhzU7lGRnu9lpCw+n4E+OUiCpyr6nHkB0xGqNGkJSnYxPVJeFJWIKkY81tvREodMU=
X-Received: by 2002:a37:9f41:: with SMTP id i62mr31098913qke.272.1579175856839; 
 Thu, 16 Jan 2020 03:57:36 -0800 (PST)
MIME-Version: 1.0
From: "Alexander E. Patrakov" <patrakov@gmail.com>
Date: Thu, 16 Jan 2020 16:57:25 +0500
Message-ID: <CAN_LGv14Tf8hoJGWDyAXe6sy_1T883Kg44JvGRt9eATqxuH8FA@mail.gmail.com>
Subject: wg-quick feature request: excluding the server if it is in AllowedIPs
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 22 Jan 2020 20:48:09 +0100
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

Hello.

Let me explain the use case: we have two networks, x.y.z.0/24 and
172.31.0.0/16, that the staff is supposed to access via a VPN.
However, the VPN server is x.y.z.5 (i.e. in the first network), so
this doesn't work on the client side because of a routing loop:

Endpoint = x.y.z.5:port
AllowedIPs = x.y.z.0/24, 172.31.0.0/16

We had to resort to this:

AllowedIPs = 172.31.0.0/16, x.y.z.128/25, x.y.z.64/26, x.y.z.32/27,
x.y.z.16/28, x.y.z.8/29, x.y.z.0/30, x.y.z.6/31, x.y.z.4/32

Ideally, we should not do this. I believe this is a bug, caused by a
wrong condition in the wg-quick script. Indeed, the special handling
that involves a separate routing table and a firewall mark is
triggered by an attempt to add a default route, while, in my opinion,
it should be triggered by having the VPN server IP covered by one of
the AllowedIPs entries. Could you please fix this?

-- 
Alexander E. Patrakov
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
