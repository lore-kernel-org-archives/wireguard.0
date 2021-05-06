Return-Path: <SRS0=FUvr=KB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2A2C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 May 2021 08:55:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 089B1610FB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 May 2021 08:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 089B1610FB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e73eed9;
	Thu, 6 May 2021 08:55:46 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6c0833f5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 May 2021 08:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620291341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Vqx/+gLnyvRkoYKfx4lAo8HlkrkgpRBw5z/Ios7+90=;
 b=LmkJ5ziYLJgs3GSRwkXc5MjrNHLGCDAINOac7IFHc24VJZRuLGb1r3T9LFqj0WDvAtF6o7
 wUwUuFCHiEJvYTzaLeKzrHiDtpjKv1UgBJcn7pS4AmT/ZTRzKG868fOcr47Pia0Cu1WY4D
 rB+fnUEHyGkjmQZ0ZJsmmXUtuuF9JGU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 22eb0763
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 May 2021 08:55:41 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id g38so6385572ybi.12
 for <wireguard@lists.zx2c4.com>; Thu, 06 May 2021 01:55:41 -0700 (PDT)
X-Gm-Message-State: AOAM533oOa/kUOkbfWzyAixk2Vml0sHkjwudzh3VSEswkTp7QCOaC594
 6I5+1PQ3UNKey/9O6g3FhyBnl3bIxPfglPCuK7c=
X-Google-Smtp-Source: ABdhPJwGaDpB1nTx8T+VLtpCLk/cpCzhSRcCUnNHJqVAypL4cMS3gd1e6ZcZpYpP5omnIHL+PQ8Yx9TmNKG4GN4lRCE=
X-Received: by 2002:a25:abaa:: with SMTP id v39mr4358871ybi.20.1620291340064; 
 Thu, 06 May 2021 01:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <f4166ec7d77fa22bdd727edafe9c58ad@adslweb.co.uk>
In-Reply-To: <f4166ec7d77fa22bdd727edafe9c58ad@adslweb.co.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 May 2021 10:55:29 +0200
X-Gmail-Original-Message-ID: <CAHmME9oypYT-wknReqSKO6GG45qTeUZd9-z4v02d+AOyqHPkjg@mail.gmail.com>
Message-ID: <CAHmME9oypYT-wknReqSKO6GG45qTeUZd9-z4v02d+AOyqHPkjg@mail.gmail.com>
Subject: Re: Android Client Won't Disconnect Tunnel
To: tomt@adslweb.co.uk
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

https://git.zx2c4.com/wireguard-android/commit/?id=d6a8e9d4dc8d6b5eb5b2e0341ef6e43aeb9c5c49
This should fix the exception in that log. The actual shutdown hang
will hopefully be solved by the bump we pushed yesterday (still
waiting Play Store approval).
