Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1A6C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Oct 2021 19:29:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3706B6109D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Oct 2021 19:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3706B6109D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 487a978c;
	Fri, 22 Oct 2021 19:26:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0a3feec1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Oct 2021 19:26:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B87DC6109D
 for <wireguard@lists.zx2c4.com>; Fri, 22 Oct 2021 19:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="OhTbVByM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634930794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHuXjtnGIwA8Zzr3bT7RPQh03xIe4TvMRJ0gk9Qtcas=;
 b=OhTbVByMlK+3wEm3H7RtjiPQ48BBTloK10IPmOtUR3F3cB5mxrGZ98hx0U7/gBE5e7CzjR
 Kga38liiuphI4U63RtD8vdqxeP3DMTzIgVpmhYuliw+Ke0br7mZ3yBhatsOaTP7y6c02Eq
 G7LS6ItaXtPIfnNfVrMvFs8w9fO3wz8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a168f85f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Oct 2021 19:26:34 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id g6so9302991ybb.3
 for <wireguard@lists.zx2c4.com>; Fri, 22 Oct 2021 12:26:34 -0700 (PDT)
X-Gm-Message-State: AOAM533ALmSg7Zzec31AumLK7rK4VlgLi+OZGj9zDGr1pYcJPEIheBUP
 Ol0DRQjwLPjyhT+0J7m63jf1DofQJaKSCrzOe7w=
X-Google-Smtp-Source: ABdhPJwUd0X3EqIXmJ5BPp8dcnhFQH4/XK5KW2hoeo7f12NFZiw8gEAYLkHNQHhM4VL1zSEVSnFc4Y+E9/adWsbhdRA=
X-Received: by 2002:a25:bcd1:: with SMTP id l17mr1611156ybm.449.1634930793282; 
 Fri, 22 Oct 2021 12:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <b28e05e1-4209-8b82-1b00-e963b2e8fc85@m7n.se>
In-Reply-To: <b28e05e1-4209-8b82-1b00-e963b2e8fc85@m7n.se>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Oct 2021 13:26:22 -0600
X-Gmail-Original-Message-ID: <CAHmME9qeKoZfp0KC8WxJX8-2YNaGTyXXVrf-+Uktr=isKLYh_Q@mail.gmail.com>
Message-ID: <CAHmME9qeKoZfp0KC8WxJX8-2YNaGTyXXVrf-+Uktr=isKLYh_Q@mail.gmail.com>
Subject: Re: [PATCH] wireguard-tools: embeddable-wg-library: add named
 wg_endpoint union
To: mikma.wg@lists.m7n.se
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

Applied, thanks.
