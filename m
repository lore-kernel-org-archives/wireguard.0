Return-Path: <SRS0=x71L=M4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AB7C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Aug 2021 20:34:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43D2F61104
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Aug 2021 20:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43D2F61104
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79db0175;
	Thu, 5 Aug 2021 20:34:21 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cac3b0b7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Aug 2021 20:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628195655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m9fHLxsDAlMhCqaqQ7E8xDQGKjTpfXTLfGCXtJrSOuE=;
 b=BDwJixUJaFJ34Bt9jFWB1jUQWY41CH3Mu6QhLoI1Co4hTorBGnRDfAl9hfTBURHwim2dpf
 RyxM++PTL8ltigVVabLLkZ7x2gKJ14T3SWKAe+8XjiVGYr7vb9fIY0kLEm6CZQWowPzG7Z
 BhGD0yp6VHqz9uCkn08b+7jU7Biyxr8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1f1e6cf3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Aug 2021 20:34:15 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id k65so11090059yba.13
 for <wireguard@lists.zx2c4.com>; Thu, 05 Aug 2021 13:34:15 -0700 (PDT)
X-Gm-Message-State: AOAM531ckMuu/paY1V5H2NjZVNR9NzmawYQ+J0mc719dIZGWqfCisOeQ
 NMrqPueqErJJyTQgNpEd5NsOv+cK+qeomoctnR0=
X-Google-Smtp-Source: ABdhPJwrehDrBDcbf3fAbH13349YemZ3ewI/VQUsPBUnNcaMPGQj8DSlRsqe69c0bVmfmR5J1xCJ+qQC6hlrVn9KfnM=
X-Received: by 2002:a25:18a:: with SMTP id 132mr8085738ybb.123.1628195654721; 
 Thu, 05 Aug 2021 13:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAM2QSmYNbXpkz55Ts5WJhGL3+Excy95LqTbu=YS0voScVP1nFQ@mail.gmail.com>
In-Reply-To: <CAM2QSmYNbXpkz55Ts5WJhGL3+Excy95LqTbu=YS0voScVP1nFQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Aug 2021 22:34:02 +0200
X-Gmail-Original-Message-ID: <CAHmME9pCfabcvHcFoxYMGyqOcKSYSvAMuujMFALOWw2g_aJ5mQ@mail.gmail.com>
Message-ID: <CAHmME9pCfabcvHcFoxYMGyqOcKSYSvAMuujMFALOWw2g_aJ5mQ@mail.gmail.com>
Subject: Re: Windows issue: impossible to add tunnels when install after
 setting program files to folder on other disk via reg value edit
To: Aelis Sagot <aelis.sagot@gmail.com>
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

Thanks for the report. Fixed here:
https://git.zx2c4.com/wireguard-windows/commit/?id=25bced8b3b1f9a13052516f15ed4e65014adac68
