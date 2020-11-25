Return-Path: <SRS0=pGg3=E7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44789C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 01:08:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D9A920BED
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 01:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LP+ZexwD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D9A920BED
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54ea1a03;
	Wed, 25 Nov 2020 01:03:06 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c79c12c6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 01:03:04 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ebed870
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 01:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=vREg6NCtNXhNNXZsIqMOpIaf9QE=; b=LP+Zex
 wDSMe8+ChyFcfgjdt9Zg3JRNq7MQ8UsI7mMpq4a6EvwWxaZ6/NglSy0uTYH8eyC1
 AG4WY/EOy0zu1HNFQVOQwUi1mT4HC0v/AjWm+9EgSttGi7Nw+6MtyJlrW30D6WqC
 2RbL9jeGM5a44vwa3Jo+NTDIkFEmNigQszD01hjes/rmGNJ88gSiLtfI2mtifCMd
 1kmKz619vjKukI36tT5zjWSemO2w86MbXG5C7M/MbicXV0rYX2PEOTMyxDqVh64l
 uyF7JkK8vVDYNREl3Ce9qE/ZaO5JGaqhtM8ATYRVy1odN3aaU+Zw5VKdQophCFCU
 VV7gfTUqGZAwzfcg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7a174a19
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 01:03:50 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id q5so1443566qkc.12
 for <wireguard@lists.zx2c4.com>; Tue, 24 Nov 2020 17:08:39 -0800 (PST)
X-Gm-Message-State: AOAM531ZA/3KDK21ggCJahwQhP6SNEQ/H+RzeS+sVLnhAoNLFXubqk7u
 0ZoW7VJm9m01E5y+pQ+LP3wmPa+5GLa+Eor4HgQ=
X-Google-Smtp-Source: ABdhPJz+P4hXJjsSfsHO9OBTMC6eZqlPcEdU6fZb+BH24MmvdG6WsfwrtY+mstGz0cGkMFVEgnwhld9FH/d/1pr6+Po=
X-Received: by 2002:a25:d047:: with SMTP id h68mr978927ybg.49.1606266518530;
 Tue, 24 Nov 2020 17:08:38 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9riWVidRXjORFebv+UF3GyG1Hv+OrDhf4njvhGyQNw=4A@mail.gmail.com>
 <C7BW4WL2LWMH.1A1WYJLENDO9Q@enhorning>
In-Reply-To: <C7BW4WL2LWMH.1A1WYJLENDO9Q@enhorning>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 25 Nov 2020 02:08:27 +0100
X-Gmail-Original-Message-ID: <CAHmME9qAjqF-p=AHrzpmO+KnFjSADMkqpYmOn+TRY9q04aBFMQ@mail.gmail.com>
Message-ID: <CAHmME9qAjqF-p=AHrzpmO+KnFjSADMkqpYmOn+TRY9q04aBFMQ@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: Riccardo Paolo Bestetti <pbl@bestov.io>
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

Hi Riccardo,

Interesting consideration. I didn't know that.

Can you not add that group manually need be?

Are there relevant use cases for "home" users using this feature?

Jason
