Return-Path: <SRS0=Tjnm=JL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CDBC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 20:23:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7852961158
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 20:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7852961158
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25b3cc73;
	Wed, 14 Apr 2021 20:21:42 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 07d2b2b7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Apr 2021 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618431700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5JrNEKadp3qG99eF7WI3aMugjFyk14QNs5jC6dxUE1A=;
 b=EMgUdKTY9IQosk0NjBW48tt4P69WVRfd4BHwYLWidC1RC2lrFw+qGIEj5e79wvhrM/L2yX
 6IGXAxcDxNi4h7+yThHarVgav2WrC2H6S0xMQyKwKDrpx/wDbEzLA+yyERZe0lsYHD4mZ9
 7tIvHrxbE9qgoL0maYXhk//o5wnhmhk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d186577d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Apr 2021 20:21:40 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 65so23586878ybc.4
 for <wireguard@lists.zx2c4.com>; Wed, 14 Apr 2021 13:21:40 -0700 (PDT)
X-Gm-Message-State: AOAM530gCYDJP676/NVKFZorxy0FYEtBITPMll9c3rVqR/yL/xZpHe92
 35tobNdVLjhvSqGDCMl2ZJyTLUuLHYH9yhU9tns=
X-Google-Smtp-Source: ABdhPJy2K1j22IZOQ6LObCH0H5vekAi011dlm01WTeULCxvZBSBx7Difae01XS5jnYqTIH9/yN6VYxexahYSbyeeVwU=
X-Received: by 2002:a25:bb90:: with SMTP id y16mr51422168ybg.49.1618431699752; 
 Wed, 14 Apr 2021 13:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAH_zGLXZ1TNMBsv3XZJnhX=TPNqiNL+DiC6icMyx+YcL3rbAnQ@mail.gmail.com>
In-Reply-To: <CAH_zGLXZ1TNMBsv3XZJnhX=TPNqiNL+DiC6icMyx+YcL3rbAnQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Apr 2021 14:21:28 -0600
X-Gmail-Original-Message-ID: <CAHmME9pRkZasYNM-DGYtTLTzwV6yiWygwhDCkFwZcb2KS-v9UA@mail.gmail.com>
Message-ID: <CAHmME9pRkZasYNM-DGYtTLTzwV6yiWygwhDCkFwZcb2KS-v9UA@mail.gmail.com>
Subject: Re: freebsd - cpu consumption?
To: Osku Sneits <wireguard@sneits.fi>
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

Hi Osku,

We'll switch to using FreeBSD's opencrypto at some point, at which
point the performance will improve. Right now we're using boring
unoptimized reference implementations.

See https://lists.freebsd.org/pipermail/freebsd-hackers/2021-March/057076.html
for more info. So far nobody has stepped up to contribute code there.

Jason
