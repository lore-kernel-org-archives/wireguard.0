Return-Path: <SRS0=kilO=AD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4C9C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Jun 2020 08:24:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 747FA20706
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Jun 2020 08:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="K2ywOdCA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 747FA20706
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fc61207;
	Mon, 22 Jun 2020 08:04:53 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5dd237b0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jun 2020 08:04:49 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b4e915b
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jun 2020 08:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=WKgEE7uOsFwyChhXVkPLgfDDliM=; b=K2ywOd
 CAEJNYTZg+B/jz1IlELpJI1j+fqg7OLFG5m2SAqn0oTSAavYxtxHCm72t6IYIzCt
 Zx7edtgaCO7udn6rwvyhQRXk/gh4FmGWoZL6Gqas0CqOMgcN3foX3shrg9vKA02S
 cc/Q4BTYMDQUY/53J/hLZ0nqfle+o6kI9aaDC0rdxvasYNeh+23abdfM3aS1wKeQ
 Q/l/Tr59BqV2VShYpUAQf5KcfF3XjyVB35pCF9fnGjjXQ0pfHybYJlY9F5Vugt9S
 EGTrVvBODJE0AUmbc6qrTT/4Mz8urtM2srb5/5CW2yprLGT/SLD2pjvtCHxBXyL6
 s5D2axncdpuLJwBA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 08cfdc47
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jun 2020 08:04:49 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id i25so18604987iog.0
 for <wireguard@lists.zx2c4.com>; Mon, 22 Jun 2020 01:23:32 -0700 (PDT)
X-Gm-Message-State: AOAM533PIj8l6hADOgj8wCTSbHy9psKUwDPMbxA/un1gNR+mDPFTFt49
 CpFD8pR4rfeSpFlA2n0+14PlU1FXaGDLBjZZRBw=
X-Google-Smtp-Source: ABdhPJwyeMF84aOEDbK/bI2AMOh5SlULPBX7U0Jh0LZpQXnLAXly35FElJoQse/Fnf5hjA82NDTOtdeg5IX1JqwYZD0=
X-Received: by 2002:a05:6638:dcf:: with SMTP id
 m15mr6248435jaj.86.1592814212206; 
 Mon, 22 Jun 2020 01:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAN5wt5r_qoLFrZM6T2CJ6UhQpcqFTqf5AHUugpe0rN5LuL3YLQ@mail.gmail.com>
In-Reply-To: <CAN5wt5r_qoLFrZM6T2CJ6UhQpcqFTqf5AHUugpe0rN5LuL3YLQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 22 Jun 2020 02:23:21 -0600
X-Gmail-Original-Message-ID: <CAHmME9pfyKr62RrAmV81NKs938CmQbqRtcab=yJzKw9V8iMc1A@mail.gmail.com>
Message-ID: <CAHmME9pfyKr62RrAmV81NKs938CmQbqRtcab=yJzKw9V8iMc1A@mail.gmail.com>
Subject: Re: Wireguard over VPN broken on windows
To: Christopher Ng <facboy@gmail.com>
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

> 59e556f on wireguard-go breaks

59e556f fixes a regression, which never shipped in any release. There
is nothing here that "once worked and now doesn't." What you have in
mind has never worked.

We're currently using IP_UNICAST_IF on the wireguard socket, attaching
it to the default route. I'd much rather have something like Linux's
policy routing and suppress_prefixlen, but I don't know how to do that
(yet?) on Windows. If you have any ideas or want to do some research,
I'd certainly be very interested.
