Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79A4C7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:54:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69EA721019
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="FmfifAg1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69EA721019
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed3367ce;
	Wed, 17 Jul 2019 20:54:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48dcbd28
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:54:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d053edb
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:54:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e23767f
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=OCoONKo2DHjA/xRPt3t3gviYkCw=; b=FmfifA
 g1USG+0GI99de3TeuDo0NraQsl8JA01bUouh4VGvGPznDRxwBqylA6rukgZJTGtC
 Rk7g5NMu3+4COdg7gMFmSiiuSaELKS+UwbWMz4mBt7b0Xs3fETep6RYrYQORJlAD
 fPYkQ6V9bRWN8QCQr7tMMLROKKrLCmA0GEfXWEVsjPKXCYFTsscuRnXBVyKQQBOR
 /mqG7kw2kR9PQdqof23mAHU05WeWiaZ/FO3vzxsH/jW13sazpvCDL2gZMEUyBrXq
 120Cos+kQoOul7MborLvT4A8faQCKQ64rN3JicZBUc/Dplok7q2T0oiZbC18bOJg
 54kr2IAK0qQxN82A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4437e081
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:18:07 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id b7so26519766otl.11
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jul 2019 13:54:55 -0700 (PDT)
X-Gm-Message-State: APjAAAU1N7nnP9uY9BWybJlP79LPmsWNkstz38O33rk9//1YqlFKrPEC
 5VdBKYsYgDROkRRbcYuTs3PploVvY70sbsH35Fk=
X-Google-Smtp-Source: APXvYqxnQZsOOtKSnmi3K9gQsEK5m+0RgL3poT3+3d7Ur3EGvMF+m/2Ut1/H3a/HgeIBdhsQD8dxlGH7QFpMd9h/3IY=
X-Received: by 2002:a05:6830:2148:: with SMTP id
 r8mr23719533otd.179.1563396894388; 
 Wed, 17 Jul 2019 13:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <e332179c-68e7-46f4-1f4c-7c6b899b0864@syseleven.de>
In-Reply-To: <e332179c-68e7-46f4-1f4c-7c6b899b0864@syseleven.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jul 2019 22:54:43 +0200
X-Gmail-Original-Message-ID: <CAHmME9pYWcA_AJ6-UFqq-hUVdXfSadkBWQpg68ee=_R-ttgthA@mail.gmail.com>
Message-ID: <CAHmME9pYWcA_AJ6-UFqq-hUVdXfSadkBWQpg68ee=_R-ttgthA@mail.gmail.com>
Subject: Re: Wireguard in OpenVZ with NETIF_F_VIRTUAL feature
To: Benedikt Braunger <b.braunger@syseleven.de>
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

On Wed, Jul 17, 2019 at 10:40 PM Benedikt Braunger
<b.braunger@syseleven.de> wrote:
> * can someone explain me why the `NETIF_F_VIRTUAL` feature is missing in
>   [3]? Is this somehow purpose?

NETIF_F_VIRTUAL is a OpenVZ-specific thing, right? It's not part of
main line kernel if I understand correctly...

I might be able to hack around that in the compat layer though.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
