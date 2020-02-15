Return-Path: <SRS0=3Rrq=4D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361AAC7114D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 19:26:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 759E32082F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 19:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RYJAEC3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 759E32082F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37fcfb8e;
	Sat, 15 Feb 2020 19:23:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1d5e416
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 19:23:13 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d000545b
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 19:23:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9aab02a4
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 19:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Uz053kUbRuF7R79AcluBcNLLnQI=; b=RYJAEC
 3FnBYU7odP6OboLZjUWw+fnzIM2hmoCBSBLOFPK8nElwkOtM+UDN2atSN37PzMGK
 kEJ5AGhUV3DcQh96g96iRI7e6PGaUfF9QP/ztKpuQB0zwSUUH1XgRGzQjllnp0X0
 XUIy0xIkHH2ulTvRPTpPPcBEsxnVSy2licn4udKHSmxbcTlCMp5AcMVIps3JcQkQ
 FlalBOAo0SiQ4t0RtlP1CgC01CHOEO8XtoMX78gt/JZhRcGViAPMtva1egz7CaZj
 5dYXlHaI9agIaOxmzgTglZhjwrGMM3cEaBZ6rbxg5AXnIZsHJnNcQwvtYWWYReBy
 9qSA702C3gudEgmw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8cebc463
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 19:23:12 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id q84so12960866oic.4
 for <wireguard@lists.zx2c4.com>; Sat, 15 Feb 2020 11:25:28 -0800 (PST)
X-Gm-Message-State: APjAAAXQJARxu2+y6+Dx+WLDhjOWq6Vqk1zxXtgG0tXK7B5gQ3yh9qr/
 kB4zvt8mdZbafd/aGUKz/rLrK6CeVyJy7sAfDGE=
X-Google-Smtp-Source: APXvYqzIxMrceiFOMPM0/24zd0EgeGVvq/dpLOw5TZoVmkM6dd7ROi0G+dxPoefHG0/TCNyQRGPqKbbwakdGE2WYm9s=
X-Received: by 2002:a05:6808:29a:: with SMTP id
 z26mr379998oic.122.1581794728263; 
 Sat, 15 Feb 2020 11:25:28 -0800 (PST)
MIME-Version: 1.0
References: <20200213103117.68943-1-tanioka404@gmail.com>
 <120ad97e-0dcb-6502-f097-e1368d9987cf@sholland.org>
 <CAA2ss9EDZ4qip3Rh-z_zseLr2u0+A8ePEUUBd7dnJq2RTdPmwA@mail.gmail.com>
 <851381cd-3fc0-94f9-63a1-7b69deb9a640@sholland.org>
 <CAA2ss9E2jnvA_TLhBPJTSuqBz+YoU-wUTPnYghYw+bMPpeSoWQ@mail.gmail.com>
In-Reply-To: <CAA2ss9E2jnvA_TLhBPJTSuqBz+YoU-wUTPnYghYw+bMPpeSoWQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 15 Feb 2020 20:25:17 +0100
X-Gmail-Original-Message-ID: <CAHmME9raemV2wfaYNr8NjA2CZT6_JaKGna2KTG0HWxPHr_jPOQ@mail.gmail.com>
Message-ID: <CAHmME9raemV2wfaYNr8NjA2CZT6_JaKGna2KTG0HWxPHr_jPOQ@mail.gmail.com>
Subject: Re: [PATCH] Add japanese translation.
To: Eiji Tanioka <tanioka404@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sat, Feb 15, 2020 at 11:24 AM Eiji Tanioka <tanioka404@gmail.com> wrote:
>
> Thank you for applying my patch!
>
> I'm now translating wireguard-apple into Japanese. When finished, I will send patch.
> Next time, I will not forget your advice.

Excellent! Thank you!
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
