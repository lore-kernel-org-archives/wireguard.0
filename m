Return-Path: <SRS0=uc8W=KG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1F6C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 May 2021 17:54:13 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AF8761606
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 May 2021 17:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AF8761606
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb229907;
	Tue, 11 May 2021 17:54:10 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 242c4657
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 May 2021 17:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620755644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vUf6VHfH6xJfd4Wfu45X/nFiwoDlo9aagCj3TrR6Y3M=;
 b=iU18zoRurG1ZdqGtWcP8rJVvmki578UhQo9vcRGYyRlsqaOvIdrvKBIxvp2tzej23e7dc9
 3z4PqsPWQYi8mLHllmfliSM5axHYpfMSKnDbeXGzIHNkyzhwldWpgASvXo3gFLFdRH9eE2
 E2Zra3QNnFZn48qZovmRreCb2fFQKVo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0cb7c999
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 May 2021 17:54:04 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id v39so27454404ybd.4
 for <wireguard@lists.zx2c4.com>; Tue, 11 May 2021 10:54:03 -0700 (PDT)
X-Gm-Message-State: AOAM530pwAVuN7IpfWXopb1/ArM+2gAaEUgqb3PLVpYPjbSAsiML67Hd
 zRyUcIoCGw4bRfktF9n6GbnkHI3jI6YK/FZYGJI=
X-Google-Smtp-Source: ABdhPJyEkRVuNY8Sb7qpx6ch/OnebMB9+p4VcAYkJPVc12tJ5AWuEeeLaFOK5Q/lUxh2b5GDtDj37YI5vR7W/CBYmxM=
X-Received: by 2002:a25:47c4:: with SMTP id
 u187mr44799042yba.306.1620755643610; 
 Tue, 11 May 2021 10:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <000b01d743f5$815d8fc0$8418af40$@glosol.com>
 <CAHmME9pb=1Qh4=0cOj6cm-4L0tfSTj7FknyXduh53i=NySbJVw@mail.gmail.com>
 <000401d74418$ffecc590$ffc650b0$@glosol.com>
 <CAHmME9o2wOEuXYcc=PakWhZ=wmGBWAe3rjckUR3hQ_=mGXuxVQ@mail.gmail.com>
 <CAHmME9r9jjSDfHnHWTAG1Z2iG99x5TwS6A4EnwBzsgc_i49G-g@mail.gmail.com>
 <CAN=LpF3OJgsD-4cH7cgds9ZVo8GPwQK7HvvoyAr_nx3mx31G5A@mail.gmail.com>
In-Reply-To: <CAN=LpF3OJgsD-4cH7cgds9ZVo8GPwQK7HvvoyAr_nx3mx31G5A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 11 May 2021 19:53:52 +0200
X-Gmail-Original-Message-ID: <CAHmME9pmkP_Hw8ZJOMRCdPahbbbmVL5LX+aYBum_uMSE-ZXmvw@mail.gmail.com>
Message-ID: <CAHmME9pmkP_Hw8ZJOMRCdPahbbbmVL5LX+aYBum_uMSE-ZXmvw@mail.gmail.com>
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

Hi Piotr,

Thanks for the feedback. I sent you a message offlist with a custom
build containing
https://git.zx2c4.com/wintun/commit/?id=479bbdc50a45ca9ae62ac15a1ee7445a6cbbe42a
. Waiting for your feedback on it.

Thanks,
Jason
