Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD63C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:15:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D0B6103C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5D0B6103C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f494238;
	Wed, 22 Sep 2021 22:15:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7cb0f67f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:15:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F19F61107
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 22:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ilonjeJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632348940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t6BzCZOiHfE1dZ2/UaFGaBvXxlMrq9BMXAMyPWkIwgU=;
 b=ilonjeJuTGj4fsURO9y9ChI4PY97nZirq8cVJee+VGzvmxlTbdkk/2f3mBwK8uuOtHF9m5
 uB9DwsitRtj1MJwZXCD9Mj5fjzixCBAF6CjiBmi71FD0gmxpQnpuMfJbkzp0sxzzJ/r+SP
 KSGOFSYw/Qn+B6XMMI3pQ59a2lp5kIo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a173f348
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:15:40 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id t4so14998642qkb.9
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 15:15:40 -0700 (PDT)
X-Gm-Message-State: AOAM531PxZn6TszNnik1Pr3V70tFSnCC90UqLIeypOj71U8z+7K7eotv
 wlP9ut/IeLxJiwxNtw/ZxVyVK1WGE3KKks/bM2k=
X-Google-Smtp-Source: ABdhPJxFakC2qSk/th80TL80WL17NcB6jSaMXF7mpw7B7trfPB7V4tAPe1D5CidWULNVhKMM/VyZBImxYBZeeskxXNs=
X-Received: by 2002:a25:3214:: with SMTP id y20mr1709668yby.416.1632348939296; 
 Wed, 22 Sep 2021 15:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
In-Reply-To: <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Sep 2021 16:15:28 -0600
X-Gmail-Original-Message-ID: <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
Message-ID: <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Eddie <stunnel@attglobal.net>, Anatoli <me@anatoli.ws>, 
 Roopesh Chander S <roop@roopc.net>, Miguel Arroz <miguel.arroz@gmail.com>
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

Hi again,

A new app has been released for both iOS and macOS. Please test it out
and let me know how it goes.

Jason
