Return-Path: <SRS0=U3rm=N5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096B3C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Sep 2021 16:51:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC6D5610A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Sep 2021 16:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC6D5610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53af49f8;
	Tue, 7 Sep 2021 16:50:21 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [2607:f8b0:4864:20::133])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 13ed0f87
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Sep 2021 16:50:19 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id b4so10711152ilr.11
 for <wireguard@lists.zx2c4.com>; Tue, 07 Sep 2021 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=30P+AvgWPaILRbnAsd/xLE+D1RebpJWHCIXjesGzGeM=;
 b=LiwGMwgrcMcaR0BEqBudGT8tUrOvOFf8NUFO4SEy6nQubVxzzqyImohfWyrwX09Bn0
 eYSnLU7JiHmLBf9sjOt6vvT1QH58sEZt+55UibI9PsuFu9HwZJYhCCYCrrIIIGm+Hz7/
 5kKpNYTa32lDYX4MqfYsQ6qfAxxIvyqqOKFtHNAXbKCECWDV/clcYAx4X+Blza4oCagD
 Z2JQt3BQ2CylIOSwZJILw+qzZtx3Z/wVPR7xgbl9Aphy2mtfuxobGVjvcS01VChZzUp9
 WnMgssZQFhbxHwy23huxIJMX8OxoeiQY3FbB9/ifsYal9G/oiJPTxWZ7nTBJZ5cLVKvd
 aRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=30P+AvgWPaILRbnAsd/xLE+D1RebpJWHCIXjesGzGeM=;
 b=M94Tz4tRvyQmcImk25SOdd6KnzBA3GQ8RVbz52ODwgfhH75Xu2VIWGMg9pnBRweFW1
 JHVzejqv6qTAseZWzdqcSK6ex3tfPQ8/YaXc8wzPNGvL8sOZqRbJVTEIzZWGMJvEm2Fq
 fdt9KqKghowZ3jhUa6XybOIqKU3gGR/XWd5eaLFd1Ee1waWNrB3xpDqg+yfB+AThRvlH
 A6ZDNoYORDe27dQgNZ3xn+EnSvYGwXgqd+AsVvC0/MdPJh28Ly8LbrwnxXeg8Bhb1unP
 z2MWpaNEBjzya45ArA1fWSK5sXONy/garWulzehM02ryI++A9jXvFjRiTnFjRAv6ivcL
 h6nQ==
X-Gm-Message-State: AOAM533MDmbx0K7aXulVLLserEnE9JvXqafuGfl8GED7tz/bVPaiPKh5
 sLwT71egV0AIjDRWChag7R3Y7x2dq3kNhWoGXl/J7Fgu
X-Google-Smtp-Source: ABdhPJzStd+1OyikPkvSA992ugegv1dBT7YXc8QIQDiEEiDabjzfppfs3LzXikWGuLc1JGwhRB8jEMvjoPMUonSA144=
X-Received: by 2002:a92:8702:: with SMTP id m2mr12303601ild.250.1631033418358; 
 Tue, 07 Sep 2021 09:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAC6DygdBVsk2Sa3LFLLs5WdOUUOi1Vs0+v6gXV7d+h-noy8v1A@mail.gmail.com>
 <CAHmME9qH9T3O04YG+DMdq79BgkUBxSTzHfgfL5m0CaymvGJ3LQ@mail.gmail.com>
In-Reply-To: <CAHmME9qH9T3O04YG+DMdq79BgkUBxSTzHfgfL5m0CaymvGJ3LQ@mail.gmail.com>
From: Veerabhushan Hatte <vkhatte@gmail.com>
Date: Tue, 7 Sep 2021 09:50:07 -0700
Message-ID: <CAC6DygcvH2HB+2PjipYkDTsQ=G+FahHnYTSkzvW+T72MiYcuDw@mail.gmail.com>
Subject: Re: Unable to load wintun library for Windows
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Hi Jason,

Thanks for the help. I copied wintun.dll into same directory where exe
file is located and library loaded library successfully.

Thanks,
Veera

On Sun, Sep 5, 2021 at 6:22 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Copy it to "C:\Program Files\Something" and execute your exe from
> there too. Never copy files into C:\windows\system32.
