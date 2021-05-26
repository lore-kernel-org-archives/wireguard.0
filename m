Return-Path: <SRS0=w0hv=KV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0640C47088
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 May 2021 15:07:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF05560C3D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 May 2021 15:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF05560C3D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3bb9e20f;
	Wed, 26 May 2021 15:07:07 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7f665133
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 May 2021 15:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1622041622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HZS+ESvipkr87Ld+wDYNeYwJQF58eGSp97FIhx4Arg0=;
 b=GtnErqUycfGCnt5/GG2AlvObnOWkNX5jzr6aVHDyGu0YzVuF4IcV4wmgZosczNn8sRiPZz
 dh/hsZNrUH88V0AN5cHOo53MPIY86VmR7MOFirM47anbRsY8H1fkx18wV07Wmqk/3aUIaL
 C/BToArXaKSwf0W0ptfBrdT2dmiDXaY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6d6c8af6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 May 2021 15:07:02 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id g38so2463190ybi.12
 for <wireguard@lists.zx2c4.com>; Wed, 26 May 2021 08:07:01 -0700 (PDT)
X-Gm-Message-State: AOAM530wVs2LVibR/vZ+48qJ4/6eugYAVlQX7m7tMggkk9hKduV1e29b
 hTy/CNW8mjg2lRZLvtWHVFzweuX2seNm5es6z9c=
X-Google-Smtp-Source: ABdhPJxo754TAJ3u154natYeZ8ldSqNmib7PN3MGP2k4Swd9oaEkG6TzqT+S/yGFBId35pEXhrXb60Jy4F7Upm9H9cg=
X-Received: by 2002:a5b:7c8:: with SMTP id t8mr49733199ybq.49.1622041621571;
 Wed, 26 May 2021 08:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <Vi69GDdtlT6JOff7GBHQU7rUExHN6badu-eM7C611Xa91MM_S8tGkmt4OVpjDSLSH2Kag1jS8VUlCIXdXjiMI6uKHot-v2KGXTBi8oK-CC8=@postermail.com>
 <CAHmME9rT5HgrC5wP-V5sLkz_qwkRFPdEJKhPTEaXr-L6Qq697w@mail.gmail.com>
 <bLrNvJdSf_UdV1e-d8nQ_4dNnzP0I7DhX2NPIFkVs93k7herY4-36gEJDPhcST5F_Z-A2F0aTPxU-Di4p9R3FgynPsVH-4jAtR2lfTZnRJs=@postermail.com>
In-Reply-To: <bLrNvJdSf_UdV1e-d8nQ_4dNnzP0I7DhX2NPIFkVs93k7herY4-36gEJDPhcST5F_Z-A2F0aTPxU-Di4p9R3FgynPsVH-4jAtR2lfTZnRJs=@postermail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 26 May 2021 17:06:50 +0200
X-Gmail-Original-Message-ID: <CAHmME9p1Kp5zsh-QX0VDD70q--_QtoXOiuBxWC-h9uTpq=_TFw@mail.gmail.com>
Message-ID: <CAHmME9p1Kp5zsh-QX0VDD70q--_QtoXOiuBxWC-h9uTpq=_TFw@mail.gmail.com>
Subject: Re: wireguard-android: tunnel not working after reboot
To: lists.zx2c4.com.486782@postermail.com
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

On Wed, May 26, 2021 at 4:57 PM <lists.zx2c4.com.486782@postermail.com> wrote:
>
> Yes, it does. Unfortunately, the endpoint has a dynamic IP address, so I am stuck with that.
>
> Is there anything I can do about it?

Probably not, but it does explain the error well, which means I can
likely fix the bug. Thanks for the report.

Jason
