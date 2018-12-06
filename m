Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A681C64EB1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:59:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEDBE20878
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Wvzxvu5N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEDBE20878
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb2196b7;
	Thu, 6 Dec 2018 23:51:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 426a6f3c
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 23:51:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05be5f95
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 23:51:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc0cd5d9
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 23:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=NiG8Kd16c6sG/NvvLy1mKg+pnok=; b=Wvzxvu
 5N6jQjyKZql6Z5cNnhPT3rBX5oqzMJLaZjcYBg2fiXRCaW2624YLetFV3uj2Uv/D
 Kx5Ac5jZiv7hUL66bRPMytmSoyeF+0ICaprSklhlY7c1DEFyXrxx4JWu/wlMY7bz
 X0t0TRVOKDnds8LwSaq5ilTzFsupUDXbhVpWCzL422ouxmW3SOCrjraxK6eeklRv
 GOsOmZ2H1wH6528hBoO2C2NPSxoILWbw0IQvtkINRdEWMZ7QVk172gXPnwC3FJQF
 YvpCnPcNJwy9FdAzzKz3slQIJktcYIygbL+qYB+G92gleaxpRTCKdLDvev1WxrJP
 1mI7nKd1ZcJwYHMg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5ede0dd6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 23:51:10 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id u16so2171535otk.8
 for <wireguard@lists.zx2c4.com>; Thu, 06 Dec 2018 15:59:24 -0800 (PST)
X-Gm-Message-State: AA+aEWblNTsgFsVPZJMDWbcpiZZJDOXoVwYC8DlLrUpGH0vk1pgS+MpG
 l4m9fzlgt8jnb+1waxvgr0EF+85C4R7lMh+rhvk=
X-Google-Smtp-Source: AFSGD/Uy6q/csyr64vEuUUXww5AKlslr4SD+I4Gix7vIESKEvZJwZBbNGKKTBR7vtwDssbdAuzXg1Ng3J0AdX8MzsOg=
X-Received: by 2002:a9d:17ca:: with SMTP id j68mr3735otj.268.1544140763286;
 Thu, 06 Dec 2018 15:59:23 -0800 (PST)
MIME-Version: 1.0
References: <CAMbARA6yEQvHEL+X-1+pfOPePu_1ULLLZdr81wC7SW65j=ep+w@mail.gmail.com>
 <F1235903-2773-425E-97B1-45D981E4751E@lonnie.abelbeck.com>
In-Reply-To: <F1235903-2773-425E-97B1-45D981E4751E@lonnie.abelbeck.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 7 Dec 2018 00:59:12 +0100
X-Gmail-Original-Message-ID: <CAHmME9r8J68eiG_-fbpK7fkio23nS38zPMN99ROqnV4WR8_7Aw@mail.gmail.com>
Message-ID: <CAHmME9r8J68eiG_-fbpK7fkio23nS38zPMN99ROqnV4WR8_7Aw@mail.gmail.com>
Subject: Re: sysctl of Alpine standard 3.8.1 doesn't support option -r.
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
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

Does alpine have a coreutils sysctl that takes precedent in PATH when installed?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
