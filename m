Return-Path: <SRS0=Yklm=FC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26036C63697
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Nov 2020 14:28:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22D4A24684
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Nov 2020 14:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bwgHF5YU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22D4A24684
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b42ee2d1;
	Sat, 28 Nov 2020 14:22:13 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f050c3e6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Nov 2020 14:22:10 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 216785fa
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Nov 2020 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=a0US5845sSGS6cjQyWhoty98uvU=; b=bwgHF5
 YUI5imQjsv89Yg452G7Ig1QdRtDaXPhgChuidstjgYHspbnaDJMUEJKtG607WIjs
 JmZGPn8+90XwIq92SewFVDDw0FCPk2tt1xsiIHP0zNTlXCB5TQBTbilxROPbfHZl
 mJlooqDORndZu3ISXaF9zAeCr9e8HGQUshS2OQU5bxaqBe01EwNHo5JQS9Yo4kT3
 JN9dG5CBV5oYg5te51VsNqAGjuTtOr33i1prYQKTnJtgWF1OVKyhSpoijm/zyCyN
 HGC+qtlIZjaRFCrMNGqAGpbU2OH3lM7Bbk3djdXle78chq2pfY+yj8FaO65slLhH
 RsqACDEOUpTktjUw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 42266c66
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Nov 2020 14:22:56 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id o144so7109633ybg.7
 for <wireguard@lists.zx2c4.com>; Sat, 28 Nov 2020 06:28:12 -0800 (PST)
X-Gm-Message-State: AOAM530Z+xZXX96tSWQXuRL7U8ufe1xPlt+MXMdNt+KF4pPCeWH72K7p
 LsBuW0Ig4zH1aiMAYDX2keUmsf6X735xoJJtPj8=
X-Google-Smtp-Source: ABdhPJylebMq168PZozQ/8ymZGWUnTSL9Yqajr6QnvYalbM4sM7jyPwrrYAY6PjZzWgA67pxF8Ib3aF162YKgIWvSwg=
X-Received: by 2002:a25:481:: with SMTP id 123mr17167251ybe.123.1606573692005; 
 Sat, 28 Nov 2020 06:28:12 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
 <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
 <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
In-Reply-To: <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 28 Nov 2020 15:28:01 +0100
X-Gmail-Original-Message-ID: <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
Message-ID: <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: Adrian Larsen <alarsen@maidenheadbridge.com>
Cc: Clint Dovholuk <clint.dovholuk@netfoundry.io>,
 Riccardo Paolo Bestetti <pbl@bestov.io>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Thu, Nov 26, 2020 at 9:53 AM Adrian Larsen
<alarsen@maidenheadbridge.com> wrote:
>
> One thing that is commonly implemented in other clients doing tunnels is
> the detection of "ON / OFF Corporate network".
>
> Without any user intervention, the vpn client is capable to detect (on
> every network change) where the user is located and to active the client
> or not.
>
> Values to detect are a combination of:
>
> (usually you can do AND / OR of this values)
>
>   1- Adapter domain (i.e. contoso.com) . This comes from DHCP values
> received.
>
> 2 - DNS servers IPs
>
> 3 - Hostname vs IP. (This is to create a local DNS A record on your
> internal DNS server that is resolvable only when you are ON corporate
> network and not outside)
>
> The detection of this values are platform agnostic. You can use it on
> any client: Linux, Windows, Mac, etc; to detect when turn ON / OFF the
> vpn client automatically without user intervention.

That sounds like it introduces a security vulnerability, in which you
send the magic unauthenticated packets, and voila, WireGuard
deactivates and you're sending data in the clear.
