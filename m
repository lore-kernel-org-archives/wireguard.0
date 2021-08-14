Return-Path: <SRS0=uw9z=NF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09C4C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Aug 2021 10:18:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F93A60F21
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Aug 2021 10:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F93A60F21
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a2fd50e;
	Sat, 14 Aug 2021 10:18:41 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7a32d079
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Aug 2021 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628936314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bD0KDc9ijWktvhy9B19sAeNzJ2HhS4nfy21D1xGITEU=;
 b=Kfhoj2Gi8aM2gq0fUSe6O6w6W6yacKLirwsdYdyxaisGyONBXs56drKwLo4WubS88dqSuP
 3EGpKyBqgeSEgEBr0GXs59UgU8XS8WQ6XO8ZqQT+J/81ruLZ+dVncee8wp2ljej12s1pRa
 pnH8ZnXP/4lN7tet44kYLd1A7hEPFRM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6f614f40
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Aug 2021 10:18:33 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id a93so23569614ybi.1
 for <wireguard@lists.zx2c4.com>; Sat, 14 Aug 2021 03:18:33 -0700 (PDT)
X-Gm-Message-State: AOAM533YzOa6gpaMGB9NH7k3cpSjDj+6IWdHa+C5hVl4Tz4yAFY/TzhT
 TmAPl1nJVcHx4DC9oJqfUFEGbsdNEDrI8ngtdGA=
X-Google-Smtp-Source: ABdhPJz+4HBKQw4nwrE4hW/eFjBtPNA1VAlhKonKpZv1AsSwYfGP0bFpOacChW2X8aCTmh158Qa4hWK5HewkzCj6cHk=
X-Received: by 2002:a25:be09:: with SMTP id h9mr8668012ybk.239.1628936312726; 
 Sat, 14 Aug 2021 03:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210814051340.485-1-dotneutron@protonmail.ch>
In-Reply-To: <20210814051340.485-1-dotneutron@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Aug 2021 12:18:21 +0200
X-Gmail-Original-Message-ID: <CAHmME9pEoOb9QaJe1AQLFFA4d_hYLP_wGFS1_wZj2kQk+s2F4w@mail.gmail.com>
Message-ID: <CAHmME9pEoOb9QaJe1AQLFFA4d_hYLP_wGFS1_wZj2kQk+s2F4w@mail.gmail.com>
Subject: Re: [PATCH] embeddable-dll-service: csharp: fix peer endpoint bug
To: dotneutron <dotneutron@protonmail.ch>
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

Hi Neutron,

Thanks for the report. I fixed this slightly differently here:

https://git.zx2c4.com/wireguard-windows/commit/?id=0ab19b6a457b672bdb613b4c92d9786a48edd605

Note that I would have given a review to your patch instead of fixing
myself, but I can't actually accept patches from you because your
Signed-off-by doesn't specify your name, per the notes here
https://www.kernel.org/doc/html/v4.11/process/submitting-patches.html#developer-s-certificate-of-origin-1-1
. WireGuard tries to stay decently close to Linux kernel guidelines.

Jason
