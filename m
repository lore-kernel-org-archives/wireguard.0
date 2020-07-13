Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36EFC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:51:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62E2F2089D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:51:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="OEFB2vY9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62E2F2089D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04cf9cf7;
	Mon, 13 Jul 2020 23:29:44 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cba5025c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 23:29:42 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2736580
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 23:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=UdGW0RryGVzH85mkbu7qTl1yZrY=; b=OEFB2v
 Y9VOHY3lotRA3Onbu2kfTQ1cprvQwxLsHcf+qo4bVvsneKfT/Sxb39paIC3rSP4a
 vytP2d8ctwsyp7I6MiKvR5vSpNFYFpNNT2uKzOCSL9IbbM67nI0PraVA+q3z76he
 C++TLr7EUN9IdMsGT2C+x+kLmCiA70n+sPHafCXL2NY66taTnwy6eLSz7folEjEA
 cID2wJWj0n0GxFt9imJeh9bUNIlxjRB4oUJbOi8fY+CqXteZH555ghPT4ujl1GUw
 0XwXuKqVntCQyV9iHKro++6p0c0qChpzuWQtPhSbE/s48izAkKq0QJz9iDLcOoqY
 8g/ktdLpQ2dhEzOg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 09b9cf13
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 23:29:40 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id o3so12735609ilo.12
 for <wireguard@lists.zx2c4.com>; Mon, 13 Jul 2020 16:51:13 -0700 (PDT)
X-Gm-Message-State: AOAM533Etu86uJ4krntJH5ZpeaSIwiEDmCHX8sGFyndwunuuJhgBKLdE
 Qw0ARix2cn8bLO+FEZL6ZyYnk3bYZNT/0S0VTNM=
X-Google-Smtp-Source: ABdhPJxBC4TidY4vX35v34XJNrkcOCrJgbDH5YNee8jv+1li1kpqHPMzYcxuU+FeyHgmyGDRILFtKyA4+SeYJr1cKkI=
X-Received: by 2002:a92:8585:: with SMTP id f127mr2183390ilh.207.1594684273222; 
 Mon, 13 Jul 2020 16:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <08a201d65946$e9c84f90$bd58eeb0$@lindenberg.one>
In-Reply-To: <08a201d65946$e9c84f90$bd58eeb0$@lindenberg.one>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Jul 2020 17:51:02 -0600
X-Gmail-Original-Message-ID: <CAHmME9oW+-WaOptJDU58AcuhvaouTR5QDjzjWbLaYtz=xKyMeQ@mail.gmail.com>
Message-ID: <CAHmME9oW+-WaOptJDU58AcuhvaouTR5QDjzjWbLaYtz=xKyMeQ@mail.gmail.com>
Subject: Re: two client connections -> crash?
To: Joachim Lindenberg <wireguard@lindenberg.one>
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

If there's a crash, dmesg should show something. Do you see an "OOPS" in there?
