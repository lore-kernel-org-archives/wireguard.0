Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FD0C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:39:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E54C61159
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E54C61159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=manojav.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 315282a1;
	Mon, 3 May 2021 15:35:13 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e10f02c3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 15:35:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id 12so8628574lfq.13
 for <wireguard@lists.zx2c4.com>; Mon, 03 May 2021 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manojav.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wyT7xQsis1dK9kqn2v5iUTeVEaV9akGC9QDrGmjYml8=;
 b=jyrEZ8ePARfjZyPAwgCG/Vp3qupRPIcKwoVaucJXv+SboM5PWNIJ7Cq23HXhKj6elS
 1ctWKzBoszJEXnGw0ei3RvlVV8DBL3NGV+/Ua7x1oqVf+rRIA5liIG/sBc5nCv13g6KD
 u1HQi77aP6yO91+vtS3yBnaGIr5+zoDpNquvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wyT7xQsis1dK9kqn2v5iUTeVEaV9akGC9QDrGmjYml8=;
 b=s22NHbqqN1by8CekXjaH/sOoYLDi9RDQUX8w3YBMzpXrMiTudml9jqMEB77RqS5ex6
 mXLCVYn4d/LebTtBmvhG2v4YSiGFKb6Kwuu1u46qDV+fZ4fO8lfn+I9k0E3979iTsYbh
 MO9q/QabKDPauebDUBRr5SxjXC/6sHVgA/SmJ5eN7cUyy+Tw6XZjWd7shgmB9FSDmo47
 wO6QAXVTaAi4G4OQWampvIoY7UP8mm774rK/xOsptc7IJFFrr76t6PKE7qqOn+Gd0NO8
 OLZDcdYeKAgfMnBg9XN3hdY35lpK07gSYwXRRY1/YvQHEgQyg0T3uKCMF89nplrFOKrm
 XDrg==
X-Gm-Message-State: AOAM531lpRF3icMS/80Iagstb3+PB6GnUrkiB7w6Tt8iC/8ptflrW7AT
 Ss2rqodONYXy0tYPMfvJAAGymas0JKKPmWxFXKFkHg==
X-Google-Smtp-Source: ABdhPJw8/lxbRh2y4z5RgI0TmJxc1eVo8jTnae+bt4LTikK7pGWUFdzjbD6UTNuca7dOpfLEgAd08+3UVAIqHgICfc8=
X-Received: by 2002:a19:7119:: with SMTP id m25mr13304063lfc.511.1620056107859; 
 Mon, 03 May 2021 08:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
 <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
 <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
 <CAGaAVNWDMLAP3FdBPUh33iyVpMSBLTzVEH8_LGXKsS8ebzwjQA@mail.gmail.com>
 <CAHmME9rLSSaaREtMPh9OYuO-oe363KF-VJcpQQHr8=54oDiAiA@mail.gmail.com>
 <CAGaAVNUyrQEppHMmTZe_WyohDPEopyupB2iaTj45peeq5qU9vg@mail.gmail.com>
In-Reply-To: <CAGaAVNUyrQEppHMmTZe_WyohDPEopyupB2iaTj45peeq5qU9vg@mail.gmail.com>
From: Manojav Sridhar <manojav@manojav.com>
Date: Mon, 3 May 2021 11:34:41 -0400
Message-ID: <CAGaAVNUQ1+R7MtUYm2Not1J+pWkkKxQw384RYxAkjCsAuiigFg@mail.gmail.com>
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

Just happened! so yeah that was it on the trigger. Once Cmac builds
the ko for me I  will test it again!

Again thanks so much!

On Mon, May 3, 2021 at 11:32 AM Manojav Sridhar <manojav@manojav.com> wrote:
>
> Ah. Understood. I am not set up to build for freebsd yet ko. But I can
> leave it running on my test box for a bit.
>
> On Mon, May 3, 2021 at 11:31 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > On Mon, May 3, 2021 at 5:27 PM Manojav Sridhar <manojav@manojav.com> wrote:
> > > I tried the bash script on both bare metal box and virtualbox pfsense
> > > box. both ran for a few minutes okay. How long does it take to happen?
> > > I am testing with the 0428 snapshot.
> >
> > Try changing in wg_noise.c:
> >
> > #define HT_INDEX_SIZE (1 << 13)
> >
> > to
> >
> > #define HT_INDEX_SIZE (1 << 3)
> >
> > And then you'll see it hit pretty quickly.
