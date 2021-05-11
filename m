Return-Path: <SRS0=uc8W=KG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A575FC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 May 2021 14:28:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 637CB611BE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 May 2021 14:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 637CB611BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glosol.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d5f2cc0;
	Tue, 11 May 2021 14:25:54 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5f9c47ba
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 May 2021 14:25:52 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id a2so18838482qkh.11
 for <wireguard@lists.zx2c4.com>; Tue, 11 May 2021 07:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iqostiza9tNEKj7krvER3+fMUDPN3kl3YefYn0eSN4E=;
 b=UUxI+NLslGhHOjjAzks5thUtrgJEDKlfde71RNbHo6n2OJLyyW8DjbqKhGHWSr0k5L
 zMe3FaEOd6T6bu/oP86fBYEs8UjPdvvBLs9n8XqCZOoiEzmBRGxVr6SaU9TUx1Y9KZS+
 wK8QdKRblF1GcxSEPCNRsMP1Yj5Ydb3wjehy1uGmKz51dCG/yU+L82Ie19z4HdpPOKxQ
 PR/bZwEVfvdKAZ95h75qFViKOFMaI2AkibxExIZU2JEW9efKeah+RmEpq7Bo2qhsDrCG
 qcis/dEl+xVGaTy7Cf18clfqItXszfgGVyGe44Kh9c0ZhsFartJBzK4eYeYBqXUjYAwA
 66PA==
X-Gm-Message-State: AOAM531Kuvr+mFSEUsbCe3xqcLkXunLyNB5onqaamaqnb2NFgBkMZlbZ
 kxzCwYQMadzfkbHHoEWACe/WraAB/5E1Fw==
X-Google-Smtp-Source: ABdhPJxpvL1b1QtPwNz9Xt5I/yDJJnFFOctpUZ2dAanMCeEosOwpO5HyAxr0/QM2TPhWGXYYbHgAzw==
X-Received: by 2002:a37:595:: with SMTP id 143mr28323435qkf.272.1620743151491; 
 Tue, 11 May 2021 07:25:51 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id h10sm12623013qka.26.2021.05.11.07.25.51
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 07:25:51 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id l7so26505678ybf.8
 for <wireguard@lists.zx2c4.com>; Tue, 11 May 2021 07:25:51 -0700 (PDT)
X-Received: by 2002:a5b:8cc:: with SMTP id w12mr41995292ybq.32.1620743150915; 
 Tue, 11 May 2021 07:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <000b01d743f5$815d8fc0$8418af40$@glosol.com>
 <CAHmME9pb=1Qh4=0cOj6cm-4L0tfSTj7FknyXduh53i=NySbJVw@mail.gmail.com>
 <000401d74418$ffecc590$ffc650b0$@glosol.com>
 <CAHmME9o2wOEuXYcc=PakWhZ=wmGBWAe3rjckUR3hQ_=mGXuxVQ@mail.gmail.com>
 <CAHmME9r9jjSDfHnHWTAG1Z2iG99x5TwS6A4EnwBzsgc_i49G-g@mail.gmail.com>
In-Reply-To: <CAHmME9r9jjSDfHnHWTAG1Z2iG99x5TwS6A4EnwBzsgc_i49G-g@mail.gmail.com>
From: Piotr Sobczak <piotrs@glosol.com>
Date: Tue, 11 May 2021 16:25:39 +0200
X-Gmail-Original-Message-ID: <CAN=LpF3OJgsD-4cH7cgds9ZVo8GPwQK7HvvoyAr_nx3mx31G5A@mail.gmail.com>
Message-ID: <CAN=LpF3OJgsD-4cH7cgds9ZVo8GPwQK7HvvoyAr_nx3mx31G5A@mail.gmail.com>
Subject: Re: Wintun - Requested GUID is already in use error on Windows 10
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Hi Jason,

It looks like the same error still occurs with version 0.3.14. Let me
know if you need any additional information or if you would like me to
try anything else.

Thanks,

Piotr


On Tue, May 11, 2021 at 1:37 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Piotr,
>
> Can you update to the wg4win version I just released and let me know
> if the problem goes away?
>
> Thanks,
> Jason
