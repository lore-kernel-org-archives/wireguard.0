Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A16C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:45:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44F92218AE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:45:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GcdXxfys"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44F92218AE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35361189;
	Wed, 20 Mar 2019 22:45:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9457f65b
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:45:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e457434f
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:45:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 490cf159
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=c46IuGm0TFxlPo5H3ImPQyn8SfQ=; b=GcdXxf
 ysNH/gEZw3dPZuQa6N5PLNO1ddKK4YWAyZQuUsZcn9MEajsEBebjNzO3l7RDvHXz
 7u0pqmJfb+goOsO2qfhYy9J0Jahwk1X0aYv3G7V2hdpueDrzsiylNO701j2WmxEU
 cvOwOTJ7z5wH9oFsqYT86v4iF6omfbdxmtjO28DsnxdCnKcpaxHsRfAKpMUSc/W2
 9GtNxQvPMhWWtJebSHZjkZ+k8Sj5bkg+eSirxRiDAH7EnY80Cerj04h0n5JiYKJv
 7yCMiWsdWsGVkbrTtS5HHH4dPpNJd+ypl6TxwTkFnPUrK08iGjyqrpk2hM5odUjr
 Pp99M7VTfwA/aDgg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8f2af432
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:24:02 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 103so3738859otd.9
 for <wireguard@lists.zx2c4.com>; Wed, 20 Mar 2019 15:45:35 -0700 (PDT)
X-Gm-Message-State: APjAAAV18XC7Mt/5v5OLUwr+HLXl1lBqkic4g627d6Gr+9y5TYr4VIMd
 eDVCc6UfBpjNytrITWhCovGIMxwtvqIJ+1UoNqQ=
X-Google-Smtp-Source: APXvYqw5Q7yLs09vFPiAcSHufDcyh2kAh48cepWgxrdWPCalE/xyVZJOZEaJqoK6EZGwMMzhs22btCLmAdz7BKp5Zhk=
X-Received: by 2002:a9d:6c45:: with SMTP id g5mr443874otq.54.1553121935149;
 Wed, 20 Mar 2019 15:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <1E650988-A618-4131-BC8E-711D601A20B0@gmail.com>
In-Reply-To: <1E650988-A618-4131-BC8E-711D601A20B0@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Mar 2019 16:45:23 -0600
X-Gmail-Original-Message-ID: <CAHmME9rSZFpri9p0s3O7a18OWF5hA0TphRWJKhVVy-ieyfkT3Q@mail.gmail.com>
Message-ID: <CAHmME9rSZFpri9p0s3O7a18OWF5hA0TphRWJKhVVy-ieyfkT3Q@mail.gmail.com>
Subject: Re: Wireguard-Go security
To: Michael Lam <michael.mc.lam@gmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

I'd like this too. Please feel free to submit patches.

We already have basic infrastructure for it: when you run without
arguments, it opens various things, and then starts a new process,
passing those things to it. The goal would be to run that second
process as non-root and with various sandboxing turned on. Check out
main.go.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
