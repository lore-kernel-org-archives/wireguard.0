Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18A9C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 10:34:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F02B623741
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 10:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F02B623741
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d73ab1b2;
	Thu, 17 Dec 2020 10:25:19 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d1191aa6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 10:25:17 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06d7b18f
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Uo2w8bkAxhxijyX0zAIgJaAdEKw=; b=UGHUXW
 o1j/JfhiWkUW5/DZhgSafugfGFD/u3Qz6NRS3GQmh2XKwtLYPHsTLnqvv2KAHF3B
 O+FzPaHU8sxsrUgb6ryXigessM2RfoOu3eeoh+6Lfw51+4C5CQoVpeUr+hNnhk+7
 1xsmd3OZy/u+c3ZV5Y1LG2kqkNm+tqAdJkD/KITjZtceNwrz65oPd3mTfrjDgo7L
 cIVcdQVUmhfhOLlUx84KnNeKLBj7d66SVBhldHMZv9Ew8tg7aiCFuAz/cG12Ck0u
 kwK2GH07AXT3EGA8jS48LBy7ATBcBpQaNrJNS/QmAS/3ud4OKWga8uDmDs4ubRiv
 XYiwfl3NJVYGs9hw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c9521672
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 10:26:03 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id w135so25363793ybg.13
 for <wireguard@lists.zx2c4.com>; Thu, 17 Dec 2020 02:33:47 -0800 (PST)
X-Gm-Message-State: AOAM53385/uymQ5zJmiBd8wrztxqLM+4mTHKmezqZfXMgH+FzbQIxooR
 ZxaGjsX0URAZr/QcD1ikSWyLhr4BPAdSODvc+v4=
X-Google-Smtp-Source: ABdhPJztWvuLu776lH5r7M9oOrdGcAyz+BPsF9ZQ59Palk83l/wjt+bkQiSnsd7qdu3SbQqPl5M0tFI3rvH+L2qCsIw=
X-Received: by 2002:a25:2cd6:: with SMTP id
 s205mr55179051ybs.279.1608201226831; 
 Thu, 17 Dec 2020 02:33:46 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:6c2:b029:30:3e8e:4ce2 with HTTP; Thu, 17 Dec 2020
 02:33:46 -0800 (PST)
In-Reply-To: <Em6qFgnUJHoAWQmkBzNyZi4JA8DAd7Ylk0OANNRR1LVrZs8SzGAWkGCvyYj-jQPMTg3AV83_0oGW8Z40Uxm-KvseNM_CWXM9kQQLaOoOJPY=@protonmail.ch>
References: <Em6qFgnUJHoAWQmkBzNyZi4JA8DAd7Ylk0OANNRR1LVrZs8SzGAWkGCvyYj-jQPMTg3AV83_0oGW8Z40Uxm-KvseNM_CWXM9kQQLaOoOJPY=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 17 Dec 2020 11:33:46 +0100
X-Gmail-Original-Message-ID: <CAHmME9qPofMW7tsSSdOXRPYR6fQG2vXwYAAfDEn=43tZGDiM_w@mail.gmail.com>
Message-ID: <CAHmME9qPofMW7tsSSdOXRPYR6fQG2vXwYAAfDEn=43tZGDiM_w@mail.gmail.com>
Subject: Re: macOS update logic needs improving
To: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
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

Hi Laura,

Thanks for letting me know. I was under the impression that we were
handling this case
https://git.zx2c4.com/wireguard-apple/tree/Sources/WireGuardApp/UI/macOS/MacAppStoreUpdateDetector.swift
but maybe things broke in Big Sur.

Were you able to eventually unlodge it and update, or did it remain stuck?

Jason
