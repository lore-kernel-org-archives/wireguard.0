Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90945C54ED1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 23:16:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a3561ea;
	Wed, 21 May 2025 23:11:22 +0000 (UTC)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bc7966e9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 May 2025 23:11:20 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3108652400cso264829a91.1
 for <wireguard@lists.zx2c4.com>; Wed, 21 May 2025 16:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1747869078; x=1748473878;
 darn=lists.zx2c4.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KdZyuVQRffc/qTOwDv32OiSbo0Uwd9rdVUrfHuZzreA=;
 b=aU2ovzUvyiUO2j5aQx1gF80U79d7vr49qNDwrJH2dj06yso99TY+5ANOFS6eaJhhNX
 F52vYxxudfbgaeie+zhBnMpg0eILflapANiT+jpHW7Ai7cmkSmdJ9EmJcrMQcby8XgoB
 mKTavj5eiJnODVG2sRANfeds7YFHt3e4zwVI8ighWfHOwpW4wmxYM2wII0wtaz0ivX2W
 MwlME+ziD2BsqZGjJ+vWILRB0p+LxTcwqTvUPQssKf7sIHLZHhPwMIcq37huoRDDir8X
 5ylKaEYPq5lPBVQ+14xdmOCgZZSxFwnndfoBYiZs40LmYzdT47/aw8n5xNRENTmKl1JZ
 T+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747869078; x=1748473878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KdZyuVQRffc/qTOwDv32OiSbo0Uwd9rdVUrfHuZzreA=;
 b=fX/yucmpc/eOuRcZ2AL9ZUdX8YDkMq//yDID9U/CLCvCkEzf1JW7by3MEMy8xRsIDP
 kfLlx8K2CpV4bPZrUkUY4EKKrd3vOy1eR9dLtRAj0Giz5d9lyMO/44PZ9TLNF8nF66gK
 FQNa9jZynt8coVZS2gPO3qjFENW/4cfCaG8bkeN13bPndGTdNAzTbiunGFQ3tvo227bQ
 uDpGy1iBL9pnR79CuvjOOGdZ9j7kaPxgzKjPiMUu/+K0/TbWwWbXZHyKxp6AWvQYaLkq
 Zr6Z26TYT/eaXUg/KKKoJ9tWhfAmoP9bMmtGgU3NI1kIWkU/7Y8VQEcNHGDNlMm4ZxaP
 F4Ew==
X-Gm-Message-State: AOJu0YzpKb2i3JCjpLsK1JWOh9Kc7kQYcLZzzUvzl/0jvEOVYoiLbkke
 Iq32ITUIXydqm2H683ljKNwKC/2ijcI2usPv5FGB4HWNt8i5F5TUe/6hon1Ba2uR98s=
X-Gm-Gg: ASbGnctzpioNjwsXbo8OMZJZ8NgfZ6uNbQZtptLrn4Bpne6HfM8UFiFJ7uk2RoxlmuU
 r4rCAcAxQoSxCroCwZSpWTS4RWxA/tQxElAHedFPLWLOifojgBmDDoeCklgUQ/IlKswh5UmFSST
 i/V3+hfU7sIeq357wdaNBBMOqLK44utuGWN4cW9PyKZGx1EeGKLsDrDPA28ArfqeK3yb60MVMCx
 ODl7OGoMAkjKSuLvPSKaJNM3Y3nXiWSEvW9JV/fbUg0CcLX6t5R2Mb2Exu9tBy0bVyVVWkotUq8
 9mTTleuF1gZgPKV/MqhAYE9BhTvBrKZGlR58Pw==
X-Google-Smtp-Source: AGHT+IGwjSUbiRwMD8QV6uWmDfMxXDebDsmtwEZ8vFNFrWh6oU27yigQeTPsiHaCNfm11lMgVo+uvw==
X-Received: by 2002:a05:6a20:d523:b0:215:db66:2a2f with SMTP id
 adf61e73a8af0-216216573a0mr12815396637.0.1747869078421; 
 Wed, 21 May 2025 16:11:18 -0700 (PDT)
Received: from t14 ([2607:fb91:1be5:f4d8:99e5:a661:f426:884c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a96defc3sm10143644b3a.21.2025.05.21.16.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 16:11:18 -0700 (PDT)
Date: Wed, 21 May 2025 16:11:14 -0700
From: Jordan Rife <jordan@jrife.io>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [RESEND PATCH v3 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
Message-ID: <a7h5ug23xvcayh66nm2373nxotd73xbr36kabpjky273wudb7i@mmduvu4bqzqa>
References: <20250517192955.594735-1-jordan@jrife.io>
 <20250517192955.594735-2-jordan@jrife.io>
 <aCz4jK9i-N6e5xk-@zx2c4.com> <aCz7YEp5-Viktx7W@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCz7YEp5-Viktx7W@zx2c4.com>
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

On Wed, May 21, 2025 at 12:00:00AM +0200, Jason A. Donenfeld wrote:
> On Tue, May 20, 2025 at 11:47:56PM +0200, Jason A. Donenfeld wrote:
> > Hi Jakub, Jordan,
> > 
> > On Sat, May 17, 2025 at 12:29:52PM -0700, Jordan Rife wrote:
> > > * Use NLA_POLICY_MASK for WGALLOWEDIP_A_FLAGS validation (Jakub).
> > [...]
> > > +	[WGALLOWEDIP_A_FLAGS]		= NLA_POLICY_MASK(NLA_U32, __WGALLOWEDIP_F_ALL),
> > 
> > I wonder... Can we update, in a separate patch, these to also use
> > NLA_POLICY_MASK?
> > 
> >    ...
> >         [WGDEVICE_A_FLAGS]              = { .type = NLA_U32 },
> >    ...
> >         [WGPEER_A_FLAGS]                = { .type = NLA_U32 },
> >    ...
> > 
> > Some consistency would be nice.
> 
> Perhaps I'll commit something like this?
> 
> From 22b6d15ad2a2e38bc80ebf65694106ff554b572f Mon Sep 17 00:00:00 2001
> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> Date: Tue, 20 May 2025 23:56:18 +0200
> Subject: [PATCH] wireguard: netlink: use NLA_POLICY_MASK where possible
> 
> Rather than manually validating flags against the various __ALL_*
> constants, put this in the netlink policy description and have the upper
> layer machinery check it for us.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  drivers/net/wireguard/netlink.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
> index f7055180ba4a..b82266da949a 100644
> --- a/drivers/net/wireguard/netlink.c
> +++ b/drivers/net/wireguard/netlink.c
> @@ -24,7 +24,7 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
>  	[WGDEVICE_A_IFNAME]		= { .type = NLA_NUL_STRING, .len = IFNAMSIZ - 1 },
>  	[WGDEVICE_A_PRIVATE_KEY]	= NLA_POLICY_EXACT_LEN(NOISE_PUBLIC_KEY_LEN),
>  	[WGDEVICE_A_PUBLIC_KEY]		= NLA_POLICY_EXACT_LEN(NOISE_PUBLIC_KEY_LEN),
> -	[WGDEVICE_A_FLAGS]		= { .type = NLA_U32 },
> +	[WGDEVICE_A_FLAGS]		= { .type = NLA_POLICY_MASK(NLA_U32, __WGDEVICE_F_ALL) },
>  	[WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
>  	[WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
>  	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED }
> @@ -33,7 +33,7 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
>  static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
>  	[WGPEER_A_PUBLIC_KEY]				= NLA_POLICY_EXACT_LEN(NOISE_PUBLIC_KEY_LEN),
>  	[WGPEER_A_PRESHARED_KEY]			= NLA_POLICY_EXACT_LEN(NOISE_SYMMETRIC_KEY_LEN),
> -	[WGPEER_A_FLAGS]				= { .type = NLA_U32 },
> +	[WGPEER_A_FLAGS]				= { .type = NLA_POLICY_MASK(NLA_U32, __WGPEER_F_ALL) },
>  	[WGPEER_A_ENDPOINT]				= NLA_POLICY_MIN_LEN(sizeof(struct sockaddr)),
>  	[WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL]	= { .type = NLA_U16 },
>  	[WGPEER_A_LAST_HANDSHAKE_TIME]			= NLA_POLICY_EXACT_LEN(sizeof(struct __kernel_timespec)),
> @@ -373,9 +373,6 @@ static int set_peer(struct wg_device *wg, struct nlattr **attrs)
> 
>  	if (attrs[WGPEER_A_FLAGS])
>  		flags = nla_get_u32(attrs[WGPEER_A_FLAGS]);
> -	ret = -EOPNOTSUPP;
> -	if (flags & ~__WGPEER_F_ALL)
> -		goto out;
> 
>  	ret = -EPFNOSUPPORT;
>  	if (attrs[WGPEER_A_PROTOCOL_VERSION]) {
> @@ -506,9 +503,6 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
> 
>  	if (info->attrs[WGDEVICE_A_FLAGS])
>  		flags = nla_get_u32(info->attrs[WGDEVICE_A_FLAGS]);
> -	ret = -EOPNOTSUPP;
> -	if (flags & ~__WGDEVICE_F_ALL)
> -		goto out;
> 
>  	if (info->attrs[WGDEVICE_A_LISTEN_PORT] || info->attrs[WGDEVICE_A_FWMARK]) {
>  		struct net *net;
> --
> 2.48.1

This changes the error code returned in userspace in these cases from
EOPNOTSUPP to EINVAL I think, but if there's nothing relying on that
behavior then it seems like a nice cleanup to me.

Jordan
