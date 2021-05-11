Return-Path: <SRS0=uc8W=KG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAB7C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 May 2021 18:07:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22AF061625
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 May 2021 18:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22AF061625
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glosol.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fcfb6a4;
	Tue, 11 May 2021 18:07:25 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0d6d9da4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 May 2021 18:07:24 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id j11so15250340qtn.12
 for <wireguard@lists.zx2c4.com>; Tue, 11 May 2021 11:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3r9RI/QUHULx22UxdSWTEwJu4XFm7tbnN6VVOtF5kKg=;
 b=XwdNo11Vh5wirkF7VluDxZCOtMFoYFk6l0hZe4l1n8kgJTVTY2h2z8N3qIO15h6fKv
 PeYukJSdICcihMumDcAKI47FyibeOKTwrtaPgmLQACk9r7g3a3yKNR7M2WU17H83xaK/
 gOQsQ4NAme17rJmmZJkCIoGDmPgC7CU8fbmSwJEehG/9hSYMkwbY1R1pYpstknQtWmL3
 HG3LDLexmserwo9Ulx9oAXSmxp23jcpY5lml2ulHL8YFPVRB6SRipG+iHKYCAoPcOZTY
 a7X4OEHtmSy0Ma6J7BgGON7m1rc+3M5IwHBByG9OoWRveKXF5QP8Qt7oWJH/D8zOZKOr
 6cIg==
X-Gm-Message-State: AOAM533n65wt70OgrawO/+Z7J2cPkW8bIbVgbYYYx5MyRIpMC+k/9J7y
 OW0X0x9pzxLuA04/MA2lWtgPhGNr9VxZAg==
X-Google-Smtp-Source: ABdhPJyi1cqns0hwJDHSW8RfvPdBLG0m3zUbBGxaA3lt3rWa+5hUsNhYAS4AzGHcvDzUd8I7xy38dw==
X-Received: by 2002:ac8:7cb3:: with SMTP id z19mr11621067qtv.22.1620756443431; 
 Tue, 11 May 2021 11:07:23 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
 by smtp.gmail.com with ESMTPSA id m205sm7188626qke.2.2021.05.11.11.07.23
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 11:07:23 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id r8so27510259ybb.9
 for <wireguard@lists.zx2c4.com>; Tue, 11 May 2021 11:07:23 -0700 (PDT)
X-Received: by 2002:a5b:386:: with SMTP id k6mr40909660ybp.235.1620756442858; 
 Tue, 11 May 2021 11:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <000b01d743f5$815d8fc0$8418af40$@glosol.com>
 <CAHmME9pb=1Qh4=0cOj6cm-4L0tfSTj7FknyXduh53i=NySbJVw@mail.gmail.com>
 <000401d74418$ffecc590$ffc650b0$@glosol.com>
 <CAHmME9o2wOEuXYcc=PakWhZ=wmGBWAe3rjckUR3hQ_=mGXuxVQ@mail.gmail.com>
 <CAHmME9r9jjSDfHnHWTAG1Z2iG99x5TwS6A4EnwBzsgc_i49G-g@mail.gmail.com>
 <CAN=LpF3OJgsD-4cH7cgds9ZVo8GPwQK7HvvoyAr_nx3mx31G5A@mail.gmail.com>
 <CAHmME9pmkP_Hw8ZJOMRCdPahbbbmVL5LX+aYBum_uMSE-ZXmvw@mail.gmail.com>
In-Reply-To: <CAHmME9pmkP_Hw8ZJOMRCdPahbbbmVL5LX+aYBum_uMSE-ZXmvw@mail.gmail.com>
From: Piotr Sobczak <piotrs@glosol.com>
Date: Tue, 11 May 2021 20:07:10 +0200
X-Gmail-Original-Message-ID: <CAN=LpF1+gNusjR0+pDEQ7JBq7Ud4vzT_27dpu2xS+7NbF4m5Wg@mail.gmail.com>
Message-ID: <CAN=LpF1+gNusjR0+pDEQ7JBq7Ud4vzT_27dpu2xS+7NbF4m5Wg@mail.gmail.com>
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

It worked. I replied to your other email with the full log as you requested.

Thank you for your help with this!

Piotr

On Tue, May 11, 2021 at 7:54 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Piotr,
>
> Thanks for the feedback. I sent you a message offlist with a custom
> build containing
> https://git.zx2c4.com/wintun/commit/?id=479bbdc50a45ca9ae62ac15a1ee7445a6cbbe42a
> . Waiting for your feedback on it.
>
> Thanks,
> Jason
