Return-Path: <SRS0=TBPu=IH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229D0C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 16:35:20 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3520065237
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 16:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3520065237
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id feab6db8;
	Tue, 9 Mar 2021 16:33:51 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 38358bbc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615307623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=piA/us82ibo/dpAl7HH3GQIsWaCI7kQ8KMn2v7TIm94=;
 b=fd9fKNem+g1gg+Kmhi5eq7oFKs5RpB3kBJJMZaYlNTxUEbEfQtDyD7mdbMS6eNVpAHLF7f
 L58tkFsYOqEHt5/nYGAn6LJ1WQuUmoqxzoIeD12USmGzflHPkAY6ZMVzS8jCOaJT9as4bx
 JFbKpxnsD9KH9mnPgiFYrmU7AtdvQbY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4e665cd8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 16:33:43 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 133so14589712ybd.5
 for <wireguard@lists.zx2c4.com>; Tue, 09 Mar 2021 08:33:43 -0800 (PST)
X-Gm-Message-State: AOAM533wNhjIvjCiKvXyX878eqpf3KP5AnAp53mqNYd1fPH/yLQ+HEeE
 /O9uTvzaaDvJfEXzMmI/fxjEun+vywaPSCzSQ+Q=
X-Google-Smtp-Source: ABdhPJxGY3Xr2L9idzlHlRbkTsE2qUeA7+Hao16T+yWab4z1duUcZlyVG+K/dAK8lAPYFSj8RSBRYW0ZHnws7dGFBp8=
X-Received: by 2002:a25:c090:: with SMTP id
 c138mr41180372ybf.279.1615307623123; 
 Tue, 09 Mar 2021 08:33:43 -0800 (PST)
MIME-Version: 1.0
References: <038632B3-A3F3-4FC6-8242-265A42F89F1F@wandera.com>
 <CAHmME9rakmzN2ndkXchvcRXONjfk4ikJScWCSEYzNR8+1ow03w@mail.gmail.com>
 <3A2A1B3E-75FB-4CCA-A7B9-FC7C02B7E9DB@wandera.com>
In-Reply-To: <3A2A1B3E-75FB-4CCA-A7B9-FC7C02B7E9DB@wandera.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 9 Mar 2021 09:33:32 -0700
X-Gmail-Original-Message-ID: <CAHmME9qkgbE0E9ApGzMoDeVr289JrrZ42Uyba1hQGNc22VSCMg@mail.gmail.com>
Message-ID: <CAHmME9qkgbE0E9ApGzMoDeVr289JrrZ42Uyba1hQGNc22VSCMg@mail.gmail.com>
Subject: Re: [PATCH] device: revert pipelining UAPI requests
To: Laura Zelenku <laura.zelenku@wandera.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Tue, Mar 9, 2021 at 9:30 AM Laura Zelenku <laura.zelenku@wandera.com> wr=
ote:
>
> Hi Jason,
> I=E2=80=99m just using =E2=80=9Cwg-quick up wg0=E2=80=9D command on Linux=
 env with NO kernel module, just userspace implementation.
> My config file looks like:
> [Interface]
> PrivateKey =3D =E2=80=A6.mEw=3D

Change your private key. No need to mess with partial exposures.

> In the command output you can see that "wg setconf wg0 /dev/fd/63=E2=80=
=9D stucked and no following commands (set IP address, set MTU, =E2=80=A6) =
are processed.

What's the output of `wg --version`?

Jason
