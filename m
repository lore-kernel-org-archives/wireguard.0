Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7DAC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 08:10:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BD1720645
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 08:10:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=diyism.com header.i=@diyism.com header.b="R2TpYdwL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BD1720645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diyism.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c83c90c3;
	Mon, 17 Dec 2018 08:09:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c584e04b
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 08:09:48 +0000 (UTC)
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a690a986
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 08:09:48 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id h78so7151796vsi.6
 for <wireguard@lists.zx2c4.com>; Mon, 17 Dec 2018 00:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diyism.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z/TyY3xUO7+7QF8t5bEehV7Hy+mNnSJzxcvzpKoq3Og=;
 b=R2TpYdwLyIWY7xz9GBoERzyIbnol4kneccdLc73xK77Da6tI4X2ryvIuUozwEPTC5a
 Jke0qUyFG8zfyEz5pi7iJ0WaK7SnWoplr4O3DD/DNuQdBwa7wIN2nw6/uuDmzCew8YWQ
 QwMFq6a/GKm2mFel+hJpLNfa0HSrWgyLyalUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z/TyY3xUO7+7QF8t5bEehV7Hy+mNnSJzxcvzpKoq3Og=;
 b=NoyHoqRL8Txy3OX3mt2dbWTzWYwWq4w2nrTBgUYbQcuvi6NlH0GVbIeZvek7QWXyay
 paaqXiVo6irIhfhcp3b2w/1SBACB/NT3Z2Y9qOi0qjhOupbXK/TtCIiad+3Mi8d+wniR
 9QaBOYcHfLIE9T4jI86o4R0j5yE86KjrBQWGBkrKmy1DRp9tUOavQfv4O5zG3OHf3Fbq
 zcDsJCKKbn9vOV19PdnnytcK+e4/A+UYlj8omdXmJ1pb2QkaZuPxvKqD6/EyiMh++ydQ
 TSfxEAwl4G4IEQtXMCDrwN23mIJNXturhvtzQqpLD+9x+YuDUcSDrxkhONP9al2pMNry
 Ygkg==
X-Gm-Message-State: AA+aEWanc0T1vBJdso4flEhE85LuY2b4gkIrl+U/k+0C58BdQRi3RBop
 WeewiyXjZ3io48GuoOfkGRYs5NJ16kgRPrqYA44QUkU9k1g5ygkI
X-Google-Smtp-Source: AFSGD/Vee9kFWEmhAm1BrjysBreg+47Q3FTAqx6PkRESgpf57MEiLHIq8lsh5+7IAVj3o5k01rWmvmMgH2pX2snazsM=
X-Received: by 2002:a67:1f4a:: with SMTP id f71mr5257912vsf.236.1545034206069; 
 Mon, 17 Dec 2018 00:10:06 -0800 (PST)
MIME-Version: 1.0
References: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
 <CAHmME9pzif4L4okrDMZdsLb73oXegaMvGHXKkY3twbw_wkYnug@mail.gmail.com>
 <CAKVinOXBxdFrTAiMaDmdE63iYO-rjBSAmBj5mb3QZ52zkmzoRQ@mail.gmail.com>
In-Reply-To: <CAKVinOXBxdFrTAiMaDmdE63iYO-rjBSAmBj5mb3QZ52zkmzoRQ@mail.gmail.com>
From: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
Date: Mon, 17 Dec 2018 16:10:27 +0800
Message-ID: <CAKVinOW_6qGYFT52LurdowOuaMD_fL=+WbTfSqr2qSspCkLoRA@mail.gmail.com>
Subject: Re: [Question or Feature Request] Any wg1.conf option to limit peer
 IP as 1-to-1?
To: Jason@zx2c4.com
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

It seems that "AllowedIPs" have nothing to do with refusing unwantted peer's IP.
It only specifes the outgoing target IPs,
For example,  I sometimes set "AllowedIPs=216.58.0.0/18" to enable me
to visit https://www.google.com through the internet of the peer
"10.1.0.3".
On Mon, Dec 17, 2018 at 3:53 PM KeXianbin(http://diyism.com)
<kexianbin@diyism.com> wrote:
>
> On my machine(10.1.0.1), does the option "AllowedIPs = 10.1.0.3/32" in
> wg1.conf take effects in both input and ouput directions?
> It seems that "AllowedIPs = 10.1.0.3/32" only added ip route rule
> "10.1.0.3 dev wg1  scope link" on my side,
> can it prevent the peer to send packets to my 10.1.0.1:80 from 10.1.0.4?
> On Mon, Dec 17, 2018 at 3:40 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > On Mon, Dec 17, 2018 at 2:42 AM KeXianbin(http://diyism.com)
> > <kexianbin@diyism.com> wrote:
> > > AllowedIPs = 10.1.0.3/32
> > > [...]
> > > If I want to limit the peer to a fixed IP 10.1.0.3, any wg1.conf
> > > OPTION to config it?
> > >
> > > Currently,  the peer can set any IP, for example 10.1.0.4, and can
> > > send packets to my http://10.1.0.1:80 from 10.1.0.4.
> >
> > Setting that peer's allowedips to 10.1.0.3/32 should accomplish
> > exactly what you want; that peer is _only_ allowed to send packets as
> > that IP. If the peer attempts to send packets as 10.1.0.4, WireGuard
> > should reject those packets. If it doesn't, that sounds like a major
> > bug.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
