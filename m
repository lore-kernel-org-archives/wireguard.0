Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD47C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 11:36:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7d59f5db;
	Mon, 13 Dec 2021 11:36:45 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 406a22d3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 11:36:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9AF26CE0F5B
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 11:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B71CC34601
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 11:36:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UlE4AzRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1639395397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EiLz9BSvuBifOMKfzoCq/C2b1rzWRKGFlD0Xp4uqZMI=;
 b=UlE4AzRTToTLcbntrqIX2cbwciXrTLT27TdvyL16SafLKGlNdXYA3fA62Jc+703Q1/plAG
 NIPwYZGjQTgKzwtksCWK2kj5G6gq7/lhVxp7o74OYsf405hqgsXjoUNyclhPRqpMFsgddx
 8SNWm0HpHFRr1K68vqHDmNnJok5K+S0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7c37243e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 11:36:36 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id d10so37693140ybn.0
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 03:36:36 -0800 (PST)
X-Gm-Message-State: AOAM5337qk1mOwk07nRKNSRUySJ+CYl5TzRaFfhQ40nJcH8KUho5yO4q
 j5muupdk2QOaZIAF2bNiSuGmrmLzyeQKEgkIVTY=
X-Google-Smtp-Source: ABdhPJw1pJ6NK9W3yZ2TBMPd3YpWMftQE/zI5J9P6q7BicuInqIENX+6gjDDEsAEVwAzNemOWwXTGaaO7DNc3EHHMcU=
X-Received: by 2002:a25:13c6:: with SMTP id 189mr32845314ybt.113.1639395395884; 
 Mon, 13 Dec 2021 03:36:35 -0800 (PST)
MIME-Version: 1.0
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
 <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
 <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
 <CAHmME9ppTs-jmmV9uV+C0jbtQC5a5RWO5zJB5_-dRD3BMjDZZA@mail.gmail.com>
 <d1921390-7fcb-a627-11ea-ce580214db63@grsecurity.net>
In-Reply-To: <d1921390-7fcb-a627-11ea-ce580214db63@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Dec 2021 12:36:25 +0100
X-Gmail-Original-Message-ID: <CAHmME9r8udYyD+R9PPyN15G4QKsm45ZH_UbYXAjXXDwuvvob=g@mail.gmail.com>
Message-ID: <CAHmME9r8udYyD+R9PPyN15G4QKsm45ZH_UbYXAjXXDwuvvob=g@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Mathias Krause <minipli@grsecurity.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Aymeric Fromherz <aymeric.fromherz@inria.fr>
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

Hi Mathias,

On Mon, Dec 13, 2021 at 8:54 AM Mathias Krause <minipli@grsecurity.net> wrote:
> So, after importing Aymeric's changes into wireguard-linux-compat, the
> alternatives change is still needed. I can help you create one, if you
> want me to (we have that change in grsec anyway, just used named asm
> operands here, as the %0/%1/%2/... was rather confusing and hard to follow).

Sure, I'll take a patch for that. Let's wait until Aymeric
incorporates your suggestion on the out param, merges the PR, and then
I'll reimport that to wireguard-linux-compat, and you can send a
patch.

Jason
