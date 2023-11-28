Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A46FC46CD3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:55:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 371076ad;
	Wed, 20 Dec 2023 05:00:27 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dc14aebf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2023 19:10:58 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5bbfc735572so11490847b3.0
 for <wireguard@lists.zx2c4.com>; Tue, 28 Nov 2023 11:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701198657; x=1701803457; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2iEjTetFnY4zzldUNEed3GzJjjZOpF8CuPR86cVt8vY=;
 b=TWyHaCUPd1iZN8kBH+vQUnHjKGrCfs8bnYF3i1GTyiqtDdEewFaZ5bYcQsGtcsRNkU
 Fy2YBOS7fA9JdpEKJ9Uu/aFqzaRp2QtvJOf4Xj+epFemnFbCYQxajr9ZvdUJOAnUvUWy
 zib18tzehS2fhefHEDTIMRhq0wH9oXJZHFJwxG6tR+s1rrOtx6463r/6W+5vrYfQGnfC
 z1HwREM4XnQXBKiV8acXE2rSorXVsx/1QFVAxENyw2Nd+1BHh8qwDXIoOsvQZqpg0H2G
 DUgqneKBnyncUUome7NWI/pI65uDxeMGDmuoWJ4X+9pA67YQe6HTLVRiPs+9/nVPW6LZ
 rssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701198657; x=1701803457;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2iEjTetFnY4zzldUNEed3GzJjjZOpF8CuPR86cVt8vY=;
 b=DenEl7oPGNTlTBm7zaDLskTrbjJxZFOW39gKLPx5DFgutTnH3y3B/AzCAEo+Q2JiBK
 nJOb6l26u5AFwvY+nO4CBG9cIWBzTHe9eOaAqhZEttZWm4qe2YZcB4aZsrqShmwXd+hm
 PhYohb3hIIq96SPYJ+Q+/m525LYfbYZjj2cEtfxMngxZoFbcc3lMYr1dhG6fXKiPD1RA
 f0DvH04gRngkqwmPszasCskCeiOg1f05gf0dEl2ADHHS8ENduQDUmn3IVT45Ocb8UWjB
 tOOHXSTWAFwuzusfou1O9/ndNeg3daGhtV8HyLO4A/pRNJIvr03PBt7kFp/w6VuskUYa
 cePg==
X-Gm-Message-State: AOJu0YwY+YhciDWYt/YG0p2HwBqdOV3T1G06PqECVzny95h8HcJjfVW6
 ZWdaLUjeiqSJhfe3OXnYTv4HdT08oSLHE/pG/hfCK3xSH/o=
X-Google-Smtp-Source: AGHT+IG3QH/sJEtYeHxnXChm5yRyjBCwTHaAhrdkeEWYzKx+x7vxctgvr5BtgiLm//hLmDs8fiqnuxoqeEfSRHrtZM8=
X-Received: by 2002:a0d:d64a:0:b0:5cc:87d0:7b64 with SMTP id
 y71-20020a0dd64a000000b005cc87d07b64mr10987148ywd.3.1701198657278; Tue, 28
 Nov 2023 11:10:57 -0800 (PST)
MIME-Version: 1.0
From: Mirco Barone <mirco.barone.3@gmail.com>
Date: Tue, 28 Nov 2023 20:10:48 +0100
Message-ID: <CANRMffCgpVRypXQv+2ex2xMO-HYpJB334D8w+Am7WuxHq9qTaA@mail.gmail.com>
Subject: Implementation of UDP GSO and GRO in WireGuard Kernel Version
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 20 Dec 2023 05:00:21 +0000
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

Hi everyone,

I've noticed the progress made by the Tailscale team with the
userspace version of WireGuard (wireguard-go). According to their
report, the implementation of UDP GSO in the physical interface
responsible for delivering UDP packets in the tunnel and UDP GRO in
the interface receiving UDP packets was crucial for their success.

I'm curious to know if this feature has been extended to the kernel
version of WireGuard. Additionally, is there anyone currently working
on implementing these features in the kernel version, if feasible?

Kind regards.
