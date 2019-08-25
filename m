Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8322C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4AA2080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="i5F7PfaI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E4AA2080C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f068508;
	Sun, 25 Aug 2019 15:49:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ce6ee56
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:49:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9785be1b
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:45:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f450d331
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=eimMlxQ2W5lmk2ZxXmMUuDY8itA=; b=i5F7Pf
 aI5F4DaSbaYYvMlC8xiH14HWm0QxcLpkTXa4H2d7X6UGBbe2DPhb6Rc0yHFHsaKW
 ZnT6Z4lfdfNPAGWy+bY2gI3YHA0DQWx7iOooaAMWrPe/bB6UWB7KWEL79JVHjdI9
 q+UHHj3BsROLo7u+Uu9iKvigT4lw9qukHxTQzJSX7uJiwDdehRs4u9p4Trrc5Udp
 S49M3KZTNd+iUdSW2VA5k+MscqHuul5AvMd31ApKLQoe66gxq1dw2aDfkk9AmYUV
 LB+RW4yyysZZiNOD4nSsDVc7sJ9Akl7E5PNybE7Jzz3/hML6s2jrae7SmGNM5XSz
 BnaxZrC2pZ7bpEkA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bf20e1aa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:03:12 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id b2so3530125uak.3
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 08:45:00 -0700 (PDT)
X-Gm-Message-State: APjAAAUlSLFBfVAXzQ8ql6Q3Mc7Djiy7072vpuqYOXPcaa0ns0XDiQFU
 xSg64RQ+QaJoqeJE2UNUusc9G/F0CjxMYMWU9ZM=
X-Google-Smtp-Source: APXvYqzLWuh9p7YtcEhAN9kCZqP8amsWbc0UUhnJyIH8U6idqwUk8PaJ/Jmx1f23UZbKwIvJpuXOLrZ9SYfgZfBc2N0=
X-Received: by 2002:ab0:290a:: with SMTP id v10mr6904081uap.74.1566747900357; 
 Sun, 25 Aug 2019 08:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <CB3F0797-D792-4883-8098-D57AA951715B@damon.at>
In-Reply-To: <CB3F0797-D792-4883-8098-D57AA951715B@damon.at>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 09:44:48 -0600
X-Gmail-Original-Message-ID: <CAHmME9r2XkUBxEEQAFNXpNUSPepN11TDy0BvLu3eYSbV5nfZsw@mail.gmail.com>
Message-ID: <CAHmME9r2XkUBxEEQAFNXpNUSPepN11TDy0BvLu3eYSbV5nfZsw@mail.gmail.com>
Subject: Re: Kernel panic on Linux 5.2.7 using Wireguard 0.0.20190702 on
 Fedora 30
To: Damon <msg@damon.at>
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

Is this problem still present in 5.2.10?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
