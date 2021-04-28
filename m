Return-Path: <SRS0=T23V=JZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B05C43460
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Apr 2021 01:51:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3564613FB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Apr 2021 01:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3564613FB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63c1995e;
	Wed, 28 Apr 2021 01:51:27 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 596ede16
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Apr 2021 01:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1619574681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n/yiq0fXKxo48SjzguxLn+/GieDU9kdvbBjQIy5dXGI=;
 b=SfrPshgRaEHGWsLdLJZ1GpXC2TBOgf6BbrHwRsKCmizc4JMNlHKuNt+LH3qi8gdnY51mHh
 g0shBEU/Eu1OaQJeGLVjP6qZLeQHABvItlA+fpilPhY3nq/vVJDfgSxHFRXRidy/DjvSyD
 WXmGumY4fRKgsgIfBuyBgoygq/4UXVo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e76b97d5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Apr 2021 01:51:21 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id z1so71805382ybf.6
 for <wireguard@lists.zx2c4.com>; Tue, 27 Apr 2021 18:51:21 -0700 (PDT)
X-Gm-Message-State: AOAM531TQ1vnQ+ERYVKyLMknoWlv80Lo7xYMy7ZutGuqkK2LSjzpHi/J
 98H/sexWH48eJN0KOB5PY0myYZ+sQsE4TI5tqLA=
X-Google-Smtp-Source: ABdhPJzsgZJy9eZuOXRYofnNvpPioWULHVKKPN3tlET+bnXRq+v2Zz1tdF6mxI/w9kJQGPh17Gs6Py4pQ6mlueshpVA=
X-Received: by 2002:a5b:5c6:: with SMTP id w6mr35930130ybp.279.1619574680599; 
 Tue, 27 Apr 2021 18:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <CADTMz0L9Xxuo+xeo4GEjjLCN5aOgBrLEJ3t=XE+JJPsyi0OBpA@mail.gmail.com>
In-Reply-To: <CADTMz0L9Xxuo+xeo4GEjjLCN5aOgBrLEJ3t=XE+JJPsyi0OBpA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 27 Apr 2021 21:51:09 -0400
X-Gmail-Original-Message-ID: <CAHmME9o77-NRbeSk6or5tPSW6HwOPnBPc=4Ty+oOuKSNYBWbTw@mail.gmail.com>
Message-ID: <CAHmME9o77-NRbeSk6or5tPSW6HwOPnBPc=4Ty+oOuKSNYBWbTw@mail.gmail.com>
Subject: Re: Kernel Panic on FreeBSD 12.2 when downing an tunnel interface
To: Christian McDonald <rcmcdonald91@gmail.com>
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

Fixed here a few days ago:
https://git.zx2c4.com/wireguard-freebsd/commit/?id=cb7cd32a7c47151c161603cdc8a1c21f48550a65

I'll have a new snapshot out likely tomorrow.

Jason
