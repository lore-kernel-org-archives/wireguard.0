Return-Path: <SRS0=ZLx+=WB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8F3C433FF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 19:39:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F7B7205F4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 19:39:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="xd3Ac1Pf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F7B7205F4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 029ddfea;
	Mon, 5 Aug 2019 19:38:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9180133
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 19:38:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df7fbee5
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 19:38:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b239533
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 18:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=dMW5DyuxcZ397XMB4ZPs9tAD23k=; b=xd3Ac1
 PfotVF4LMczEuH7AMY3+l6QdKa+kPRuGqr7A+d7v+kDPhqn5qUiYeSuEW/Azy000
 AcAkHP6idsSCG75heRiCD5oAsDZsqZDENp/BC3QYPtx8YlH34NsphsRWz/NakyN6
 A/vuZCjI+uTHkyHHFRIKF/YQG8qdt896G8XD9QyC5hhY3MI7kex1XOb5Hv0XP4dc
 idR+tPdel8br35TuJYUmsqp7k6O4E5Ok3GYW+Z4AR9mQs8ayIsqMMLnZnSM9Gcw8
 TlvOi/lGNLl+T4bnL19QjJBAKAfdq5z3I5Us6P3ffiUmAwU9UzCpFfVeC+CpXt+3
 rOTmpAmPMIbIa9qw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dca87c8c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 18:59:39 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id j19so10002747otq.2
 for <wireguard@lists.zx2c4.com>; Mon, 05 Aug 2019 12:38:54 -0700 (PDT)
X-Gm-Message-State: APjAAAW0+vXabnOsUySYOVmtpA4nkV/QIPeRawI0LuPEkbxjoWFG6C/3
 Yn1GQm4xDinTtvH3Fm/N7LJyr3SQOfKQ/2Qmjhc=
X-Google-Smtp-Source: APXvYqwTTWNu3QqUMjALjp2MnmtYJrmhX6vtYffAKtSuGtsVuY9esZui2DSfRL9i9x5usQZsPJHjIQYWtcUoX1RKIkc=
X-Received: by 2002:a05:6830:2148:: with SMTP id
 r8mr9246106otd.179.1565033933516; 
 Mon, 05 Aug 2019 12:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190720122016.57765-1-ankur@lipidity.com>
 <CAHmME9pGLM9a3Ww-MNy7mNT6JEQQXv4qLF0LDrAqVFUbDDPrsg@mail.gmail.com>
 <CAA6-MF9hxZk5b8W-5SoYOwXO1F9hWxUydcYKt75EtwaVc37AkA@mail.gmail.com>
In-Reply-To: <CAA6-MF9hxZk5b8W-5SoYOwXO1F9hWxUydcYKt75EtwaVc37AkA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Aug 2019 21:38:42 +0200
X-Gmail-Original-Message-ID: <CAHmME9rQcJ=wSpv-TAFuG9qUZzgAdyzBMDnrQ6sf5GKNVhx-9w@mail.gmail.com>
Message-ID: <CAHmME9rQcJ=wSpv-TAFuG9qUZzgAdyzBMDnrQ6sf5GKNVhx-9w@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: Fix alternate routing table syntax on OpenBSD
To: Janne Johansson <icepic.dz@gmail.com>
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

Hi Janne,

Thanks. I wonder how I came up with the rdomain syntax in the first
place. Perhaps out of ifconfig.c incorrectly.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
