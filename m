Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1869BC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 17:47:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9536320835
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 17:47:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=benburkert-com.20150623.gappssmtp.com header.i=@benburkert-com.20150623.gappssmtp.com header.b="ioAVce1v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9536320835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benburkert.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c06ba5eb;
	Wed, 27 Nov 2019 17:47:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 744c43a5
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 17:47:40 +0000 (UTC)
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f823a043
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 17:47:40 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id p18so7272355uar.7
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 09:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=benburkert-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=StZX+GVQijyGEMF0+3un3XelhgWUuyH4tvlI5FtaaQw=;
 b=ioAVce1vw95nlmtXMDwoPkg/vm8xySlK7wI/AUmZBkNB0Gt9bjjp/Jw/2z47Iy4kYO
 0bOva7Hk2VnfaOvEseJRp7xRcndwuLI2oAs/ti4XVLPFzKj+G/1ukYMcDHaUM6FAWJdL
 ezeaimRsBtjruSQwVKCBnKSbljf0d4LHvgV4KNj9k9u0LZwJmrNu0jfpmA0LyvWvwZ2T
 vDzh7BiNW0YhmqtL1PebGjusq3QJSYFknC+8Bbdkeag+LuDHubX+8PDCkJI0NIYG6zxl
 VUYiJf+mAB58kAYmwosqMABn/WbZ0JhOdIdURO5Zeqeyvir7KFaS7aYiEtR6B5jq1a5g
 507g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=StZX+GVQijyGEMF0+3un3XelhgWUuyH4tvlI5FtaaQw=;
 b=jPz0VdPaJKpcP6v7NjXN3D/zudNOCwCzcKrQ3MMcNF23ydiEozWYXg32+RfOnm3zZg
 MTQSx/CbA/1STo6rDdC2TbXTHJgqLhUcdnvrdM15Wq7R5Dv+uFTc+juhZ4RLPvVLREws
 9AFwaaeBTg2htjUq3/2MTvvVpZiVYYiEqoGOYzvam83lbPdGbBvQhYajwRdztAKoX9g6
 4hPQw6OhG4T9/46n021wtuh/qQeDRiAw5K4ATYS1YKCJ7R7yRQI+zU99elsYn9h/nYdx
 hQN3ZYuKPLnMHt3N5sVBM1ND96Rkz1qM1NMXDsaYXrTpDMcUvnMlDqyBBe1GZYg5fLw7
 TYbA==
X-Gm-Message-State: APjAAAXD9HJh5XTX6y6AJjvrXrJ52yWOHslqyQLqO8S99EMjqF39rdWp
 H3B74MMI8mmEzn1+hiKLbG+XynOYhgc1PTTEtW5gN8gP2QQ=
X-Google-Smtp-Source: APXvYqxV4z88iw/q2qODYbjurBXmIXXlOyMUw2/v6OH+ioUNnQrAqIYqiP/uhnvxUz3rdZ4jCFveMG7Diw0OVOSTTYk=
X-Received: by 2002:ab0:710e:: with SMTP id x14mr3651820uan.122.1574876860052; 
 Wed, 27 Nov 2019 09:47:40 -0800 (PST)
MIME-Version: 1.0
References: <CAMi2xeQs3hCB9DEZZOZMUQyx6r_HT6Qh_MAnBgNvhOmfJvrChg@mail.gmail.com>
 <CAHmME9rhLSieSQ-Co7KKR6hfC-RGyaLA_TGpmYPObzJYMe5rDQ@mail.gmail.com>
In-Reply-To: <CAHmME9rhLSieSQ-Co7KKR6hfC-RGyaLA_TGpmYPObzJYMe5rDQ@mail.gmail.com>
From: Ben Burkert <ben@benburkert.com>
Date: Wed, 27 Nov 2019 09:47:29 -0800
Message-ID: <CAMi2xeT1xO_1Co4SYRYpe48NAGTMO-wXFTUq1Eg+5+eJBBW1jQ@mail.gmail.com>
Subject: Re: wireguard-go data race in Peer.SendBuffer()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Thanks, unfortunately I'm getting a build error now. Looks like the
patch needs to switch "sync.Lock" to "sync.Mutex". I'm testing this
change and haven't hit any race conditions yet, I'll let you know if I
see any more issues.

On Wed, Nov 27, 2019 at 4:40 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Thanks for the report. Does this fix it for you?
>
> https://git.zx2c4.com/wireguard-go/commit/?id=cd26ba8ee4a523437aba3b489422127f1293a16f
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
