Return-Path: <SRS0=RmKM=E3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58581C64E69
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Nov 2020 10:06:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67BAB22254
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Nov 2020 10:06:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fMv7yGTL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67BAB22254
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3d2c61e;
	Sat, 21 Nov 2020 10:00:54 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f08a7617
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Nov 2020 10:00:50 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de82f89b
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Nov 2020 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=prDROw5zeBeDAAQ4TxiiWvucXbs=; b=fMv7yG
 TL5op/9S9/GBbHtqPaBLWW0+ZBA6pTwoMsnlshWBfUP/6k/du0+5hWnrKf87wEMp
 031dcy7iiM5iVZYzO+X4L2BFXGoyIVy80YmP0qPxBWsI6zW0KNSuWNhwb9b/V8in
 gSYHT+ZN6UrKWVofudaKw0BNt2JlQuNGc8WqdJb2GmpZw/pkL2gLOHZFmDSW3TEw
 x/MvT2qNaNoa2r/j229o8QfXyMbslXTwwmETWEz3NupBJnBo4MQE1dZNfzsNXYgU
 3XkNRNZIi+c4ugocQ5X8W+HVAknZdRSWzD7wuGA1MN2SubNoJcQC7hKjhs5eD+ZZ
 mlUKsYRTD9dguFuw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5c92853f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Nov 2020 10:01:36 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id g15so11052522ybq.6
 for <wireguard@lists.zx2c4.com>; Sat, 21 Nov 2020 02:05:57 -0800 (PST)
X-Gm-Message-State: AOAM5335nNXEyiqJM1rhmwOMC95byVQlOAM5C2iB6gni0gFmVwPNooGs
 Bi8J/EyG5u6+AT5rn1ODdbj4VIv1fsl7XnMDJ88=
X-Google-Smtp-Source: ABdhPJwsX3P79DtE+ztO2T3/xavbuxl63gJuvYZhyaWhoDn4MCkYqAlpFYDwvTuS1+rHS0NBMMw4lva15lwfeWrQpYo=
X-Received: by 2002:a25:5084:: with SMTP id
 e126mr33387169ybb.239.1605953157013; 
 Sat, 21 Nov 2020 02:05:57 -0800 (PST)
MIME-Version: 1.0
References: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
In-Reply-To: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 21 Nov 2020 11:05:46 +0100
X-Gmail-Original-Message-ID: <CAHmME9riWVidRXjORFebv+UF3GyG1Hv+OrDhf4njvhGyQNw=4A@mail.gmail.com>
Message-ID: <CAHmME9riWVidRXjORFebv+UF3GyG1Hv+OrDhf4njvhGyQNw=4A@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: vh217@werehub.org
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

Hi,

Check out the recent changes in git master, still under development,
but functional at this point:

https://git.zx2c4.com/wireguard-windows/about/adminregistry.md

You'll need to build from source to try this, but that should be pretty easy:

git clone https://git.zx2c4.com/wireguard-windows
cd wireguard-windows
.\build.bat
taskkill /im wireguard.exe /f
amd64\wireguard.exe

I may remove this before 0.3, or implement it totally differently, but
that's the general sketch.

Jason
