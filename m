Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C21FC71153
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 28 Aug 2023 18:00:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e41fcce1;
	Mon, 28 Aug 2023 17:55:23 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 827db489
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Aug 2023 17:55:20 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso5404953e87.0
 for <wireguard@lists.zx2c4.com>; Mon, 28 Aug 2023 10:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=krose.org; s=google; t=1693245319; x=1693850119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1F/Gw4Z5gDu9Yz/dz8atWXbSb53THhZOBpN/WVjsTWY=;
 b=MpqEdyinQO11n38NsdRl6+cfMAy3/XbDjobjYFtqrkZsbtQjT67Qz30lPi9fKLx4At
 jSTFGzkLcLakVlm+ILwjucoMk2pL+D1rtJ5Fm51zgHR/ysrgpVnksT3fYxafTKgho5cv
 RtqPnygnKkCCTIE5eCmjCuOAIt5gYqZqvtjao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693245319; x=1693850119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1F/Gw4Z5gDu9Yz/dz8atWXbSb53THhZOBpN/WVjsTWY=;
 b=WRu1cmkQwBpcFctjpSV3kTwy+e3dEq0mR5jk6fR5+hGkdE7FUpOZc47VGI2owCYcYK
 jAHpiGE/eQ7uzXpw37DMQoMhV+EtRAy/RHFgumr5y8Q4o5tnC3TMqgze3TJz8+BxoxID
 m1ClmqtXoMlnwEichdyQLOZhzbOjz4vd1S+4p8AEhFluMp+RhIr/TKjIISwL8TVA7ZYH
 3HAJMAHEkPUn9qGf7YH8xa/lVOxpVHX7+BV5GcSWT8U22bUr+tf4nM8TfeU7K4ad4xjf
 DyS7MQssOHgDCcwooybFjiwWlafux8rt7WUJzxX1wLq0XmAMG/A/UDOz5GKxY3RZUDwn
 VeKg==
X-Gm-Message-State: AOJu0YyP1UM9uZITQuntemeTRP/e08GDBnubBokkpnlBlfm8oB5CuEYZ
 dZLHdpD5qFEpV5eHtJlB5wlymKpbfyRphMrVa0TuGA==
X-Google-Smtp-Source: AGHT+IE0FA+dURky2KXvHQx7ycPC0s+7w4EsMsIJj/xln9kILjMGxjma25b7De1EbiNxG4lAHYrhmya3Z/WCnmMSNXc=
X-Received: by 2002:a19:791d:0:b0:4fd:cbd6:d2ff with SMTP id
 u29-20020a19791d000000b004fdcbd6d2ffmr16269916lfc.33.1693245319484; Mon, 28
 Aug 2023 10:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
 <4b-64e11f80-13-5e880900@8744214>
 <20230819212357.lkshcpslkgbeaq4e@House.clients.dxld.at>
 <CAJU8_nVR_ohTetKzHoxFH=dYccQg9HdniqV+JKk4LoJGorx0ZA@mail.gmail.com>
 <20230828160705.a5uxv5l2zknna7yj@House.clients.dxld.at>
 <87v8czqd3w.wl-jch@irif.fr>
In-Reply-To: <87v8czqd3w.wl-jch@irif.fr>
From: Kyle Rose <krose@krose.org>
Date: Mon, 28 Aug 2023 13:55:08 -0400
Message-ID: <CAJU8_nVTHmd9_=SXN+6maVB9BVLno_FGiM3RjZsCiXVOcNBLHg@mail.gmail.com>
Subject: Re: [Babel-users] [RFC] Replace WireGuard AllowedIPs with IP route
 attribute
To: Juliusz Chroboczek <jch@irif.fr>
Cc: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>, bird-users@network.cz,
 babel-users@alioth-lists.debian.net, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 28, 2023 at 1:41=E2=80=AFPM Juliusz Chroboczek <jch@irif.fr> wr=
ote:
> I've read the whole discussion, and I'm still not clear what advantages
> the proposed route attribute has over having one interface per peer.  Is
> it because interfaces are expensive in the Linux kernel?  Or is there som=
e
> other reason why it is better to run all WG tunnels over a single interfa=
ce?

Why manage n^2 tunnels and allocate n^2 /30 CIDRs when you can just
have one tunnel and a single subnet for a full mesh? IMO, the latter
should be a feature differentiating Wireguard from other solutions to
creating a mesh VPN. That is, in fact, the whole reason I dropped
OpenVPN for it.

Kyle
