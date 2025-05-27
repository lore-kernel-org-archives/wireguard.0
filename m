Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19536C54F30
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 May 2025 12:20:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 719eae2b;
	Tue, 27 May 2025 12:17:40 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ae106738
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 May 2025 12:17:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A328CA4F66D
 for <wireguard@lists.zx2c4.com>; Tue, 27 May 2025 12:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236E8C4CEE9
 for <wireguard@lists.zx2c4.com>; Tue, 27 May 2025 12:17:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QlMduWey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1748348255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CpOPZjMWQSwk+66hbqEmuyE5MPQcfkzzdx9/BVUWaL8=;
 b=QlMduWeyfmHBw6uVa1dfyuai0Vuk1pd8iCgyImeWMaJgVkr55WE/li+3/LWm0+ycC3EIdS
 0pjYbQrjfev5IvrD89+HT4acxMxRbvUwaKULbwGv2f1Pq1daiJiE+BUy24uxUJHcB/kq1u
 f/qMQ7pWbQ4jfmF/ljL/oXIxG22dieI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eadd31a4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 May 2025 12:17:35 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3feaedb39e9so479238b6e.1
 for <wireguard@lists.zx2c4.com>; Tue, 27 May 2025 05:17:35 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywz6m5rtcxroaYC3F+LDN0KgJeW3jZcovtUIG81kv5CxvhzBZXz
 xgdf6u2NdGpRNms4gAPqzGJlIe3tjtAJULG2SYLRC9fMzgtDA5f0agc89LeV/sM+dEpZxQSwmdc
 LsWiHKguExYMhBb6Nkej+ryxc54gWXHQ=
X-Google-Smtp-Source: AGHT+IGoHZ2a34hZD6mFNOHdOnbZztYWK2p6BdA67JgUTVqPbltK+miKqAha0fwMWyaFqJ0M2DsWem/THW9KMTYS32o=
X-Received: by 2002:a05:6808:1c07:b0:402:a5c:906 with SMTP id
 5614622812f47-406468c7d03mr7747203b6e.34.1748348254569; Tue, 27 May 2025
 05:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <PA4PR05MB8995153AC212DDED36166CC48964A@PA4PR05MB8995.eurprd05.prod.outlook.com>
In-Reply-To: <PA4PR05MB8995153AC212DDED36166CC48964A@PA4PR05MB8995.eurprd05.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 27 May 2025 14:17:22 +0200
X-Gmail-Original-Message-ID: <CAHmME9pV8inzKksdXFq8C1ey9dLJZBUzNJoCr7PrrqeHqy=e-g@mail.gmail.com>
X-Gm-Features: AX0GCFvD2ulrfT7Q45P7M956CoqJdpQMBQ1BS6pvmHRiVmkOMfqaNCiIJFzFnts
Message-ID: <CAHmME9pV8inzKksdXFq8C1ey9dLJZBUzNJoCr7PrrqeHqy=e-g@mail.gmail.com>
Subject: Re: [PATCH] Enabling Threaded NAPI by Default
To: Mirco Barone <mirco.barone@polito.it>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Indeed I'm interested in this, but I need this as a proper git
formatted patch with a commit message that has real information:

- What kind of speedups and under which circumstances?
- Are there any known performance regressions? Small packets? Bursty traffic?
- Why is this not enabled by default everywhere and what makes
WireGuard special?

And so forth. All of this should be in a normally written git message,
with the patch sent using `git send-email`.

Thanks,
Jason
