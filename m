Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C865BC2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:38:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEAF320825
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="wYzWKg02"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEAF320825
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 641bc0df;
	Thu, 12 Nov 2020 08:34:45 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ff463c48
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:34:43 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0c6b606
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=V5RtEGK53hcX5t0vLlt+s3BudYs=; b=wYzWKg
 02tGXc+2PbnkMDY+ZEC94liLRRhYLdwsVd/Uyy8+sSXx5CJuGlbjQCV7XwC54mB3
 NJKivT8bWXNBXhHjDu+W9pV8tCfvS5gnfirbZ3zNeg7pyoChZUpxX6U/aO3+2rYI
 GSvBKqZLcxJ6gTI3XEM1/GfVXe+nGZ663wgMn40TOtXIihV7IGaL6k929Z6BKzML
 a2kYSQm5fO3v524FqNNRskKKnd5MrwdwmjRomdpyaGwOUmfLQsqCCrsTYdpyhAHi
 DJYyGHc2xRPvjKvaANBFb6nHvWh4Z11VM37KnEKQpBdPvRudjDHec2oB1K4fTe2y
 0Wx3RDYH4YxinnaA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 44978c14
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:35:29 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id s8so4546011yba.13
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 00:38:39 -0800 (PST)
X-Gm-Message-State: AOAM530AiFudt68+wqi9C+BV0fgzvGv0peeuBDXGjQDnXBU9tsupbFlN
 F00joVQUv8y9JOiOiwl9++E3Ya40nJubelcJsw8=
X-Google-Smtp-Source: ABdhPJyAyY3TXh+l0WxLyaBEiLLyC9xFxsGK+92amE6LjO3rvzw7lfSnAFXqY4vtFAXHctUvk/hteGZjFL73UXxdb1Q=
X-Received: by 2002:a25:df05:: with SMTP id w5mr43071066ybg.20.1605170319133; 
 Thu, 12 Nov 2020 00:38:39 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <K17360-33.1605029899@spamhaus.org>
In-Reply-To: <K17360-33.1605029899@spamhaus.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Nov 2020 09:38:28 +0100
X-Gmail-Original-Message-ID: <CAHmME9pmKxGYmxxs0pLt=zt2igy6aR-g5xsB=2Zew6oWVY0Z3w@mail.gmail.com>
Message-ID: <CAHmME9pmKxGYmxxs0pLt=zt2igy6aR-g5xsB=2Zew6oWVY0Z3w@mail.gmail.com>
Subject: Re: Should we sunset Windows 7 support?
To: Andrew Fried <afried@spamteq.com>
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

Hi Andrew,

On Thu, Nov 12, 2020 at 9:29 AM Andrew Fried <afried@spamteq.com> wrote:
>
> We recently began deploying clusters of recursive DNS "firewalls" that
> use wireguard to secure and authenticate all traffic between the client
> and servers.   What we quickly learned was that virtually the entire
> customer base in India uses Windows 7 almost exclusively.
>
> I can certainly understand the desire to streamline development and
> focus on current versions of client operating systems, but by
> deprecating support for Windows 7 you would be reducing the number of
> potential Wireguard deployments by hundreds of millions of users,
> particularly in Asian and underpopulated communities in Africa.  Most of
> the end users there simply can't afford the cost of updating to the
> latest version of Windows.  I personally wish this were not the case,
> but it is what it is.

Thanks for that info. This is by far the most compelling point brought
up so far and is one likely to keep us supporting Windows 7 for some
time. I assume your deployment to those parts of the world is quite
large?

Are there any websites or other sources you used to find these
statistics about usage per region? It sounds like that'd be useful to
look at.

Jason
