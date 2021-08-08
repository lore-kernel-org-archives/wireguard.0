Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04319C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 20:53:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C2A60F42
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 20:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10C2A60F42
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c968c13d;
	Sun, 8 Aug 2021 20:53:35 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e4c3bf03
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 20:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628456010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nc5gmxuDlFTG+/WAv4rFODyBK7kXVj5gXOt0OEocBrQ=;
 b=G+ec2nXfiqZiFs9gvwo9j2RSWSOc/6qndgrTJ97FuSmbhqObXgCYpQqIRlqT3+7e9TndIU
 kTRZz0thEawZktzuaIaWBBkW1Sy19pePl8ULtgGxznL7gLoAFrRyp036m+ZeUvz4aOfPvv
 kc9EQanmUsgq4Zir8pUQh8Ky3ICDfUY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fd661629
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 20:53:30 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id k65so25692908yba.13
 for <wireguard@lists.zx2c4.com>; Sun, 08 Aug 2021 13:53:30 -0700 (PDT)
X-Gm-Message-State: AOAM530XQE1yv0+kNz2tRMU07Ja11tc9EZv1/2e436A8K6+NDBYh1WRx
 1w2D4NnkCqfp1kOrtw1gdcCSTmSwt+w78b4WeH8=
X-Google-Smtp-Source: ABdhPJz3I5ODINRyHZP7pTIv5XjfUQ3/9HXAAwpWvp2nfXOJ3kU4YEqlYuvw3hbNseSQDacn9X6M6LPceSFzLjulmq0=
X-Received: by 2002:a25:8445:: with SMTP id r5mr28490312ybm.20.1628456009588; 
 Sun, 08 Aug 2021 13:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210706132714.8220-1-minipli@grsecurity.net>
In-Reply-To: <20210706132714.8220-1-minipli@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Aug 2021 22:53:18 +0200
X-Gmail-Original-Message-ID: <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
Message-ID: <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Mathias Krause <minipli@grsecurity.net>
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

Hi Mathias,

Sorry for the delay in reviewing these. Thanks for that. I've merged
them with a trivial change. The constraint one is interesting; it
looks like with your change and those extra constraints it winds up
spilling rdi to the stack?

Jason
