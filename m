Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FCFC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 09:04:47 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5264860F24
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 09:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5264860F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4696ff2a;
	Mon, 27 Sep 2021 09:04:44 +0000 (UTC)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [2607:f8b0:4864:20::334])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2a6c1096
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 08:17:55 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so16459629otv.4
 for <wireguard@lists.zx2c4.com>; Mon, 27 Sep 2021 01:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad.net; s=july2021;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=xrv3ms02beMIZjz5OAGMfWxenjNrlfrWApwPB2T0wnw=;
 b=Q6+V9SAHtdIHHdMx1nsqPDAUxU+ACQDuoHDJB6mbUyxeEWK9/S1c6xudrLB+3qj30E
 nXTtuTE34eOy4SgilObZdzteMgj6cyPWy6X6I1lKj+F9rzAtDGfVF97Smo0UIhZz8PT8
 t+PbzW5HGCIGUp/py9pTuw87IAG5o/W8FeocOOv4CenSfP0a65U3z2Abs0ZP3h0RM0Kp
 fhue7DRxRKCN5B2vLuMJMOTcbAdWkAh+1bQcacve7OjHuLFcVN0W/25LW9wouKdSieL6
 okPZhW7aCLhkmwRSteGY6PQuCaoG2UP3a1yf6WGCwLoRbWGguKUXh0ri9wMJZfqNNOOd
 fXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=xrv3ms02beMIZjz5OAGMfWxenjNrlfrWApwPB2T0wnw=;
 b=nFV1mFPALVeGW+w02JZ9hhJWcT7tbgbt2BdPvgBtJsApnmN65ZxRtnu9FTMBKg0NCA
 xuICQWv93UwLZKALNhBm8xExPzWd3cBwYJ0z5DCZrJfrcZoFfp8W9mi3/7pmrpdHCYXn
 9879nAmCNQIfvbQIqm/FJYtTJuL5WWVAaMZ5vP1vDP5Jik3S4j7FHm+NO7RNVFJOvEty
 1olCN725MoxjPA1TJY1P3/3A6GX6oGzDKHMnpm+nBcrfeZXS06HMKb9fXop3U8Xft4WN
 xtxeGcgoOQ6+JKlM/NYMcuZ54cVlnSFf5RHCVAMXLYTux26uri+5fXT+R0t7m7T1auCR
 dqdA==
X-Gm-Message-State: AOAM5323frI9Gs9vIiGawzdYZtKGUU8gNaAISiR5Bz7P/NJn+JCWGlSy
 j7klqdYTa7SecUPKrcVnjB/2NHmC7E15d3XpuD5AdY6xdqfAfA==
X-Google-Smtp-Source: ABdhPJxNpcPsXfIQ0Y+FjqjmP/5b3Jq/Iy+so7OYdg0PL2sH3NNhCtbqbY3AWz/xHS6tPUzpSUPYMr0lHmsDfHaVG7Q=
X-Received: by 2002:a9d:6359:: with SMTP id y25mr15887202otk.274.1632730674143; 
 Mon, 27 Sep 2021 01:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
 <877df2d5px.fsf@ungleich.ch> <20210927071130.GA13681@wolff.to>
 <87y27ibgjp.fsf@ungleich.ch>
In-Reply-To: <87y27ibgjp.fsf@ungleich.ch>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Mon, 27 Sep 2021 10:17:42 +0200
Message-ID: <CANTUoedCxBRNHXj1C+moFx2Ut4uK4JN+eNe7vFjsyec1UVs+EQ@mail.gmail.com>
Subject: Re: WireGuard with obfuscation support
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 27 Sep 2021 09:04:43 +0000
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

Hi everyone,

On Mon, Sep 27, 2021 at 9:55 AM Nico Schottelius
<nico.schottelius@ungleich.ch> wrote:
> Bruno Wolff III <bruno@wolff.to> writes:
> > On Mon, Sep 27, 2021 at 09:53:08 +0900,
> >  Nico Schottelius <nico.schottelius@ungleich.ch> wrote:
> >
> > The problem is mostly orthogonal to Wireguard. There isn't going to be
> > a one size fits all solution for hiding traffic.

Exactly. And it would be a big mistake to attempt to merge obfuscation
support into WireGuard itself. Tor's approach of pluggable transports
is probably the right one.

https://www.wireguard.com/known-limitations/
"WireGuard does not focus on obfuscation. Obfuscation, rather, should
happen at a layer above WireGuard, with WireGuard focused on providing
solid crypto with a simple implementation. It is quite possible to
plug in various forms of obfuscation, however."

Here are my arguments:
https://lists.zx2c4.com/pipermail/wireguard/2018-September/003292.html

Cheers,
Fredrik Stromberg
