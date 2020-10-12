Return-Path: <SRS0=215W=DT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DD0C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Oct 2020 22:32:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B583E2078E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Oct 2020 22:32:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="thOFqX22"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B583E2078E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba7d89ee;
	Mon, 12 Oct 2020 21:58:27 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8b4c9b25
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Oct 2020 21:58:25 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c05d8392
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Oct 2020 21:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=0qNQr8y7G+FYVWiJuE45bv6YbFM=; b=thOFqX
 22cFKzJuU/JFFKJoX8wJ+1y5FDmGI5dPcInsrnQY+Drmh0GPFI1ag9sdm3x3SWNM
 19oxFTaNmvGM/oh88cBpp+Akw/ysd7Zb8/GxLv2RXMf9mN/e1Feuf2n+ck8OfeCg
 8/cVuUVrr5SU3inclWbHAEJLx9JFwfxwF1m354yMI2VRI8JQSv+7xk04/zr0WbdA
 eNGJjObb7rNgUOGGz9qSwKvckhdWAHb8JU5NlK7XJW8kdFVFu/bUDYeAxGe6qgha
 U05tHm1OuTdj7PQZ3PUbjiU2J8qVJBLCdvbSPwPtfjFUcNZ2IHC7YBBH2hszKqbt
 Oh3z2VCQ5LHXOxDA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 52944bd3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Oct 2020 21:58:25 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id o18so17670312ill.2
 for <wireguard@lists.zx2c4.com>; Mon, 12 Oct 2020 15:31:44 -0700 (PDT)
X-Gm-Message-State: AOAM533lz0JFJLUb/mM0A3sG0aFf66AnyFJ0SUMccJVcjFlDcXrHYGKG
 jZ0HGECqUok/+w15HNlyTq2cEFLBGtjt6MLRowU=
X-Google-Smtp-Source: ABdhPJyDepMpjqvwYAFZUcyjI2XdVLlfVjN5oQigAKIYOQzeU4Td+VYDv96IfyIiYqgab6LMST2wKm0l8ecyFhXhnCI=
X-Received: by 2002:a05:6e02:4af:: with SMTP id
 e15mr740929ils.64.1602541903720; 
 Mon, 12 Oct 2020 15:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <be4e9109-399b-5520-e6fd-e7163350aaf0@riseup.net>
 <CAHmME9oe5e84gpsGjGYkWHZoOLYKX1xUZBNzM7g0R6cEHg5JUg@mail.gmail.com>
 <b1955eb8-bc38-770c-848d-540c6c13bfbc@riseup.net>
 <CAHmME9q0WPQYavB7cnJCcTfYYTafnJ3WxsswP33tv27C7+BMZw@mail.gmail.com>
 <4870a998-bab9-14a7-0447-29f74322eca6@riseup.net>
In-Reply-To: <4870a998-bab9-14a7-0447-29f74322eca6@riseup.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 13 Oct 2020 00:31:32 +0200
X-Gmail-Original-Message-ID: <CAHmME9oQB8-NmqJGD3SEhmOR4MA-ybTkkMfV2mbtwc3etrYByQ@mail.gmail.com>
Message-ID: <CAHmME9oQB8-NmqJGD3SEhmOR4MA-ybTkkMfV2mbtwc3etrYByQ@mail.gmail.com>
Subject: Re: [PATCH] wg-quick linux: Add strip-and-eval cmd to extract keys
 from PostUp
To: Robin Schneider <ypid@riseup.net>
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

On Mon, Oct 12, 2020 at 9:54 PM Robin Schneider <ypid@riseup.net> wrote:
>
> On 2020-10-12 17:01, Jason A. Donenfeld wrote:
> > On Sat, Oct 10, 2020 at 5:58 PM Robin Schneider <ypid@riseup.net> wrote:
> >> The proposed workaround has two issues:
> >>
> >> 1. It does not allow to replace the PrivateKey or PresharedKey using the `syncconf` now from the config file which is what I want to have.
> >> 2. It only outputs the PrivateKey and not the PresharedKey for each peer. Sure, this could be done with a for loop.
> >
> > Sounds like something easily achievable with scripting.
> >
>
> So you suggest to write a 3party script instead of putting it into wg-quick? Because a inline script with support for all of this wound not exactly be a one-liner :) Could such a script be included in the wireguard-tools?

Yes, write your own script for this kind of custom merging of
PostUp/PreUp state modification, instead of trying to parse bash with
a regex as this commit does.
