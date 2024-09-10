Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A34D4922F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 14:58:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7d3b3be;
	Mon, 18 Nov 2024 12:45:24 +0000 (UTC)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f74222eb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2024 06:34:06 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e1a9dc3efc1so5896799276.2
 for <wireguard@lists.zx2c4.com>; Mon, 09 Sep 2024 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725950045; x=1726554845; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lejK35/pWLaQaNOp+LtO8VnEssDIJMb5nbshBedk3/4=;
 b=JUvB97s9APhwJhlaHdFatOHowVTmYwMM1qyzEL4nzTitdB3Y2kJVl5s0wT9UfEDGm3
 0VLnbvkLoV3HG1n9S/4mdLlQJ2T3WOfPN9odZPIB17MlPtcq+PyuujMzz13Wyw/SkYh0
 nqvOTHgBAveH+2L7nfbO4gW+w+jXct0vps3YIoWC6vYosBCSFYW4UrmGoIVuxOEA8zmq
 sHC+dnlZTCS8AqY1ZjtBDbEY2C5I1wlbkaD/Pdt6IGf4ZVnxiIgzbUqDyVFi5GDKSN3A
 /Xadls7/CUywlu3HMQIHFidvmMQjBaWY1V0H5UEezYaVFhoH5NpQcFxAusRduf8SchCC
 PNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725950045; x=1726554845;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lejK35/pWLaQaNOp+LtO8VnEssDIJMb5nbshBedk3/4=;
 b=NY5jcjGlp2zYRuxVheyV+oAon2TDup0wq2VmGS7uKD/Yb7ZFUlaIbnYniS0Hb0x2Re
 f1OCTyJvSeWJsp+VzkojKgr/k+bDVyK/hn6s8VnGXfauudUruVSWQv8uY+lULECJj2UK
 MvN40Y7Ua9A4vcd7BeyYDrsCnZWjR8hpfF+wL15pm3HzeW3IuNzwY8SJxAu56N//04Cs
 hE9vo82nnF8xs3jeBPAOKGT6KNgvM1Q5ZCvtbgLYOK7/TU4a4nYFNN+gPocGUZKdvOqJ
 /CdDCrigYpJNLUHIEpNlj6MyREACn4O+/7FfVF8DJQId20FuA1euL2OP0WcZwHZrn0/h
 V79g==
X-Gm-Message-State: AOJu0YzmeGgcUQGMG85tk4jlxqSJmDK/xprKVIu69AMhCnDqeyRiEc3G
 UWrFglg9IOjfhJKXkE5K1H+0LEJgwYt5YG2RLPzuiYNl8CEsIpSTJ4sEEkT/GeJ6SlHUfQHh/NU
 br9WQ9rlWnH1Zi2V/TRCrJTMm3rOxuGW8
X-Google-Smtp-Source: AGHT+IF7D/RLtzC9/TwW5liR7/bpQcE6mY5BeBCHhoMhHpJhgxNObMBjsQfIWa3FzQeDAHQRK53TPL4Ftp6+6sMIH+g=
X-Received: by 2002:a05:6902:2785:b0:e13:ec5b:f699 with SMTP id
 3f1490d57ef6-e1d34897e90mr14634161276.31.1725950044686; Mon, 09 Sep 2024
 23:34:04 -0700 (PDT)
MIME-Version: 1.0
From: Mirco Barone <mirco.barone.3@gmail.com>
Date: Tue, 10 Sep 2024 08:33:54 +0200
Message-ID: <CANRMffDRX+i7N0JpH=fJBJ=BJ4vNsk6QbbfUkqguT0F3FFO22A@mail.gmail.com>
Subject: [PATCH] Enabling Threaded NAPI by Default
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:44:56 +0000
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


While testing Wireguard with a large number of tunnels, we noticed a
bottleneck caused by the superimposition of multiple NAPI functions on
the same CPU core, hence preventing the system to scale effectively.
More details are described in this paper on page 3:
https://netdevconf.info/0x18/docs/netdev-0x18-paper23-talk-paper.pdf


Since each peer has its own NAPI struct, the problem can potentially
occur when many peers are created on the same machine. The simple
solution we found is to enable threaded NAPI, which improves
considerably the throughput in our testing conditions while, at the
same time, showing no drawbacks in case of traditional deployment
scenarios (i.e., single tunnel). Hence, we feel we could slightly
modify the code and move to threaded NAPI as the new default.


Any comment?

The option to revert to NAPI handled by a softirq is still preserved,
by simply changing the `/sys/class/net/<iface>/threaded` flag.

diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c

old mode 100644

new mode 100755

index 3feb36ee5bfb..60554b7c405a

--- a/drivers/net/wireguard/device.c

+++ b/drivers/net/wireguard/device.c

@@ -363,6 +363,8 @@ static int wg_newlink(struct net *src_net, struct
net_device *dev,

        ret = wg_ratelimiter_init();

        if (ret < 0)

                goto err_free_handshake_queue;

+

+       dev_set_threaded(dev,true);


        ret = register_netdevice(dev);

        if (ret < 0)



Kind regards

<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
Privo di virus.www.avast.com
<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
