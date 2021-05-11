Return-Path: <SRS0=uc8W=KG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAAAC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 May 2021 11:37:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94DD461028
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 May 2021 11:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94DD461028
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8de91002;
	Tue, 11 May 2021 11:37:42 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7aa7512f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 May 2021 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620733057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s97oWvfVnBRv9MyyqwO+mKYTMVg7DiVgC1ImS1abWm0=;
 b=LzZqfucTVoACNvmK4a2Zc26FcsTlLiXBMV1JQFx/HflMHICvxB1G8pJU0Pe7XQo5bK8aBg
 KKsB0zTpQHC2fzl63gRNjYiRCZPY4sNBJgs34cOZIMI9oQ6uIwyWUFH03HYbllroqwqxsV
 A8Dp5RVjXrl0YOKEi/emm+az8G0vf5g=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c6fc6e49
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 May 2021 11:37:36 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id s37so1371215ybi.6
 for <wireguard@lists.zx2c4.com>; Tue, 11 May 2021 04:37:36 -0700 (PDT)
X-Gm-Message-State: AOAM530hJI4PxGNi34vyHscuB4ctZ4WydxUGqU6f6XN97XPc7NrnZTTC
 ZRFPgEJ5MG8Zg0Tmhb1rPHNJRD3MXRWfrCIppw4=
X-Google-Smtp-Source: ABdhPJxQ59ELELeOD9OyNVpQGqAGnDiBu9wcd39zQNw7eZOSDC1BFdDQ6gTanjIkP6Bhqwp96FJHqD4GxesaaF+H3ko=
X-Received: by 2002:a5b:7c8:: with SMTP id t8mr34204886ybq.49.1620733056086;
 Tue, 11 May 2021 04:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <000b01d743f5$815d8fc0$8418af40$@glosol.com>
 <CAHmME9pb=1Qh4=0cOj6cm-4L0tfSTj7FknyXduh53i=NySbJVw@mail.gmail.com>
 <000401d74418$ffecc590$ffc650b0$@glosol.com>
 <CAHmME9o2wOEuXYcc=PakWhZ=wmGBWAe3rjckUR3hQ_=mGXuxVQ@mail.gmail.com>
In-Reply-To: <CAHmME9o2wOEuXYcc=PakWhZ=wmGBWAe3rjckUR3hQ_=mGXuxVQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 11 May 2021 13:37:25 +0200
X-Gmail-Original-Message-ID: <CAHmME9r9jjSDfHnHWTAG1Z2iG99x5TwS6A4EnwBzsgc_i49G-g@mail.gmail.com>
Message-ID: <CAHmME9r9jjSDfHnHWTAG1Z2iG99x5TwS6A4EnwBzsgc_i49G-g@mail.gmail.com>
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

Can you update to the wg4win version I just released and let me know
if the problem goes away?

Thanks,
Jason
