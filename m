Return-Path: <SRS0=RmRV=3X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91835C35249
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 17:30:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2865B2087E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 17:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WvadvRaw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2865B2087E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c3e2465;
	Mon, 3 Feb 2020 17:29:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b4a4cd4
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 17:29:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e598a1c
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 17:29:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35e9dfa8
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 17:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=28t6sotqJukaFxRw171I3Cn6DxE=; b=WvadvR
 awCQFfOXiFBAGpb31NVzMFCrXb+RoX72vuoryKggzxx1QcQpFUnNLrAbcsf2t2lN
 74iVHgdLpQqKJAMesGaoqwYmVaicQ1OKg+ATPNsM7OF0zFtBr7hlZ+U5zptJdmfJ
 SD2NuAnoIfTY/8ydEGDfj2mUp8dfVCVuOa3rUK8MVBw2bDk7+WIeZ/9Hpx30IFX7
 TF0niHnMDQx+jsn4JltcqETWqsgryDOG0Vg/jSsXdRMcDOjbaSTj9+WDikDs7qQS
 vAYcCwoxvg7mlQ5DSWNv8hQaIiKgqGrBM5yFqTNFw6UbNR/qPOuR5pUlBgcG3LIX
 TGYiwMQjAyxeDkaQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7d209846
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 17:29:22 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id q81so15583420oig.0
 for <wireguard@lists.zx2c4.com>; Mon, 03 Feb 2020 09:30:04 -0800 (PST)
X-Gm-Message-State: APjAAAUA69zmeAQpWiewjyMHgpQ1yI3VOamIuGK/N0Fg5dkxJXJ0jzl+
 6yw1eV2U753R6vZZoLTbZFmB4D4sYYkbnqjqcwk=
X-Google-Smtp-Source: APXvYqzIoRHqNoLv7FbvVlnzWCsh7Adxxc5E2xveI4Q5n+MliMNd+hhEYP6mEFieDEAx6R0WAg1mk5zzcMJjebtbYe4=
X-Received: by 2002:aca:2109:: with SMTP id 9mr77511oiz.119.1580751003175;
 Mon, 03 Feb 2020 09:30:03 -0800 (PST)
MIME-Version: 1.0
References: <20200203171951.222257-1-edumazet@google.com>
In-Reply-To: <20200203171951.222257-1-edumazet@google.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Feb 2020 18:29:52 +0100
X-Gmail-Original-Message-ID: <CAHmME9r3bROD=jAH-598_DU_RUxQECiqC6sw=spdQvHQiiwf=g@mail.gmail.com>
Message-ID: <CAHmME9r3bROD=jAH-598_DU_RUxQECiqC6sw=spdQvHQiiwf=g@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: fix use-after-free in
 root_remove_peer_lists
To: Eric Dumazet <edumazet@google.com>
Cc: netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 syzbot <syzkaller@googlegroups.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <eric.dumazet@gmail.com>
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

Hi Eric,

On Mon, Feb 3, 2020 at 6:19 PM Eric Dumazet <edumazet@google.com> wrote:
> diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> index 121d9ea0f13584f801ab895753e936c0a12f0028..3725e9cd85f4f2797afd59f42af454acc107aa9a 100644
> --- a/drivers/net/wireguard/allowedips.c
> +++ b/drivers/net/wireguard/allowedips.c
> @@ -263,6 +263,7 @@ static int add(struct allowedips_node __rcu **trie, u8 bits, const u8 *key,
>         } else {
>                 node = kzalloc(sizeof(*node), GFP_KERNEL);
>                 if (unlikely(!node)) {
> +                       list_del(&newnode->peer_list);
>                         kfree(newnode);
>                         return -ENOMEM;
>                 }
> --
> 2.25.0.341.g760bfbb309-goog

Thanks, nice catch. I remember switching that code over to using the
peer_list somewhat recently and embarrassed I missed this. Glad to see
WireGuard is hooked up to syzkaller.

I've queued this up in my stable tree, and I'll send this back out in
a few days:
https://git.zx2c4.com/wireguard-linux/commit/?h=stable&id=3492daa8815770038c9da36382dc66cea76ad4fc

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
