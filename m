Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C33C64EB1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 16:19:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B46920700
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 16:19:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="wMl0cnyx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B46920700
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 693c3974;
	Thu, 6 Dec 2018 16:11:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cac1c95d
 for <WireGuard@lists.zx2c4.com>; Thu, 6 Dec 2018 16:11:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b24d99b0
 for <WireGuard@lists.zx2c4.com>; Thu, 6 Dec 2018 16:11:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e41ff9f6
 for <WireGuard@lists.zx2c4.com>; Thu, 6 Dec 2018 16:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=FlafmP5PLrfh/YPDsYzZKp1tSBs=; b=wMl0cn
 yx8RL4jk2VoJuYUNdPEStiZaR1AxNIgV8azS9YNi2ghxV1g4jolK/YAt+x34mgLk
 CTOpVTSd1iUIBIMvihDWf8WSdquEFBEmyblDsnESpLn56sFtlq3sb/2qqgFYdRqg
 AwrQXxR1Mt4mHT07Qgkgha16TqTHKJoE8Os4EwJjtwoAsfzOI7okkd7nz590kL7J
 HnS8m32CaD3GzaVZNGKHUR5fXc3SiiIbaON+NQOK2lm6eGpDQ5hbOp9V/11C17Xf
 JfK2EN2a/Zs0XZpkJuh6wFqWz2vF5Vg45RwkkJBP1oO34jkTJOFpFD+w+Xu/metP
 4p4yOnAHi0OBU6Og==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 85e6b077
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <WireGuard@lists.zx2c4.com>; Thu, 6 Dec 2018 16:10:59 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id w13so831526oiw.9
 for <WireGuard@lists.zx2c4.com>; Thu, 06 Dec 2018 08:19:10 -0800 (PST)
X-Gm-Message-State: AA+aEWbxQSMMcdKjsh2Wp6NvgHOycJ1h6rjJxVBbjT7v9cPijfFrwkzW
 XrUnlTbNXAWQB4bxdwpf06Vt5ac16KQkK8YUIVQ=
X-Google-Smtp-Source: AFSGD/XOCJBWA2dPRR2488eC81zYGnz2xM0Cgfh7ZtviF6y/wqLsVqo6uh20v3T6SS3SA/Oczz2YCFhfHvjY3rBdMPY=
X-Received: by 2002:aca:c650:: with SMTP id w77mr16555691oif.122.1544113149719; 
 Thu, 06 Dec 2018 08:19:09 -0800 (PST)
MIME-Version: 1.0
References: <CAMhRzNT3Ss4P4h4AFxiZLKcmEG59=sXYFDdFgmnpF9MMWOA0vQ@mail.gmail.com>
In-Reply-To: <CAMhRzNT3Ss4P4h4AFxiZLKcmEG59=sXYFDdFgmnpF9MMWOA0vQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Dec 2018 17:18:58 +0100
X-Gmail-Original-Message-ID: <CAHmME9p7dkgEroU0orBkv9gTVw046TySyhgbrwhpDy9_CJuMJg@mail.gmail.com>
Message-ID: <CAHmME9p7dkgEroU0orBkv9gTVw046TySyhgbrwhpDy9_CJuMJg@mail.gmail.com>
Subject: Re: wireguard-go foreground mode broken on Linux
To: cbranch@cloudflare.com
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
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

Thanks, nice catch. Let me know if this fixes it for you:

https://git.zx2c4.com/wireguard-go/commit/?id=651744561e9e31197d8ebb59f97ab3dae3c39687
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
