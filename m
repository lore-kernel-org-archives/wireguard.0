Return-Path: <SRS0=Z//i=3M=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51987C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Jan 2020 12:49:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8857B21835
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Jan 2020 12:49:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="DgghMi2I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8857B21835
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d18e88b;
	Thu, 23 Jan 2020 12:49:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c514ca3
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jan 2020 12:49:15 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e78cd50e
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jan 2020 12:49:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc909525
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jan 2020 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=hvdu1yHGDx61ov+4GaWRxfZcOP0=; b=DgghMi
 2I0LqCQmWudyDaNcbziLyE7KQ6eFoZdZ4PeDLsu3jqGDsOD+UHd5+MDgiqZ6CgLM
 zy93DA+ikQX9LtTIBtRvULbRi1inTKJpDvEuhGJy8LEofwjw8rc2OI7oiNjMIo6b
 jdrrpSa3Vva4PGZazZzVwmdgfoHg7mM5jFCeTM//hiPDvcMyPkokDxkdki5D1KdN
 xuxEZhtP7KSaCzZv9Kqbwc6WvuZN7PCkLQ5h5y2JjEgoN9nHRasZ3jciprfXDnCK
 di2J0oLq86N8+LWXVOZrI2eWlxzW8/LirisTw1DDJ3SUhph5P7X6IDWV+NmEJ6tC
 4XwuBnGzsMdCDXtA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 10df3019
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jan 2020 11:48:02 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id i15so2623882oto.2
 for <wireguard@lists.zx2c4.com>; Thu, 23 Jan 2020 04:49:14 -0800 (PST)
X-Gm-Message-State: APjAAAV1bz+EFQJ9ZIOy5epwpY1bBke9KSGHYFSmgNWYPgbiGY6b8qqR
 BR07toNI0qq/sUxN4L0Zc6tP9TfeiRVS83zsris=
X-Google-Smtp-Source: APXvYqxlj4wjar5429aMlmqmJu5cJT5IPpNU4Ogx5N29yfuKF/9kP2kSWzWJuIwE4p5inHsuDUoP2l34ADQdSLb4gvY=
X-Received: by 2002:a05:6830:10c4:: with SMTP id
 z4mr11503674oto.120.1579783754185; 
 Thu, 23 Jan 2020 04:49:14 -0800 (PST)
MIME-Version: 1.0
References: <CA+hAYV=67S+3d0g+eQ9AZHok=AdvmBsd2XpOFSEcJ=aozjK9PA@mail.gmail.com>
 <aaf2a265-f53e-f6d2-09d7-e83497578a81@zx2c4.com>
 <CA+hAYVnPDw_t9dRm8CEZeF+iDXQyPAGosfzLCQiY+izF9jMNag@mail.gmail.com>
In-Reply-To: <CA+hAYVnPDw_t9dRm8CEZeF+iDXQyPAGosfzLCQiY+izF9jMNag@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Jan 2020 13:49:03 +0100
X-Gmail-Original-Message-ID: <CAHmME9qSr-K1RrfkrKgHTQKBebJCeXBvW_dUKWUB5SX+OaQ+ow@mail.gmail.com>
Message-ID: <CAHmME9qSr-K1RrfkrKgHTQKBebJCeXBvW_dUKWUB5SX+OaQ+ow@mail.gmail.com>
Subject: Re: Bug report: WireGuard client not setting underlying network on
 Android Pie
To: Andrey Kupreychik <foxel@quickfox.ru>
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

Thanks for those commits. The next version will have this addressed.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
