Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46192C28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 11:03:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC56420675
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 11:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="zTTpItL+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC56420675
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 948107ba;
	Wed, 6 May 2020 10:51:15 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7d743c5d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 10:51:13 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81ada103
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=qy0wOpYoUYYfD0sIszReVcgB3EY=; b=zTTpIt
 L+14tNVakQ9uGOeIbuphBGSfD8BLEgTFyopaDuv+zR8icUPaQT6KIum/8opGteek
 sFftYEwO8XIcm2rv4YmPBWFp0PXUz/kJcG9szHu2Xd+8a6a0KtWCoJeT9AiLVk/j
 GS8OKOabcA+ztIgFCT5pzrJWTrwkisa/T91iTo+cD1EOBceWifogrb0+M58mn7uV
 WjotZYSj+ICD6C6Lt6HW6Lef3nRWfrxuz2adL+2KR2lKEY7unmRZzArn0gR8qV6f
 P8gh9xxB3XjuFXqI6sONHknL5pjZrikWS/BZhhLNyzy4nQsKwyF+xFtmkUBFRe8m
 RKOh6FmWxLMI0guQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1d71f7d0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 10:51:12 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id c2so1647262iow.7
 for <wireguard@lists.zx2c4.com>; Wed, 06 May 2020 04:03:52 -0700 (PDT)
X-Gm-Message-State: AGi0PubAAxmhgKDlTq+ikD6WkkCFEkKdal/KZc/b2GFV/HW0XojD1kre
 +9n+HBj0sNRwm7vkZVKWGZiyY4SaSZBkSkvFCFg=
X-Google-Smtp-Source: APiQypLR9xxuDJlKTTQTa2yEDPid8JsXQ8ouAx4D35gEqH4as6ii/5fD8Yso+Bj5n5y5cNaf3QR5bVRJ6NOp2vqT0xI=
X-Received: by 2002:a05:6602:21d3:: with SMTP id
 c19mr7735384ioc.29.1588763031885; 
 Wed, 06 May 2020 04:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXzSMozuS_dSpODmp3LzAmoetr9jKXUZpbQthx5P9YXk-xGAw@mail.gmail.com>
 <FC124C86-7CBB-4856-BB9D-3EE3E4E550C1@getmailspring.com>
In-Reply-To: <FC124C86-7CBB-4856-BB9D-3EE3E4E550C1@getmailspring.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 May 2020 05:03:41 -0600
X-Gmail-Original-Message-ID: <CAHmME9oSaG3UWzs19D+-V82LJpQtJfVmsGmOu-stFHngAmm02g@mail.gmail.com>
Message-ID: <CAHmME9oSaG3UWzs19D+-V82LJpQtJfVmsGmOu-stFHngAmm02g@mail.gmail.com>
Subject: Re: Android client fails to auto start connection if using a DDNS
 address as endpoint
To: Harsh Shandilya <me@msfjarvis.dev>
Cc: Dark Shadow <shadowofdarkness@gmail.com>, 
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Looks like we don't have any retry logic for DNS resolution for the
case in which there's temporarily no Internet:

https://git.zx2c4.com/wireguard-android/tree/tunnel/src/main/java/com/wireguard/config/InetEndpoint.java#n91
