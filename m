Return-Path: <SRS0=qAD6=FD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFDDC3E8C5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 10:53:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A24A220771
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 10:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Gh+aFvqR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A24A220771
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf0a2e74;
	Sun, 29 Nov 2020 10:46:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f5174622
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 10:46:33 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22a9f183
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 10:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=4l1nIV0S8jE6jEIVXrCA/j6djyc=; b=Gh+aFv
 qRONoI7pFwL9Om0p4bJsPxC7Z+oNght746EZBs8e48UvIhRHXBwMPjFNjLR27SW0
 yOIzZ9P28VfjrsaToyVmPSnp+nUw5tl7ooFfABQatiaCPnQ/2nfdcwOscgc0pqb8
 ngnUcMeTiXreCy9LU7MwJtAb/d7KGZ2SnYGRv0A5CPTjwWDkOqibomZq6cpluqUH
 3I5y2PHtJoNgh+hpUTxiIN40/7zVwrt0xdPkooR2FRQJtLLtAaS0lOg+jE36bMBG
 eAhjMN26YQiXOlqGp9Yqf87vjmnHVbLo/X/LLahCgA5Zub9sU2Myppun1UU61Gd7
 wrmu8fqJug9Z6U+Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c42072b3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 10:47:18 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id t33so8706749ybd.0
 for <wireguard@lists.zx2c4.com>; Sun, 29 Nov 2020 02:52:42 -0800 (PST)
X-Gm-Message-State: AOAM532TpZcPnGXbyi/6AiLW+/Q7U6MdUqVzIjglJopoz/oDWGwnWBq6
 yfsdlI29gELJYcw/l3cIJn9+SNJL+wOYYpGPgMY=
X-Google-Smtp-Source: ABdhPJwxJ+KhLoK/Bg1S5PY0v/dsK0qSip6fGo9vwsoG7ZJ/65TDkZjc5fOPa88xlk3tgUW7k2mkawFy0iJ1fe/1198=
X-Received: by 2002:a25:2054:: with SMTP id g81mr22701490ybg.178.1606647161648; 
 Sun, 29 Nov 2020 02:52:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:2cd:b029:2f:52a5:c7b2 with HTTP; Sun, 29 Nov 2020
 02:52:41 -0800 (PST)
In-Reply-To: <3b4f9ec2-2f50-25c9-0e27-7ca0d2f16943@maidenheadbridge.com>
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
 <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
 <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
 <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
 <3b4f9ec2-2f50-25c9-0e27-7ca0d2f16943@maidenheadbridge.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 29 Nov 2020 11:52:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9pP4u5-HjZcdj0SAymGmoG36kA0sbcvRo7=mr8XZ-RXHA@mail.gmail.com>
Message-ID: <CAHmME9pP4u5-HjZcdj0SAymGmoG36kA0sbcvRo7=mr8XZ-RXHA@mail.gmail.com>
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

>>> One thing that is commonly implemented in other clients
>> That sounds like it introduces a security vulnerability
> Yes, it is

I don't mean to be rude, but shouldn't the line of thought sort of
come to a natural end there? We're trying very hard not to be in the
business of creating security vulnerabilities, after all.
