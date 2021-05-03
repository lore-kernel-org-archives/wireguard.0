Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E49EC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:33:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87DBB61027
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87DBB61027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=manojav.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee41d151;
	Mon, 3 May 2021 15:33:11 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 65ca9ff3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 15:33:10 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id c11so8653178lfi.9
 for <wireguard@lists.zx2c4.com>; Mon, 03 May 2021 08:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manojav.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j0WCFYQCwHHOxaak1+F85oO1Qkbfj/qTLmlFelKXanE=;
 b=OPLnLr9VuFb6dYA2bKnw65SXYIVYSVTCufNt7pD/dv3qm52+tEfwdxMCEAjGA7Pbqm
 03zrJ/BAwWBFaclYdyyh87+0xbSWXfCmk2Yl1RakeSGnlrSWDJNjYVWf5tELwW9DO+x/
 QE1GmKjOJhEQCjewzJQY9PNslEmzZTJu8XT5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j0WCFYQCwHHOxaak1+F85oO1Qkbfj/qTLmlFelKXanE=;
 b=tifl8ymJdL3EPl603Q/1Jw969s3gMBQnAakKOpbHzm3NbE8iZ14oLjp1rcfkexYeFG
 jyRuRnYRAkUFJqGyNElldn98hua6Dn2yP/PFwlzGoQfnCWOOT7DzS4TSsKTTKdZDcDVi
 t7SA6m5eL9Ovy+8lyhZkfouxsfDFlHPfQxpO5DmTbn/RV/KFbCyWMiOlWJ2pcmh2eTyP
 sg3MyqfKMDPlHXEEVVLYfXL7B5fMsuAncunUJ6ruW2/Vq/m3Za23ETsMzDjKtIYSgqVh
 nEUGInPap0NZ8NMI+I7hQ8PjDSxuzRGa+TUQdS7xt/BLzfWNr3J5vLt02Mg5fHSuxMTK
 juyw==
X-Gm-Message-State: AOAM533Dd8xIhZ7m3Ke6AG685wxBW8QLfni8rQAs8eqfCs6zwEhCH/Gu
 8vVJ95UbyJombhyD/UP8yAXsv+Lw6zG2hWNtr3NzNg==
X-Google-Smtp-Source: ABdhPJwVEvOgn8/YFV4kGcy/mU+i1gQXHoMuExXVUJlOrKEJAOGxUMTWr0IGbG8GlVrHsjHygZ6OIRxbvrqsoe0ZTkk=
X-Received: by 2002:a05:6512:224c:: with SMTP id
 i12mr507603lfu.643.1620055989783; 
 Mon, 03 May 2021 08:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
 <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
 <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
 <CAGaAVNWDMLAP3FdBPUh33iyVpMSBLTzVEH8_LGXKsS8ebzwjQA@mail.gmail.com>
 <CAHmME9rLSSaaREtMPh9OYuO-oe363KF-VJcpQQHr8=54oDiAiA@mail.gmail.com>
In-Reply-To: <CAHmME9rLSSaaREtMPh9OYuO-oe363KF-VJcpQQHr8=54oDiAiA@mail.gmail.com>
From: Manojav Sridhar <manojav@manojav.com>
Date: Mon, 3 May 2021 11:32:43 -0400
Message-ID: <CAGaAVNUyrQEppHMmTZe_WyohDPEopyupB2iaTj45peeq5qU9vg@mail.gmail.com>
Subject: Re: kp's and mem corruption?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Ah. Understood. I am not set up to build for freebsd yet ko. But I can
leave it running on my test box for a bit.

On Mon, May 3, 2021 at 11:31 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Mon, May 3, 2021 at 5:27 PM Manojav Sridhar <manojav@manojav.com> wrote:
> > I tried the bash script on both bare metal box and virtualbox pfsense
> > box. both ran for a few minutes okay. How long does it take to happen?
> > I am testing with the 0428 snapshot.
>
> Try changing in wg_noise.c:
>
> #define HT_INDEX_SIZE (1 << 13)
>
> to
>
> #define HT_INDEX_SIZE (1 << 3)
>
> And then you'll see it hit pretty quickly.
