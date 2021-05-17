Return-Path: <SRS0=pvJ2=KM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF13C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 09:49:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9792611CA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 09:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9792611CA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2f561e8;
	Mon, 17 May 2021 09:44:22 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8789b290
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 May 2021 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1621244659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fOJEnKypEbP19tIL3XT8YRXgoLhNoiiMT4PxAWCrn6A=;
 b=kbfdNCLqRUSyk4l4bPWhZ7RkZl/m+f1oaHs6WQBcTueeDB75FjmZlu9Q2Gs9M51fXCK0Mu
 Mzdo4AqWcs3H/rdOukcDb4xBw9x8cuTEyPR3sbctWfKZEeQ7HpJz6oIKu0fROC9uDy6wZY
 QMC14CIp8hNNZU8rUxTZ2cKqDgxuWGQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c6091ef3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 May 2021 09:44:19 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id f9so7687356ybo.6
 for <wireguard@lists.zx2c4.com>; Mon, 17 May 2021 02:44:19 -0700 (PDT)
X-Gm-Message-State: AOAM530DnrNmur6f2yxM2wLB9iDGpFcjo+Zw24rx+eopLBPiC0db8Nmc
 7mGYgVy/9fNjyoAwEXxAsFAZVjGJhcnvpORJMLs=
X-Google-Smtp-Source: ABdhPJyOyb4hg/V9LMMLsn8TFVtAkTDF6Wdv1qLxcxOXPlPSoQnhZB4Ajqbkbt33Kij3DgcitdO1WlZHX6fGkTRbhGw=
X-Received: by 2002:a25:bb89:: with SMTP id y9mr81387410ybg.456.1621244658942; 
 Mon, 17 May 2021 02:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210517091053.886157-1-liuhangbin@gmail.com>
In-Reply-To: <20210517091053.886157-1-liuhangbin@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 17 May 2021 11:44:08 +0200
X-Gmail-Original-Message-ID: <CAHmME9rj1dJPNneAuKB3Vx7yXUGoz5aZDD8bR53dTc8yJAUN6Q@mail.gmail.com>
Message-ID: <CAHmME9rj1dJPNneAuKB3Vx7yXUGoz5aZDD8bR53dTc8yJAUN6Q@mail.gmail.com>
Subject: Re: [PATCH wireguard-tools] src/show: remove dead offset check code
To: Hangbin Liu <liuhangbin@gmail.com>
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

The compiler will optimize this out, right? In which case, I like the
consistency, in case lines are ever reordered or copy and pasted.
