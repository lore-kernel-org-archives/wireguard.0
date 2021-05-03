Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15B3C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:39:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD2A461159
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD2A461159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=manojav.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 210517c7;
	Mon, 3 May 2021 15:37:26 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d760cecd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 15:37:24 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id x2so8662702lff.10
 for <wireguard@lists.zx2c4.com>; Mon, 03 May 2021 08:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manojav.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rkZSJUf04z5TylBVUJl2T+OODAxgPwtduP+7OtPjJuk=;
 b=Zv4NUs9By9bXM2QTDOzpSuhY7VWQWVuV5IQJ1RJDXKdbx8bqVg6pMECiCqM20AJPF0
 hjvOjMe8lZZP8XiYqATbGL9q0jG2yuDZVlICG62onoFgaYNrX3lZ7UV3XWan8KnaBXpI
 cxJrgO/fFjRLlRkWqY8EAxpuUF1FKlf3lvni4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rkZSJUf04z5TylBVUJl2T+OODAxgPwtduP+7OtPjJuk=;
 b=MEeQMr95cSCHFaQiah3iMwWyOk4YooCsojI7Cf/AYN/wjtiledfigNmdNYqR+VNBwL
 RXa03Mw0X4tWaOTFcqbW3CbCRYeHYVelW3il7TztHienA3KumJMyk/gIZ7VEzLySiR4Q
 TWFKiN2WSGbK6ZIRpBBeXLjMDFwHQifLXERRnWjtxBq1nncwzpwXo2J+vSUzblRjsTGo
 fdxI2rm3YduADQuLx+r2weVWxs1CZnxQbCdYdqcMRuEjK5XrlfEubwZbrOOTnW1PCWVo
 UPJExVEGPQPl3Hx+i2lg1fRel97MM1JKRLm0KOJJPE2WkGv1nClI994JZCo/5v+WZANU
 uIxA==
X-Gm-Message-State: AOAM530EkvumXq1o6iYd0Q20d79l3+x5Fxh7H1vuEI0PjMRNDKhP2R4y
 731ioG6X4ICCfkTApcLJXS/EEgrsBUU12MGHQfw9Hg==
X-Google-Smtp-Source: ABdhPJxUQ+49MJqkhsaaXVw6EXo4Z2lGENAwG/FTHefON8Pyb4xqk1c8G6LSo4H40vMVABSI1hBZwGhfAVg8btsYOj8=
X-Received: by 2002:a19:7119:: with SMTP id m25mr13310675lfc.511.1620056243984; 
 Mon, 03 May 2021 08:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
 <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
 <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
 <CAGaAVNWDMLAP3FdBPUh33iyVpMSBLTzVEH8_LGXKsS8ebzwjQA@mail.gmail.com>
 <CAHmME9rLSSaaREtMPh9OYuO-oe363KF-VJcpQQHr8=54oDiAiA@mail.gmail.com>
 <CAGaAVNUyrQEppHMmTZe_WyohDPEopyupB2iaTj45peeq5qU9vg@mail.gmail.com>
 <CAGaAVNUQ1+R7MtUYm2Not1J+pWkkKxQw384RYxAkjCsAuiigFg@mail.gmail.com>
 <CAHmME9rMv2PDQL-SWUX0x6QENSMgmonooS8vvdjerBDsmXQSDQ@mail.gmail.com>
In-Reply-To: <CAHmME9rMv2PDQL-SWUX0x6QENSMgmonooS8vvdjerBDsmXQSDQ@mail.gmail.com>
From: Manojav Sridhar <manojav@manojav.com>
Date: Mon, 3 May 2021 11:36:57 -0400
Message-ID: <CAGaAVNUMaRjvpPXqJaSm7JNq=PoxzfTkXgftvXrCVOkkNx0NUw@mail.gmail.com>
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

With the same ko I sent you. 1<<13. I was just confirming I could trigger it.

On Mon, May 3, 2021 at 11:35 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Mon, May 3, 2021 at 5:35 PM Manojav Sridhar <manojav@manojav.com> wrote:
> >
> > Just happened! so yeah that was it on the trigger.
>
> With 1 << 13 or 1 << 3?
