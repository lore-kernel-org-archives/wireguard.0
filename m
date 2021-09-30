Return-Path: <SRS0=sRyP=OU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9B7C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Sep 2021 16:41:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D5BA6142A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Sep 2021 16:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D5BA6142A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4171852;
	Thu, 30 Sep 2021 16:41:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 36dcb24c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Sep 2021 16:41:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1DB0619E0
 for <wireguard@lists.zx2c4.com>; Thu, 30 Sep 2021 16:41:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="VyL6wrR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1633020104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3WSuLh+qyf5ahhQuwrvrIrZLTfI3w4ImE3SlC/yEu4c=;
 b=VyL6wrR4g/bwhmIZWg8V+/cYP1+PPn4VACmHNWGh9FbIHbTkDVmjb+cpwvaoD+AOrhG9Jy
 h2Le/L4daV5yqIaNJWgvDtrz5y7ilYmn7xdW1SSUI03i/+BN3vUwcLh/ssl+tiyyUTKTKR
 RBn4oE69eqb96CAix5+j9szqGhEU73c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bd9e73e5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Sep 2021 16:41:44 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id b82so14682959ybg.1
 for <wireguard@lists.zx2c4.com>; Thu, 30 Sep 2021 09:41:43 -0700 (PDT)
X-Gm-Message-State: AOAM5325jWvSQTeBOW5frWvNi8rrTdKDLVGWtCivDLX/a2MnEHvskMIp
 21b8Fz9PuO+TtTrXp+npNZhiZgRNP8Gj1trY51A=
X-Google-Smtp-Source: ABdhPJy7W7BPSoHafTNb0DTZboLFNgrMy8Od9BlAiw4PCZeZ6y0U4FSsqFbmqiykXw5RhTyBs4eg3nP89OoRi6GJX9Q=
X-Received: by 2002:a25:bd03:: with SMTP id f3mr231417ybk.412.1633020103095;
 Thu, 30 Sep 2021 09:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <163277858699.7.10950010429724590941.14337061@stdmail.de>
 <163287098886.7.7062947333110889290.14414570@simplelogin.co>
 <163300015018.6.7640455085114865179.14515199@stdmail.de>
In-Reply-To: <163300015018.6.7640455085114865179.14515199@stdmail.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Sep 2021 10:41:32 -0600
X-Gmail-Original-Message-ID: <CAHmME9q2GX9Oq1V2Gu4x0uGpY3MKP6pejBOuniv=s8hEh4Eb3A@mail.gmail.com>
Message-ID: <CAHmME9q2GX9Oq1V2Gu4x0uGpY3MKP6pejBOuniv=s8hEh4Eb3A@mail.gmail.com>
Subject: Re: Feature request - Number of tunnel entries in root of tray icon
 context menu
To: wireguard_mailing_list_user@stdmail.de
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

On Thu, Sep 30, 2021 at 5:15 AM <wireguard_mailing_list_user@stdmail.de> wrote:
> The ratio would require a knob as well

Why?

Anyway, we're not adding knobs for any of this, as already stated. If
you've got a better heuristic than "10", then by all means send a
patch and I'd be happy to apply it. If you don't like "10" and you
don't like percentage of the vertical resolution, then come up with a
different heuristic and make a strong argument for it.
