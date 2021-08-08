Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6539CC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 13:28:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ACCE60FC1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 13:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7ACCE60FC1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e41c002;
	Sun, 8 Aug 2021 13:28:35 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 26683504
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 13:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628429309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xs+iztM5RGBHBAu7FjfPNGaKHlYWfQtxcj7+dxElvDU=;
 b=nf6IBLK1km0n4JgaMDnVuy+Rzec6rnQcUImcb+w3gCeyu2gz8uj7EOynEd8IfE9bp3TTx4
 PdatyS3EZt9NdQDwRtLRIpdp6JhKRId16ZzwUbZEauF0JdVS3ZEH94O+p+B6nDNxpNUJU+
 +57ojw7mOsgVcL/fbkMdwYQLfwNH9Og=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 73286ea9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 13:28:29 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id z5so22702060ybj.2
 for <wireguard@lists.zx2c4.com>; Sun, 08 Aug 2021 06:28:29 -0700 (PDT)
X-Gm-Message-State: AOAM530fd6eHUrlf8gGjSbo7s/TyZxOO5iatBBL+FiCicmWUtOg98+yu
 CCAdUcmkiN7107JNoskdKzuCo0hlU28VR/Ma0TE=
X-Google-Smtp-Source: ABdhPJwPE6LHmwLSPyeAIGLmXJAeMSuNcCwxJNjT5QpgkDIoHljDcgFo7wEOvYtLPDbszUbrPUJKn0bh7wPY725HWvI=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr26361024ybg.306.1628429308589; 
 Sun, 08 Aug 2021 06:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <CALaUSuusH4S23thAEj1zXp_4=WJ81cR5PETG6aHO9Of7ELViJw@mail.gmail.com>
 <CAHmME9opTHXHGFGVnD15hx_1g5-g8Qqrv_0U_Bjie2vU0KEDiQ@mail.gmail.com>
In-Reply-To: <CAHmME9opTHXHGFGVnD15hx_1g5-g8Qqrv_0U_Bjie2vU0KEDiQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Aug 2021 15:28:17 +0200
X-Gmail-Original-Message-ID: <CAHmME9ov12crwLW_sjoQn3=J0nBNm=7=Nqu4Yr9pNBVVjGysPg@mail.gmail.com>
Message-ID: <CAHmME9ov12crwLW_sjoQn3=J0nBNm=7=Nqu4Yr9pNBVVjGysPg@mail.gmail.com>
Subject: Re: WireGuard for Windows 0.4.2 failed to start due to
 WintunSetAdapterName failure (Code 0x000006D9)
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Simon Rozman <simon@rozman.si>
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

Hi Joshua,

I've increased the heuristic's timing a bit:
https://git.zx2c4.com/wireguard-windows/commit/?id=a3e6316aa7b1d80098ad49732a05aec1c9b62849

I still would like to find a better set of _real_ bootup dependencies, however.

Jason
