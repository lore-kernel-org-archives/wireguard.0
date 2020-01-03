Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B910C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 16:08:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDEF42084D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 16:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZuSR9a4T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDEF42084D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f9d58d9;
	Fri, 3 Jan 2020 16:07:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b12d179
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 16:07:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e539033e
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 16:07:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bed8b94
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=xMk6Bf59bfp73PdK1KBgUVkf7+s=; b=ZuSR9a
 4To3KxxOXLTP3V0110sIv0kEr1M+CSGOdokZg4iGu/BA6PjEGzHEmR7doH9Xevv2
 fSQBGRQfFFgVxmxwc4XxNTqXBlCkCnsrBiyj1FFbBdcylVamATRVHxGxKnOMX+o4
 uuSJImL1fbVOwjEbJfnRIH1OYNoS6miIGv840ctIVGDpTJw4Iiqy1OsWzAfAPdA0
 2wrGvxnkQ1NAEazvIiAMhifjF0K272RKFPp8NH/V7ubYfuVLt056/eDUyQR9h4gI
 42xEp/Y182dUb3/HR3ivOx/YeQiSsTtxkWQPYroE6Iyf02zzOjmzcjkWqTb8RRiU
 ZJuojH8YEY4pcf3A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 11b57818
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 15:09:18 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id c77so14047938oib.7
 for <wireguard@lists.zx2c4.com>; Fri, 03 Jan 2020 08:07:57 -0800 (PST)
X-Gm-Message-State: APjAAAVVL8xf/YZzo33yeA+FY2adMq0876rugqjd6ZZTGeM796HEt2no
 ffLWtJmjjbXPZAnJrL7n/+c1de3OKo46pVw4hcY=
X-Google-Smtp-Source: APXvYqxPFKMZJj4WT8Kprl6AYaFKCPdhGLjQq9FpZ4gtpw1cMNuDmP8yncTHCe6dN9j937J+xnYKl6bOjtcBkWjMOJs=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr3895839oia.122.1578067676694; 
 Fri, 03 Jan 2020 08:07:56 -0800 (PST)
MIME-Version: 1.0
References: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
 <762ea0a4-cc2a-4b7d-91fc-efa9e9531043@zx2c4.com>
 <7eb40791-9689-2b3d-bfb0-2299cdf7b07a@attglobal.net>
 <CAHmME9r+HM27xhjwDP3q=DJV7KJsvZS__75szHzBE4qHBoXYUg@mail.gmail.com>
In-Reply-To: <CAHmME9r+HM27xhjwDP3q=DJV7KJsvZS__75szHzBE4qHBoXYUg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 3 Jan 2020 17:07:45 +0100
X-Gmail-Original-Message-ID: <CAHmME9ruOqW=PRXE=mKj_a2WZ9q1CbUh7YOCf7ZhhNx6Us33kw@mail.gmail.com>
Message-ID: <CAHmME9ruOqW=PRXE=mKj_a2WZ9q1CbUh7YOCf7ZhhNx6Us33kw@mail.gmail.com>
Subject: Re: wg-quick: syntax error, unexpected saddr
To: Eddie <stunnel@attglobal.net>
Cc: alvind11@hotmail.com, WireGuard mailing list <wireguard@lists.zx2c4.com>
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

I took a closer look. Indeed the issue is that nft 0.6 is too old. Use 0.7+.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
