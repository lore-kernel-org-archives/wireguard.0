Return-Path: <SRS0=cL7X=H7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04403C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Mar 2021 20:10:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F294964DDF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Mar 2021 20:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F294964DDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5a6d275;
	Mon, 1 Mar 2021 20:09:43 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9a067d64
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Mar 2021 20:09:41 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id i21so17130801oii.2
 for <wireguard@lists.zx2c4.com>; Mon, 01 Mar 2021 12:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FxvXDhSy+QFjhUDRje4hCgMvieUrkU+IA9Fq5emK7n8=;
 b=HMvIBQzHFMPU+cmeY8EUb0u+OBlaTNihneNYTHmEhHHmTvZxMiANROEpXd/Rvp3tGa
 rp2bfDEr6KZ1ROA+/gOPz489aNd3x6MKpca7QvSGiaODinewqdFyh+8Bhrfmp5ey9PxC
 n7yIZWiaw2VKPeB6ZE2R7/yrlqt4EeSmL8ZP+gZ2NMVeHV7fMtSuSwWYYjjk9EwiW1R3
 0farV5T6rBqR5VKCSYuggr5anSup4tEw6TRZu+/XlnajtbHs93nnshRuBO9pxNtWpcbz
 u6GhNHjERH4RIRd282NKOAwV/ywIcuMFXe87ZeE60kJiDOugLGak5B8u5fHim7Nd0YIc
 7K/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FxvXDhSy+QFjhUDRje4hCgMvieUrkU+IA9Fq5emK7n8=;
 b=jUVJ9b61vhaeXoRwn+rGUZ3BhQVmeLH2p7fi9o1z343Fwd7REU85Byf6Z1vfGWRtX0
 E8zIvkzSKY+pXVC3YWagrO7ZBzXuVNZ8E6rK10krkzltN7+sJDeDxpGfgilFopj1MgKG
 FI3UDYKQQBtyCxhAeeFtxZQfCltAeJ2QnKxrNa/YmGJFfQruA9z5yG55wQOHTHbjUJVY
 iX9BB7VDzO2Qa4NrBvdBx0XYIqaN9FzRtSMCCg+OC36DNHZoR5aOnUqegmyh6iHNfcr5
 riwsA69LzgG5LBx8mHsbhcHYyhNqEnff+oYsmYlkrRQ5rDw6BC2cYZH90qow+ODZFwQj
 tcxw==
X-Gm-Message-State: AOAM530nBxBaCG000VPgsvx++dMQMR4gnjenwzfq1CNUJM/zfspt8UY7
 7jy7GgI5JEy9U6HAfZoeGFqC2MoD+2wUWx+IB+o/U34r
X-Google-Smtp-Source: ABdhPJywcUjJRcXlKg/osF7WzQ4rMFL48ySoqwmz+7MaHsTYQd/OmVaUDiphryUcsHPmbFMA7QmwntuPWX6+XtR6i88=
X-Received: by 2002:aca:1e15:: with SMTP id m21mr556307oic.62.1614629379950;
 Mon, 01 Mar 2021 12:09:39 -0800 (PST)
MIME-Version: 1.0
References: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>
 <E8F8664E-3C8A-45B9-B9B8-1A1E2873289B@carmickle.com>
 <65365aa6-cdd0-f9dc-f894-3a040ca596ae@aaronmdjones.net>
 <CAMS0tn0k=7aVstO7Nnn1zZDUypuE2sWidS3uT+04=7rs6+YjGQ@mail.gmail.com>
 <43EFA67E-34E0-4E33-A2FB-EBD42002F1AB@carmickle.com>
In-Reply-To: <43EFA67E-34E0-4E33-A2FB-EBD42002F1AB@carmickle.com>
From: i iordanov <iiordanov@gmail.com>
Date: Mon, 1 Mar 2021 15:09:03 -0500
Message-ID: <CAMS0tn2FXkzFHgMgkDwYvD2Fhrxb_PjMNDuV54sL9-ZhTijS7A@mail.gmail.com>
Subject: Re: Nested Wireguard tunnels not working on Android and Windows
To: Frank Carmickle <frank@carmickle.com>
Cc: Aaron Jones <me@aaronmdjones.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Frank,

On Mon, Mar 1, 2021 at 9:42 AM Frank Carmickle <frank@carmickle.com> wrote:
> Maybe it's a bug and not a feature? It seems to me that you would have no way of setting the MTU on the inner tunnel.

That's true - other than inefficient packet fragmentation, is there
anything else that would be an issue?

> Is there a reason why you can't try multiple interfaces?

I cannot bring up more than a single interface on Android. I am not
sure about interface management on Windows with wg.exe, but
wireguard.exe certainly does not permit multiple interfaces to be
brought up.

Thanks!
iordan


-- 
The conscious mind has only one thread of execution.
