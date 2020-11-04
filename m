Return-Path: <SRS0=4t3h=EK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C176C2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Nov 2020 19:46:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 563D9206F9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Nov 2020 19:46:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YZ0TuiB2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 563D9206F9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 691e5273;
	Wed, 4 Nov 2020 19:43:38 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id acc0a271
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 19:43:35 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0511dc87
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 19:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=A3txSEFLmhKqctZhBsIbAmC27m4=; b=YZ0Tui
 B294RZlMp3QLM3Ri3JNXVOGFuWXm59fll9PFQbjflCH4iIqHSuP9Z8petTgmMsoa
 SYbiicDRJ07VU2USeeAHNCxPXmve1Apkqxc2QSqq56SCB5oDAhRL9G8qX5ELPRAl
 54WzpqWLpl51bZ18F02TkblOIVULgtTHAnmPCkQj7KUZEp1nFOpeB7z7821tZ+Cs
 d4R9vFfZ9lrK8MTI1fhIo66OpbCgYcENeFySwtOV6gsfTWVeMOqVYmJVQde4Dmq/
 7KXYw7NydK/I3c7Kc51z6FfX96jcuI8qpyujURHaLwNUi72UpnTdRv8h0yarEddf
 MIBiq3jLEgYQu1Rw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 98a8d222
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 19:44:21 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id b138so19045680yba.5
 for <wireguard@lists.zx2c4.com>; Wed, 04 Nov 2020 11:46:32 -0800 (PST)
X-Gm-Message-State: AOAM531NMbTdZZsmF2LzeL6I5ICkrz6uvq3ymNg+57TPpWhBLEQ9lmE5
 X9ExOQ//pZRW2W4L09wx07Ca3hqL8p2Ax7B88So=
X-Google-Smtp-Source: ABdhPJwrKS1Qe6FXigKFOooqaDL+07TCiLCBrWPsMRVnWDv3P9m/KovJNUleFszPuWdGWRHEv9qhIoS2MVT6MLp9zZs=
X-Received: by 2002:a25:4943:: with SMTP id w64mr27765905yba.178.1604519191132; 
 Wed, 04 Nov 2020 11:46:31 -0800 (PST)
MIME-Version: 1.0
References: <059fcb95-fba8-673e-0cd6-fb26e8ed4861@gmail.com>
 <4f731535-2a51-a673-5daf-d9ec2536a8f8@gmail.com>
In-Reply-To: <4f731535-2a51-a673-5daf-d9ec2536a8f8@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Nov 2020 20:46:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9qkPLwO4+H=+GAvWXDMQz-tHhyK1mmmtmb5Waph7fTiCw@mail.gmail.com>
Message-ID: <CAHmME9qkPLwO4+H=+GAvWXDMQz-tHhyK1mmmtmb5Waph7fTiCw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 07/10] wireguard: switch to dev_get_tstats64
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>, 
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Pablo Neira Ayuso <pablo@netfilter.org>, 
 Harald Welte <laforge@gnumonks.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 osmocom-net-gprs@lists.osmocom.org, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Steffen Klassert <steffen.klassert@secunet.com>
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

On Wed, Nov 4, 2020 at 3:31 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> Replace ip_tunnel_get_stats64() with the new identical core fucntion
> dev_get_tstats64().
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/net/wireguard/device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
> index c9f65e96c..a3ed49cd9 100644
> --- a/drivers/net/wireguard/device.c
> +++ b/drivers/net/wireguard/device.c
> @@ -215,7 +215,7 @@ static const struct net_device_ops netdev_ops = {
>         .ndo_open               = wg_open,
>         .ndo_stop               = wg_stop,
>         .ndo_start_xmit         = wg_xmit,
> -       .ndo_get_stats64        = ip_tunnel_get_stats64
> +       .ndo_get_stats64        = dev_get_tstats64
>  };
>
>  static void wg_destruct(struct net_device *dev)
> --
> 2.29.2

Looks fine to me.

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
