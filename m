Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0C6C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 10:52:20 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D12A64EAF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 10:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D12A64EAF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d596c17;
	Thu, 25 Feb 2021 10:47:56 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6587308b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1614250070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tlUO5418KbT3w5cAA7zoE9wGUoND39DbriBT90R0SLY=;
 b=HxTr75Rk0mTb5rMxMawWiKu6bY43lAo2F3Yj1v5XxBR5W1Hj8VyM8S8cDxmHOumKtG6lMx
 7OSXbU6hjWRBMAX+ge1LFnwdhi9Rj+YChMUEYJPtfSZwZY/4P3wiO7W1fm7W7Ol5rOuL3p
 y9RTYAJQygZqSbMaTwDtu0BqlHmQzFM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b308e399
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 10:47:50 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id u75so4939500ybi.10
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 02:47:50 -0800 (PST)
X-Gm-Message-State: AOAM5305TPeJuBBrl4bqGcHFj+m84rxSQGjFYAyYqAW2ScaZ8Qv6TdFe
 cmuJiP2wvzJksKbLr4l7HbdACi9YUhCpLVW0yBM=
X-Google-Smtp-Source: ABdhPJwWWuGPyE/5Kh46qx9UA6ChOwbJn6BwJgmutju+qK8IeO6PGLhedFKCN2VkYQwO0+y0vEDcEpNLDP7ZqioY1sU=
X-Received: by 2002:a25:5289:: with SMTP id g131mr3221233ybb.178.1614250066966; 
 Thu, 25 Feb 2021 02:47:46 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:9041:b029:35:5678:14a0 with HTTP; Thu, 25 Feb 2021
 02:47:46 -0800 (PST)
In-Reply-To: <F332C4E6-0559-4BE0-8AF6-3AD942C01FAC@wandera.com>
References: <F332C4E6-0559-4BE0-8AF6-3AD942C01FAC@wandera.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Feb 2021 11:47:46 +0100
X-Gmail-Original-Message-ID: <CAHmME9qyD4ZDoT9dyb-cdQ319jjTHYXhhXbcdFphU8+pSKdWiw@mail.gmail.com>
Message-ID: <CAHmME9qyD4ZDoT9dyb-cdQ319jjTHYXhhXbcdFphU8+pSKdWiw@mail.gmail.com>
Subject: Re: Patch: initialise device.peers.empty
To: Laura Zelenku <laura.zelenku@wandera.com>
Cc: wireguard@lists.zx2c4.com
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

Thanks for the patch. Can you resubmit this as a proper git-formatted
patch containing your Signed-off-by line?

git commit -s --amend --no-edit
git send-email HEAD~

Also, you mentioned custom unit tests. Any of those suitable for
sending upstream?

Jason
