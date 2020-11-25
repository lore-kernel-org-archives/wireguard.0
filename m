Return-Path: <SRS0=pGg3=E7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DB7C5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 10:30:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB93206E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 10:30:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Qy49edxF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FB93206E0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2901e0d;
	Wed, 25 Nov 2020 10:24:27 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 800dbc10
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 10:24:23 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a233e6c
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=EdSMgt8QCiGt+8rU7TvxiwVSk7I=; b=Qy49ed
 xFX9ySocyDibRoMnzYWInKfokPGyTpLItZXy3XonTxsx7JiFfHg33zBsBxh94auA
 gdW+L6sKjptNo2At7ijSlnx3YGZ9Ar0s7iaD7Zu4YDnOw+/JMX32Dq6tuDebz2ss
 rLp+CD0frhfG7dVlVik5NhL+wUKg0oNMx8ObRjz/cq6zb9rBVMKixwUx65fIUioi
 6yLFVhTERPioM1CNJDVsKwzRamr5xObzz5wHT4aT3Q9qXsuYopoZMevvtyRjYyZj
 rF7xmPoK/XS4NnVNcvTIv3vMp65FouLJK5TmQqoHEbubb2DcHKhrwa9yG/vqI4zW
 pMPqCisW92miUSdg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 368edbfe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 10:25:09 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id b144so3402543qkc.13
 for <wireguard@lists.zx2c4.com>; Wed, 25 Nov 2020 02:30:01 -0800 (PST)
X-Gm-Message-State: AOAM530C+b3PFgcYVQ1VbO9uWGVy8GUprkPMpnSLl4b6nxMGD+klFDE5
 P7RKYNIO4kgKjdT4rWJ/AUesr1n2pEXZCD7slw0=
X-Google-Smtp-Source: ABdhPJy2ogo+Xx799Kh1KW3040YPr4Xe5N1ro+GdvLjqE3xxTtKoP/z53XtbmDkuoa8K6/Umm32Z/Wf+7GrLziB8Uw0=
X-Received: by 2002:a25:2054:: with SMTP id g81mr3299153ybg.178.1606300201161; 
 Wed, 25 Nov 2020 02:30:01 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:2cd:b029:2f:52a5:c7b2 with HTTP; Wed, 25 Nov 2020
 02:30:00 -0800 (PST)
In-Reply-To: <C7C6HAUS055X.339KNR4ZAROGW@enhorning>
References: <CAHmME9qAjqF-p=AHrzpmO+KnFjSADMkqpYmOn+TRY9q04aBFMQ@mail.gmail.com>
 <C7C6HAUS055X.339KNR4ZAROGW@enhorning>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 25 Nov 2020 11:30:00 +0100
X-Gmail-Original-Message-ID: <CAHmME9rp_nDjP6d_yki4LPP2pr1BejWcD7FQ5-A9MXZ9ORxZvg@mail.gmail.com>
Message-ID: <CAHmME9rp_nDjP6d_yki4LPP2pr1BejWcD7FQ5-A9MXZ9ORxZvg@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: Riccardo Paolo Bestetti <pbl@bestov.io>
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

On 11/25/20, Riccardo Paolo Bestetti <pbl@bestov.io> wrote:
> On Wed Nov 25, 2020 at 2:08 AM CET, Jason A. Donenfeld wrote:
>> Hi Riccardo,
>>
>> Interesting consideration. I didn't know that.
> I didn't know that either until I tried to deploy WireGuard on a laptop
> yesterday! It seems not to be documented anywhere.
>
> The group has been around since Windows XP afaik, however I have no idea
> whether the associated licesing chicanery has also been around that long.
>
>>
>> Can you not add that group manually need be?
> I'm not an expert on Windows, but a quick lookup on the net suggests you
> cannot create a local group with a specific SID.

I'm not convinced this is the case. We're talking about a local group.
Surely there's some on-disk representation of available groups and
associations, no? This line of inquiry needs to be fully exhausted
before we even consider alternatives.

Has Microsoft documented this limitation?
