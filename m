Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2176C43460
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:39:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B221D61159
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B221D61159
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92f6711d;
	Mon, 3 May 2021 15:35:17 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 44c98667
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 15:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620056113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=si0b55cviO9QJLZqlim4x/t6N1HRaglGig5IDC0gGfY=;
 b=OBEO7EPpswBfi+sxZrEjnVwOWfaBsbNPfxB1Lq1UIf6wbkB8zbKurjWjz0pVPyIfPmA2C+
 mF1vAciouwP5wXfzvYzEbH1AngvFTmo7/tLiEKm0PswZdJ9W6LpKmYrL3o+61kAG8p0yR4
 GCcWSWkMrhxS0x1cLjfhFt0+DzjfcP4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b94d6143
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 15:35:13 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id 15so8109480ybc.0
 for <wireguard@lists.zx2c4.com>; Mon, 03 May 2021 08:35:12 -0700 (PDT)
X-Gm-Message-State: AOAM532sMoHq2iIOt5AX9qggHKCYuVfI4ApPN5vQX9FIIAikEdLfqMyJ
 QgUBPJpRNb9p+LvAGgWWCqjBiGpTnCCTOMkcM5g=
X-Google-Smtp-Source: ABdhPJxtyTUywmDpa4cNPeMbDl9WtGHLG5WXsgFPeBL8dD8a/jKiq6bkdiEfAs0/jiR97OGOga0x4uTAu+XQDNNfrHM=
X-Received: by 2002:a25:2c47:: with SMTP id s68mr18214403ybs.123.1620056112649; 
 Mon, 03 May 2021 08:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
 <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
 <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
 <CAGaAVNWDMLAP3FdBPUh33iyVpMSBLTzVEH8_LGXKsS8ebzwjQA@mail.gmail.com>
 <CAHmME9rLSSaaREtMPh9OYuO-oe363KF-VJcpQQHr8=54oDiAiA@mail.gmail.com>
 <CAGaAVNUyrQEppHMmTZe_WyohDPEopyupB2iaTj45peeq5qU9vg@mail.gmail.com>
In-Reply-To: <CAGaAVNUyrQEppHMmTZe_WyohDPEopyupB2iaTj45peeq5qU9vg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 May 2021 17:35:01 +0200
X-Gmail-Original-Message-ID: <CAHmME9qLmvt7wRSucwZuV5R6y1xOYxhy_UO_GANu2t6-tOY_zQ@mail.gmail.com>
Message-ID: <CAHmME9qLmvt7wRSucwZuV5R6y1xOYxhy_UO_GANu2t6-tOY_zQ@mail.gmail.com>
Subject: Re: kp's and mem corruption?
To: Manojav Sridhar <manojav@manojav.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Christian McDonald <rcmcdonald91@gmail.com>
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

On Mon, May 3, 2021 at 5:33 PM Manojav Sridhar <manojav@manojav.com> wrote:
>
> Ah. Understood. I am not set up to build for freebsd yet ko. But I can
> leave it running on my test box for a bit.

Ah, don't worry about it. The trigger was sufficient for my purposes,
but it doesn't need to be reproduced elsewhere necessarily. However,
if you do wind up seeing this same bug again, using the latest master
branch that contains the fix, please let me know, since that'd
indicate I've done something wrong.

Jason
