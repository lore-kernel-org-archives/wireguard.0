Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C7FC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:31:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0785861176
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0785861176
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f0f42ab;
	Mon, 3 May 2021 15:31:17 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 07015539
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620055868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bRUu8fxmDpikCIVRjTgHA2BR+PtoW+hv+Qgn90QRvYk=;
 b=Dn3Om+b2i933KeSlRbtvKDU4Vd3ucGj6b4rKxpyMveVPxYM1tKYY/AzYQhjqV3SI9/t46a
 oAEKaiPATSVEOpzbmRP4KFI6px7BXt+pSsBSGyCnG0JYKfJhp1M3soVCoDrZz82iwyrLoJ
 94bBfrToaIPpmmOucLO8F+Xgm9cRelM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a6c28ac3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 15:31:07 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id l7so8021497ybf.8
 for <wireguard@lists.zx2c4.com>; Mon, 03 May 2021 08:31:07 -0700 (PDT)
X-Gm-Message-State: AOAM531vHwp+ULf6dUg67wtz5XfFkFU7AS8eowNGWAvCEYeTwWjmTYWU
 o/E0Dr1QvL+GaFF9qZK71IaqQy9t6aPtNm46IRg=
X-Google-Smtp-Source: ABdhPJyCwmyndRmZrqiA+wklhbyZ7Ss3jl3DVBHBZLlqvok6C2MVzh4H7Q30ep+pPFJAUZg/bMMbp1QdYH4I0IYErW0=
X-Received: by 2002:a25:abaa:: with SMTP id v39mr29820217ybi.20.1620055867363; 
 Mon, 03 May 2021 08:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
 <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
 <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
 <CAGaAVNWDMLAP3FdBPUh33iyVpMSBLTzVEH8_LGXKsS8ebzwjQA@mail.gmail.com>
In-Reply-To: <CAGaAVNWDMLAP3FdBPUh33iyVpMSBLTzVEH8_LGXKsS8ebzwjQA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 May 2021 17:30:56 +0200
X-Gmail-Original-Message-ID: <CAHmME9rLSSaaREtMPh9OYuO-oe363KF-VJcpQQHr8=54oDiAiA@mail.gmail.com>
Message-ID: <CAHmME9rLSSaaREtMPh9OYuO-oe363KF-VJcpQQHr8=54oDiAiA@mail.gmail.com>
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

On Mon, May 3, 2021 at 5:27 PM Manojav Sridhar <manojav@manojav.com> wrote:
> I tried the bash script on both bare metal box and virtualbox pfsense
> box. both ran for a few minutes okay. How long does it take to happen?
> I am testing with the 0428 snapshot.

Try changing in wg_noise.c:

#define HT_INDEX_SIZE (1 << 13)

to

#define HT_INDEX_SIZE (1 << 3)

And then you'll see it hit pretty quickly.
