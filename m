Return-Path: <SRS0=5LHB=JY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3751C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Apr 2021 02:29:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A582161165
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Apr 2021 02:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A582161165
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aefe3875;
	Tue, 27 Apr 2021 02:27:31 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3b52091c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Apr 2021 02:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1619490445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o59LLKAPKt/pmSSvOxaom0BLAOnSkKh9jqmgysUM8x8=;
 b=bobTriw+9EarsaO+vuSTqjLKLQnJPJqhkisF/rre3EUaF6gPyx6mbfIs0w1lQX/Of12L+7
 2e7rjv60aI2nRjn+tui1rG8u5/eKtkSkqva45rd5hyK56pDPulOiJVio6C0MrlA7Dsn1qs
 9cjZWr777gwZFkl7+WQcA6W+Wna9e98=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f5724f8e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Apr 2021 02:27:24 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id s9so9130547ybe.5
 for <wireguard@lists.zx2c4.com>; Mon, 26 Apr 2021 19:27:24 -0700 (PDT)
X-Gm-Message-State: AOAM530Yqz6SzIWfodoYHM7rSx53noPY5FU+ck+XYxhthvH85Fk4ODcM
 +WIrXCyUAg+MXval8L1WesH+UgKJ36UxI4AFAHE=
X-Google-Smtp-Source: ABdhPJzitqVAL83OGFyZHuUiq+Fr8JmMTtJW0lpY2MqmtnhS4WSagHIBbFfUZ10es6QFKEom+8gZoqGqg9T+dwCYi+c=
X-Received: by 2002:a25:330a:: with SMTP id z10mr28923480ybz.123.1619490444494; 
 Mon, 26 Apr 2021 19:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <CALaUSusjvQGjKJyj3U3e2BH+K-1cMB3dWLjf3Lc6Jgge8q5H=Q@mail.gmail.com>
In-Reply-To: <CALaUSusjvQGjKJyj3U3e2BH+K-1cMB3dWLjf3Lc6Jgge8q5H=Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 26 Apr 2021 22:27:13 -0400
X-Gmail-Original-Message-ID: <CAHmME9q9pSu40NLNFKgdnHu0cJ8O8mq=K_uCsH1yLMpdrsRhNw@mail.gmail.com>
Message-ID: <CAHmME9q9pSu40NLNFKgdnHu0cJ8O8mq=K_uCsH1yLMpdrsRhNw@mail.gmail.com>
Subject: Re: WinTun access violation error 0xc0000005 during ReceivePacket call
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
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

Thanks for the bug report. Fixed here:

https://git.zx2c4.com/wireguard-go/commit/?id=097af6e1351ba80a18b8f63e9c07b9bd13b632bb
