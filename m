Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476F0C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 18:06:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 918D32376F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 18:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 918D32376F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc2ee4df;
	Thu, 17 Dec 2020 17:57:22 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8d67be14
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 17:57:19 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f75b737
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=jmHVMV3oOX+22mGpO9U53RGeE8Q=; b=Kblumu
 FF47dEKiz115eX9uGz3i+LmN4e8LJSyaVv973OP0LGrcpZAdp79gaGpKI4i5iWgY
 U5Cbv3iNdMaK+UGrlGbolz0mlcoNNW8vwA23VgG5Wh+pVeGQGsqJ7LogCwJaCfE1
 MBWvyaWPp6SIzuu6Pc6ahZQZIDV3FakMZTVIY0KSH2bz7eoKxszg94P0OMkBwOZT
 H8tN525LENPw5GSe0U/9aNItQ7MjcuaF+pQJ7NgJQmy8SaQ0hI5v5LIOSwU31iJf
 PygTp8JyzdhoGwZakrhWq8m8IXFBBHmXuMMJhrGwaRndPgktG2CdStb25bZkTWOv
 /n2554PSAUJ/JnNg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5a7cc05c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 17:58:05 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id j17so26680802ybt.9
 for <wireguard@lists.zx2c4.com>; Thu, 17 Dec 2020 10:05:52 -0800 (PST)
X-Gm-Message-State: AOAM532gm+bCrMVdcubXA7wBiLJm/shC5nMEwFZR5Ji3AMlZRT4QJbQ0
 D8q+VZcCGMVKnuOnfs7S/G8OPRD5Cy4wVKfEVaM=
X-Google-Smtp-Source: ABdhPJypNI7gFMQYyF0J+Z2+vBhlll+P9+6aopPoMGGEcbsrGAzNVri99TOh6CKlaE2U6oQwr8/7iVsjZ++g3EElyjw=
X-Received: by 2002:a25:938a:: with SMTP id a10mr464775ybm.49.1608228351637;
 Thu, 17 Dec 2020 10:05:51 -0800 (PST)
MIME-Version: 1.0
References: <0c6e326e-139c-012b-fb47-95cc85560485@blackberry.com>
In-Reply-To: <0c6e326e-139c-012b-fb47-95cc85560485@blackberry.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 17 Dec 2020 19:05:40 +0100
X-Gmail-Original-Message-ID: <CAHmME9oRUm_D7QSA+zFB8cHW9OQZ-rq4pmDGY1G86VbcUBZaEA@mail.gmail.com>
Message-ID: <CAHmME9oRUm_D7QSA+zFB8cHW9OQZ-rq4pmDGY1G86VbcUBZaEA@mail.gmail.com>
Subject: Re: Unexpected error re-initializing Wintun 0.9.2
To: Brad Spencer <bspencer@blackberry.com>
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

Hi Brad,

Thanks for the clear bug report and reproducer. I've never actually
seen anybody use the iso646.h operators before in real code... First
time for everything I guess!

It looks like the issue is that on each iteration of that loop, you're
calling LoadLibrary and FreeLibrary. Instead, only call LoadLibrary
once per process. Then you won't face this issue.

I've written a patch, however, to support the pathological library
reloading pattern in that example, though:
https://git.zx2c4.com/wintun/commit/?id=7710ff187b5079d9f2573608b6cb33b15262b2b8
This will be part of 0.10.1 or 0.11, whichever comes first. But, I'd
really recommend only calling LoadLibrary once per process, regardless
of that fix.

Thanks again for the report.

Jason
