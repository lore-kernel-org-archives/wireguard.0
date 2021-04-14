Return-Path: <SRS0=Tjnm=JL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDC9C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 20:17:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C09608FC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 20:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1C09608FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sneits.fi
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14b3f55f;
	Wed, 14 Apr 2021 20:17:34 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 96b60530
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Apr 2021 17:58:46 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id n8so34743108lfh.1
 for <wireguard@lists.zx2c4.com>; Wed, 14 Apr 2021 10:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sneits-fi.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=mv1FFckR+8W6ZZ4k2qvvRuf6fgFJew6Z2Qg+eravbnA=;
 b=eodQL2lk2p2pwm/aKfmcW4zTPGp0b5Owmdw91SOLkPWFr+1RCEKsg3XG/X9nCf5oQn
 8q0fR4rYoHsWC2V4RQEwP32K4mMMIAtMbqFsNcqBQxsx0//blPC6v0mtHaQrWg414gXS
 V1dODeyXLoPOe5g7XqxqTSGBn+Y+SaZz2DFb+21XdmJzLZ1dhnJxLkLbGrEHg2TYR87m
 +qDhHkd9yuM9YAtKDNIfK7FldEzK8nnnAjjV+v9O9oF0j1+e5itXxvOmmZJikWExqfPc
 UsFkuawhnCvMtqEFfA72xvAbvi2ql3WhWElOhpnshVg9HtHRzNOE5jfX1wB4eKBpdUEh
 ZwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mv1FFckR+8W6ZZ4k2qvvRuf6fgFJew6Z2Qg+eravbnA=;
 b=jXEVvCGiuv4ty2WagijBtzbIiOPsMgo5jZWex1pyEPN1rEAbEVJvM7qZQQcAwv5xJZ
 E+O5rXMO6Blx93CKpdNvd8WxchtgeaVn5Odtn59ckWuGZoZBFz2R9fiiLlQcu6fdtUxp
 s0RXy8Yc9/KA1Ev/shTd7QdZ+eWbsb58cs5+OggTZ5gumvLEFbPm7m9d8k7nJSuMyeqk
 ehNGC/YKVN+L/V8MJTX7hEqtdHy/vteE+lX5m1p4mYEItpcH2BDsCpUHpByugIMSurqu
 PgM155PSM5bIwj7U37tHZE+yZ9PcF6UzIPoglplQK8NZreqSR8NAcBnc09W9eHf01YBr
 xJjw==
X-Gm-Message-State: AOAM531c8MCos40HfblX50PbGOcnzCvw++ZwTuD+j3GxfQyvOZ7C3QMe
 vr15mAYT5vgpttx43mb4eczskK6InL9tA/kfoNasooI0dU54SHAE
X-Google-Smtp-Source: ABdhPJxukq7xrSuQAN5fF0fJt6I2koGL/vzqgqRZ4a99sHNcfAU0JvQ5epxrokfmFyUs18N7rDzs6tEZ8boF33sPGLY=
X-Received: by 2002:ac2:4c04:: with SMTP id t4mr27273342lfq.641.1618423125715; 
 Wed, 14 Apr 2021 10:58:45 -0700 (PDT)
MIME-Version: 1.0
From: Osku Sneits <wireguard@sneits.fi>
Date: Wed, 14 Apr 2021 21:00:18 +0300
Message-ID: <CAH_zGLXZ1TNMBsv3XZJnhX=TPNqiNL+DiC6icMyx+YcL3rbAnQ@mail.gmail.com>
Subject: freebsd - cpu consumption?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 14 Apr 2021 20:17:33 +0000
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

Dear all,

has anyone else noticed the CPU consumption on FreeBSD kernel Wireguard?

For my test link, there is a net speed of 200 Mbit/s.

On esxi based host, transferring inside Wireguard tunnel, full speed
takes about 90% of xeon d-1541 host.

Doing this on CentOS 7, takes less than 20% of the same host.
