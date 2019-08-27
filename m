Return-Path: <SRS0=ZPcD=WX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66440C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 22:51:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79F72186A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 22:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WHxIv3ZV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A79F72186A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71e1bf85;
	Tue, 27 Aug 2019 22:51:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b91b7d2f
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:51:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47d6c0d3
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:51:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb9bf2ce
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Pt1s5PfEnN1MAZLzme5Ft9vzeBs=; b=WHxIv3
 ZVthAIkDO0cETR5rEeKsUJPSkqdesMv/mzFcVXWuezWtKjcdqAyoPijv396obZvi
 tx+IN4ujKxeN77pdWp/bCiF8xrd+8vpz3oXRNLnLQsz23jkTDQRPt1N5phAjBkpo
 KyUEck/xIKlyR2mS3e6lA4+KcKY8SCB8UUGp1toqcP/9ZsftY3maSONFQoQ3Ah6s
 q7WT6/zoQpU8ozgl9f+tRRhF5X0nAuaQQjLpCQqJB7w4LHVvQ/gg05RQSdzCdcel
 SxUvLe/Gow3nL9rTpopH6Ec3mrzMiMqofTgmccXwy5e1a38209mqz6FHXtZt9Drq
 D0MWlnRQLBgSll8g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2dff8c26
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:09:36 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id o101so819812ota.8
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 15:51:42 -0700 (PDT)
X-Gm-Message-State: APjAAAVkWPmBpBFsITP/nQcaO6ao/FnDDlyluT4IWPbBTzukHwON45i8
 3FyTTyAdezz5r/1l3DgADCwvNsMU8NJxC333yQc=
X-Google-Smtp-Source: APXvYqytW/PFBFu9Q0TQI7vthAsA8UzvLqWvfHMchqQOH3BuZzcLyZSf1MQD76nJDo6KzIg10FJux2ptCqDwW3I6aFs=
X-Received: by 2002:a9d:675a:: with SMTP id w26mr838551otm.179.1566946301907; 
 Tue, 27 Aug 2019 15:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190824071451.5297-1-rpigott@berkeley.edu>
In-Reply-To: <20190824071451.5297-1-rpigott@berkeley.edu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 27 Aug 2019 16:51:30 -0600
X-Gmail-Original-Message-ID: <CAHmME9pNVSr4vqXEvpH-K2bK-9OyOurkHrzK7kg0Mmyb0ASrUA@mail.gmail.com>
Message-ID: <CAHmME9pNVSr4vqXEvpH-K2bK-9OyOurkHrzK7kg0Mmyb0ASrUA@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: linux: Don't fail systemd service when using
 systemd-resolved
To: Ronan Pigott <rpigott314@gmail.com>
Cc: Ronan Pigott <rpigott@berkeley.edu>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Could you resubmit a v2 with your Signed-off-by line?

Instead of this hack, why not just reorder unset_dns and del_if? Are
you worried about a race in between them if they're ordered as such?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
