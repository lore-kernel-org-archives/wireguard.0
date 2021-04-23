Return-Path: <SRS0=RWyD=JU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9F3C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Apr 2021 01:53:13 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A360061450
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Apr 2021 01:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A360061450
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6549f58d;
	Fri, 23 Apr 2021 01:53:10 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9f546179
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Apr 2021 01:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1619142784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QdTW/btKog5Sb/AH20aYNKwowA2sHOwFSw4281DdP3s=;
 b=lAF6XUHGTylD6c7DAXQusrY8cPzjPHLRLQsvpSxsVcKxsJCr4N0apMu2sEAqAo47ElqDwj
 qQZ56hMspQF2LJ47FZbrl3Buckshv0FMuQEJRlr1xhe+NbyB23kl4MT+N4ndfT/Ax6wqGK
 cRhq+Y/9Zu924WeELdcmwO3k83hBilA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 32e0aa73
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Apr 2021 01:53:04 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id p3so33191890ybk.0
 for <wireguard@lists.zx2c4.com>; Thu, 22 Apr 2021 18:53:04 -0700 (PDT)
X-Gm-Message-State: AOAM5323oiHQg6cjPWKGjx8Twtos9KuxIwbO07ba96fUIod46FgjBsOC
 caSHxXvGjYXaiHse9XqSHSShRHsZoDG3XxgaQic=
X-Google-Smtp-Source: ABdhPJzZhPwXZvGakZySLW1d7dVagmMXtCDNK3gqPro5Oh6ZVbU5N5D+K9helxzjW4tdOnQDDg1F1HKPzB5UFF25m88=
X-Received: by 2002:a25:818b:: with SMTP id p11mr2142755ybk.49.1619142784124; 
 Thu, 22 Apr 2021 18:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210419205125.2835077-1-peter.georg@physik.uni-regensburg.de>
In-Reply-To: <20210419205125.2835077-1-peter.georg@physik.uni-regensburg.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 22 Apr 2021 19:52:53 -0600
X-Gmail-Original-Message-ID: <CAHmME9o=fahdB+_ZJidv9f67Y1k2P-U0hBMsVAeQKg+A+JvH0w@mail.gmail.com>
Message-ID: <CAHmME9o=fahdB+_ZJidv9f67Y1k2P-U0hBMsVAeQKg+A+JvH0w@mail.gmail.com>
Subject: Re: [PATCH compat] Update and improve detection of CentOS Stream 8
To: peter.georg@physik.uni-regensburg.de
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

Applied, thanks!

https://git.zx2c4.com/wireguard-linux-compat/commit/?id=2cf9543bedc68b29760f85622ae228a256082ac6

Jason
