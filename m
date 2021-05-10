Return-Path: <SRS0=I1qK=KF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D882DC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 May 2021 09:06:47 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97E6460232
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 May 2021 09:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97E6460232
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3a46a09;
	Mon, 10 May 2021 09:06:44 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bd169ea3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 May 2021 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620637600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YSE2Sb3YYyOYM1CFXXTNRJKrtXDLERYQJtkl6Trvhxc=;
 b=e1mM/+h/BtS7AeA1/qpOIyzks6KxPVlSc9YT/M0nE0rEpPA57+8sjzbjXSZmnJIkDRGUuq
 em48cNcCrDAAewcCw7Y9pM348hKtG9Wb0VSqsXt8f0HKLqU0VGD3+1naP+A8jQcel7GIY7
 7r8ur3BT0J10VDVlHxgofWgbNvMHOYw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 77e33b94
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 May 2021 09:06:40 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id v39so20695253ybd.4
 for <wireguard@lists.zx2c4.com>; Mon, 10 May 2021 02:06:39 -0700 (PDT)
X-Gm-Message-State: AOAM530p4tmBD7oHcVIR4hrxx+7VPrpuhyilCCXBzgt4f3lGpTMq+OcJ
 Ys1GGjdqlTFYdDhJ5ecOiThUsm8c4a+zN0686Ak=
X-Google-Smtp-Source: ABdhPJw1KPW424O+BWMdlqGAM/pLBD0GDGEklzHYFCMcoTOSGVJoTyPundxycN4tvIyblBocWNQ/84DxTizpH5tsyIQ=
X-Received: by 2002:a5b:5c6:: with SMTP id w6mr31381959ybp.279.1620637599281; 
 Mon, 10 May 2021 02:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <000b01d743f5$815d8fc0$8418af40$@glosol.com>
 <CAHmME9pb=1Qh4=0cOj6cm-4L0tfSTj7FknyXduh53i=NySbJVw@mail.gmail.com>
 <000401d74418$ffecc590$ffc650b0$@glosol.com>
In-Reply-To: <000401d74418$ffecc590$ffc650b0$@glosol.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 May 2021 11:06:28 +0200
X-Gmail-Original-Message-ID: <CAHmME9o2wOEuXYcc=PakWhZ=wmGBWAe3rjckUR3hQ_=mGXuxVQ@mail.gmail.com>
Message-ID: <CAHmME9o2wOEuXYcc=PakWhZ=wmGBWAe3rjckUR3hQ_=mGXuxVQ@mail.gmail.com>
Subject: Re: Wintun - Requested GUID is already in use error on Windows 10
To: Piotr Sobczak <piotrs@glosol.com>
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

Thanks for the report. I think I understand what's going on. This will fix it:

https://git.zx2c4.com/wintun/commit/?id=28888d254be9b499ac6a4b7f1c704cf46cca88f6

In the interim, you can just delete those windscribe interfaces I guess.
