Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C737C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 16:33:58 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F1C64F56
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 16:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77F1C64F56
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e75a7937;
	Sun, 7 Mar 2021 16:30:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e9e5c405
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 16:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615134623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6qq1SFiqVQ00Yy8Kqo2gTuCUFl4KXtyJT6InL8r5c30=;
 b=kYPjtvb4iXLU+7xkkHxnmVx18V3FcUkooYCGIweo7jNF6txvWisZx13LuMxzhzCcLlU4kg
 CgeF2EqSaWlaC12gCBCxtHs+kDtuFftyia1DAKqPLgsydztUjet/ci7B4xSwi+ja/+kJIO
 fmtW7guMQ2QIZuBPdl9GH+04QgVMa7I=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 705bf340
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 16:30:23 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id c131so7587137ybf.7
 for <wireguard@lists.zx2c4.com>; Sun, 07 Mar 2021 08:30:23 -0800 (PST)
X-Gm-Message-State: AOAM5305IgiWlIs4Rvwl0xwwItfCj1c8EZQEeWGvF+7SGYYHOOE6qiE3
 cej31oP3yjKWed22v6GBhajTQ9ojln5g7HBUa0Y=
X-Google-Smtp-Source: ABdhPJzC1Q+nL48n+LI1s8hfw+FN8Mt88+wbUGHtKMwXD67nlD5fbLQXcSrAR+ETE9uG0dCExizPJBir8sf9kkdbGdY=
X-Received: by 2002:a25:3cd:: with SMTP id 196mr28109368ybd.456.1615134623413; 
 Sun, 07 Mar 2021 08:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20210306094705.1037746-1-kay.diam@gmail.com>
 <20210307162131.1153348-1-kay.diam@gmail.com>
In-Reply-To: <20210307162131.1153348-1-kay.diam@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 7 Mar 2021 09:30:12 -0700
X-Gmail-Original-Message-ID: <CAHmME9q2bEt6hzg6Hd3qXPX5Uhs__ZfEq96smUDD8Re07XCapA@mail.gmail.com>
Message-ID: <CAHmME9q2bEt6hzg6Hd3qXPX5Uhs__ZfEq96smUDD8Re07XCapA@mail.gmail.com>
Subject: Re: [PATCH] FreeBSD default tun name patch
To: kayrus <kay.diam@gmail.com>
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

Applied, thanks:
https://git.zx2c4.com/wireguard-go/commit/?id=f4695db51c393f60ed9b8398b95b1f2013ad9b22
