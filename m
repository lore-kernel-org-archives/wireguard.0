Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE49C43461
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:39:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06C4C61159
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06C4C61159
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50406906;
	Mon, 3 May 2021 15:35:56 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f0df80f2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620056153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yAgTRpYIi0vAYq8yVGYGv4o1J4lpAZkelX9gmuRcb7s=;
 b=aJbKCYHt3EYAT5j4KAtZ9U3ab2/ZPVHKM3SHzY7OZO5tN/F/cjxqYiLLv+bIY1hgPqpI5z
 5ASs2eLPv2rmsLe3JaHK+cuSYHSItAVaP+P/eKVBmeSNlOx0dkGZNPwUNVSBSi1Ssbz1kK
 No6fXLv8mxRffwzruRY9Yfs37MP3kvw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3510b899
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 15:35:53 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id 130so8050059ybd.10
 for <wireguard@lists.zx2c4.com>; Mon, 03 May 2021 08:35:53 -0700 (PDT)
X-Gm-Message-State: AOAM530rZ0ZCy3/6XaRE8EXbgoOAyjvaxQpT3ZVVYmv7HAApnR7tS2XX
 uDQ8FpPfFuYWzpfG8j2Xp1SVRNzbXVU4wXtNtJk=
X-Google-Smtp-Source: ABdhPJzN42eI5g6qTXlt6x7mdrpHib34Z2STPFLJy7PqappfGOu/GotgEE+f8abz92bzhY4J/l7x2CRbsNSLNvmqeIM=
X-Received: by 2002:a25:2c47:: with SMTP id s68mr18218561ybs.123.1620056152756; 
 Mon, 03 May 2021 08:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
 <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
 <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
 <CAGaAVNWDMLAP3FdBPUh33iyVpMSBLTzVEH8_LGXKsS8ebzwjQA@mail.gmail.com>
 <CAHmME9rLSSaaREtMPh9OYuO-oe363KF-VJcpQQHr8=54oDiAiA@mail.gmail.com>
 <CAGaAVNUyrQEppHMmTZe_WyohDPEopyupB2iaTj45peeq5qU9vg@mail.gmail.com>
 <CAGaAVNUQ1+R7MtUYm2Not1J+pWkkKxQw384RYxAkjCsAuiigFg@mail.gmail.com>
In-Reply-To: <CAGaAVNUQ1+R7MtUYm2Not1J+pWkkKxQw384RYxAkjCsAuiigFg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 May 2021 17:35:41 +0200
X-Gmail-Original-Message-ID: <CAHmME9rMv2PDQL-SWUX0x6QENSMgmonooS8vvdjerBDsmXQSDQ@mail.gmail.com>
Message-ID: <CAHmME9rMv2PDQL-SWUX0x6QENSMgmonooS8vvdjerBDsmXQSDQ@mail.gmail.com>
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

On Mon, May 3, 2021 at 5:35 PM Manojav Sridhar <manojav@manojav.com> wrote:
>
> Just happened! so yeah that was it on the trigger.

With 1 << 13 or 1 << 3?
