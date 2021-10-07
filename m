Return-Path: <SRS0=nAhE=O3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53411C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Oct 2021 20:56:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5496F61130
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Oct 2021 20:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5496F61130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acff6dfd;
	Thu, 7 Oct 2021 20:56:07 +0000 (UTC)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [2607:f8b0:4864:20::b31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 25a2456c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Oct 2021 20:56:06 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id u32so16273224ybd.9
 for <wireguard@lists.zx2c4.com>; Thu, 07 Oct 2021 13:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OAwhoQ8WnPjiR05kpnMMYY2kjXq1+16g/k5+6wSGx6g=;
 b=JOOJ48o9O8li5/RVr1K91U3pJsEcml3OhD2uhsKlydGuE9Dnvcj6fqA5qrn0QIzp26
 jpI04Ob9Vs3glArfc7zc+dJmCn4+0B6pHYoSOYedU9A+uPrRun2+hX4hqzSUanG0tCil
 p23NiCVSvt4CG+HrfOny84BXBMAEDvBj/uNbB8X1mYhqlvsm5tNeumKC9xCgb/n/E+JI
 K7yCwS0u08MD1Cxwq8wVQpZliHkOO67LkdTYW4zFcMOcQ6mMsVQo77n8jUld+El/NIkN
 feBXz3F28ZmLz6aKFSIRqfBFKIdUSU8myLSaOIOqBdrmbm6bC1he5fuVcqXeuZWBit8B
 qZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OAwhoQ8WnPjiR05kpnMMYY2kjXq1+16g/k5+6wSGx6g=;
 b=pdKTxYJvjo6lAgOEMJGpzJLGVA3Iw94DDuh3uXLAXJefIILl5aZ/SjXWATKqFE7B3q
 aHbHHmkyS9vVSHNhYUzHdtUCsM57E9HccYHcYxAU0yo5Dn+NmU6F5ZDKPDUDjiqfjkDT
 5/gOS3ZNBzj53OFSIa982B8sTuE3Vv74zNp3A98Q6Lgb6P22wMopMUdxZhWgDvOYolE3
 9nb7L7Q3pV+O63+yeftytrysuTqRfdvTicewaTxmavsf35Canw2lz8HyA1Mck40cN8FV
 URvSi3fXH129fFm5vHY1jn/O2cXCuUHBmCs3FOjRenoOfWUm1XJJ5GEI6tWisUzo9vLp
 uTGA==
X-Gm-Message-State: AOAM530RpOZY/b0ZHxfWnlZ3C0Dee+MSCZD89kMFVh/VYJijs9oG9Mjr
 svr2+NEo/bfOFlzT9V3mcUmLs3gO8m7Vf1Hx8+I=
X-Google-Smtp-Source: ABdhPJzGsVJVt21objpdGhNHBHCI7Jy0qwSEx4beX4m1GCqBTDIC+pOXICVrv7MXHOlyEkD3/h0Hb/R39nshNdumIUI=
X-Received: by 2002:a25:bb0b:: with SMTP id z11mr7234921ybg.108.1633640165017; 
 Thu, 07 Oct 2021 13:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210928031938.17902-1-xiyou.wangcong@gmail.com>
 <CAHmME9rbfBHUnoifdQV6pOp8MHwowEp7ooOhV-JSJmanRzksLA@mail.gmail.com>
 <CAM_iQpV-JKrk8vaHDeD0pXaheN0APUxH5Lp+mGCM=_yZQ1hd4w@mail.gmail.com>
In-Reply-To: <CAM_iQpV-JKrk8vaHDeD0pXaheN0APUxH5Lp+mGCM=_yZQ1hd4w@mail.gmail.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Thu, 7 Oct 2021 13:55:54 -0700
Message-ID: <CAM_iQpVNP2+7F59-6NDhXfE7qxU6APNdBu5UxcWKMaow05kytA@mail.gmail.com>
Subject: Re: [Patch net] wireguard: preserve skb->mark on ingress side
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Netdev <netdev@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Cong Wang <cong.wang@bytedance.com>, Peilin Ye <peilin.ye@bytedance.com>
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

Hi, Jason

On Mon, Sep 27, 2021 at 8:27 PM Cong Wang <xiyou.wangcong@gmail.com> wrote:
>
> On Mon, Sep 27, 2021 at 8:22 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Hi Cong,
> >
> > I'm not so sure this makes sense, as the inner packet is in fact
> > totally different. If you want to distinguish the ingress interface,
>
> The contents are definitely different, but skb itself is the same.
>
> Please also take a look at other tunnels, they all preserve this
> in similar ways, that is, comparing net namespaces. Any reason
> why wireguard is so different from other tunnels?

Any response?

Thanks.
